import 'package:get/get.dart';
import '../../routes/app_routes.dart';

class SplashController extends GetxController {
  // navigation to auth screen
  void navigate(){
    Get.offNamed(AppRoutes.select_auth);
  }
}
