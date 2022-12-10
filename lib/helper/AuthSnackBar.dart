import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController AuthSnackBar(title, message) {
  return Get.snackbar(
    title,
    message,
    backgroundColor: Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    borderRadius: 10,
    borderWidth: 2,
  );
}
