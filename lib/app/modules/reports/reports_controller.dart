import 'package:get/get.dart';

class ReportsController extends GetxController {
  var reports = <Map<String, String>>[ 
    {'title': 'Blood Test Report', 'date': '2024-05-01'},
    {'title': 'X-Ray Report', 'date': '2024-05-10'},
  ].obs;

  void viewReport(Map<String, String> report) {
    Get.snackbar('Report', 'Viewing report: ${report['title']}');
  }
} 