import 'package:flutter/material.dart';
import 'package:readaptic_app_interface/globals/api.dart';
import 'package:readaptic_app_interface/models/sensor.dart';

class Sensor2View extends StatefulWidget {
  const Sensor2View({super.key});

  @override
  State<Sensor2View> createState() => _Sensor2ViewState();
  
}

class _Sensor2ViewState extends State<Sensor2View>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Sensor 2"),
      ),
    );
  }
}