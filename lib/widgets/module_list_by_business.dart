import 'package:flutter/material.dart';
import 'package:paas/api/module.dart';
import 'package:paas/model/business.dart';
import 'package:paas/model/module.dart';
import 'package:paas/providers/module_bar.dart';
import 'package:provider/provider.dart';

class ModuleListByBusinessWidget extends StatefulWidget {

  /* BusinessModel business;

  ModuleListByBusinessWidget(this.business); */

  @override
  _ModuleListByBusinessWidgetState createState() => _ModuleListByBusinessWidgetState();
}

class _ModuleListByBusinessWidgetState extends State<ModuleListByBusinessWidget> {

  final _moduleAPI = ModuleAPI();
  var moduleCount = 0;
  List<ModuleByBusinessModel> modules = List<ModuleByBusinessModel>(); 

  _loadModule(BusinessModel model) async {
    //call request
    final res = await _moduleAPI.getModuleListByBusiness(context, model.id);

    if (res != null) {
      setState(() {
        moduleCount = res.length;
        modules = res;
      });
    }
  }
  
  @override
  Widget build(BuildContext context) {

    final moduleInfo = Provider.of<ModuleBar>(context);

    BusinessModel business = moduleInfo.businessSelected;

    _loadModule(business);

    return Container(
      child: ListView.builder(
          itemCount: moduleCount,
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
