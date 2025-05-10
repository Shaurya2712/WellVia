// book_payment_view.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'book_payment_controller.dart';

class BookPaymentView extends GetView<BookPaymentController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_new_rounded),
                    onPressed: () => Get.back(),
                  ),
                  Text(
                    'Payment Summary',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.notifications_none_outlined),
                ],
              ),
              SizedBox(height: 24),
              Text(
                'Payment Details',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 12),
              _buildAmountRow('Consultation Fee', controller.consultationFee.value),
              _buildAmountRow('Taxes', controller.taxes.value),
              _buildAmountRow('Discount', controller.discount.value, isDiscount: true),
              Divider(height: 24),
              _buildAmountRow('Total', controller.total, isTotal: true),
              SizedBox(height: 24),
              Text(
                'Select Payment Methods',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              SizedBox(height: 12),
              _buildPaymentOption(Icons.credit_card, 'Credit/Debit Cards'),
              _buildPaymentOption(Icons.phone_android, 'UPI Payments'),
              _buildPaymentOption(Icons.account_balance_wallet, 'Wallets'),
              _buildPaymentOption(Icons.account_balance, 'Net Banking'),
              SizedBox(height: 30),
              Center(
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: controller.proceedToPayment,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: Color(0xFF55B2D4),
                    ),
                    child: Text(
                      'PAY NOW',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAmountRow(String label, int amount, {bool isDiscount = false, bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isDiscount ? Colors.red : Colors.black,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            '₹ $amount',
            style: TextStyle(
              color: isDiscount ? Colors.red : Colors.black,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          )
        ],
      ),
    );
  }

  Widget _buildPaymentOption(IconData icon, String label) {
    return Obx(() => Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: Colors.pink),
        title: Text(label),
        trailing: Radio<String>(
          value: label,
          groupValue: controller.selectedPaymentMethod.value,
          onChanged: (value) => controller.selectPaymentMethod(value!),
        ),
        onTap: () => controller.selectPaymentMethod(label),
      ),
    ));
  }
}
