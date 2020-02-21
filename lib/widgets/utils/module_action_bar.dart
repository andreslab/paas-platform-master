import 'package:flutter/material.dart';
import 'package:paas/providers/business_bar.dart';
import 'package:paas/providers/home_bar.dart';
import 'package:paas/providers/module_bar.dart';
import 'package:paas/providers/template_bar.dart';
import 'package:provider/provider.dart';

class ModuleActionBarWidget extends StatefulWidget {
  final int menu;
  ModuleActionBarWidget({this.menu});

  @override
  _ModuleActionBarWidgetState createState() => _ModuleActionBarWidgetState();
}

class _ModuleActionBarWidgetState extends State<ModuleActionBarWidget> {
  @override
  Widget build(BuildContext context) {
    final moduleInfo = Provider.of<ModuleBar>(context);

    TextEditingController textEditingController = TextEditingController();
    textEditingController.addListener(() {
      print(textEditingController.text);
    });

    Widget moduleBusinessBar = Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Row(
          children: <Widget>[
            Expanded(
              child: TextField(
                onChanged: (input) => print(input),
                controller: textEditingController,
              ),
            ),
            SizedBox(
              width: 20,
            ),
            RaisedButton(
              child: Icon(Icons.filter_list),
              onPressed: () => print("filtro"),
            )
          ],
        ));

    Widget moduleListBar = Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: <Widget>[
          RaisedButton(
            child: Icon(Icons.arrow_back),
            onPressed: () {
              moduleInfo.indexPage = 0;
              moduleInfo.indexMenu = 0;
            },
          ),
          SizedBox(
            width: 20,
          ),
          RaisedButton(
              child: Text("Nuevo"),
              onPressed: () {
                moduleInfo.indexPage = 2; //moduleListGeneral
                moduleInfo.indexMenu = 2; //moduleListGeneralBar
              }),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: TextField(
              onChanged: (input) => print(input),
              controller: textEditingController,
            ),
          ),
          SizedBox(
            width: 20,
          ),
          RaisedButton(
            child: Icon(Icons.filter_list),
            onPressed: () => print("filtro"),
          )
        ],
      ),
    );

    Widget moduleListGeneralBar = Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
                child: TextField(
                  onChanged: (input) => print(input),
                  controller: textEditingController,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              RaisedButton(
                child: Icon(Icons.filter_list),
                onPressed: () => print("filtro"),
              ),
              SizedBox(
                width: 20,
              ),
              RaisedButton(
                child: Icon(Icons.close),
                onPressed: () {
                  moduleInfo.indexPage = 1;
                  moduleInfo.indexMenu = 1;
                },
              )
        ],
      ),
    );

    Widget moduleEditBar = Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RaisedButton(
              child: Text("Guardar"),
              onPressed: () {
                moduleInfo.indexPage = 1;
                moduleInfo.indexMenu = 1;
              }),
          RaisedButton(
            child: Icon(Icons.close),
            onPressed: () {
              moduleInfo.indexPage = 1;
              moduleInfo.indexMenu = 1;
            },
          )
        ],
      ),
    );

    List<Widget> bars = <Widget>[
      moduleBusinessBar,
      moduleListBar,
      moduleListGeneralBar,
      moduleEditBar
    ];

    return Container(
        height: 80, color: Colors.blue, child: bars[moduleInfo.indexMenu]);
  }
}
