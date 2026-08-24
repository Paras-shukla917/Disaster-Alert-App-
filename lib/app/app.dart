import 'package:flutter/material.dart';
import '../navigation/bottom_navigation.dart';
import 'theme.dart';

class DisasterAlertApp extends StatelessWidget {
  const DisasterAlertApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Disaster Alert App',
      theme: AppTheme.lightTheme,
      home: const BottomNavigation(),
    );
  }
}