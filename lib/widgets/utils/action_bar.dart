import 'package:flutter/material.dart';
import 'package:paas/providers/business_bar.dart';
import 'package:paas/providers/home_bar.dart';
import 'package:paas/providers/module_bar.dart';
import 'package:paas/providers/template_bar.dart';
import 'package:provider/provider.dart';

class ActionBarWidget extends StatefulWidget {

  final int menu;
 ActionBarWidget({this.menu});

  @override
  _ActionBarWidgetState createState() => _ActionBarWidgetState();
}

class _ActionBarWidgetState extends State<ActionBarWidget> {
  @override
  Widget build(BuildContext context) {
    
    final homeInfo = Provider.of<HomeBar>(context);
    final businessInfo = Provider.of<BusinessBar>(context);
    final moduleInfo = Provider.of<ModuleBar>(context);
    final templateInfo = Provider.of<TemplateBar>(context);

    Widget homeBar = Row(
      children: <Widget>[
        FloatingActionButton(
            child: Icon(Icons.dashboard),
            onPressed: () => homeInfo.indexPage = 1)
      ],
    );

    Widget businessBar = Row(
      children: <Widget>[
        FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => businessInfo.indexPage = 2)
      ],
    );

    Widget moduleBar = Row(
      children: <Widget>[
        FloatingActionButton(
            child: Icon(Icons.place),
            onPressed: () => moduleInfo.indexPage = 2)
      ],
    );

    Widget templateBar = Row(
      children: <Widget>[
        FloatingActionButton(
            child: Icon(Icons.access_time),
            onPressed: () => templateInfo.indexPage = 2)
      ],
    );

    List<Widget> bars = <Widget>[
      homeBar,
      businessBar,
      moduleBar,
      templateBar
    ];

    return Container(height: 80, color: Colors.blue, child: bars[widget.menu]);
  }
}
