import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:mono/Utils/bottom_nav.dart';

import '../../Utils/app_color.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(AppColor.white),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/images/Group 1.png"),

          Text(
            "spend smarter ",
            style: TextStyle(
              color: const Color(AppColor.primaryColor),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "save more",
            style: TextStyle(
              color: const Color(AppColor.primaryColor),
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
        InkWell(
            onTap: () {Get.to(() => const MainScreen());},
            child: Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: const Color(AppColor.primaryColor),
                borderRadius: BorderRadius.circular(150),
              ),
              child: Center(
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    color: const Color(AppColor.white),
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account? ",
                style: TextStyle(
                  color: const Color(AppColor.black),
                  fontSize: 16,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Log In",
                  style: TextStyle(
                    color: const Color(AppColor.primaryColor),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
