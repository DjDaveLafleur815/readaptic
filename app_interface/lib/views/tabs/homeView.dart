// Importation des widgets de base de l'application
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
      floatingActionButton: FloatingActionButton(
        onPressed: fetchSensors,
        child: const Icon(Icons.sensors),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
    );
  }

    void fetchSensors() async {
    print('fetchSensors called !');
    const url = 'http://192.168.43.76:8123/api/states';
    final uri = Uri.parse(url);
    const String accessToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiIzMzA4NGEwMWMyM2M0MGZmOTRlMmJlMDIzMGQ5ZjdmMSIsImlhdCI6MTcyMDE3NzY1NywiZXhwIjoyMDM1NTM3NjU3fQ.ZGYQuyqYmlt_OJpUdYEkEL9aMhZA-zGZGXj1hFvW_zc';
    const headers = {
      'Authorization': 'Bearer $accessToken',
    };
    final response = await http.get(uri, headers: headers);
    final body = response.body;
    final json = jsonDecode(body);
      setState(() {
        sensor = json;
      });
    print('fetchSensors completed !');
  }
}