package com.example.flutter_locker

import android.app.Activity
import android.content.Context
import androidx.annotation.NonNull
import androidx.fragment.app.FragmentActivity
import co.infinum.goldfinger.Goldfinger
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.lang.Exception

/** FlutterLockerPlugin */
public class FlutterLockerPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {

    private lateinit var channel: MethodChannel
    private lateinit var context: Context
    private lateinit var activity: Activity
    private lateinit var goldfinger: Goldfinger

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        this.context = flutterPluginBinding.applicationContext

        channel = MethodChannel(
            flutterPluginBinding.getFlutterEngine().getDartExecutor(),
            "flutter_locker"
        )
        channel.setMethodCallHandler(this)
        goldfinger = Goldfinger.Builder(context).build()
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            FlutterLocker.ProtoMethodInterface.canAuthenticate.number.toString() -> canAuthenticate(result)
            FlutterLocker.ProtoMethodInterface.saveSecret.number.toString() -> saveSecret(call, result)
            FlutterLocker.ProtoMethodInterface.retrieveSecret.number.toString() -> retrieveSecret(call, result)
            FlutterLocker.ProtoMethodInterface.deleteSecret.number.toString() -> deleteSecret(call, result)
            else -> result.notImplemented()
        }
    }

    private fun canAuthenticate(result: Result) {
        result.success(goldfinger.canAuthenticate())
    }

    private fun saveSecret(call: MethodCall, result: Result) {
        val request = FlutterLocker.ProtoSaveRequest.parseFrom(call.arguments as ByteArray)

        val prompt = Goldfinger.PromptParams.Builder(activity as FragmentActivity)
            .title(request.androidPrompt.titleText)
            .description(request.androidPrompt.description)
            .negativeButtonText(request.androidPrompt.cancelText)
            .build()

        goldfinger.encrypt(prompt, request.key, request.secret, object : Goldfinger.Callback {
            override fun onResult(goldfingerResult: Goldfinger.Result) {
                if (goldfingerResult.type() == Goldfinger.Type.SUCCESS) {
                    activity.getPreferences(Context.MODE_PRIVATE).edit()
                        .putString(request.key.toPrefsKey(), goldfingerResult.value()).apply()
                    result.success(null)
                } else if (goldfingerResult.type() == Goldfinger.Type.ERROR) {
                    result.error("Error", "Failed to save secret: " +
                        goldfingerResult.message(), null);
                }
            }

            override fun onError(e: Exception) {
                result.error("Error", e.toString(), null)
            }
        })
    }

    private fun retrieveSecret(call: MethodCall, result: Result) {
        val request = FlutterLocker.ProtoRetrieveRequest.parseFrom(call.arguments as ByteArray)

        val prompt = Goldfinger.PromptParams.Builder(activity as FragmentActivity)
            .title(request.androidPrompt.titleText)
            .description(request.androidPrompt.description)
            .negativeButtonText(request.androidPrompt.cancelText)
            .build()

        val encryptedSecret = activity.getPreferences(Context.MODE_PRIVATE).getString(request.key.toPrefsKey(), null)

        encryptedSecret?.let {
            goldfinger.decrypt(prompt, request.key, it, object : Goldfinger.Callback {
                override fun onResult(goldfingerResult: Goldfinger.Result) {
                    if (goldfingerResult.type() == Goldfinger.Type.SUCCESS) {
                        result.success(goldfingerResult.value())
                    } else if (goldfingerResult.type() == Goldfinger.Type.ERROR) {
                        result.error("Error", "Failed to retrieve secret: " +
                            goldfingerResult.message(), null);
                    }
                }

                override fun onError(e: Exception) {
                    result.error("Error", e.toString(), null)
                }
            })
        } ?: kotlin.run {
            result.error("Error", "Secret not found for that key", null)
        }
    }

    private fun deleteSecret(call: MethodCall, result: Result) {
        val request = FlutterLocker.ProtoDeleteRequest.parseFrom(call.arguments as ByteArray)
        activity.getPreferences(Context.MODE_PRIVATE).edit().remove(request.key.toPrefsKey()).apply()
        result.success(null)
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    //region ActivityAware interface
    override fun onDetachedFromActivity() {
        // no-op
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        this.activity = binding.activity
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        this.activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        // no-op
    }
    //endregion

    // When saving to prefs we add this prefix to avoid any possible clash with other keys
    fun String.toPrefsKey(): String = "\$_flutter_locker_$this"
}
