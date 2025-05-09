import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellvia/app/core/utils/global_widgets/under_development_dialogbox.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellvia/app/routes/app_routes.dart';

class HomeController extends GetxController {
  // Observables
  var isLoading = true.obs;
  var user = User().obs;
  var services = <Service>[].obs;
  var doctors = <Doctor>[].obs;
  var categories = <Category>[].obs;
  var emergencyCategories = <Category>[].obs; // For emergency section
  var upcomingAppointment = Appointment().obs;
  var whyWellvia = <WhyWellvia>[].obs;
  var faqs = <Faq>[].obs;
  var greeting = ''.obs;
  var currentDoctorIndex = 0.obs;
  var currentWhyWellviaIndex = 0.obs;
  var currentFaqIndex = 0.obs;
  var selectedEmergencyIndex = 0.obs; // Track selected emergency category
  var selectedServiceIndex = 0.obs; // Track selected service
  var selectedCategoryIndex = 0.obs; // Track selected category

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
    fetchHomeData();
    setGreeting();
  }

  void setGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      greeting.value = 'Good Morning!';
    } else if (hour < 17) {
      greeting.value = 'Good Afternoon!';
    } else {
      greeting.value = 'Good Evening!';
    }
  }

  Future<void> fetchUserData() async {
    await Future.delayed(const Duration(seconds: 1));
    user.value = User(
      profileImage: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
      fullName: 'John Doe',
    );
  }

  Future<void> fetchHomeData() async {
    isLoading(true);

    await Future.delayed(const Duration(seconds: 1));

    services.value = [
      Service(title: 'Book Consultation', subtitle: 'Find Specialists'),
      Service(title: 'Lab Tests', subtitle: 'Book Checkup'),
      Service(title: 'Ambulance', subtitle: '24/7 Available'),
      Service(title: 'Facial Scan', subtitle: 'Expert Treatment'),
    ];

    doctors.value = [
      Doctor(
        name: 'Dr. John Smith',
        profession: 'Cardiologist',
        experience: '10 years',
        imageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
        time: '9:00 AM - 5:00 PM',
        rating: 4.8,
        fees: 500,
      ),
      Doctor(
        name: 'Dr. Jane Doe',
        profession: 'Dermatologist',
        experience: '8 years',
        imageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
        time: '9:00 AM - 6:00 PM',
        rating: 4.6,
        fees: 450,
      ),
    ];

    categories.value = [
      Category(name: 'Full Body Checkup'),
      Category(name: 'Sexual Health'),
      Category(name: 'Allergy Checkup'),
      Category(name: 'Women\'s Health'),
    ];

    emergencyCategories.value = [
      Category(name: 'General'),
      Category(name: 'Cardiac'),
      Category(name: 'Ambulance'),
      Category(name: 'Trauma'),
    ];

    upcomingAppointment.value = Appointment(
      name: 'Dr. John Smith',
      profession: 'Cardiologist',
      experience: '10 years',
      imageUrl: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e',
      time: '10:00 AM',
    );

    whyWellvia.value = [
      WhyWellvia(
        image: 'assets/images/logo_demo.png',
        title: 'Trusted Care',
        description: 'Our doctors are highly experienced.',
      ),
      WhyWellvia(
        image: 'assets/images/logo_demo.png',
        title: 'Affordable Prices',
        description: 'We offer the best prices for quality care.',
      ),
    ];

    faqs.value = [
      Faq(
        question: 'What is Wellvia Health?',
        answer: 'Wellvia Health is a comprehensive healthcare platform offering services such as ambulance booking, doctor consultations, telemedicine, health checkups & facial scans to ensure timely and reliable medical assistance.',
      ),
      Faq(
        question: 'How can I book an ambulance through Wellvia Health?',
        answer: 'Booking an ambulance is quick and easy. Simply visit our website, use the Wellvia Health app, or call our helpline 9353602108 to request an ambulance. We ensure fast response times to provide immediate medical assistance.',
      ),
      Faq(
        question: 'Do you offer home healthcare services?',
        answer: 'Yes, we provide sample collections at home across India.',
      ),
      Faq(
        question: 'What is included in your health packages?',
        answer: 'Our health packages are designed to cover essential medical services, including telemedicine consultations, preventive checkups, emergency support and personalized healthcare solutions tailored to your needs.',
      ),
      Faq(
        question: 'Is Wellvia Health available 24/7?',
        answer: 'Yes, our emergency medical services ambulance booking is available 24/7 to ensure you get medical care whenever you need it.',
      ),
      Faq(
        question: 'How do I access telemedicine services?',
        answer: 'You can connect with a certified doctor online through our website or app. Schedule an appointment, consult via call and receive prescriptions or medical advice from the comfort of your home.',
      ),
      Faq(
        question: 'What cities does Wellvia Health operate in?',
        answer: 'We serve across India to provide accessible healthcare solutions.',
      ),
      Faq(
        question: 'What is the facial scan service and how does it work?',
        answer: 'Our facial scan technology helps determine body vitals by analyzing key facial indicators. It provides insights into potential health risks and early warning signs, enabling timely medical intervention.',
      ),
      Faq(
        question: 'How do I contact customer support?',
        answer: 'You can reach our support team via phone, email or chat on our website for any queries or assistance with bookings.',
      ),
    ];

    isLoading(false);
  }

  void bookEmergency() {
    // Get.snackbar('Emergency', 'Booking an ambulance...');
    final dialogController = Get.put(DialogController());
    dialogController.showFeatureDevelopmentDialog();
  }

  void viewAllAppointments() {
    Get.toNamed('/appointments');
  }

  void onServiceSelected(int index) {
    if (index == 1 || index == 2 || index == 3) { // Ambulance or Facial Scan
      final dialogController = Get.put(DialogController());
      dialogController.showFeatureDevelopmentDialog();
    } else {
      selectedServiceIndex.value = index;
    }
  }

  // Add this method to handle notification icon tap
  void onNotificationTapped() {
    print("Notification icon tapped");
    final dialogController = Get.put(DialogController());
    dialogController.showFeatureDevelopmentDialog();
    // Example: Navigate to a notifications screen
    // Get.toNamed(Routes.notifications); // Adjust to your route name
    // Alternatively, show a dialog or perform another action
    // Get.dialog(AlertDialog(
    //   title: Text('Notifications'),
    //   content: Text('No new notifications.'),
    //   actions: [
    //     TextButton(
    //       onPressed: () => Get.back(),
    //       child: Text('Close'),
    //     ),
    //   ],
    // ));
  }

  void logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(AppRoutes.login);
  }
}

class User {
  final String profileImage;
  final String fullName;

  User({this.profileImage = '', this.fullName = ''});
}

class Service {
  final String title;
  final String subtitle;

  Service({required this.title, required this.subtitle});
}

class Doctor {
  final String name;
  final String profession;
  final String experience;
  final String imageUrl;
  final String time;
  final double rating;
  final int fees;

  Doctor({
    required this.name,
    required this.profession,
    required this.experience,
    required this.imageUrl,
    required this.time,
    required this.rating,
    required this.fees,
  });
}

class Category {
  final String name;

  Category({required this.name});
}

class Appointment {
  final String name;
  final String profession;
  final String experience;
  final String imageUrl;
  final String time;

  Appointment({
    this.name = '',
    this.profession = '',
    this.experience = '',
    this.imageUrl = '',
    this.time = '',
  });
}

class WhyWellvia {
  final String image;
  final String title;
  final String description;

  WhyWellvia({
    required this.image,
    required this.title,
    required this.description,
  });
}

class Faq {
  final String question;
  final String answer;

  Faq({required this.question, required this.answer});
}