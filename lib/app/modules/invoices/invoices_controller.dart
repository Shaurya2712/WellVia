import 'package:get/get.dart';

class InvoicesController extends GetxController {
  var invoices = <Map<String, String>>[ 
    {'id': 'INV001', 'date': '2024-05-01', 'amount': '1200'},
    {'id': 'INV002', 'date': '2024-05-10', 'amount': '800'},
  ].obs;

  void downloadInvoice(Map<String, String> invoice) {
    Get.snackbar('Download', 'Downloading Invoice ID: ${invoice['id']}');
  }
} 