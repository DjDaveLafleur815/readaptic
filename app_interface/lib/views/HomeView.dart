// Importation des widgets de base de l'application
import 'package:flutter/material.dart';
import 'package:readaptic_app_interface/globals/sensorList.dart';
import 'package:readaptic_app_interface/models/sensor.dart';
import 'package:readaptic_app_interface/views/tabs/homeView.dart';
import 'package:readaptic_app_interface/views/tabs/sensorView.dart';

// Classe principale de l'application
class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

// Classe de l'état de l'application
class _HomeViewState extends State<HomeView> {
  List<Sensor> sensor = [];
  int currentIndex = 0;
// Liste des vues
  List<Widget> views = const [
    Home(),
    SensorView()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // Corps de la page
      body: views[currentIndex],

      // Barre de navigation
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        destinations: sensors,
      ),
    );
  }
}