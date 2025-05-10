import 'package:get/get.dart';
import 'saved_addresses_controller.dart';

class SavedAddressesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SavedAddressesController>(() => SavedAddressesController());
  }
} 