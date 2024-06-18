import 'package:flutter/material.dart';
import 'package:readaptic_app_interface/globals/api.dart';
import 'package:readaptic_app_interface/models/sensor.dart';

class Sensor1View extends StatefulWidget {
  const Sensor1View({super.key});

  @override
  State<Sensor1View> createState() => _Sensor1ViewState();
  
}

class _Sensor1ViewState extends State<Sensor1View>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Sensor 1"),
      ),
    );
  }
}