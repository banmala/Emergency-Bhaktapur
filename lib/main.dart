import 'package:emergency_bhaktapur/Process/APIRequest.dart';
import 'package:flutter/material.dart';
import 'Views/Home.dart';
import 'package:emergency_bhaktapur/Views/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  APIRequest apiRequest1 = new APIRequest(
      st: 'ambulance',
      apiUrl:
          'https://raw.githubusercontent.com/Techsamuha/Emergency-bhaktapur/master/ambulance.php');
  APIRequest apiRequest2 = new APIRequest(
      st: 'hospital',
      apiUrl:
          'https://raw.githubusercontent.com/Techsamuha/Emergency-bhaktapur/master/hospital.php');
  APIRequest apiRequest3 = new APIRequest(
      st: 'fireBrigade',
      apiUrl:
          'https://raw.githubusercontent.com/Techsamuha/Emergency-bhaktapur/master/fireBrigade.php');
  APIRequest apiRequest4 = new APIRequest(
      st: 'police',
      apiUrl:
          'https://raw.githubusercontent.com/Techsamuha/Emergency-bhaktapur/master/police.php');
  APIRequest apiRequest5 = new APIRequest(
      st: 'sabbahan',
      apiUrl:
          'https://raw.githubusercontent.com/Techsamuha/Emergency-bhaktapur/master/sabbahan.php');
  APIRequest apiRequest6 = new APIRequest(
      st: 'bhaktapur',
      apiUrl:
          'https://raw.githubusercontent.com/Techsamuha/Emergency-bhaktapur/master/bhaktapur.php');
  APIRequest apiRequest7 = new APIRequest(
      st: 'changu',
      apiUrl:
          'https://raw.githubusercontent.com/Techsamuha/Emergency-bhaktapur/master/changu.php');
  APIRequest apiRequest8 = new APIRequest(
      st: 'thimi',
      apiUrl:
          'https://raw.githubusercontent.com/Techsamuha/Emergency-bhaktapur/master/thimi.php');
  APIRequest apiRequest9 = new APIRequest(
      st: 'suryabinayak',
      apiUrl:
          'https://raw.githubusercontent.com/Techsamuha/Emergency-bhaktapur/master/suryabinayak.php');
  APIRequest apiRequest10 = new APIRequest(
      st: 'covid',
      apiUrl:
          'https://raw.githubusercontent.com/Techsamuha/Emergency-bhaktapur/master/covid.php');
  APIRequest apiRequest11 = new APIRequest(
      st: 'office',
      apiUrl:
          'https://raw.githubusercontent.com/Techsamuha/Emergency-bhaktapur/master/office.php');
  APIRequest apiRequest12 = new APIRequest(
      st: 'blood',
      apiUrl:
          'https://raw.githubusercontent.com/Techsamuha/Emergency-bhaktapur/master/blood.php');
  @override
  Widget build(BuildContext context) {
    apiRequest1.getData();
    apiRequest2.getData();
    apiRequest3.getData();
    apiRequest4.getData();
    apiRequest5.getData();
    apiRequest6.getData();
    apiRequest7.getData();
    apiRequest8.getData();
    apiRequest9.getData();
    apiRequest10.getData();
    apiRequest11.getData();
    apiRequest12.getData();
    return MaterialApp(
      title: 'Emergency Bhaktapur',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: Home(),
      ),
    );
  }
}
