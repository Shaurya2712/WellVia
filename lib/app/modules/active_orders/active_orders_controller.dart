import 'package:get/get.dart';

class ActiveOrdersController extends GetxController {
  var activeOrders = <Map<String, String>>[ 
    {'id': 'A123', 'date': '2024-06-01', 'status': 'In Progress'},
    {'id': 'A124', 'date': '2024-06-02', 'status': 'In Progress'},
  ].obs;

  void viewOrderDetails(Map<String, String> order) {
    Get.snackbar('Order Details', 'Viewing details for Order ID: ${order['id']}');
  }
} 