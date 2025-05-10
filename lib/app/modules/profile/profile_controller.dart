import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProfileController extends GetxController {
  var selectedIndex = 0.obs;

  void navigateToSavedAddresses() {
    Get.toNamed('/saved-addresses');
  }

  void navigateToActiveOrders() {
    Get.toNamed('/active-orders');
  }

  void navigateToPastOrders() {
    Get.toNamed('/past-orders');
  }

  void navigateToInvoices() {
    Get.toNamed('/invoices');
  }

  void navigateToReports() {
    Get.toNamed('/reports');
  }

  void logout() {
    Get.defaultDialog(
      title: 'Logout',
      middleText: 'Are you sure you want to logout?',
      textCancel: 'Cancel',
      textConfirm: 'Logout',
      confirmTextColor: Colors.white,
      buttonColor: Colors.pink,
      onConfirm: () {
        Get.offAllNamed('/login');
      },
      onCancel: () {},
    );
  }

  void addAnotherMember() {
    Get.toNamed('/add-member');
  }

  void editProfile() {
    Get.toNamed('/edit-profile');
  }

  void onBottomNavTap(int index) {
    selectedIndex.value = index;
    switch (index) {
      case 0:
        Get.offAllNamed('/home');
        break;
      case 1:
        Get.offAllNamed('/reports');
        break;
      case 2:
        Get.offAllNamed('/checkups');
        break;
      case 3:
        Get.offAllNamed('/ambulance');
        break;
    }
  }
} 