import 'package:get/get.dart';
import 'book_payment_controller.dart';

class BookPaymentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BookPaymentController>(() => BookPaymentController());
  }
}
