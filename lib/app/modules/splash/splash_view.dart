import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFFDFDFD), // more white at the top
              Color(0xFFEAF6FB), // even lighter blue
              Color(0xFFADD8E6), // light blue
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 80),

              // Top Image
              Image.asset(
                'assets/images/logo_demo.png',
                height: size.height * 0.22,
              ),

              const SizedBox(height: 50),

              // Main Title Text
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: 'splash_welcome'.tr + '\n',
                      style: const TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: 'splash_app_name_part1'.tr,
                      style: const TextStyle(color: Colors.blue),
                    ),
                    const TextSpan(text: ' '),
                    TextSpan(
                      text: 'splash_app_name_part2'.tr,
                      style: const TextStyle(color: Colors.green),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // Medium Text
              Text(
                'splash_tagline'.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 28,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),
              ),

              const SizedBox(height: 24),

              // Small Text
              Text(
                'splash_subtagline'.tr,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),

              const Spacer(),

              // Button + Label
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'splash_button'.tr,
                    style: const TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  FloatingActionButton(
                    onPressed: () {
                      controller.navigate();
                    },
                    backgroundColor: Colors.pink,
                    shape: const CircleBorder(),
                    child: const Icon(Icons.arrow_forward, color: Colors.white),
                  ),
                ],
              ),

              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
