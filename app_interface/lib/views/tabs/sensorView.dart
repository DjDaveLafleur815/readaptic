import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;

class SensorView extends StatefulWidget {
  const SensorView({Key? key}) : super(key: key); // Ajouter Key? key

  @override
  State<SensorView> createState() => _SensorViewState();
}

class _SensorViewState extends State<SensorView> {
  List<dynamic> sensor = [];

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(300, 800),
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'READAPTIC',
            style: TextStyle(
              fontSize: 40, // Utiliser des valeurs non constantes pour la taille de police
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: sensor.length,
          itemBuilder: (context, index) {
            final sensors = sensor[index];
            final entityId = sensors['entity_id'];
            final name = sensors['attributes']['friendly_name'];
            final state = sensors['state'];
            return ListTile(
              title: Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              subtitle: Text('État: $state', style: TextStyle(fontSize: 16)),
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: fetchSensors,
          child: const Icon(Icons.sensors),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }

  void fetchSensors() async {
    print('fetchSensors called!');
    const url = 'http://192.168.43.76:8123/api/states';
    final uri = Uri.parse(url);
    const String accessToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiIzMzA4NGEwMWMyM2M0MGZmOTRlMmJlMDIzMGQ5ZjdmMSIsImlhdCI6MTcyMDE3NzY1NywiZXhwIjoyMDM1NTM3NjU3fQ.ZGYQuyqYmlt_OJpUdYEkEL9aMhZA-zGZGXj1hFvW_zc';
    final headers = {
      'Authorization': 'Bearer $accessToken',
    };
    final response = await http.get(uri, headers: headers);
    final body = utf8.decode(response.bodyBytes);
    final json = jsonDecode(body);
    
    setState(() {
      sensor = json;
      sortSensors();
    });
    
    print('fetchSensors completed!');
  }

  void sortSensors() {
    sensor.sort((a, b) {
      final nameA = a['attributes']['friendly_name'].toString().toLowerCase();
      final nameB = b['attributes']['friendly_name'].toString().toLowerCase();
      return nameA.compareTo(nameB);
    });
  }
}
