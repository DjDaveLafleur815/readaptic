import 'package:flutter/material.dart';
import 'package:readaptic_app_interface/globals/sensorList.dart';
import 'package:readaptic_app_interface/views/tabs/sensor1View.dart';
import 'package:readaptic_app_interface/views/tabs/sensor2View.dart';
import 'package:readaptic_app_interface/views/tabs/sensor3View.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

// Liste des destinations de la barre de navigation
  List<Widget> views = const [
    Sensor1View(),
    Sensor2View(),
    Sensor3View()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('READAPIC'),
        centerTitle: true,
      ),
      body: views[currentIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentIndex,
        onDestinationSelected: (index) {
          setState(() {});
        },
        destinations: sensors,
      ),
    );
  }
}