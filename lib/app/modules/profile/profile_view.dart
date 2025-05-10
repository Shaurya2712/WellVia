import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF42A5F5),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: controller.editProfile,
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(
              top: size.height * 0.03,
              left: size.width * 0.06,
              right: size.width * 0.06,
              bottom: size.height * 0.04,
            ),
            decoration: const BoxDecoration(
              color: Color(0xFF42A5F5),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: size.width * 0.11,
                  backgroundColor: Colors.grey[300],
                  child: const Icon(Icons.person, color: Colors.white, size: 48),
                ),
                SizedBox(width: size.width * 0.05),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'SAMEER JATTAN',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      '+91-12345 67890',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.5,
                        height: 1.2,
                        // 0.8 opacity
                        shadows: [Shadow(color: Colors.black12, blurRadius: 1)],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.06,
              vertical: size.height * 0.025,
            ),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              title: const Text(
                "SAMEER JATTAN'S Family",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              subtitle: const Text('1 Members'),
              trailing: ElevatedButton.icon(
                onPressed: controller.addAnotherMember,
                icon: const Icon(Icons.person_add, color: Colors.white, size: 18),
                label: const Text('Add Another Member', style: TextStyle(color: Colors.white, fontSize: 13)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                  elevation: 0,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              children: [
                _buildMenuItem(
                  icon: Icons.location_on,
                  title: 'Saved Addresses',
                  onTap: controller.navigateToSavedAddresses,
                ),
                _buildMenuItem(
                  icon: Icons.message,
                  title: 'Active Orders',
                  onTap: controller.navigateToActiveOrders,
                ),
                _buildMenuItem(
                  icon: Icons.history,
                  title: 'Past Orders',
                  onTap: controller.navigateToPastOrders,
                ),
                _buildMenuItem(
                  icon: Icons.receipt_long,
                  title: 'Invoices',
                  onTap: controller.navigateToInvoices,
                ),
                _buildMenuItem(
                  icon: Icons.bar_chart,
                  title: 'Reports',
                  onTap: controller.navigateToReports,
                ),
                _buildMenuItem(
                  icon: Icons.logout,
                  title: 'Logout',
                  onTap: controller.logout,
                ),
              ],
            ),
          ),
        ],
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

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.blueGrey, size: 26),
      title: Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      minLeadingWidth: 32,
    );
  }
} 