import 'package:get/get.dart';

class PastOrdersController extends GetxController {
  var pastOrders = <Map<String, String>>[ 
    {'id': 'P101', 'date': '2024-05-01', 'status': 'Completed'},
    {'id': 'P102', 'date': '2024-05-10', 'status': 'Completed'},
  ].obs;

  void viewOrderDetails(Map<String, String> order) {
    Get.snackbar('Order Details', 'Viewing details for Order ID: ${order['id']}');
  }
} 