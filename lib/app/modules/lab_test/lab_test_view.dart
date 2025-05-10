import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'lab_test_controller.dart';
import 'package:wellvia/app/core/utils/global_widgets/universal_search_bar.dart';
import 'package:wellvia/app/core/constants/colors.dart';

class LabTestView extends GetView<LabTestController> {
  const LabTestView({Key? key}) : super(key: key);

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
              // Header
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
                        'Health Checkup',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    icon: Icon(Icons.notifications, color: Colors.black),
                    onPressed: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Universal search bar
              UniversalSearchBar(
                hintText: 'Search tests, packages, categories...',
                onSearch: (query) {},
              ),
              const SizedBox(height: 20),
              // Most Booked Tests
              Text(
                'Most Booked Tests',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _mostBookedTestsCarousel(controller),
              const SizedBox(height: 20),
              // Category grid
              Text(
                'Categories',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _categoryGrid(controller),
              const SizedBox(height: 20),
              // Specialties Section
              Text(
                'Recommended Tests',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _specialtiesSection(controller),
              const SizedBox(height: 20),
              // Test for Vital Organs
              Text(
                'Test for Vital organs',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _vitalOrgansCarousel(controller),
              const SizedBox(height: 20),
              // Stay healthy with regular checkups
              Text(
                'Stay healthy with regular checkups',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _helpCarousel(controller),
              const SizedBox(height: 20),
              // Recommended Labs
              Text(
                'Recommended Labs',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _recommendedLabsCarousel(controller),
              const SizedBox(height: 20),
              // FAQ
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
    );
  }

  Widget _mostBookedTestsCarousel(LabTestController controller) {
    return Obx(() {
      final tests = controller.mostBookedTests;
      final currentIndex = controller.currentBookedTestIndex.value;
      return Column(
        children: [
          SizedBox(
            height: 155,
            child: PageView.builder(
              itemCount: tests.length,
              controller: PageController(viewportFraction: 0.92, initialPage: currentIndex),
              onPageChanged: (index) => controller.currentBookedTestIndex.value = index,
              itemBuilder: (context, index) {
                final test = tests[index];
                return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.88,
                    child: Card(
                      elevation: 4,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: Stack(
                          children: [
                            // Main content
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 8),
                                Text(
                                  test.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  test.subtitle,
                                  style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(height: 8),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Rs. ${test.price}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        OutlinedButton(
                                          onPressed: () {},
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(color: AppColors.primaryBlue),
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                          ),
                                          child: Text(
                                            'View Details',
                                            style: TextStyle(
                                              color: AppColors.primaryBlue,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors.primaryPink,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                          ),
                                          child: Text(
                                            'Add To Cart',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                            // Badges
                            // if (test.recommended) Positioned(
                            //     top: 0,
                            //     left: 0,
                            //     child: Container(
                            //       padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            //       decoration: BoxDecoration(
                            //         color: AppColors.primaryPink,
                            //         borderRadius: BorderRadius.circular(12),
                            //       ),
                            //       child: Text(
                            //         'Recommended',
                            //         style: TextStyle(
                            //           color: Colors.white,
                            //           fontWeight: FontWeight.bold,
                            //           fontSize: 11,
                            //         ),
                            //       ),
                            //     ),
                            //   ),
                            // Positioned(
                            //   top: 0,
                            //   right: 0,
                            //   child: Container(
                            //     padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                            //     decoration: BoxDecoration(
                            //       color: AppColors.primaryBlue,
                            //       borderRadius: BorderRadius.circular(8),
                            //     ),
                            //     child: Text(
                            //       test.discount,
                            //       style: TextStyle(
                            //         color: Colors.white,
                            //         fontWeight: FontWeight.bold,
                            //         fontSize: 11,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              tests.length,
              (dotIdx) => Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == dotIdx ? Colors.black54 : Colors.grey[300],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _categoryGrid(LabTestController controller) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: controller.categories.length,
      itemBuilder: (context, index) {
        final category = controller.categories[index];
        return Card(
          elevation: 4,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  category.icon,
                  size: 28,
                  color: AppColors.primaryBlue,
                ),
                const SizedBox(height: 8),
                Text(
                  category.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  category.description,
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 11,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _vitalOrgansCarousel(LabTestController controller) {
    return Obx(() {
      final organs = controller.vitalOrgans;
      final currentIndex = controller.currentOrganIndex.value;
      return Column(
        children: [
          SizedBox(
            height: 140,
            child: PageView.builder(
              itemCount: organs.length,
              controller: PageController(viewportFraction: 0.3, initialPage: currentIndex),
              onPageChanged: (index) => controller.currentOrganIndex.value = index,
              itemBuilder: (context, index) {
                final organ = organs[index];
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  child: Card(
                    elevation: 4,
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                            child: Image.asset(
                              organ.imageUrl, // Replace with your asset image path
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  color: Colors.grey[200],
                                  child: Icon(Icons.error, color: Colors.red),
                                );
                              },
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            organ.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              organs.length,
              (dotIdx) => Container(
                width: 6,
                height: 6,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == dotIdx ? Colors.black54 : Colors.grey[300],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _helpCarousel(LabTestController controller) {
    return Obx(() {
      final helpItems = controller.helpItems;
      return Container(
        height: 70,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: helpItems.length,
          itemBuilder: (context, index) {
            final item = helpItems[index];
            return Container(
              width: MediaQuery.of(context).size.width * 0.8,
              margin: EdgeInsets.only(right: 10),
              child: Card(
                elevation: 4,
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          item.title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                        ),
                        child: Text(
                          item.buttonText,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    });
  }

  Widget _recommendedLabsCarousel(LabTestController controller) {
    return Obx(() {
      final labs = controller.recommendedLabs;
      final currentIndex = controller.currentRecommendedLabIndex.value;
      return Column(
        children: [
          SizedBox(
            height: 180,
            child: PageView.builder(
              itemCount: labs.length,
              controller: PageController(viewportFraction: 0.92, initialPage: currentIndex),
              onPageChanged: (index) => controller.currentRecommendedLabIndex.value = index,
              itemBuilder: (context, index) {
                final lab = labs[index];
                return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.88,
                    child: Card(
                      elevation: 4,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Text(
                                    lab.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                if (lab.recommended)
                                  Container(
                                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                                    decoration: BoxDecoration(
                                      color: AppColors.primaryPink,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      'Recommended',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 11,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              lab.subtitle,
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 13,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Rs. ${lab.price}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: AppColors.primaryBlue,
                                  ),
                                ),

                                Row(
                                  children: [
                                    OutlinedButton(
                                      onPressed: () {},
                                      style: OutlinedButton.styleFrom(
                                        side: BorderSide(color: AppColors.primaryBlue),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                      ),
                                      child: Text(
                                        'View Details',
                                        style: TextStyle(
                                          color: AppColors.primaryBlue,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.primaryPink,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                      ),
                                      child: Text(
                                        'Book Now',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )


                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              labs.length,
              (dotIdx) => Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == dotIdx ? Colors.black54 : Colors.grey[300],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _faqCarousel(LabTestController controller) {
    return Obx(() {
      final faqs = controller.faqs;
      final currentIndex = controller.currentFaqIndex.value;
      return Column(
        children: [
          SizedBox(
            height: 180,
            child: PageView.builder(
              itemCount: faqs.length,
              controller: PageController(viewportFraction: 0.92, initialPage: currentIndex),
              onPageChanged: (index) => controller.currentFaqIndex.value = index,
              itemBuilder: (context, index) {
                final faq = faqs[index];
                return Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.88,
                    child: Card(
                      elevation: 4,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              faq.question,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: AppColors.primaryBlue,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 12),
                            Text(
                              faq.answer,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[800],
                              ),
                              maxLines: 4,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              faqs.length,
              (dotIdx) => Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == dotIdx ? Colors.black54 : Colors.grey[300],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  Widget _specialtiesSection(LabTestController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.specialties.length,
            itemBuilder: (context, index) {
              final specialty = controller.specialties[index];
              return Obx(() {
                final isSelected = controller.currentSpecialtyIndex.value == index;
                return Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: ChoiceChip(
                    label: Text(specialty.name),
                    selected: isSelected,
                    showCheckmark: false,
                    onSelected: (selected) {
                      if (selected) {
                        controller.currentSpecialtyIndex.value = index;
                      }
                    },
                    backgroundColor: Colors.white,
                    selectedColor: AppColors.primaryBlue.withOpacity(0.1),
                    labelStyle: TextStyle(
                      color: isSelected ? AppColors.primaryBlue : Colors.black,
                      fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                    ),
                    side: BorderSide(
                      color: isSelected ? AppColors.primaryBlue : Colors.grey[300]!,
                      width: 1.5,
                    ),
                  ),
                );
              });
            },
          ),
        ),
        const SizedBox(height: 16),
        Obx(() {
          final selectedIndex = controller.currentSpecialtyIndex.value;
          final selectedSpecialty = controller.specialties[selectedIndex];
          final currentConsultantIndex = controller.currentConsultantIndices[selectedIndex];
          return Column(
            children: [
              SizedBox(
                height: 178,
                child: PageView.builder(
                  itemCount: selectedSpecialty.consultants.length,
                  controller: PageController(viewportFraction: 1, initialPage: currentConsultantIndex),
                  onPageChanged: (page) {
                    controller.currentConsultantIndices[selectedIndex] = page;
                  },
                  itemBuilder: (context, idx) {
                    final consultant = selectedSpecialty.consultants[idx];
                    return Card(
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          consultant.name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      if (consultant.discount.isNotEmpty)
                                        Container(
                                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                          decoration: BoxDecoration(
                                            color: AppColors.primaryBlue,
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Text(
                                            consultant.discount,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    consultant.subtitle,
                                    style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                    ),
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Rs. ${consultant.price}',
                                        style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          OutlinedButton(
                                            onPressed: () {},
                                            style: OutlinedButton.styleFrom(
                                              side: BorderSide(color: AppColors.primaryBlue),
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                              minimumSize: Size(90, 32),
                                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                            ),
                                            child: Text(
                                              'View Details',
                                              style: TextStyle(
                                                color: AppColors.primaryBlue,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: 8),
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: AppColors.primaryPink,
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                                              minimumSize: Size(90, 32),
                                              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                                            ),
                                            child: Text(
                                              'Add To Cart',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  selectedSpecialty.consultants.length,
                  (dotIdx) => Container(
                    width: 8,
                    height: 8,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentConsultantIndex == dotIdx ? Colors.black54 : Colors.grey[300],
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}