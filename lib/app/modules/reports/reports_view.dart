import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'reports_controller.dart';

class ReportsView extends GetView<ReportsController> {
  const ReportsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reports'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() => ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: controller.reports.length,
        itemBuilder: (context, index) {
          final report = controller.reports[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(report['title'] ?? ''),
              subtitle: Text('Date: ${report['date']}'),
              trailing: ElevatedButton(
                onPressed: () => controller.viewReport(report),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text('View Report', style: TextStyle(color: Colors.white)),
              ),
            ),
          );
        },
      )),
    );
  }
} 