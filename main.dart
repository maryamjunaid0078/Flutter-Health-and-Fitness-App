import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/dashboard.dart';
import 'pages/bmi_calculator.dart';
import 'pages/mental_health.dart';
import 'pages/feedback_page.dart';

void main() {
  runApp(const HealthFitnessApp());
}

class HealthFitnessApp extends StatelessWidget {
  const HealthFitnessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Health & Fitness Pro',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
        useMaterial3: true,
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
