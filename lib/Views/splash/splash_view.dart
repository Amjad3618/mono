import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mono/Utils/app_color.dart';

import '../onboarding/onboarding_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
void initState() {
  super.initState();

  WidgetsBinding.instance.addPostFrameCallback((_) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.off(() => const OnboardingView());
    });
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(AppColor.primaryColor),
      body: Center(
        child: Text(
          "mono",
          style: TextStyle(
            color: const Color(AppColor.white),
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
