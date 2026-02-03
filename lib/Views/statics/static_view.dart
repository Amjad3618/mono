import 'package:flutter/material.dart';

class StaticView extends StatefulWidget {
  const StaticView({super.key});

  @override
  State<StaticView> createState() => _StaticViewState();
}

class _StaticViewState extends State<StaticView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: const Center(
        child: Text("Static View Content"),
      ),
    );
  }
}