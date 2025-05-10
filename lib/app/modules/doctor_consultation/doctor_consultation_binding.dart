import 'package:get/get.dart';
import 'doctor_consultation_controller.dart';

class DoctorConsultationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorConsultationController>(() => DoctorConsultationController());
  }
} 