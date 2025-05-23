import 'package:flutter/material.dart';
import 'package:intenee_learning_app/view/splashScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Intenee LMS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      color: Colors.green,
      home: SplashScreen(), // Start with SplashScreen instead of MyHomePage
    );
  }
}
