import 'package:get/get.dart';
import 'active_orders_controller.dart';

class ActiveOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ActiveOrdersController>(() => ActiveOrdersController());
  }
} 