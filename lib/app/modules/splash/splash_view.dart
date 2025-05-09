import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wellvia/app/core/constants/colors.dart';
import 'splash_controller.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutBack),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeIn),
    );
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controller = Get.find<SplashController>();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
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
        child: Stack(
          children: [
            // Animated wave background
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CustomPaint(
                size: Size(size.width, size.height * 0.25),
                painter: WavePainter(),
              ),
            ),
            // Main content
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Logo with scale and fade animation
                FadeTransition(
                  opacity: _fadeAnimation,
                  child: ScaleTransition(
                    scale: _scaleAnimation,
                    child: Image.asset(
                      'assets/images/Wellvia-Health-Final-Logo.png',
                      height: size.height * 0.2,
                      semanticLabel: 'Wellvia Health Logo',
                    ),
                  ),
                ),

                // Title with slide animation
                AnimatedSlide(
                  offset: Offset(0, _fadeAnimation.value * 0.1),
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.easeOut,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: TextStyle(
                          fontSize: 36,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Poppins',
                          letterSpacing: 1,
                          shadows: [
                            Shadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        children: [
                          TextSpan(
                            text: 'splash_welcome'.tr + '\n',
                            style: const TextStyle(color: Colors.black87),
                          ),
                          TextSpan(
                            text: 'splash_app_name_part1'.tr,
                            style: TextStyle(color: AppColors.primaryPink),
                          ),
                          const TextSpan(text: ' '),
                          TextSpan(
                            text: 'splash_app_name_part2'.tr,
                            style: const TextStyle(color: Color(0xFF4CAF50)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Tagline with fade animation
                FadeTransition(
                  opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: _controller,
                      curve: const Interval(0.2, 1.0, curve: Curves.easeIn),
                    ),
                  ),
                  child: Text(
                    'splash_tagline'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Poppins',
                      letterSpacing: 0.4,
                      height: 1.4,

                    ),
                  ),
                ),

                // Subtagline with fade animation
                FadeTransition(
                  opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                    CurvedAnimation(
                      parent: _controller,
                      curve: const Interval(0.4, 1.0, curve: Curves.easeIn),
                    ),
                  ),
                  child: Text(
                    'splash_subtagline'.tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                      fontFamily: 'Poppins',
                      letterSpacing: 0.3,
                      height: 1.5,

                    ),
                  ),
                ),

                // Button with pulse animation
                AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: 1.0 + 0.05 * (0.5 + 0.5 * _controller.value),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FadeTransition(
                            opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                              CurvedAnimation(
                                parent: _controller,
                                curve: const Interval(0.6, 1.0),
                              ),
                            ),
                            child: Text(
                              'splash_button'.tr,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Poppins',
                                color: Colors.black87,
                                letterSpacing: 0.5,
                              ),
                              semanticsLabel: 'Get Started Button Label',
                            ),
                          ),
                          const SizedBox(height: 12),
                          GestureDetector(
                            onTap: controller.checkAuthStatus ,
                            child: Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    AppColors.primaryPink,
                                    Color(0xFFE91E63), // Darker pink
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primaryPink.withOpacity(0.5),
                                    blurRadius: 12,
                                    offset: const Offset(0, 6),
                                  ),
                                ],
                              ),
                              padding: const EdgeInsets.all(18),
                              child: const Icon(
                                Icons.arrow_forward,
                                color: AppColors.white,
                                size: 26,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Custom painter for animated wave
class WavePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primaryPink.withOpacity(0.15)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height * 0.5);
    path.quadraticBezierTo(
      size.width * 0.3,
      size.height * 0.7,
      size.width * 0.5,
      size.height * 0.5,
    );
    path.quadraticBezierTo(
      size.width * 0.7,
      size.height * 0.3,
      size.width,
      size.height * 0.5,
    );
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}