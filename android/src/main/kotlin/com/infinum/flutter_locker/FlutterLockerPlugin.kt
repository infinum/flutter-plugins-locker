package com.infinum.flutter_locker

import android.app.Activity
import android.content.Context
import androidx.fragment.app.FragmentActivity
import co.infinum.goldfinger.Goldfinger
import kotlin.Exception

/** FlutterLockerPlugin */
public class FlutterLockerPlugin : FlutterLocker.PigeonApi {
  private lateinit var context: Context
  private lateinit var activity: Activity
  private var goldfinger: Goldfinger

  init {
    goldfinger = Goldfinger.Builder(context).build()
  }

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
          result?.success(null)
        } else if (goldfingerResult.type() == Goldfinger.Type.ERROR) {
          handleGoldfingerError(goldfingerResult, result)
        }
      }

      override fun onError(e: Exception) {
        result?.error(Exception("Failed to save secret: ${e.message}"))
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
            Exception(
              e.toString()
            )
          )
        }
      })
    } ?: kotlin.run {
      result?.error(Exception("Secret not found for that key"))
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
      result?.error(Exception("Authentication canceled: ${goldfingerResult.message()}"))
    } else if (goldfingerResult.reason() == Goldfinger.Reason.LOCKOUT_PERMANENT || goldfingerResult.reason() == Goldfinger.Reason.LOCKOUT) {
      result?.error(Exception("Authentication failed: ${goldfingerResult.message()}"))
    } else {
      result?.error(Exception("Error: ${goldfingerResult.message()}"))
    }
  }

  // When saving to prefs we add this prefix to avoid any possible clash with other keys
  fun String.toPrefsKey(): String = "\$_flutter_locker_$this"
}
