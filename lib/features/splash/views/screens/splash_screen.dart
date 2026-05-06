import 'package:cropify_app/features/splash/views/widgets/splash_background.dart';
import 'package:cropify_app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    // Animation
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();

    // Navigation
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.goNamed(RouteNames.onboarding);
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
    return Scaffold(
      body: Stack(
        children: [
          const SplashBackground(),
          Container(color: const Color(0xFF3FA34D).withOpacity(0.9)),

          // main content
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Icon(
                    Icons.eco,
                    size: 40,
                    color: Color(0xFF3FA34D),
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "Cropify",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Sell Fresh • Buy Fresh",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),

          // loader
          Positioned(
            bottom: 40,
            left: 40,
            right: 40,
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, _) {
                      return LinearProgressIndicator(
                        value: _controller.value,
                        color: Colors.white,
                        backgroundColor: Colors.white24,
                        minHeight: 5,
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "LOADING FARMS NEAR YOU",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white70,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
