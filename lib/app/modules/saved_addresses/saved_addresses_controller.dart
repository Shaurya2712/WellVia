import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SavedAddressesController extends GetxController {
  final line1Controller = TextEditingController();
  final line2Controller = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final pinController = TextEditingController();

  var addresses = <Map<String, String>>[].obs;

  void saveAddress() {
    final line1 = line1Controller.text.trim();
    final line2 = line2Controller.text.trim();
    final city = cityController.text.trim();
    final state = stateController.text.trim();
    final pin = pinController.text.trim();
    if (line1.isEmpty || city.isEmpty || state.isEmpty || pin.isEmpty) {
      Get.snackbar('Error', 'Please fill all required fields');
      return;
    }
    addresses.add({
      'line1': line1,
      'line2': line2,
      'city': city,
      'state': state,
      'pin': pin,
    });
    clearFields();
    Get.snackbar('Success', 'Address saved');
  }

  void editAddress(int index) {
    final address = addresses[index];
    line1Controller.text = address['line1'] ?? '';
    line2Controller.text = address['line2'] ?? '';
    cityController.text = address['city'] ?? '';
    stateController.text = address['state'] ?? '';
    pinController.text = address['pin'] ?? '';
    addresses.removeAt(index);
  }

  void deleteAddress(int index) {
    addresses.removeAt(index);
    Get.snackbar('Deleted', 'Address removed');
  }

  void clearFields() {
    line1Controller.clear();
    line2Controller.clear();
    cityController.clear();
    stateController.clear();
    pinController.clear();
  }

  @override
  void onClose() {
    line1Controller.dispose();
    line2Controller.dispose();
    cityController.dispose();
    stateController.dispose();
    pinController.dispose();
    super.onClose();
  }
} 