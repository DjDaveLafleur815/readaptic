import 'dart:convert';
import 'package:readaptic_app_interface/models/sensor.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<List> fetchEvents() async {
    const url = 'http://192.168.0.101:8123/api/states';
    const headers = {
      "Authorization":
      "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiIzYTc1NWZiMGQ4MWI0YzBjOTQyMDRhYWJmNjhlNTU4MSIsImlhdCI6MTcxMjczODE2MSwiZXhwIjoyMDI4MDk4MTYxfQ.3zmc4hSq3QdrCgapSKLUytjVnznmnabRtdo7QpT_Xlo"
    };
    final uri = Uri.parse(url);
    final response = await http.get(uri, headers: headers);
    final body = response.body;
    final json = jsonDecode(body);
    final sensor = json ['sensor'] as List<dynamic>;
    final sensors = sensor.map((e) {
      return Sensor.fromMap(e);
    }).toList();
    return sensors;
  }
}