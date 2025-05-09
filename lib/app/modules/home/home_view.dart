import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../home/home_controller.dart';
import 'package:wellvia/app/core/constants/colors.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  Widget shimmerLoader({
    double height = 100,
    double width = double.infinity,
    BorderRadius? borderRadius,
  }) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius ?? BorderRadius.circular(10),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          if (controller.isLoading.value) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: 7,
              separatorBuilder: (_, __) => const SizedBox(height: 20),
              itemBuilder: (_, index) => shimmerLoader(height: 120),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Profile Section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Show logout confirmation dialog
                            Get.dialog(

                              Dialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: AppColors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.logout, color: Colors.redAccent, size: 50),
                                      const SizedBox(height: 16),
                                      Text(
                                        'Logout',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        'Are you sure you want to logout?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(color: Colors.black54),
                                      ),
                                      const SizedBox(height: 24),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          OutlinedButton(
                                            onPressed: () => Get.back(),
                                            style: OutlinedButton.styleFrom(
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                            ),
                                            child: Text('Cancel'),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              Get.back();
                                              controller.logout();
                                            },
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.redAccent,
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(12),
                                              ),
                                            ),
                                            child: Text('Logout', style: TextStyle(color: AppColors.white),),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.grey[200],
                            child: ClipOval(
                              child: Image.network(
                                controller.user.value.profileImage,
                                fit: BoxFit.cover,
                                width: 48,
                                height: 48,
                                errorBuilder: (context, error, stackTrace) {
                                  print('Error loading profile image: $error');
                                  return Icon(
                                    Icons.person,
                                    size: 32,
                                    color: Colors.grey[400],
                                  );
                                },
                                loadingBuilder: (context, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return Center(
                                    child: CircularProgressIndicator(
                                      value: loadingProgress.expectedTotalBytes != null
                                          ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                          : null,
                                      strokeWidth: 2,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(
                                  () => Text(
                                '${controller.greeting.value}',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                            Text(
                              controller.user.value.fullName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.notifications,
                        color: isDark ? Colors.white : Colors.black,
                      ),
                      onPressed: () {
                        // Handle notification icon tap
                        controller.onNotificationTapped();
                      },
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                // Search bar
                TextField(
                  decoration: InputDecoration(
                    hintText: 'home_search_placeholder'.tr,
                    prefixIcon: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {
                        // Handle search icon tap
                        print("Search icon tapped");
                        // Add your search logic here, e.g., trigger a search
                      },
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(Icons.mic),
                      onPressed: () {
                        // Handle mic icon tap
                        print("Mic icon tapped");
                        // Add your mic logic here, e.g., start voice input
                      },
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(
                        color: Colors.grey,
                        width: 2,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.redAccent, width: 2),
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Emergency Section with Button
                Container(
                  decoration: BoxDecoration(
                    color: AppColors.primaryPink,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'home_emergency'.tr,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              'home_emergency_subtext'.tr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => controller.bookEmergency(),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          minimumSize: Size(100, 30),
                        ),
                        child: Text(
                          'home_book_now'.tr,
                          style: TextStyle(color: AppColors.primaryPink),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),

                // Services Grid
                _sectionTitle('home_services'.tr),
                const SizedBox(height: 5),
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  childAspectRatio: 1 / 1,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  children: controller.services.asMap().entries.map((entry) {
                    final index = entry.key;
                    final service = entry.value;
                    return GestureDetector(
                      onTap: () {
                        controller.onServiceSelected(index);
                      },
                      child: Obx(() {
                        final isSelected = controller.selectedServiceIndex.value == index;
                        return Card(
                          color: Colors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(
                              color: isSelected
                                  ? (index == 0
                                  ? Colors.blue
                                  : index == 1
                                  ? Colors.green
                                  : index == 2
                                  ? Colors.red
                                  : Colors.purple)
                                  : Colors.grey[300]!,
                              width: 2,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CircleAvatar(
                                  radius: 40,
                                  backgroundColor: index == 0
                                      ? Colors.blue[50]
                                      : index == 1
                                      ? Colors.green[50]
                                      : index == 2
                                      ? Colors.red[50]
                                      : Colors.purple[50],
                                  child: Icon(
                                    index == 0
                                        ? Icons.medical_services_outlined
                                        : index == 1
                                        ? Icons.science_outlined
                                        : index == 2
                                        ? Icons.local_hospital_outlined
                                        : Icons.face_retouching_natural_outlined,
                                    color: isSelected
                                        ? (index == 0
                                        ? Colors.blue
                                        : index == 1
                                        ? Colors.green
                                        : index == 2
                                        ? Colors.red
                                        : Colors.purple)
                                        : Colors.grey,
                                    size: 24,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  service.title.tr,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: isSelected
                                        ? (index == 0
                                        ? Colors.blue
                                        : index == 1
                                        ? Colors.green
                                        : index == 2
                                        ? Colors.red
                                        : Colors.purple)
                                        : Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  service.subtitle.tr,
                                  style: TextStyle(color: Colors.grey[600], fontSize: 15),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 20),

                // Upcoming Appointments
                _sectionTitle('home_appointments'.tr, onSeeAll: controller.viewAllAppointments),
                const SizedBox(height: 5),
                _appointmentCard(),

                const SizedBox(height: 20),

                // Popular Categories
                _sectionTitle('home_popular_categories'.tr),
                const SizedBox(height: 5),
                _categoryGrid(),

                const SizedBox(height: 20),

                // Most Booked Doctors
                _sectionTitle('home_most_booked_doctors'.tr),
                const SizedBox(height: 5),
                _doctorCarousel(),

                const SizedBox(height: 20),

                // Why Wellvia
                _sectionTitle('home_why_wellvia'.tr),
                const SizedBox(height: 5),
                _whyWellviaCarousel(),

                const SizedBox(height: 20),

                // FAQs
                _sectionTitle('home_faq_title'.tr),
                const SizedBox(height: 5),
                _faqCarousel(),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _sectionTitle(String title, {VoidCallback? onSeeAll}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        if (onSeeAll != null)
          TextButton(onPressed: onSeeAll, child: Text('home_see_all'.tr)),
      ],
    );
  }

  Widget _emergencyGrid() {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      shrinkWrap: true,
      childAspectRatio: 1 / 1,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      children: controller.emergencyCategories.asMap().entries.map((entry) {
        final index = entry.key;
        final category = entry.value;
        return GestureDetector(
          onTap: () {
            controller.selectedEmergencyIndex.value = index;
          },
          child: Obx(() {
            final isSelected = controller.selectedEmergencyIndex.value == index;
            return Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: isSelected
                  ? (index == 0 ? Colors.white : index == 1 || index == 3 ? Colors.pink[100] : Colors.blue[100])
                  : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      index == 0
                          ? Icons.person
                          : index == 1
                          ? Icons.favorite
                          : index == 2
                          ? Icons.local_hospital
                          : Icons.health_and_safety,
                      color: isSelected
                          ? (index == 0 ? Colors.blue : index == 1 || index == 3 ? Colors.pink[400] : Colors.blue[400])
                          : Colors.grey,
                      size: 30,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      category.name.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: isSelected
                            ? (index == 0 ? Colors.blue : index == 1 || index == 3 ? Colors.pink[400] : Colors.blue[400])
                            : Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        );
      }).toList(),
    );
  }

  Widget _appointmentCard() {
    final appointment = controller.upcomingAppointment;
    return Card(
      color: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 90,
                height: 90,
                child: Image.network(
                  appointment.value.imageUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    print('Error loading appointment image: $error');
                    return Icon(
                      Icons.person,
                      size: 32,
                      color: Colors.grey[400],
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                            : null,
                        strokeWidth: 2,
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appointment.value.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    appointment.value.profession,
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  Text(
                    '${appointment.value.experience} ${'home_experience'.tr}',
                    style: TextStyle(
                      color: AppColors.primaryBlue,
                      fontSize: 13,
                    ),
                  ),
                  Text(
                    '${appointment.value.time}',
                    style: TextStyle(
                      color: AppColors.primaryPink,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _categoryGrid() {
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 4,
      shrinkWrap: true,
      childAspectRatio: 1 / 1.2,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
      children: controller.categories.asMap().entries.map((entry) {
        final index = entry.key;
        final category = entry.value;
        final isEven = index % 2 == 0;
        return Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: isEven ? AppColors.primaryPink : AppColors.primaryBlue,
              width: 2,
            ),
          ),
          color: isEven ? AppColors.primaryPink : AppColors.primaryBlue,
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  index == 0
                      ? Icons.health_and_safety
                      : index == 1
                      ? Icons.favorite
                      : index == 2
                      ? Icons.medical_information
                      : Icons.pregnant_woman,
                  color: AppColors.white,
                  size: 30,
                ),
                const SizedBox(height: 8),
                Text(
                  category.name.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _doctorCarousel() {
    return Column(
      children: [
        SizedBox(
          height: 120,
          child: PageView.builder(
            itemCount: controller.doctors.length,
            controller: PageController(viewportFraction: 1),
            onPageChanged: (index) => controller.currentDoctorIndex.value = index,
            itemBuilder: (context, index) {
              final doctor = controller.doctors[index];
              return Card(
                color: AppColors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          width: 90,
                          height: 90,
                          child: Image.network(
                            doctor.imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              print('Error loading doctor image: $error');
                              return Icon(
                                Icons.person,
                                size: 32,
                                color: Colors.grey[400],
                              );
                            },
                            loadingBuilder: (context, child, loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                      : null,
                                  strokeWidth: 2,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              doctor.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              doctor.profession,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '${doctor.experience} Experience',
                              style: TextStyle(
                                color: AppColors.primaryBlue,
                                fontSize: 13,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              'Rs. ${doctor.fees} per consultation',
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 8),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.blue[50],
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.star,
                                  color: Colors.blue,
                                  size: 14,
                                ),
                                const SizedBox(width: 2),
                                Text(
                                  doctor.rating.toString(),
                                  style: const TextStyle(
                                    color: Colors.blue,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          ElevatedButton(
                            onPressed: () => controller.bookEmergency(),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryPink,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              minimumSize: Size(60, 25),
                            ),
                            child: Text(
                              'home_book_now'.tr,
                              style: TextStyle(color: AppColors.white, fontSize: 11),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Obx(
              () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              controller.doctors.length,
                  (index) => Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: controller.currentDoctorIndex.value == index
                      ? Colors.black54
                      : Colors.grey[300],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _whyWellviaCarousel() {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            itemCount: controller.whyWellvia.length,
            controller: PageController(viewportFraction: 1),
            onPageChanged: (index) => controller.currentWhyWellviaIndex.value = index,
            itemBuilder: (context, index) {
              final item = controller.whyWellvia[index];
              return Card(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(item.image, height: 60),
                    const SizedBox(height: 8),
                    Text(
                      item.title.tr,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 4),
                    Container(width: 50, height: 2, color: Colors.grey),
                    const SizedBox(height: 4),
                    Text(item.description.tr, textAlign: TextAlign.center),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Obx(
              () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              controller.whyWellvia.length,
                  (index) => Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: controller.currentWhyWellviaIndex.value == index
                      ? Colors.black54
                      : Colors.grey[300],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _faqCarousel() {
    return Column(
      children: [
        SizedBox(
          height: 190,
          child: PageView.builder(
            itemCount: controller.faqs.length,
            controller: PageController(viewportFraction: 1),
            onPageChanged: (index) => controller.currentFaqIndex.value = index,
            itemBuilder: (context, index) {
              final item = controller.faqs[index];
              return Card(
                color: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(color: Colors.grey[300]!, width: 1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.question.tr,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Text(
                          item.answer.tr,
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Obx(
              () => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              controller.faqs.length,
                  (index) => Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: controller.currentFaqIndex.value == index
                      ? Colors.black54
                      : Colors.grey[300],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

}