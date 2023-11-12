import 'package:flutter/material.dart';

import 'homescreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Task',
      initialRoute:HomeScreen.routeName  ,
      routes: {
        HomeScreen.routeName : (context) => HomeScreen(),
      },
      debugShowCheckedModeBanner: false,

    );
  }
}

