import 'package:get/get.dart';

class BookAppointmentController extends GetxController {
  var gender = 'Male'.obs;
  var mode = 'Audio'.obs;
  var isTakingMedicine = false.obs;

  void setGender(String value) => gender.value = value;
  void setMode(String value) => mode.value = value;
  void setIsTakingMedicine(bool value) => isTakingMedicine.value = value;

  void proceed() {
    // Placeholder for proceed action
  }
} 