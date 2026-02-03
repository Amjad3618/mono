import 'package:flutter/material.dart';
import 'package:mono/Views/profile/profile_view.dart';
import 'package:mono/Views/statics/static_view.dart';

import '../../Utils/app_color.dart';
import '../Views/add_expenses_view.dart/add_expenses_view.dart';
import '../Views/homeview/home_view.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  // List of views to display
  final List<Widget> _views = [
    const HomeView(),
    const StaticView(),
    const AddExpensesView(),
    const ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(AppColor.white),
      body: _views[_selectedIndex],
      bottomNavigationBar: Stack(
        alignment: Alignment.topCenter,
        children: [
          // Background for bottom navigation
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: const Color(AppColor.white),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 15,
                  spreadRadius: 0,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Home
                  _buildNavItem(
                    index: 0,
                    icon: Icons.home_outlined,
                    label: 'Home',
                  ),
                  // Analytics/Statistics
                  _buildNavItem(
                    index: 1,
                    icon: Icons.bar_chart_outlined,
                    label: 'Statistics',
                  ),
                  // Center space for FAB
                  const SizedBox(width: 60),
                  // Add Expenses (can be used for calendar or other)
                  _buildNavItem(
                    index: 2,
                    icon: Icons.add_circle_outline,
                    label: 'Add',
                  ),
                  // Profile
                  _buildNavItem(
                    index: 3,
                    icon: Icons.person_outline,
                    label: 'Profile',
                  ),
                ],
              ),
            ),
          ),
          // Floating Action Button in center
          Positioned(
          
            child: GestureDetector(
              onTap: () {
                // Add action here - you can navigate to add expenses or any other action
                setState(() {
                   // Navigate to Add Expenses view
                });
              },
              child: Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(AppColor.primaryColor),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(AppColor.primaryColor).withOpacity(0.4),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    bool isSelected = _selectedIndex == index;

    return GestureDetector(
      onTap: () => _onItemTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected
                  ? const Color(AppColor.primaryColor).withOpacity(0.1)
                  : Colors.transparent,
            ),
            child: Center(
              child: Icon(
                icon,
                color: isSelected
                    ? const Color(AppColor.primaryColor)
                    : Colors.grey.shade400,
                size: 24,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: isSelected
                  ? const Color(AppColor.primaryColor)
                  : Colors.grey.shade400,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}