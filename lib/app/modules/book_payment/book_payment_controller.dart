import 'package:get/get.dart';

class BookPaymentController extends GetxController {
  RxInt consultationFee = 500.obs;
  RxInt taxes = 80.obs;
  RxInt discount = 200.obs;

  int get total => consultationFee.value + taxes.value - discount.value;

  RxString selectedPaymentMethod = ''.obs;

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }

  void proceedToPayment() {
    print('Proceeding with: ${selectedPaymentMethod.value}');
  }
}
