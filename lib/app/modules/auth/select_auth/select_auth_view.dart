import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'select_auth_controller.dart';
import 'package:wellvia/app/core/constants/colors.dart';

class SelectAuthView extends GetView<SelectAuthController> {
  const SelectAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.white, // Pure white
              Color(0xFFD6EFFF), // Soft sky blue
              AppColors.primaryPink.withOpacity(0.2), // Subtle pink
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.02),

                // Logo
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 13),
                  child: Image.asset(
                    'assets/images/Wellvia-Health-Final-Logo.png',
                    height: size.height * 0.2,
                    semanticLabel: 'Wellvia Health Logo',
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                // Carousel
                Obx(
                      () => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    child: CarouselSlider.builder(
                      itemCount: controller.imageList.value.length,
                      itemBuilder: (context, index, realIndex) {
                        final item = controller.imageList.value[index];
                        return Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 10,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.asset(
                                    item['image']!,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                item['label']!,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'Poppins',
                                  color: Color(0xFF59b1de),
                                ),
                                semanticsLabel: item['label'],
                              ),
                              const SizedBox(height: 12),
                            ],
                          ),
                        );
                      },
                      options: CarouselOptions(
                        height: size.height * 0.4,
                        aspectRatio: 1.4,
                        viewportFraction: 1,
                        enlargeCenterPage: false,
                        autoPlay: true,
                        autoPlayInterval: const Duration(seconds: 5),
                        autoPlayAnimationDuration: const Duration(milliseconds: 2000),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        pauseAutoPlayOnTouch: true,
                        onPageChanged: (index, reason) =>
                        controller.currentPage.value = index,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.02),

                // Indicators
                Obx(
                      () => Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.imageList.value.length,
                          (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 5),
                        width: 14,
                        height: 5,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(5),
                          color: controller.currentPage.value == index
                              ? Colors.black
                              : Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.03),

                // Login Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.navigateToLogin,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryBlue,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 2,
                        shadowColor: Colors.black26,
                      ),
                      child: Text(
                        'login_button'.tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                        semanticsLabel: 'Login Button',
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                // Sign Up Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: controller.navigateToSignUp,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryPink,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        elevation: 2,
                        shadowColor: Colors.black26,
                      ),
                      child: Text(
                        'selectauth_signup'.tr,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                        ),
                        semanticsLabel: 'Sign Up Button',
                      ),
                    ),
                  ),
                ),

                SizedBox(height: size.height * 0.04),
              ],
            ),
          ),
        ),
      ),
    );
  }
}