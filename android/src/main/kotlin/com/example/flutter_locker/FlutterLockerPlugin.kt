package com.example.flutter_locker

import android.app.Activity
import android.content.Context
import androidx.fragment.app.FragmentActivity
import co.infinum.goldfinger.Goldfinger
import io.flutter.BuildConfig
import io.flutter.Log
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.FlutterException

/** FlutterLockerPlugin */
class FlutterLockerPlugin : FlutterPlugin, ActivityAware, FlutterLocker.PigeonApi {
  private lateinit var activity: Activity
  private lateinit var goldfinger: Goldfinger

  override fun canAuthenticate(result: FlutterLocker.Result<Boolean>?) {
    result?.success(goldfinger.canAuthenticate())
  }

  override fun save(request: FlutterLocker.SaveSecretRequest, result: FlutterLocker.Result<Boolean>?) {
    val prompt = Goldfinger.PromptParams.Builder(activity as FragmentActivity)
      .title(request.androidPrompt.title)
      .description(request.androidPrompt.description)
      .negativeButtonText(request.androidPrompt.cancelLabel)
      .build()

    goldfinger.encrypt(prompt, request.key, request.secret, object : Goldfinger.Callback {
      override fun onResult(goldfingerResult: Goldfinger.Result) {
        if (goldfingerResult.type() == Goldfinger.Type.SUCCESS) {
          activity.getPreferences(Context.MODE_PRIVATE).edit()
            .putString(request.key.toPrefsKey(), goldfingerResult.value()).apply()
          result?.success(true)
        } else if (goldfingerResult.type() == Goldfinger.Type.ERROR) {
          handleGoldfingerError(goldfingerResult, result)
        }
      }

      override fun onError(e: Exception) {
        result?.error(LockerException("-1", "Failed to save secret: ${e.message}", null))
      }
    })
  }

  override fun retrieve(request: FlutterLocker.RetrieveSecretRequest, result: FlutterLocker.Result<String>?) {
    val prompt = Goldfinger.PromptParams.Builder(activity as FragmentActivity)
      .title(request.androidPrompt.title)
      .description(request.androidPrompt.description)
      .negativeButtonText(request.androidPrompt.cancelLabel)
      .build()

    val encryptedSecret =
      activity.getPreferences(Context.MODE_PRIVATE).getString(request.key.toPrefsKey(), null)

    encryptedSecret?.let {
      goldfinger.decrypt(prompt, request.key, it, object : Goldfinger.Callback {
        override fun onResult(goldfingerResult: Goldfinger.Result) {
          if (goldfingerResult.type() == Goldfinger.Type.SUCCESS) {
            result?.success(goldfingerResult.value())
          } else if (goldfingerResult.type() == Goldfinger.Type.ERROR) {
            handleGoldfingerError(goldfingerResult, result)
          }
        }

        override fun onError(e: Exception) {
          result?.error(
            LockerException(
              "0",
              e.toString(),
              e.stackTrace,
            )
          )
        }
      })
    } ?: kotlin.run {
      result?.error(LockerException("0", "Secret not found for that key", null))
    }
  }

  override fun delete(key: String, result: FlutterLocker.Result<Void>?) {
    activity.getPreferences(Context.MODE_PRIVATE).edit().remove(key.toPrefsKey())
      .apply()

    result?.success(null)
  }

  private fun <T> handleGoldfingerError(
    goldfingerResult: Goldfinger.Result,
    result: FlutterLocker.Result<T>?
  ) {
    if (goldfingerResult.reason() == Goldfinger.Reason.NEGATIVE_BUTTON || goldfingerResult.reason() == Goldfinger.Reason.CANCELED || goldfingerResult.reason() == Goldfinger.Reason.USER_CANCELED) {
      result?.error(LockerException("1", "Authentication canceled: ${goldfingerResult.message()}", goldfingerResult.reason()))
    } else if (goldfingerResult.reason() == Goldfinger.Reason.LOCKOUT_PERMANENT || goldfingerResult.reason() == Goldfinger.Reason.LOCKOUT) {
      result?.error(LockerException("2", "Authentication failed: ${goldfingerResult.message()}", goldfingerResult.reason()))
    } else {
      result?.error(LockerException("-1", "Error: ${goldfingerResult.message()}", goldfingerResult.reason()))
    }
  }

  // When saving to prefs we add this prefix to avoid any possible clash with other keys
  fun String.toPrefsKey(): String = "\$_flutter_locker_$this"
  override fun onAttachedToEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    goldfinger = Goldfinger.Builder(binding.applicationContext).build()
    FlutterLocker.PigeonApi.setup(binding.binaryMessenger, this)
  }

  override fun onAttachedToActivity(binding: ActivityPluginBinding) {
    activity = binding.activity;
  }

  override fun onDetachedFromActivityForConfigChanges() {
    // no-op
  }

  override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
    activity = binding.activity;
  }

  override fun onDetachedFromActivity() {
    // no-op
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    // no-op
  }
}