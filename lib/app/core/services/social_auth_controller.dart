import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:wellvia/app/core/services/social_auth_service.dart';
import 'package:wellvia/app/core/utils/global_widgets/under_development_dialogbox.dart';
import 'package:wellvia/app/routes/app_routes.dart';

class SocialAuthController extends GetxController {

  final DialogController dialogController = Get.put(DialogController());

  // Common method for Social Login (Google/Facebook)
  Future<void> socialLogin(String provider) async {
    final socialAuthService = Get.find<SocialAuthService>();
    SocialUser? user;

    // Call the respective login function based on the provider
    if (provider == 'google') {
      user = await socialAuthService.loginWithGoogle();
    } else if (provider == 'facebook') {
      dialogController.showFeatureDevelopmentDialog();
      // user = await socialAuthService.loginWithFacebook();
    }

    if (user != null) {
      // Handle successful login (e.g., navigate to the dashboard, store user info)
      print('$provider Login Successful: ${user.name}, ${user.email}');
      // Navigate to main screen
      Get.offAllNamed(AppRoutes.main);
    } else {
      // Handle login failure (e.g., show an error message)
      print('$provider Login Failed');
    }
  }
}
