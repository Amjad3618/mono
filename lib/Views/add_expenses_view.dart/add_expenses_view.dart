import 'package:flutter/material.dart';

class AddExpensesView extends StatefulWidget {
  const AddExpensesView({super.key});

  @override
  State<AddExpensesView> createState() => _AddExpensesViewState();
}

class _AddExpensesViewState extends State<AddExpensesView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: const Center(
        child: Text("Add Expenses Content"),
      ),
    );
  }
}