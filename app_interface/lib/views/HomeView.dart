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
        title: const Text('READAPTIC',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          )),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            const SizedBox(height: 15),
              Image.asset('assets/icon/playstore.png',
                width: 150,
                height: 150,
              ),
            Container(
              margin: const EdgeInsets.only(top: 20), // Espace de 20 pixels en haut
              child: Text(
                'Welcome to Readaptic. This is a research project in home automation using an IoT system (Internet of Things) to connect MultiSensors via the Z-Wave protocol to a Home Assistant server',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
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