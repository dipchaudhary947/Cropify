import 'package:cropify_app/core/services/preferences_service.dart';
import 'package:cropify_app/features/onboarding/model/onboarding_model.dart';
import 'package:cropify_app/features/onboarding/views/widgets/onboarding_item.dart';
import 'package:cropify_app/routes/route_names.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int _currentScreens = 0;
  final PageController _screenController = PageController();
  final List<OnbardingModel> _screens = [
    OnbardingModel(
      title: "Fresh From Farm",
      description:
          "Cropify connects farmers and customers in one seamless marketplace. List produce, discover fresh food, and get it delivered fast. No middlemen, just better prices, real transparency, and farm-fresh quality.",
      lottieImage: "assets/lottie/onboarding01.json",
    ),
    OnbardingModel(
      title: "Farm to Doorstep",
      description:
          "With Cropify, buying and selling fresh food is simple. Farmers sell directly. Customers get fresh produce on demand. Built for speed, trust, and everyday convenience.",
      lottieImage: "assets/lottie/onboarding02.json",
    ),
    OnbardingModel(
      title: "Fresh Food Network",
      description:
          "Cropify is the fastest way to move food from farms to people. Farmers grow, list, and sell. Customers browse, order, and receive—fresh, reliable, and hassle-free.",
      lottieImage: "assets/lottie/onboarding03.json",
    ),
  ];

  @override
  void dispose() {
    _screenController.dispose();
    super.dispose();
  }

  Future<void> _onNextTap() async {
    if (_currentScreens < _screens.length - 1) {
      _screenController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      // navigate to home
      await PreferencesService.instance.setBool("onboarding", true);
      if (mounted) {
        context.goNamed(RouteNames.login);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 80),
        child: Column(
          spacing: 20,
          children: [
            Expanded(
              child: PageView.builder(
                controller: _screenController,
                itemCount: _screens.length,
                onPageChanged: (value) =>
                    setState(() => _currentScreens = value),
                itemBuilder: (context, index) {
                  return OnboardingItem(item: _screens[index]);
                },
              ),
            ),
            Row(
              mainAxisAlignment: .center,
              spacing: 10,
              children: List.generate(_screens.length, (index) {
                return AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  height: 10,
                  width: _currentScreens == index ? 20 : 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: _currentScreens == index
                        ? Colors.green
                        : Colors.grey,
                  ),
                );
              }),
            ),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: _onNextTap,
                style: FilledButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  textStyle: TextStyle(fontWeight: .bold, fontSize: 18),
                ),
                child: Text(
                  _currentScreens == _screens.length - 1
                      ? "Open Cropify"
                      : "Next",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
