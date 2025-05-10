import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'invoices_controller.dart';

class InvoicesView extends GetView<InvoicesController> {
  const InvoicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Invoices'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() => ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.invoices.length,
        itemBuilder: (context, index) {
          final invoice = controller.invoices[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text('Invoice ID: ${invoice['id']}'),
              subtitle: Text('Date: ${invoice['date']}\nAmount: ₹${invoice['amount']}'),
              isThreeLine: true,
              trailing: ElevatedButton(
                onPressed: () => controller.downloadInvoice(invoice),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('Download', style: TextStyle(color: Colors.white)),
              ),
            ),
          );
        },
      )),
    );
  }
} 