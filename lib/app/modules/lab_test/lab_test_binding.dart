import 'package:get/get.dart';
import 'lab_test_controller.dart';

class LabTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LabTestController>(() => LabTestController());
  }
} 