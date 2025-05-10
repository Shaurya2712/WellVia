import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'payment_summary_controller.dart';

class PaymentSummaryView extends GetView<PaymentSummaryController> {
  const PaymentSummaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Payment Summary',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                icon: Icon(Icons.notifications, color: Colors.black),
                onPressed: () {},
              ),
              Positioned(
                right: 10,
                top: 10,
                child: Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    '1',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),
            // Success Icon and Message
            Center(
              child: Column(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 80),
                  const SizedBox(height: 16),
                  Text('Payment Successful!', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
                  const SizedBox(height: 4),
                  Text('Thank you for your payment', style: TextStyle(color: Colors.grey, fontSize: 16)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Consultation Details
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Consultation Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Cardiologist - Dr. Rishi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  const SizedBox(height: 4),
                  Text('Price - ₹ 500', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                  const SizedBox(height: 4),
                  Text('Date - Wed, 23', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                  const SizedBox(height: 4),
                  Text('Time - 06:30 AM - 7:30 AM', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                  const SizedBox(height: 4),
                  Text('Mode - Video', style: TextStyle(color: Colors.grey[600], fontSize: 13)),
                ],
              ),
            ),
            const SizedBox(height: 24),
            // Payment Details
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Payment Details', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)),
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Transaction ID: 123456789', style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 6),
                  Text('Payment Method: UPI', style: TextStyle(fontSize: 14)),
                  const SizedBox(height: 6),
                  Text('Amount: ₹ 500', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                ],
              ),
            ),
            const SizedBox(height: 32),
            // Back to Home Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: controller.backToHome,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  'Back to Home',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
} 