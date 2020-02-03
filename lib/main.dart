import 'package:flutter/material.dart';
import 'pages/home.dart';
import 'pages/company.dart';
import 'pages/detail.dart';


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
      home: HomePage(),
      routes: {
        "home": (context) => HomePage(),
        "company": (context) => CompanyPage(),
        "detail": (context) => DetailPage(),
      },
    );
  }  
}