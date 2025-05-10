import 'package:get/get.dart';
import 'health_checkup_controller.dart';

class HealthCheckupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HealthCheckupController>(() => HealthCheckupController());
  }
} 