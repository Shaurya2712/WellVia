import 'package:get/get.dart';
import 'past_orders_controller.dart';

class PastOrdersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PastOrdersController>(() => PastOrdersController());
  }
} 