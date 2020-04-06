package com.example.flutter_locker

import android.app.Activity
import android.content.Context
import android.content.SharedPreferences
import android.util.Log
import androidx.annotation.NonNull;
import androidx.fragment.app.FragmentActivity
import co.infinum.goldfinger.Goldfinger
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.PluginRegistry.Registrar
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
        channel.setMethodCallHandler(this);
        goldfinger = Goldfinger.Builder(context).build();
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        val args = call.arguments as? List<String>

        when (call.method) {
            "canAuthenticate" -> canAuthenticate(result)
            "saveSecret" -> saveSecret(args!![0], args[1], args[2], args[3], result)
            "retrieveSecret" -> retrieveSecret(args!![0], args[1], args[2], result)
            else -> result.notImplemented()
        }
    }

    private fun canAuthenticate(result: Result) {
        result.success(goldfinger.canAuthenticate());
    }

    private fun saveSecret(key: String, value: String, title: String, cancel: String, result: Result) {
        val prompt = Goldfinger.PromptParams.Builder(activity as FragmentActivity)
            .title(title)
            .negativeButtonText(cancel)
            .build();
        goldfinger.encrypt(prompt, key, value, object : Goldfinger.Callback {
            override fun onResult(goldfingerResult: Goldfinger.Result) {
                if (goldfingerResult.type() == Goldfinger.Type.SUCCESS) {
                    activity.getPreferences(Context.MODE_PRIVATE).edit()
                        .putString(key, goldfingerResult.value()).apply()
                    result.success(true);
                } else if (goldfingerResult.type() == Goldfinger.Type.SUCCESS) {
                    result.success(false);
                }
            }

            override fun onError(e: Exception) {
                result.error("Error", e.toString(), null);
            }
        })
    }

    private fun retrieveSecret(key: String, title: String, cancel: String, result: Result) {
        val prompt = Goldfinger.PromptParams.Builder(activity as FragmentActivity)
            .title(title)
            .negativeButtonText(cancel)
            .build();

        val encryptedSecret = activity.getPreferences(Context.MODE_PRIVATE).getString(key, null);

        encryptedSecret?.let {
            goldfinger.decrypt(prompt, key, it, object : Goldfinger.Callback {
                override fun onResult(goldfingerResult: Goldfinger.Result) {
                    if (goldfingerResult.type() == Goldfinger.Type.SUCCESS) {
                        result.success(goldfingerResult.value());
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
}
