import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'active_orders_controller.dart';

class ActiveOrdersView extends GetView<ActiveOrdersController> {
  const ActiveOrdersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Active Orders'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() => ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.activeOrders.length,
        itemBuilder: (context, index) {
          final order = controller.activeOrders[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text('Order ID: ${order['id']}'),
              subtitle: Text('Date: ${order['date']}\nStatus: ${order['status']}'),
              isThreeLine: true,
              trailing: ElevatedButton(
                onPressed: () => controller.viewOrderDetails(order),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('View Details', style: TextStyle(color: Colors.white)),
              ),
            ),
          );
        },
      )),
    );
  }
} 