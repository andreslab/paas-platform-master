import 'package:flutter/material.dart';
import 'package:paas/api/module.dart';
import 'package:paas/model/module.dart';
import 'package:provider/provider.dart';
import 'package:paas/providers/business/module_bar.dart';
import 'package:paas/providers/modules/module_bar.dart';
import '../utils/utils.dart';

class ListModulesWidget extends StatefulWidget {
  
  SECTION section;

  ListModulesWidget(this.section);

  @override
  _ListModulesWidgetState createState() =>
      _ListModulesWidgetState();
}

class _ListModulesWidgetState extends State<ListModulesWidget> {


  final _moduleAPI = ModuleAPI();
  var moduleCount = 0;
  List<ModuleModel> dataModules = List<ModuleModel>(); 

  _loadModule() async {
    //call request
    final res = await _moduleAPI.getModuleList(context);

    if (res != null) {
      print("OK");
      setState(() {
        moduleCount = res.length;
        dataModules = res;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    
    
    if(dataModules.length == 0){
      _loadModule();
    }

    return Container(
      child: ListView.builder(
        itemCount: moduleCount,
        itemBuilder: (context, position) {
          return InkWell(
            onTap: () {
              
              if(widget.section == SECTION.BUSINESS){
                var moduleInfo = Provider.of<BModuleBar>(context);
                moduleInfo.indexPage = NAVIGATOR_BUSINESS_MODULE.PAGE_EDIT_MODULE; 
                moduleInfo.indexMenu = 3;
                moduleInfo.moduleSelected = dataModules[position];
              }else{
                var moduleInfo = Provider.of<MModuleBar>(context);
                moduleInfo.indexPage = NAVIGATOR_MODULE_MAIN.PAGE_EDIT_MODULE; 
                moduleInfo.indexMenu = 0;
              }
            },
            child: Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(dataModules[position].name.toUpperCase(), style: TextStyle(fontSize: 20)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Status: ${dataModules[position].status}",
                                style: TextStyle(fontSize: 12)),
                          ]),
                    ),
                    Text(dataModules[position].lastUpdate),
                  ],
                )),
          );
        },
      ),
    );
  }
}
