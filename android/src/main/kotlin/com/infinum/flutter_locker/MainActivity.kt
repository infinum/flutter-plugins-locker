package com.infinum.flutter_locker

import androidx.annotation.NonNull;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    super.configureFlutterEngine(flutterEngine)
    FlutterLocker.FlutterLockerApi.setup(flutterEngine.dartExecutor.binaryMessenger, FlutterLockerPlugin())
  }

}
