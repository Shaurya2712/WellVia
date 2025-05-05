import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:wellvia/app/modules/auth/signup/singup_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
        title: Text('signup_title'.tr, style: TextStyle(    fontWeight: FontWeight.bold,), ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Name input
              Text(
                'signup_enter_name'.tr,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Obx(
                    () => TextFormField(
                  onChanged: (value) {
                    controller.nameTouched.value = true;
                    controller.name.value = value;
                  },
                  decoration: InputDecoration(
                    hintText: 'signup_hint_name'.tr,
                    prefixIcon: const Icon(Icons.person),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    errorText: controller.nameTouched.value && !controller.isNameValid
                        ? 'signup_error_name'.tr
                        : null,
                  ),
                ),
              ),

              const SizedBox(height: 10),

// Mobile number input
              Text(
                'signup_enter_mobile'.tr,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Obx(
                    () => TextFormField(
                  onChanged: (value) {
                    controller.mobileTouched.value = true;
                    controller.mobileNumber.value = value;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    hintText: 'signup_hint_mobile'.tr,
                    prefixIcon: const Icon(Icons.phone_android),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    errorText: controller.mobileTouched.value && !controller.isMobileNumberValid
                        ? 'signup_error_mobile'.tr
                        : null,
                  ),
                ),
              ),

              const SizedBox(height: 10),

// OTP input
              Text(
                'signup_enter_otp'.tr,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Obx(
                    () => TextFormField(
                  onChanged: (value) {
                    controller.otpTouched.value = true;
                    controller.otp.value = value;
                  },
                  obscureText: !controller.showOtp.value,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'signup_hint_otp'.tr,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: IconButton(
                      icon: Icon(
                        controller.showOtp.value ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () => controller.showOtp.value = !controller.showOtp.value,
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    errorText: controller.otpTouched.value && !controller.isOtpValid
                        ? 'signup_error_otp'.tr
                        : null,
                  ),
                ),
              ),


              // Terms and conditions
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Obx(
                    () => Checkbox(
                      value: controller.termsAccepted.value,
                      onChanged:
                          (bool? value) =>
                              controller.termsAccepted.value = value ?? false,
                    ),
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        children: [
                          TextSpan(text: 'signup_terms_one'.tr),
                          TextSpan(
                            text: 'signup_terms_two'.tr,
                            style: const TextStyle(
                              color: Color(0xFFee6b87),
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    // TODO: Navigate to Terms of Service screen
                                    print("Terms of Service clicked");
                                  },
                          ),
                          TextSpan(text: 'signup_terms_three'.tr),
                          TextSpan(
                            text: 'signup_terms_four'.tr,
                            style: const TextStyle(
                              color: Color(0xFFee6b87),
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer:
                                TapGestureRecognizer()
                                  ..onTap = () {
                                    // TODO: Navigate to Privacy Policy screen
                                    print("Privacy Policy clicked");
                                  },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Sign Up button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: controller.signUp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFed6b87),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Pill shape
                    ),
                  ),
                  child: Text(
                    'signup_button'.tr,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Already have an account
              Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(fontSize: 16, color: Colors.black),
                    children: [
                      TextSpan(
                        text: 'signup_have_account_prefix'.tr,
                      ), // Example: "Already have an account? "
                      TextSpan(
                        text:
                            'signup_have_account_action'
                                .tr, // Example: "Log in"
                        style: const TextStyle(
                          color: Color(0xFF59b1de),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer:
                            TapGestureRecognizer()
                              ..onTap = () {
                                // Navigate to login screen
                                print("Navigate to Login");
                              },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Divider
              Row(
                children: [
                  const Expanded(child: Divider()),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(
                      'signup_or'.tr,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const Expanded(child: Divider()),
                ],
              ),

              const SizedBox(height: 20),

              // Google Sign Up
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    // Handle Google sign up
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                  icon: Image.asset(
                    'assets/images/google_icon.png',
                    height: 20,
                    width: 20,
                  ),
                  label: Text(
                    'signup_google'.tr,
                    style: const TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Facebook Sign Up
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {
                    // Handle Facebook sign up
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Colors.transparent,
                  ),
                  icon: Image.asset(
                    'assets/images/facebook_icon.png',
                    height: 20,
                    width: 20,
                  ),
                  label: Text(
                    'signup_facebook'.tr,
                    style: const TextStyle(color: Colors.black, fontSize: 17),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
