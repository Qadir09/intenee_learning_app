import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intenee_learning_app/view/dashboard.dart'; // Update this import if needed

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 6), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MyHomePage(title: 'Internee LMS'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade700,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App logo or placeholder
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.school,
                  size: 80,
                  color: Colors.green.shade700,
                ),
              ),
              const SizedBox(height: 30),
              // Welcome message
              Text(
                'Welcome to Internee.pk LMS',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Empowering Learners Across Pakistan',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, color: Colors.green.shade100),
              ),
              const SizedBox(height: 40),
              // Loading indicator
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
