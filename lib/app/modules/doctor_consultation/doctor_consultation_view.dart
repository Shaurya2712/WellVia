import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'doctor_consultation_controller.dart';
import 'package:wellvia/app/core/utils/global_widgets/universal_search_bar.dart';
import 'package:wellvia/app/core/constants/colors.dart';

class DoctorConsultationView extends GetView<DoctorConsultationController> {
  const DoctorConsultationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                        onPressed: () => Get.back(),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        'Doctor Consultation',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications, color: Colors.black),
                    onPressed: () {
                      // TODO: Notification action
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Universal search bar
              UniversalSearchBar(
                hintText: 'Search category, symptoms, specialities...',
                onSearch: (query) {
                  // TODO: Implement search logic
                },
              ),
              const SizedBox(height: 20),
              // Our Specialities section
              Text(
                'Our Specialities',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 170,
                child: Obx(() => ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.specialities.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 16),
                      itemBuilder: (context, index) {
                        final isSelected =
                            controller.selectedSpecialityIndex.value == index;
                        // Demo images for first 3, fallback for others
                        final demoImages = [
                          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
                          'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
                          'https://images.unsplash.com/photo-1515378791036-0648a3ef77b2',
                        ];
                        final imageUrl = index < demoImages.length
                            ? demoImages[index]
                            : demoImages[0];
                        return GestureDetector(
                          onTap: () =>
                              controller.selectedSpecialityIndex.value = index,
                          child: Container(
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.15),
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                ),
                              ],
                              border: Border.all(
                                color: isSelected
                                    ? AppColors.primaryBlue
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(20)),
                                  child: FadeInImage.assetNetwork(
                                    placeholder:
                                        'assets/images/profile_placeholder.png',
                                    image: imageUrl,
                                    height: 110,
                                    width: 150,
                                    fit: BoxFit.cover,
                                    imageErrorBuilder:
                                        (context, error, stackTrace) =>
                                            Container(
                                      height: 110,
                                      width: 150,
                                      color: Colors.grey[200],
                                      child: Icon(Icons.medical_services,
                                          size: 40, color: Colors.grey[400]),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8, vertical: 8),
                                      child: Text(
                                        controller.specialities[index],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: isSelected
                                              ? AppColors.primaryBlue
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )),
              ),
              const SizedBox(height: 20),
              // Recommended Consultants section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recommended Consultants',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('See all'),
                  ),
                ],
              ),
              _recommendedConsultantsCarousel(controller),
              const SizedBox(height: 20),
              // Need help carousel
              SizedBox(
                height: 70,
                child: Obx(() => ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.helpItems.length,
                      separatorBuilder: (_, __) => const SizedBox(width: 12),
                      itemBuilder: (context, index) {
                        final item = controller.helpItems[index];
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          elevation: 2,
                          child: Container(
                            width: 260,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    item.title,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.primaryBlue,
                                    minimumSize: Size(80, 28),
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                  ),
                                  child: Text(item.buttonText,
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    )),
              ),
              const SizedBox(height: 20),
              // Expert medical advice section
              Text(
                'Expert medical advice at your fingertips',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _expertMedicalAdviceCarousel(controller),
              const SizedBox(height: 20),
              // Special health programmes section
              Row(
                children: [
                  Text(
                    'Special health programmes',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '(coming soon)',
                    style: TextStyle(fontSize: 14, color: Colors.redAccent),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              _specialHealthProgrammesCarousel(controller),
              const SizedBox(height: 20),
              // FAQ section
              Text(
                'FAQ - Frequently asked questions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _faqCarousel(controller),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _BottomNavBar(),
    );
  }

  Widget _recommendedConsultantsCarousel(
      DoctorConsultationController controller) {
    final RxInt currentIndex = 0.obs;
    return Column(
      children: [
        SizedBox(
          height: 130,
          child: PageView.builder(
            itemCount: controller.recommendedDoctors.length,
            controller: PageController(viewportFraction: 1),
            onPageChanged: (index) => currentIndex.value = index,
            itemBuilder: (context, index) {
              final doc = controller.recommendedDoctors[index];
              return Card(
                color: AppColors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
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
                          child: doc.assetImagePath
                                  .isNotEmpty // Replace `imageUrl` with your asset image path field
                              ? FadeInImage(
                                  placeholder: AssetImage(
                                      'assets/images/profile_placeholder.png'),
                                  image: AssetImage(doc
                                      .assetImagePath), // Replace with your asset image path
                                  fit: BoxFit.cover,
                                  width: 90,
                                  height: 90,
                                  imageErrorBuilder:
                                      (context, error, stackTrace) => Icon(
                                    Icons.person,
                                    size: 32,
                                    color: Colors.grey[400],
                                  ),
                                )
                              : Icon(
                                  Icons.person,
                                  size: 32,
                                  color: Colors.grey[400],
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
                              doc.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              doc.specialization,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              doc.experience,
                              style: TextStyle(
                                color: AppColors.primaryBlue,
                                fontSize: 13,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(
                              '₹${doc.fee} per consultation',
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
                                  doc.rating.toString(),
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
                            onPressed: () {
                              Get.toNamed('/book-consultation');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryPink,
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              minimumSize: Size(60, 25),
                            ),
                            child: Text(
                              'Book Now',
                              style: TextStyle(
                                  color: AppColors.white, fontSize: 11),
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
              controller.recommendedDoctors.length,
              (index) => Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex.value == index
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

  Widget _faqCarousel(DoctorConsultationController controller) {
    final RxInt currentFaqIndex = 0.obs;
    return Column(
      children: [
        SizedBox(
          height: 190,
          child: PageView.builder(
            itemCount: controller.faqs.length,
            controller: PageController(viewportFraction: 1),
            onPageChanged: (index) => currentFaqIndex.value = index,
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
                        item.question,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Expanded(
                        child: Text(
                          item.answer,
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
                  color: currentFaqIndex.value == index
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

  Widget _expertMedicalAdviceCarousel(DoctorConsultationController controller) {
    final RxInt currentIndex = 0.obs;
    final demoImages = [
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
      'https://images.unsplash.com/photo-1515378791036-0648a3ef77b2',
    ];
    return Column(
      children: [
        SizedBox(
          height: 340,
          child: PageView.builder(
            itemCount: controller.expertDoctors.length,
            controller: PageController(viewportFraction: 0.6),
            onPageChanged: (index) => currentIndex.value = index,
            itemBuilder: (context, index) {
              final doc = controller.expertDoctors[index];
              final imageUrl = doc.assetImagePath;
              return Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 7,
                shadowColor: Colors.blue.withOpacity(0.08),
                child: Container(
                  constraints: BoxConstraints(
                      maxHeight: 320, minHeight: 260, maxWidth: 220),
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          doc.assetImagePath, // Replace with your asset image path
                          width: 180,
                          height: 180,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            width: 120,
                            height: 120,
                            color: Colors.grey[200],
                            child: Icon(Icons.person,
                                size: 40, color: Colors.grey[400]),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        doc.name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: AppColors.primaryBlue),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        doc.specialization,
                        style: TextStyle(color: Colors.grey[700], fontSize: 13),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 6),
                      Container(
                        width: 40,
                        height: 2,
                        color: AppColors.primaryBlue.withOpacity(0.2),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            Get.toNamed('/book-consultation');
                          },
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(color: AppColors.primaryBlue),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            padding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 0),
                          ),
                          child: Text(
                            'Book Your Appointment',
                            style: TextStyle(
                              color: AppColors.primaryBlue,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
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
              controller.expertDoctors.length,
              (index) => Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex.value == index
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

  Widget _specialHealthProgrammesCarousel(
      DoctorConsultationController controller) {
    final RxInt currentIndex = 0.obs;
    final demoImages = [
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308',
      'https://images.unsplash.com/photo-1506744038136-46273834b3fb',
      'https://images.unsplash.com/photo-1515378791036-0648a3ef77b2',
    ];
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: PageView.builder(
            itemCount: controller.healthProgrammes.length,
            controller: PageController(viewportFraction: 0.6),
            onPageChanged: (index) => currentIndex.value = index,
            itemBuilder: (context, index) {
              final prog = controller.healthProgrammes[index];
              final imageUrl = demoImages[index % demoImages.length];
              return Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                elevation: 7,
                shadowColor: Colors.pink.withOpacity(0.08),
                child: Container(
                  constraints: BoxConstraints(
                      maxHeight: 170, minHeight: 140, maxWidth: 160),
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: FadeInImage.assetNetwork(
                          placeholder: 'assets/images/profile_placeholder.png',
                          image: imageUrl,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          imageErrorBuilder: (context, error, stackTrace) =>
                              Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey[200],
                            child: Icon(Icons.local_hospital,
                                size: 32, color: Colors.grey[400]),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        prog.name,
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: AppColors.primaryPink),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 6),
                      Container(
                        width: 30,
                        height: 2,
                        color: AppColors.primaryPink.withOpacity(0.2),
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
              controller.healthProgrammes.length,
              (index) => Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex.value == index
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

class _BottomNavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, -1),
          ),
        ],
      ),
      child: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            activeIcon: Icon(Icons.bar_chart),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.medical_services_outlined),
            activeIcon: Icon(Icons.medical_services),
            label: 'Checkups',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital_outlined),
            activeIcon: Icon(Icons.local_hospital),
            label: 'Ambulance',
          ),
        ],
        currentIndex: 0, // Set as needed
        selectedItemColor: AppColors.primaryPink,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
        unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.w500),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          // TODO: Implement navigation
        },
      ),
    );
  }
}
