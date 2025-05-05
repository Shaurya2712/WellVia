import 'dart:ui';
import 'package:get/get.dart';

class TranslationService extends Translations {
  static final locale = const Locale('en', 'US');
  static final fallbackLocale = const Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
    'en_US': {
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

    },
  };
}
