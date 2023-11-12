import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "homeScreen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
children: [
  Image.asset(
    'assets/images/background.jpg',
    fit: BoxFit.fill,
    width: double.infinity,
    height: double.infinity,
  ),
],
    );
  }
}
