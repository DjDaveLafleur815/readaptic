import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SensorView extends StatefulWidget {
  const SensorView({super.key});

  @override
  State<SensorView> createState() => _SensorViewState();
  
}

class _SensorViewState extends State<SensorView>  {
  List <dynamic> sensor = [];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('READAPTIC',
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          )
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: sensor.length,
        itemBuilder: (context, index) {
          final sensors = sensor[index];
          final entityId = sensors['entity_id'];
          final name = sensors['attributes']['friendly_name'];
          final email = sensors['state'];
          return ListTile(
            title: Text(name),
            subtitle: Text(email),
          );
        },
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
