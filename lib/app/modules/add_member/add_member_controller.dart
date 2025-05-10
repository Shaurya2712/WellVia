import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AddMemberController extends GetxController {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

  void saveMember() {
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
    // Mock save
    Get.snackbar('Success', 'Member added successfully');
    Get.back();
  }

  @override
  void onClose() {
    nameController.dispose();
    phoneController.dispose();
    super.onClose();
  }
} 