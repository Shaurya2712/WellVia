import 'package:get/get.dart';
import '../../routes/app_routes.dart';
import 'package:wellvia/app/core/services/social_auth_service.dart';

class SplashController extends GetxController {
  final SocialAuthService _authService = Get.find<SocialAuthService>();
  
  @override
  void onInit() {
    super.onInit();
    // checkAuthStatus();
  }

  Future<void> checkAuthStatus() async {
      // If not logged in, navigate to auth selection
      Get.offAllNamed(AppRoutes.selectAuth);
    }

}
