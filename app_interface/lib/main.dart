import 'package:readaptic_app_interface/views/HomeView.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: HomeView(), // HomeView widget
    );
  }
}
