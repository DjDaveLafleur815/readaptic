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
    // AppBar with the title 'Home'
    appBar: AppBar(
      title: Text('READAPTIC'),
    ),
    // ListView.builder that displays the list of sensors
    body: ListView.builder(
      // The number of items in the list is the length of the sensors list
      itemCount: sensors.length,
      // Function that returns a ListTile for each sensor
      itemBuilder: (context, index) {
        final sensor = sensors[index];
        final SensorId = sensor['entity_id'];
        final SensorName = sensor['attributes']['friendly_name'];
        final SensorState = sensor['state'];
        // ListTile with the index of the sensor, sensor ID, sensor name, and sensor state
        return ListTile(
          leading: Text('${index + 1}'),
          title: Text(SensorId),
          subtitle: Text('$SensorName: $SensorState'),
        );
      },
    ),
    // FloatingActionButton that triggers the FetchEvents function when pressed
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
