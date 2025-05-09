import 'package:get/get.dart';
import 'login_controller.dart';
import 'package:wellvia/app/core/services/social_auth_service.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.put<SocialAuthService>(SocialAuthService());
  }
}
