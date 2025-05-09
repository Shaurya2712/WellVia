import 'package:get/get.dart';
import 'select_auth_controller.dart';

class SelectAuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectAuthController>(() => SelectAuthController());
  }
}
