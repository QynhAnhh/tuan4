import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnboardingScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3C63EA),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SvgPicture.asset(
                  'assets/images/rectangle-list-regular-full.svg',
                  width: 64,
                  height: 64,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF3C63EA),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'UTH Todo',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Việc học, việc nhà – gọn gàng mỗi ngày',
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
              const Spacer(),
              const Text(
                'Phiên bản 2.1.0',
                style: TextStyle(fontSize: 12, color: Colors.white54),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}