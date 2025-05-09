import 'dart:ui';
import 'package:get/get.dart';

class TranslationService extends Translations {
  static final locale = const Locale('en', 'US');
  static final fallbackLocale = const Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {

      // dialog box
      'under_development_message' : 'This feature is in development right now. Will be available in the future release.',
      'under_development_message_ok' : 'Okay',

      // Home Screen
      'home_title': 'Home',
      'home_message': 'You have pushed the button this many times:',

      // Splash Screen
      'splash_welcome': 'Welcome To',
      'splash_app_name_part1': 'Wellvia',
      'splash_app_name_part2': 'Health',
      'splash_tagline': "India's First Smart\n Omni-Healthcare App!" ,
      'splash_subtagline':'Get seamless access to\n essential medical services\n anytime, anywhere.',
      'splash_button': 'Get Started',

      // Select Auth Screen
      "selectauth_login": "Login",
      "selectauth_signup": "Sign Up",

        "otp_dialog_title": "Enter OTP",
        "otp_dialog_message": "Please enter the OTP sent to your phone.",

      // Sign Up Screen
      'signup_title': 'Sign Up',
      'signup_enter_name': 'Name',
      'signup_hint_name': 'Enter your name',
      'signup_error_name': 'Name is required',

      'signup_enter_mobile': 'Mobile number',
      'signup_hint_mobile': 'Enter your mobile number',
      'signup_error_mobile': 'Enter a valid mobile number',

      'signup_enter_otp': 'OTP',
      'signup_hint_otp': 'Enter OTP',
      'signup_error_otp': 'OTP is required',

      'signup_terms_one': 'I agree to the WellVia ',
      'signup_terms_two': 'Terms of Service',
      'signup_terms_three': ' and ',
      'signup_terms_four': 'Privacy Policy',

      'signup_button': 'Sign Up',
      "signup_have_account_prefix": "Already have an account? ",
      "signup_have_account_action": "Log in",
      'signup_or': 'OR',
      'signup_google': 'Sign up with Google',
      'signup_facebook': 'Sign up with Facebook',

      // Log in screen
      "login_title": "Sign In",
      "login_mobile_label": "Enter your mobile number",
      "login_mobile_hint": "Mobile Number",
      "login_mobile_error": "Please enter a valid mobile number",
      "login_otp_label": "Enter OTP",
      "login_otp_hint": "OTP",
      "login_otp_error": "Invalid OTP",

      "login_no_otp": "Didn't receive OTP?",
      "login_resend_otp": "Resend OTP?",

      "login_button": "Log In",
      "login_no_account_prefix": "Don't have an account? ",
      "login_no_account_action": "Sign Up",
      "login_or": "or",
      "login_google": "Log in with Google",
      "login_facebook": "log in with Facebook",

      // Home Page
      "home_title": "Welcome to Wellvia Health",
      "home_good_morning" : "Good Morning",
      "home_good_afternoon" : "Good Afternoon",
      "home_good_evening" : "Good Evening",
      "home_profile": "Profile",
      "home_search": "Search",
      "home_emergency": "Emergency",
      "home_emergency_subtext": "Book an ambulance now",
      "home_book_now": "Book now",
      "home_services": "Our Services",
      "home_appointments": "Upcoming Appointments",
      "home_see_all": "See all",
      "home_upcoming_appointments": "Upcoming Appointments",
      "home_popular_categories": "Popular Categories",
      "home_popular_doctors": "Most Booked Doctors",
      "home_why_wellvia": "Why Wellvia Health?",
      "home_faq": "Frequently Asked Questions",
      "home_experience": "Experience",
      "home_time": "Time",
      "consultation_fee": "Consultation Fee",
      "consultation_fee_value": "The consultation fee is \$50.",
      "category": "Category",
      "faq_question": "What is the consultation fee?",
      "faq_answer": "The consultation fee is \$50.",
      "home_most_booked_doctors": "Most Booked Doctors",
      "home_faq_title" : "FAQ - Frequently asked questions",


    },
  };
}
