import 'package:get/get.dart';
import 'package:wellvia/app/modules/auth/signup/singup_controller.dart';


class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}
