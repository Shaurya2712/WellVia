import 'package:get/get.dart';
import 'package:wellvia/app/modules/auth/signup/singup_view.dart';
import '../modules/auth/selectAuth/select_auth_binding.dart';
import '../modules/auth/selectAuth/select_auth_view.dart';
import '../modules/auth/signup/signup_binding.dart';
import '../modules/home/home_view.dart';
import '../modules/home/home_binding.dart';
import '../modules/splash/splash_view.dart';
import '../modules/splash/splash_binding.dart';
import 'app_routes.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.select_auth,
      page: () => const SelectAuthView(),
      binding: SelectAuthBinding(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
  ];
}
