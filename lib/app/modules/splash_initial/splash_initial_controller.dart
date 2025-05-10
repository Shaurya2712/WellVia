import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../routes/app_routes.dart';

class SplashInitialController extends GetxController {
  static const String _isLoggedInKey = 'is_logged_in';
  final RxBool _isChecking = true.obs;
  
  @override
  void onInit() {
    super.onInit();
    print("SplashInitialController: onInit called");
    // Use a microtask to ensure the widget is built before checking auth
    Future.microtask(() => checkAuthStatus());
  }

  Future<void> checkAuthStatus() async {
    print("SplashInitialController: Starting checkAuthStatus");
    try {
      // Get SharedPreferences instance
      print("SplashInitialController: Getting SharedPreferences instance");
      final prefs = await SharedPreferences.getInstance();
      print("SplashInitialController: Got SharedPreferences instance");
      
      // Check if user is logged in
      final isLoggedIn = prefs.getBool(_isLoggedInKey) ?? false;
      print("SplashInitialController: isLoggedIn = $isLoggedIn");
      print("SplashInitialController: All SharedPreferences keys: ${prefs.getKeys()}");
      
      // Add a minimum delay to show the loading animation
      print("SplashInitialController: Starting delay");
      await Future.delayed(const Duration(seconds: 2));
      print("SplashInitialController: Delay completed");
      
      if (isLoggedIn) {
        print("SplashInitialController: User is logged in, navigating to main");
        // If logged in, navigate to main screen with bottom navigation
        await Get.offAllNamed(Routes.main);
      } else {
        print("SplashInitialController: User is not logged in, navigating to splash");
        // If not logged in, navigate to splash screen
        await Get.offAllNamed(Routes.splash);
      }
    } catch (e, stackTrace) {
      print("SplashInitialController: Error checking login status: $e");
      print("SplashInitialController: Stack trace: $stackTrace");
      // In case of any error, navigate to splash screen
      print("SplashInitialController: Navigating to splash due to error");
      await Get.offAllNamed(Routes.splash);
    } finally {
      _isChecking.value = false;
      print("SplashInitialController: checkAuthStatus completed");
    }
  }
} 