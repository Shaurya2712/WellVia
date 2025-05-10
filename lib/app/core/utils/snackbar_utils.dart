import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_colors.dart';

class SnackbarUtils {
  static void showSuccess({
    required String title,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.green[50],
      colorText: Colors.green[800],
      icon: Icon(Icons.check_circle, color: Colors.green[800]),
      snackPosition: SnackPosition.BOTTOM,
      duration: duration,
      margin: const EdgeInsets.all(10),
      borderRadius: 8,
      borderColor: Colors.green[200],
      borderWidth: 1,
    );
  }

  static void showWarning({
    required String title,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.orange[50],
      colorText: Colors.orange[800],
      icon: Icon(Icons.warning_amber_rounded, color: Colors.orange[800]),
      snackPosition: SnackPosition.BOTTOM,
      duration: duration,
      margin: const EdgeInsets.all(10),
      borderRadius: 8,
      borderColor: Colors.orange[200],
      borderWidth: 1,
    );
  }

  static void showError({
    required String title,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: Colors.red[50],
      colorText: Colors.red[800],
      icon: Icon(Icons.error_outline, color: Colors.red[800]),
      snackPosition: SnackPosition.BOTTOM,
      duration: duration,
      margin: const EdgeInsets.all(10),
      borderRadius: 8,
      borderColor: Colors.red[200],
      borderWidth: 1,
    );
  }

  static void showInfo({
    required String title,
    required String message,
    Duration duration = const Duration(seconds: 3),
  }) {
    Get.snackbar(
      title,
      message,
      backgroundColor: AppColors.primaryBlue.withOpacity(0.1),
      colorText: AppColors.primaryBlue,
      icon: Icon(Icons.info_outline, color: AppColors.primaryBlue),
      snackPosition: SnackPosition.BOTTOM,
      duration: duration,
      margin: const EdgeInsets.all(10),
      borderRadius: 8,
      borderColor: AppColors.primaryBlue.withOpacity(0.2),
      borderWidth: 1,
    );
  }
} 