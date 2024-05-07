import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<dynamic> sensors = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView.builder(
        itemCount: sensors.length,
        itemBuilder: (context, index) {
          final sensor = sensors[index];
          final SensorId = sensor['entity_id'];
          final SensorName = sensor['attributes']['friendly_name'];
          final SensorState = sensor['state'];
          return ListTile(
            leading: Text('${index + 1}'),
            title: Text(SensorId),
            subtitle: Text('$SensorName: $SensorState'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: FetchEvents,
      ),
    );
  }

  void FetchEvents() async {
    print('FetchEvents');
    const url = 'http://192.168.0.101:8123/api/states';
    const headers = {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiIzYTc1NWZiMGQ4MWI0YzBjOTQyMDRhYWJmNjhlNTU4MSIsImlhdCI6MTcxMjczODE2MSwiZXhwIjoyMDI4MDk4MTYxfQ.3zmc4hSq3QdrCgapSKLUytjVnznmnabRtdo7QpT_Xlo"
    };
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body);
      setState(() {
        sensors = json;
      });
    } else {
      // Handle error if the request fails
      print('Failed to fetch data: ${response.statusCode}');
    }

    print('FetchEvents done');
  }
}
