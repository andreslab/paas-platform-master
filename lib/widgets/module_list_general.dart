import 'package:flutter/material.dart';
import 'package:paas/api/module.dart';
import 'package:paas/model/module.dart';
import 'package:provider/provider.dart';
import 'package:paas/providers/module_bar.dart';

class ModuleListGeneralWidget extends StatefulWidget {
  List<ModuleModel> dataModule;

  ModuleListGeneralWidget(this.dataModule);

  @override
  _ModuleListGeneralWidgetState createState() =>
      _ModuleListGeneralWidgetState();
}

class _ModuleListGeneralWidgetState extends State<ModuleListGeneralWidget> {


  final _moduleAPI = ModuleAPI();
  var moduleCount = 0;

  _loadModule() async {
    //call request
    final res = await _moduleAPI.getModuleList(context);

    if (res != null) {
      print("OK");
      setState(() {
        moduleCount = res.length;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final moduleInfo = Provider.of<ModuleBar>(context);


    _loadModule();

    return Container(
      child: ListView.builder(
        itemCount: moduleCount,
        itemBuilder: (context, position) {
          return InkWell(
            onTap: () {
              moduleInfo.indexPage = 3; //editPage: 3
              moduleInfo.indexMenu = 3; //editMenu: 2
            },
            child: Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text("REGISTRO", style: TextStyle(fontSize: 20)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Categoria: Usuarios",
                                style: TextStyle(fontSize: 12)),
                          ]),
                    ),
                    Text("12/04/2019"),
                  ],
                )),
          );
        },
      ),
    );
  }
}
