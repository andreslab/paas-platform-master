import 'package:flutter/material.dart';

class ModuleMainWidget extends StatefulWidget {
  @override
  _ModuleMainWidgetState createState() => _ModuleMainWidgetState();
}

class _ModuleMainWidgetState extends State<ModuleMainWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: PageView(
          children: <Widget>[listCompany, listModuleByCompany],
        ));
  }

  Widget listCompany = ListView.builder(
    itemCount: 5,
    itemBuilder: (context, position) {
      return Container(
          padding: EdgeInsets.all(20),
          child: Row(
            children: <Widget>[
              Placeholder(
                fallbackHeight: 40,
                fallbackWidth: 40,
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text("EMPRESA", style: TextStyle(fontSize: 30)),
                      SizedBox(height: 20),
                      Text("4 MODULOS", style: TextStyle(fontSize: 15))
                    ]),
              ),
              Icon(Icons.arrow_right)
            ],
          ));
    },
  );

  Widget listModuleByCompany = ListView.builder(
    itemCount: 5,
    itemBuilder: (context, position) {
      return Container(
        padding: EdgeInsets.all(20),
          child: Row(
        children: <Widget>[
          Checkbox(
            value: true,
            onChanged: (bool value) {
              print("...");
            },
          ),
          SizedBox(width: 20,),
          Expanded(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("REGISTRO", style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10,),
                  Text("Plantilla: Personlizada", style: TextStyle(fontSize: 12)),
                ]),
          ),
          Text("12/04/2019"),
        ],
      ));
    },
  );
}
