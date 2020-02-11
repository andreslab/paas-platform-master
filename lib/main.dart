import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/business.dart';
import 'pages/dashboard.dart';
import 'pages/module.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Flutter Demo",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: DashboardPage(),
      routes: {
        "home": (context) => HomePage(),
        "company": (context) => BusinessPage(),
        "dashboard": (context) => DashboardPage(),
        "module": (context) => ModulePage(),
      },
    );
  }  
}