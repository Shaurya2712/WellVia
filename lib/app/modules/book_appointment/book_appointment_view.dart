import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'book_appointment_controller.dart';

class BookAppointmentView extends GetView<BookAppointmentController> {
  const BookAppointmentView({Key? key}) : super(key: key);

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
          'Booking Details',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Who is getting consulted?', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black)),
            const SizedBox(height: 16),
            Text('Full Name', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
            const SizedBox(height: 6),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'Enter your name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              ),
            ),
            const SizedBox(height: 14),
            Text('Age', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
            const SizedBox(height: 6),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter your age',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.grey.shade300),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
              ),
            ),
            const SizedBox(height: 14),
            // Gender
            Text('Gender', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
            const SizedBox(height: 6),
            Obx(() => Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    value: 'Male',
                    groupValue: controller.gender.value,
                    onChanged: (val) => controller.setGender(val ?? 'Male'),
                    title: Text('Male', style: TextStyle(fontSize: 13)),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    value: 'Female',
                    groupValue: controller.gender.value,
                    onChanged: (val) => controller.setGender(val ?? 'Female'),
                    title: Text('Female', style: TextStyle(fontSize: 13)),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ],
            )),
            const SizedBox(height: 10),
            // Mode
            Text('Mode', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
            const SizedBox(height: 6),
            Obx(() => Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    value: 'Audio',
                    groupValue: controller.mode.value,
                    onChanged: (val) => controller.setMode(val ?? 'Audio'),
                    title: Text('Audio', style: TextStyle(fontSize: 13)),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    value: 'Video',
                    groupValue: controller.mode.value,
                    onChanged: (val) => controller.setMode(val ?? 'Video'),
                    title: Text('Video', style: TextStyle(fontSize: 13)),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ],
            )),
            const SizedBox(height: 10),
            // Medicine
            Text('Are you taking any medicine or suffering from anything?', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
            const SizedBox(height: 6),
            Obx(() => Row(
              children: [
                Expanded(
                  child: RadioListTile<bool>(
                    value: true,
                    groupValue: controller.isTakingMedicine.value,
                    onChanged: (val) => controller.setIsTakingMedicine(val ?? true),
                    title: Text('Yes', style: TextStyle(fontSize: 13)),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
                Expanded(
                  child: RadioListTile<bool>(
                    value: false,
                    groupValue: controller.isTakingMedicine.value,
                    onChanged: (val) => controller.setIsTakingMedicine(val ?? false),
                    title: Text('No', style: TextStyle(fontSize: 13)),
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ],
            )),
            Obx(() => controller.isTakingMedicine.value
                ? Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Kindly explain',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.grey.shade300),
                        ),
                        contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 14),
                      ),
                      maxLines: 2,
                    ),
                  )
                : SizedBox.shrink()),
            const SizedBox(height: 16),
            // Upload file
            Text('Upload your file', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13)),
            const SizedBox(height: 2),
            Text('Upload your last report or prescription', style: TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 44,
                    decoration: BoxDecoration(
                      color: Colors.blue[100],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.upload, color: Colors.blue, size: 22),
                        const SizedBox(width: 8),
                        Text('Upload', style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Optionally, add a file name preview here
              ],
            ),
            const SizedBox(height: 18),
            // Consultation Added
            Text('Consultation Added', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Container(
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
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.pink[50],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    icon: Icon(Icons.delete, color: Colors.pink),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            OutlinedButton.icon(
              onPressed: () {},
              icon: Icon(Icons.add, color: Colors.pink),
              label: Text('Another Consultation', style: TextStyle(color: Colors.pink, fontWeight: FontWeight.bold)),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.pink),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.symmetric(vertical: 12),
              ),
            ),
            const SizedBox(height: 24),
            // Proceed Button
            SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to payment and clear this page from backstack
                  Get.offNamed('/book-payment');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 2,
                ),
                child: Text(
                  'Proceed',
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