import 'package:get/instance_manager.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kwg/ui/common/kwg_theme.dart';

class CustomSnackbar {
  static showErrorSnackbar(String title, String message) {
    Get.snackbar(title, message,
        icon: Icon(
          Icons.error_outline,
          color: WHITE,
        ),
        backgroundColor: RED,
        colorText: WHITE,
        duration: Duration(seconds: 10));
  }

  static showSuccessSnackBar(String title, String message) {
    Get.snackbar(title, message,
        icon: Icon(
          Icons.check_circle,
          color: WHITE,
        ),
        backgroundColor: PRIMARY_COLOR,
        colorText: WHITE);
  }

  static showNoticeSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      duration: Duration(seconds: 5),
      backgroundColor: BLUE,
      colorText: WHITE,
    );
  }
}
