import 'package:readaptic_app_interface/views/HomeView.dart';
import 'package:flutter/material.dart';

// Lancement de l'application.
void main() {
  runApp( const MyApp());
}

// Fonction principale de l'application.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}
