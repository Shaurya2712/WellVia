import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'select_auth_controller.dart';

class SelectAuthView extends GetView<SelectAuthController> {
  const SelectAuthView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),

              // Top demo image
              Image.asset(
                'assets/images/logo_demo.png',
                height: size.height * 0.22,
              ),

              const SizedBox(height: 20),

              // CarouselSlider.builder
              Obx(
                    () => Container(
                  margin: const EdgeInsets.symmetric( horizontal: 20.0, vertical: 10.0 ),  // Apply margin here
                  child: CarouselSlider.builder(
                    itemCount: controller.imageList.value.length,
                    itemBuilder: (context, index, realIndex) {
                      final item = controller.imageList.value[index];
                      return Container(
                        margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              offset: Offset(0, 2),
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
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF59b1de),
                              ),
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      );
                    },
                    options: CarouselOptions(
                      height: size.height * 0.4,  // Reduce carousel height
                      aspectRatio: 1.4,            // Adjust aspect ratio
                      viewportFraction: 1.0,
                      enlargeCenterPage: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(milliseconds: 2000),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      pauseAutoPlayOnTouch: true,
                      onPageChanged:
                          (index, reason) =>
                      controller.currentPage.value = index,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // Square indicators
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    controller.imageList.value.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 15,
                      height: 5,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                        color:
                            controller.currentPage.value == index
                                ? Colors.black
                                : Colors.grey.shade400,
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // Login Button
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 10,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.navigateToLogin();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF59b1de),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Login',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),

              // Sign Up Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.navigateToSignUp();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFed6b87),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
