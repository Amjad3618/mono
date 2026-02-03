import 'package:flutter/material.dart';
import 'package:mono/Utils/app_color.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Color(AppColor.primaryColor));
  }
}
