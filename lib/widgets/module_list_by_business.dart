import 'package:flutter/material.dart';
import 'package:paas/model/module.dart';

class ModuleListByBusinessWidget extends StatefulWidget {

  List<ModuleModel> dataModule;

  ModuleListByBusinessWidget(this.dataModule);

  @override
  _ModuleListByBusinessWidgetState createState() => _ModuleListByBusinessWidgetState();
}

class _ModuleListByBusinessWidgetState extends State<ModuleListByBusinessWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
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
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("REGISTRO", style: TextStyle(fontSize: 20)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Plantilla: Personlizada",
                                style: TextStyle(fontSize: 12)),
                          ]),
                    ),
                    Text("12/04/2019"),
                  ],
                ));
          },
        ),
    );
  }
}
