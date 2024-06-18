import 'package:flutter/material.dart';
import 'package:readaptic_app_interface/globals/api.dart';
import 'package:readaptic_app_interface/models/sensor.dart';

class Sensor3View extends StatefulWidget {
  const Sensor3View({super.key});

  @override
  State<Sensor3View> createState() => _Sensor3ViewState();
  
}

class _Sensor3ViewState extends State<Sensor3View>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Sensor 3"),
      ),
    );
  }
}