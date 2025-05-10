import 'package:get/get.dart';
import 'package:flutter/material.dart';

class EditProfileController extends GetxController {
  final nameController = TextEditingController(text: 'SAMEER JATTAN');
  final phoneController = TextEditingController(text: '+91-12345 67890');

  void updateProfile() {
    final name = nameController.text.trim();
    final phone = phoneController.text.trim();
    if (name.isEmpty) {
      Get.snackbar('Error', 'Name cannot be empty');
      return;
    }
    if (phone.isEmpty || phone.length < 10) {
      Get.snackbar('Error', 'Enter a valid phone number');
      return;
    }
    // Mock update
    Get.snackbar('Success', 'Profile updated successfully');
    Get.back();
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    super.onClose();
  }
} 