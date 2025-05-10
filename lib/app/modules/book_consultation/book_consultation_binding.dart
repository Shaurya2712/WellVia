import 'package:get/get.dart';
import 'book_consultation_controller.dart';

class BookConsultationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookConsultationController>(() => BookConsultationController());
  }
} 