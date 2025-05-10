import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HealthCheckupController extends GetxController {
  var selectedIndex = 2.obs; // Checkups tab

  // Demo data for UI
  final mostBookedTests = [
    {
      'title': 'Full Body Checkup - Comprehensive',
      'price': 8030,
    },
    {
      'title': 'Diabetes Screening',
      'price': 1200,
    },
    {
      'title': 'Women\'s Health Panel',
      'price': 3500,
    },
  ];

  final categories = [
    {
      'icon': Icons.person,
      'title': 'Full Body Checkup',
    },
    {
      'icon': Icons.female,
      'title': 'Women\'s Health',
    },
    {
      'icon': Icons.medical_services,
      'title': 'Diabetes Screening',
    },
    {
      'icon': Icons.star,
      'title': 'Popular Health checks',
    },
  ];

  final organs = [
    {'icon': Icons.favorite, 'title': 'Heart'},
    {'icon': Icons.opacity, 'title': 'Kidney'},
    {'icon': Icons.bloodtype, 'title': 'Liver'},
    {'icon': Icons.science, 'title': 'Hormones'},
  ];

  final labs = [
    {
      'name': 'Lal Path Labs',
      'rating': 4.8,
    },
    {
      'name': 'SRL Diagnostics',
      'rating': 4.7,
    },
  ];

  // Search functionality
  void searchTests(String query) {
    // TODO: Implement search logic
    Get.snackbar('Search', 'Searching for "$query"');
  }

  // Navigation and actions
  void viewDetails(Map<String, dynamic> test) {
    // TODO: Implement view details navigation
    Get.snackbar('View Details', 'Viewing details for ${test['title']}');
  }

  void addToCart(Map<String, dynamic> test) {
    // TODO: Implement add to cart logic
    Get.snackbar('Add to Cart', '${test['title']} added to cart');
  }

  void selectCategory(Map<String, dynamic> category) {
    // TODO: Implement category selection navigation
    Get.snackbar('Category', 'Selected ${category['title']}');
  }

  void selectOrganTest(Map<String, dynamic> organ) {
    // TODO: Implement organ test selection navigation
    Get.snackbar('Organ Test', 'Selected ${organ['title']} test');
  }

  void getSet() {
    // TODO: Implement Get Set navigation
    Get.snackbar('Get Set', 'Get Set for a healthier tomorrow!');
  }

  void bookLab(Map<String, dynamic> lab) {
    // TODO: Implement book lab navigation
    Get.snackbar('Book Lab', 'Booking ${lab['name']}');
  }

  void goToCart() {
    // TODO: Implement cart navigation
    Get.snackbar('Cart', 'Navigating to cart');
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
        // Already on Checkups
        break;
      case 3:
        Get.offAllNamed('/ambulance');
        break;
    }
  }
} 