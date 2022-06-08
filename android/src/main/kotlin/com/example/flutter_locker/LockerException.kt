package com.example.flutter_locker


class LockerException internal constructor(code: String, message: String?, details: Any?) :
  RuntimeException(message) {
  val code: String
  val details: Any?

  companion object {
    private const val TAG = "LockerException#"
  }

  init {
    this.code = code
    this.details = details
  }

  override fun toString(): String {
    return code
  }
}