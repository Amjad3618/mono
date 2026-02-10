import 'package:flutter/material.dart';
import 'package:mono/Views/profile/profile_view.dart';
import 'package:mono/Views/statics/static_view.dart';

import '../../Utils/app_color.dart';
import '../Views/add_expenses_view.dart/connect_wallet.dart';
import '../Views/homeview/home_view.dart';
import '../widgets/expenses_dailogbox.dart'; // Import the new dialog

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _views = [
    const HomeView(),
    const StaticView(),
    const ConnectWallet(),
    const ProfileView(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _showAddExpenseDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const AddExpenseDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(AppColor.white),
      body: _views[_selectedIndex],
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none, // This allows content to overflow
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
                  // Add Expenses
                  _buildNavItem(
                    index: 2,
                    icon: Icons.calendar_today_outlined,
                    label: 'Calendar',
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
            top: -30, // Floats above the nav bar
            child: GestureDetector(
              onTap: _showAddExpenseDialog,
              child: Container(
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: const Color(AppColor.primaryColor),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(
                        AppColor.primaryColor,
                      ).withOpacity(0.4),
                      blurRadius: 20,
                      spreadRadius: 2,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: const Icon(Icons.add, color: Colors.white, size: 32),
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