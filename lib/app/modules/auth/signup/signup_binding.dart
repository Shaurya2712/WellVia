import 'package:get/get.dart';
import 'package:wellvia/app/modules/auth/signup/signup_controller.dart';
import 'package:wellvia/app/data/repositories/auth_repository.dart';
import 'package:wellvia/app/core/services/dio_service.dart';


class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DioService>(() => DioService(), fenix: true);
    Get.lazyPut<AuthRepository>(() => AuthRepository(), fenix: true);
    Get.lazyPut<SignUpController>(() => SignUpController());
  }
}
