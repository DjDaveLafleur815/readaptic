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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomeView(),
    );
  }
}
