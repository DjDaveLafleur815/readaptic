// Importation des widgets de base de l'application
import 'package:flutter/material.dart';
// Classe principale de l'application
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

// Classe de l'état de l'application
class _HomeState extends State<Home> {

  List <dynamic> sensor = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      // En-tête de la page
      appBar: AppBar(
        title: const Text('READAPTIC',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          )),
        centerTitle: true,
      ),

      // Corps de la page
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: [
            const SizedBox(height: 15),
              Image.asset('assets/icon/playstore.png',
                width: 125,
                height: 125,
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
            Container(
              margin: const EdgeInsets.only(top: 35), // Espace de 20 pixels en haut
              child: Text(
                'Made by ciad',
              ),
            ),
          ],
        ),
      ),
    );
  }
}