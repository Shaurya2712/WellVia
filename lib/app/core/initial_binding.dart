import 'package:get/get.dart' as getx;
import '../core/services/dio_service.dart';
import '../data/repositories/auth_repository.dart';

class InitialBinding extends getx.Bindings {
  @override
  void dependencies() {
    getx.Get.put(DioService(), permanent: true);
    getx.Get.put(AuthRepository(), permanent: true);
    // ... existing bindings ...
  }
} 