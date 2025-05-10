import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DoctorConsultationController extends GetxController {
  // Specialities
  final specialities = [
    'Cold, Fever, Cough and Sneeze',
    'Diabetes Consult',
    'General Physician',
    'Dental',
    'Dermatology',
    'Hair Scalp Care',
    'Gynecology',
    'Infertility',
    'Ophthalmology',
    'Orthopedics',
    'Pediatrics',
    'Psychology',
    'Sexology',
    'Food and Nutrition',
    'Ear Nose and Throat',
    'Cardiology',
    'Psychiatry',
    'Pulmonology',
    'Neurology',
    'Gastroenterology',
    'Urology',
    'Oncology',
  ].obs;
  var selectedSpecialityIndex = 0.obs;

  // Recommended doctors (sample)
  final recommendedDoctors = [
    DoctorRecommendation(
      name: 'Dr. Nihal',
      specialization: 'Gynecologist',
      experience: '10 years',
      rating: 4.8,
      assetImagePath: 'assets/images/doc_img_3.jpg',
      fee: 600,
    ),
    DoctorRecommendation(
      name: 'Dr. Aditi',
      specialization: 'Dermatologist',
      experience: '8 years',
      rating: 4.7,
      assetImagePath: 'assets/images/doc_img_2.jpg',
      fee: 500,
    ),
  ].obs;

  // Help carousel
  final helpItems = [
    HelpItem(
      title: 'Need online doctor consultation?',
      buttonText: 'Get a Call',
    ),
    HelpItem(
      title: 'Need prescription renewal?',
      buttonText: 'Renew Now',
    ),
    HelpItem(
      title: 'Need lab test at home?',
      buttonText: 'Book Now',
    ),
  ].obs;

  // Expert medical advice (sample)
  final expertDoctors = List.generate(
    14,
    (i) => DoctorRecommendation(
      name: 'Dr. Expert ${i + 1}',
      specialization: 'Specialist',
      experience: '${5 + i} years',
      rating: 4.5,
      assetImagePath : 'assets/images/doc_img_1.jpg',
      fee: 700,
    ),
  ).obs;

  // Special health programmes (sample)
  final healthProgrammes = [
    HealthProgramme(name: 'Virtual Surgery Program', imageUrl: ''),
    HealthProgramme(name: 'Women\'s Health', imageUrl: ''),
    HealthProgramme(name: 'Elderly Care', imageUrl: ''),
  ].obs;

  // FAQ (sample)
  final faqs = [
    Faq(question: 'How do I book an online doctor consultation?', answer: 'You can book via the app or website.'),
    Faq(question: 'Can I get a prescription renewal?', answer: 'Yes, use the Renew Now option.'),
  ].obs;
}

class DoctorRecommendation {
  final String name;
  final String specialization;
  final String experience;
  final double rating;
  final String assetImagePath;
  final int fee;
  DoctorRecommendation({
    required this.name,
    required this.specialization,
    required this.experience,
    required this.rating,
    required this.assetImagePath,
    required this.fee,
  });
}

class HelpItem {
  final String title;
  final String buttonText;
  HelpItem({required this.title, required this.buttonText});
}

class HealthProgramme {
  final String name;
  final String imageUrl;
  HealthProgramme({required this.name, required this.imageUrl});
}

class Faq {
  final String question;
  final String answer;
  Faq({required this.question, required this.answer});
} 