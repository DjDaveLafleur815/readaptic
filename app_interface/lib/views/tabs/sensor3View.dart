import 'package:flutter/material.dart';
import 'package:readaptic_app_interface/globals/api.dart';
import 'package:readaptic_app_interface/models/sensor.dart';
import 'package:readaptic_app_interface/globals/sensorList.dart';

class Sensor3View extends StatefulWidget {
  const Sensor3View({super.key});

  @override
  State<Sensor3View> createState() => _Sensor3ViewState();
  
}

class _Sensor3ViewState extends State<Sensor3View>  {
  int currentIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('READAPIC',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          )
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(25.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20), // Espace de 20 pixels en haut
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed non risus. Suspendisse lectus tortor, dignissim sit amet, adipiscing nec, ultricies sed, dolor.',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      ),
    );
  }
}