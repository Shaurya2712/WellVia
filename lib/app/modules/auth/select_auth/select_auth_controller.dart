import 'package:get/get.dart';
import 'package:wellvia/app/routes/app_routes.dart';

class SelectAuthController extends GetxController {
  // Must be observable
  final RxList<Map<String, String>> imageList = <Map<String, String>>[
    {
      'image': 'assets/images/demo_1.jpg',
      'label': 'Track your health',
    },
    {
      'image': 'assets/images/demo_2.jpg',
      'label': 'Book appointments',
    },
    {
      'image': 'assets/images/demo_3.jpg',
      'label': 'Consult online',
    },
  ].obs;  // ← this is important

  var currentPage = 0.obs;  // ← this is important

  void navigateToLogin(){
    Get.toNamed(AppRoutes.login);
  }

  void navigateToSignUp(){
    Get.toNamed(AppRoutes.signup);
  }

}
