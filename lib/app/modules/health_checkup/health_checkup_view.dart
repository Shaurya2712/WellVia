import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'health_checkup_controller.dart';

class HealthCheckupView extends GetView<HealthCheckupController> {
  const HealthCheckupView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Health Checkups', style: TextStyle(fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: controller.goToCart,
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0.5,
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.04, vertical: size.height * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: Colors.grey),
                    const SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search category, tests...',
                        ),
                        onChanged: controller.searchTests,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              // Most Booked Tests
              const Text('Most Booked Tests', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 10),
              SizedBox(
                height: 160,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.mostBookedTests.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 14),
                  itemBuilder: (context, index) {
                    final test = controller.mostBookedTests[index];
                    return _buildTestCard(test, size);
                  },
                ),
              ),
              const SizedBox(height: 24),
              // Categories
              const Text('Categories', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 10),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 2.2,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                ),
                itemCount: controller.categories.length,
                itemBuilder: (context, index) {
                  final category = controller.categories[index];
                  return _buildCategoryCard(category, size);
                },
              ),
              const SizedBox(height: 24),
              // Test for Vital Organs
              const Text('Test for Vital Organs', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 10),
              SizedBox(
                height: 90,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.organs.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 18),
                  itemBuilder: (context, index) {
                    final organ = controller.organs[index];
                    return _buildOrganIcon(organ);
                  },
                ),
              ),
              const SizedBox(height: 24),
              // Stay Healthy Banner
              _buildStayHealthyBanner(size),
              const SizedBox(height: 24),
              // Recommended Labs
              const Text('Recommended Labs', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 10),
              SizedBox(
                height: 110,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.labs.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 14),
                  itemBuilder: (context, index) {
                    final lab = controller.labs[index];
                    return _buildLabCard(lab, size);
                  },
                ),
              ),
              const SizedBox(height: 24),
              // FAQ
              const Text('FAQ - Frequently Asked Questions', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
              const SizedBox(height: 10),
              _buildFAQTile(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: controller.selectedIndex.value,
        onTap: controller.onBottomNavTap,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services),
            label: 'Checkups',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital),
            label: 'Ambulance',
          ),
        ],
      )),
    );
  }

  Widget _buildTestCard(Map<String, dynamic> test, Size size) {
    return Container(
      width: size.width * 0.6,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(test['title'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 8),
          Text('Rs. ${test['price']}', style: const TextStyle(fontSize: 15, color: Colors.black54)),
          const Spacer(),
          Row(
            children: [
              TextButton(
                onPressed: () => controller.viewDetails(test),
                child: const Text('View Details'),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () => controller.addToCart(test),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  elevation: 0,
                ),
                child: const Text('Add to Cart', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(Map<String, dynamic> category, Size size) {
    return GestureDetector(
      onTap: () => controller.selectCategory(category),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(category['icon'], size: 32, color: Colors.blue),
            const SizedBox(height: 8),
            Text(category['title'], textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  Widget _buildOrganIcon(Map<String, dynamic> organ) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => controller.selectOrganTest(organ),
          child: CircleAvatar(
            radius: 28,
            backgroundColor: Colors.blue[50],
            child: Icon(organ['icon'], color: Colors.red, size: 32),
          ),
        ),
        const SizedBox(height: 6),
        Text(organ['title'], style: const TextStyle(fontSize: 13)),
      ],
    );
  }

  Widget _buildStayHealthyBanner(Size size) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF42A5F5), Color(0xFF00E5FF)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Stay Healthy with Regular Checkups',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Text(
                  'One step today for a healthier tomorrow',
                  style: TextStyle(color: Colors.white.withOpacity(0.9), fontSize: 14),
                ),
              ),
              ElevatedButton(
                onPressed: controller.getSet,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  elevation: 0,
                ),
                child: const Text('Get Set', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLabCard(Map<String, dynamic> lab, Size size) {
    return Container(
      width: size.width * 0.5,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: Colors.yellow[700],
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.local_pharmacy, color: Colors.white, size: 28),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(lab['name'], style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.blue, size: 15),
                    const SizedBox(width: 2),
                    Text('${lab['rating']}/5', style: const TextStyle(fontSize: 13, color: Colors.blue)),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () => controller.bookLab(lab),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.pink,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              elevation: 0,
            ),
            child: const Text('Book Now', style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQTile() {
    return ExpansionTile(
      title: const Text('How to book an online doctor consultation?', style: TextStyle(fontWeight: FontWeight.w500)),
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            'To book an online doctor consultation, simply select your preferred doctor, choose a time slot, and complete the booking process. You will receive a confirmation and can join the consultation via the app.',
            style: TextStyle(fontSize: 14, color: Colors.black54),
          ),
        ),
      ],
    );
  }
} 