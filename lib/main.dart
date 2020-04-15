import 'package:flutter/material.dart';
import 'package:paas/providers/business/business_bar.dart';
import 'package:paas/providers/business/module_bar.dart';
import 'package:paas/providers/dashboard/dashboard_bar.dart';
import 'package:paas/providers/modules/module_bar.dart';
import 'package:paas/providers/template/template_bar.dart';
import 'package:provider/provider.dart';
import 'pages/dashboard/dashboard.dart';
import 'pages/business/business.dart';
import 'pages/navigator.dart';
import 'pages/business/module.dart';
import 'pages/modules/module.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MultiProvider(
      providers: [
        //ChangeNotifierProvider(create: (context) => DDashboardBar(),),
        ChangeNotifierProvider(create: (context) => BBusinessBar(),),
        ChangeNotifierProvider(create: (context) => BModuleBar(),),
        ChangeNotifierProvider(create: (context) => MModuleBar(),),
        ChangeNotifierProvider(create: (context) => TTemplateBar(),)
      ],
      
      child: MaterialApp(
        title: "Flutter Demo",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: NavigatorPage(),
        routes: {
          "navigator": (context) => NavigatorPage(),
          "dashboard": (context) => DDashboardPage(),
          "company": (context) => BBusinessPage(),
          "business-module": (context) => BModulePage(),
          "modules": (context) => MModulePage(),
        },
      ),
    );
  }
}
