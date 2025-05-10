import 'package:get/get.dart';
import 'splash_initial_controller.dart';

class SplashInitialBinding extends Bindings {
  @override
  void dependencies() {
    print("SplashInitialBinding: Initializing controller");
    Get.put<SplashInitialController>(SplashInitialController());
    print("SplashInitialBinding: Controller initialized");
  }
}
   