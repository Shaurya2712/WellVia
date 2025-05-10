import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'splash_initial_controller.dart';
import 'package:wellvia/app/core/constants/colors.dart';

class SplashInitialView extends GetView<SplashInitialController> {
  const SplashInitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.white,
              Color(0xFFD6EFFF),
              AppColors.primaryPink.withOpacity(0.2),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Image.asset(
                'assets/images/Wellvia-Health-Final-Logo.png',
                height: 120,
                semanticLabel: 'Wellvia Health Logo',
              ),
              const SizedBox(height: 40),
              // Bouncing dots loader
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return BouncingDot(
                    delay: Duration(milliseconds: index * 200),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BouncingDot extends StatefulWidget {
  final Duration delay;

  const BouncingDot({
    super.key,
    required this.delay,
  });

  @override
  State<BouncingDot> createState() => _BouncingDotState();
}

class _BouncingDotState extends State<BouncingDot> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    Future.delayed(widget.delay, () {
      if (mounted) {
        _controller.repeat(reverse: true);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, -10 * _animation.value),
          child: Container(
            width: 12,
            height: 12,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: AppColors.primaryPink,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }
} 