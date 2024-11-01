import 'package:belajar_flutter/pages/doctor.dart';
import 'package:belajar_flutter/pages/home.dart';
import 'package:belajar_flutter/pages/appoinment.dart';
import 'package:belajar_flutter/pages/location.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      initialRoute: '/homePage',
      routes: {
        '/homePage': (context) => HomePage(),
        '/location': (context) => LocationPage(),
        '/appointment': (context) => Appoinment(),
        '/doctor': (context) => Doctor(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}