import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LabTestController extends GetxController {
  // Most Booked Tests
  final mostBookedTests = [
    LabTest(
      name: 'Full Body Checkup - Comprehensive',
      subtitle: 'Includes 15 Tests',
      price: 5000,
      discount: '70% OFF',
      recommended: true,
    ),
    LabTest(
      name: 'Diabetes Screening',
      subtitle: 'Includes 5 Tests',
      price: 1200,
      discount: '50% OFF',
      recommended: false,
    ),
    LabTest(
      name: 'Women Health Panel',
      subtitle: 'Includes 10 Tests',
      price: 2000,
      discount: '30% OFF',
      recommended: false,
    ),
  ].obs;
  var currentBookedTestIndex = 0.obs;

  // Categories
  final categories = [
    LabCategory(
      title: 'FULL BODY CHECK',
      description: 'Complete health analysis',
      icon: Icons.person_search,
    ),
    LabCategory(
      title: "WOMEN'S HEALTH",
      description: 'Hormonal Tests',
      icon: Icons.female,
    ),
    LabCategory(
      title: 'DIABETES SCREENING',
      description: 'Blood Sugar Tests',
      icon: Icons.bloodtype,
    ),
    LabCategory(
      title: 'POPULAR HEALTH CHECKS',
      description: 'General Wellness Tests',
      icon: Icons.star,
    ),
  ];

  // Specialties and Consultants
  final specialties = [
    LabSpecialty(
      name: 'Full Body Checkup',
      consultants: [
        LabConsultant(
          name: 'Complete Health Package',
          subtitle: 'Includes 50+ Tests',
          price: '4999',
          discount: '50% OFF',
          recommended: true,
          details: 'Comprehensive health checkup covering all major body systems',
        ),
        LabConsultant(
          name: 'Basic Health Package',
          subtitle: 'Includes 30+ Tests',
          price: '2999',
          discount: '40% OFF',
          recommended: false,
          details: 'Essential health checkup for general wellness',
        ),
      ],
    ),
    LabSpecialty(
      name: 'Women\'s Health',
      consultants: [
        LabConsultant(
          name: 'Women\'s Health Package',
          subtitle: 'Includes 35+ Tests',
          price: '3999',
          discount: '45% OFF',
          recommended: true,
          details: 'Comprehensive women\'s health checkup',
        ),
        LabConsultant(
          name: 'Hormonal Profile',
          subtitle: 'Includes 15+ Tests',
          price: '2499',
          discount: '30% OFF',
          recommended: false,
          details: 'Complete hormonal analysis',
        ),
      ],
    ),
    LabSpecialty(
      name: 'Diabetes Screening',
      consultants: [
        LabConsultant(
          name: 'Diabetes Care Package',
          subtitle: 'Includes 20+ Tests',
          price: '1999',
          discount: '35% OFF',
          recommended: true,
          details: 'Complete diabetes screening and monitoring',
        ),
        LabConsultant(
          name: 'Basic Diabetes Test',
          subtitle: 'Includes 5+ Tests',
          price: '999',
          discount: '20% OFF',
          recommended: false,
          details: 'Essential diabetes tests',
        ),
      ],
    ),
    LabSpecialty(
      name: 'Heart Health',
      consultants: [
        LabConsultant(
          name: 'Cardiac Care Package',
          subtitle: 'Includes 25+ Tests',
          price: '3499',
          discount: '40% OFF',
          recommended: true,
          details: 'Comprehensive heart health checkup',
        ),
        LabConsultant(
          name: 'Basic Heart Check',
          subtitle: 'Includes 10+ Tests',
          price: '1499',
          discount: '25% OFF',
          recommended: false,
          details: 'Essential heart health tests',
        ),
      ],
    ),
  ].obs;

  var currentSpecialtyIndex = 0.obs;
  var currentConsultantIndices = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    // Initialize currentConsultantIndices with zeros
    currentConsultantIndices.value = List.generate(specialties.length, (_) => 0);
  }

  // Vital Organs
  final vitalOrgans = [
    OrganTest('Heart', 'assets/icon/body_parts/heart_icon.png'),
    OrganTest('Brain', 'assets/icon/body_parts/brain_icon.png'),
    OrganTest('Lungs', 'assets/icon/body_parts/lung_icon.png'),
    OrganTest('Liver', 'assets/icon/body_parts/liver_icon.png'),
    OrganTest('Kidneys', 'assets/icon/body_parts/kidney_icon.png'),
    OrganTest('Stomach', 'assets/icon/body_parts/stomach_icon.png'),
    OrganTest('Pancreas', 'assets/icon/body_parts/pancreas_icon.png'),
  ].obs;

  var currentOrganIndex = 0.obs;

  // Stay healthy help items
  final helpItems = [
    HelpItem(title: 'Need a lab test at home?', buttonText: 'Book Now'),
    HelpItem(title: 'Need a health checkup?', buttonText: 'Get a Call'),
    HelpItem(title: 'Need prescription renewal?', buttonText: 'Renew Now'),
  ].obs;

  // Recommended Labs (reuse mostBookedTests for demo)
  final recommendedLabs = [
    LabTest(
      name: 'Full Body Checkup - Comprehensive',
      subtitle: 'Includes 15 Tests',
      price: 5000,
      discount: '70% OFF',
      recommended: true,
    ),
    LabTest(
      name: 'Diabetes Screening',
      subtitle: 'Includes 5 Tests',
      price: 1200,
      discount: '50% OFF',
      recommended: false,
    ),
  ].obs;
  var currentRecommendedLabIndex = 0.obs;

  // FAQ
  final faqs = [
    Faq(question: 'How do I book a lab test?', answer: 'You can book via the app or website.'),
    Faq(question: 'Can I get a home sample collection?', answer: 'Yes, we offer home collection.'),
  ].obs;
  var currentFaqIndex = 0.obs;
}

class LabTest {
  final String name;
  final String subtitle;
  final int price;
  final String discount;
  final bool recommended;
  LabTest({required this.name, required this.subtitle, required this.price, required this.discount, this.recommended = false});
}

class LabCategory {
  final String title;
  final String description;
  final IconData icon;
  LabCategory({required this.title, required this.description, required this.icon});
}

class OrganTest {
  final String name;
  final String imageUrl;
  OrganTest(this.name, this.imageUrl);
}

class HelpItem {
  final String title;
  final String buttonText;
  HelpItem({required this.title, required this.buttonText});
}

class Faq {
  final String question;
  final String answer;
  Faq({required this.question, required this.answer});
}

class LabSpecialty {
  final String name;
  final List<LabConsultant> consultants;
  LabSpecialty({required this.name, required this.consultants});
}

class LabConsultant {
  final String name;
  final String subtitle;
  final String price;
  final String discount;
  final bool recommended;
  final String details;

  LabConsultant({
    required this.name,
    required this.subtitle,
    required this.price,
    required this.discount,
    this.recommended = false,
    required this.details,
  });
} 