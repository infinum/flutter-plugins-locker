package com.example.flutter_locker

import android.app.Activity
import android.content.Context
import androidx.biometric.BiometricManager
import androidx.fragment.app.FragmentActivity
import co.infinum.goldfinger.Goldfinger
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding

/** FlutterLockerPlugin */
class FlutterLockerPlugin : FlutterPlugin, ActivityAware, PigeonApi {
  private lateinit var activity: Activity
  private lateinit var goldfinger: Goldfinger

  private val authenticators = BiometricManager.Authenticators.BIOMETRIC_STRONG

  object ErrorCodes {
    const val OTHER = "other"
    const val SECRET_NOT_FOUND = "secretNotFound"
    const val AUTHENTICATION_CANCELED = "authenticationCanceled"
    const val AUTHENTICATION_FAILED = "authenticationFailed"
  }

  override fun canAuthenticate(callback: (Result<Boolean>) -> Unit) {
    callback(Result.success(goldfinger.canAuthenticate(authenticators)))
  }

  override fun save(request: SaveSecretRequest, callback: (Result<Unit>) -> Unit) {
    val prompt = Goldfinger.PromptParams.Builder(activity as FragmentActivity)
      .allowedAuthenticators(authenticators)
      .title(request.androidPrompt.title)
      .description(request.androidPrompt.descriptionLabel)
      .negativeButtonText(request.androidPrompt.cancelLabel)
      .build()

    goldfinger.encrypt(prompt, request.key, request.secret, object : Goldfinger.Callback {
      override fun onResult(goldfingerResult: Goldfinger.Result) {
        if (goldfingerResult.type() == Goldfinger.Type.SUCCESS) {
          activity.getPreferences(Context.MODE_PRIVATE).edit()
            .putString(request.key.toPrefsKey(), goldfingerResult.value()).apply()
          callback(Result.success(Unit))
        } else if (goldfingerResult.type() == Goldfinger.Type.ERROR) {
          val error = FlutterError(reasonToErrorCode(goldfingerResult.reason()), goldfingerResult.message())
          callback(Result.failure(error))
        }
      }

      override fun onError(e: Exception) {
        callback(Result.failure(FlutterError(ErrorCodes.OTHER, e.message)))
      }
    })
  }

  override fun retrieve(request: RetrieveSecretRequest, callback: (Result<String>) -> Unit) {
    val prompt = Goldfinger.PromptParams.Builder(activity as FragmentActivity)
      .allowedAuthenticators(authenticators)
      .title(request.androidPrompt.title)
      .description(request.androidPrompt.descriptionLabel)
      .negativeButtonText(request.androidPrompt.cancelLabel)
      .build()

    val encryptedSecret =
      activity.getPreferences(Context.MODE_PRIVATE).getString(request.key.toPrefsKey(), null)

    encryptedSecret?.let {
      goldfinger.decrypt(prompt, request.key, it, object : Goldfinger.Callback {
        override fun onResult(goldfingerResult: Goldfinger.Result) {
          if (goldfingerResult.type() == Goldfinger.Type.SUCCESS) {
            callback(Result.success(goldfingerResult.value() as String))
          } else if (goldfingerResult.type() == Goldfinger.Type.ERROR) {
            val error = FlutterError(reasonToErrorCode(goldfingerResult.reason()), goldfingerResult.message())
            callback(Result.failure(error))
          }
        }

        override fun onError(e: Exception) {
          val error = FlutterError(ErrorCodes.SECRET_NOT_FOUND)
          callback(Result.failure(error))
        }
      })
    } ?: kotlin.run {
      val error = FlutterError(ErrorCodes.SECRET_NOT_FOUND)
      callback(Result.failure(error))
    }
  }

  override fun delete(key: String, callback: (Result<Unit>) -> Unit) {
    activity.getPreferences(Context.MODE_PRIVATE).edit().remove(key.toPrefsKey()).apply()
    callback(Result.success(Unit))
  }

  private fun reasonToErrorCode(reason: Goldfinger.Reason): String {
    return when (reason) {
        Goldfinger.Reason.NEGATIVE_BUTTON, Goldfinger.Reason.CANCELED, Goldfinger.Reason.USER_CANCELED -> {
          ErrorCodes.AUTHENTICATION_CANCELED
        }
        Goldfinger.Reason.LOCKOUT_PERMANENT, Goldfinger.Reason.LOCKOUT -> {
          ErrorCodes.AUTHENTICATION_FAILED
        }
        else -> {
          ErrorCodes.OTHER
        }
    }
  }

  // When saving to prefs we add this prefix to avoid any possible clash with other keys
  fun String.toPrefsKey(): String = "\$_flutter_locker_$this"
  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    goldfinger = Goldfinger.Builder(binding.applicationContext).build()
    PigeonApi.setUp(binding.binaryMessenger, this)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivityForConfigChanges() {
    // no-op
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    activity = binding.activity
  }

  override fun onDetachedFromActivity() {
    // no-op
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    // no-op
  }
}