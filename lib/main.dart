import 'package:flutter/material.dart';
import 'package:paas/providers/business_bar.dart';
import 'package:paas/providers/home_bar.dart';
import 'package:paas/providers/module_bar.dart';
import 'package:paas/providers/template_bar.dart';
import 'package:provider/provider.dart';
import 'pages/home.dart';
import 'pages/business.dart';
import 'pages/dashboard.dart';
import 'pages/module.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeBar(),),
        ChangeNotifierProvider(create: (context) => BusinessBar(),),
        ChangeNotifierProvider(create: (context) => ModuleBar(),),
        ChangeNotifierProvider(create: (context) => TemplateBar(),)
      ],
      
      child: MaterialApp(
        title: "Flutter Demo",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: DashboardPage(),
        routes: {
          "home": (context) => HomePage(),
          "company": (context) => BusinessPage(),
          "dashboard": (context) => DashboardPage(),
          "module": (context) => ModulePage(),
        },
      ),
    );
  }
}
