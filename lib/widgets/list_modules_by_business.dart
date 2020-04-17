import 'package:flutter/material.dart';
import 'package:paas/api/module.dart';
import 'package:paas/model/business.dart';
import 'package:paas/model/module.dart';
import 'package:paas/providers/business/module_bar.dart';
import 'package:paas/providers/modules/module_bar.dart';
import 'package:provider/provider.dart';
import '../utils/utils.dart';

class ListModulesByBusinessWidget extends StatefulWidget {

  SECTION section;

  ListModulesByBusinessWidget(this.section);

  @override
  _ListModulesByBusinessWidgetState createState() => _ListModulesByBusinessWidgetState();
}

class _ListModulesByBusinessWidgetState extends State<ListModulesByBusinessWidget> {

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

    var moduleInfo = Provider.of<BModuleBar>(context);

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
