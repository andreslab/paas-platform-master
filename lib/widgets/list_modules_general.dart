import 'package:flutter/material.dart';
import 'package:paas/api/module.dart';
import 'package:paas/model/module.dart';
import 'package:provider/provider.dart';
import 'package:paas/providers/business/module_bar.dart';
import 'package:paas/providers/modules/module_bar.dart';
import '../utils/utils.dart';

class ModuleListGeneralWidget extends StatefulWidget {
  
  Section section;

  ModuleListGeneralWidget(this.section);

  @override
  _ModuleListGeneralWidgetState createState() =>
      _ModuleListGeneralWidgetState();
}

class _ModuleListGeneralWidgetState extends State<ModuleListGeneralWidget> {


  final _moduleAPI = ModuleAPI();
  var moduleCount = 0;
  List<ModuleModel> modules = List<ModuleModel>(); 

  _loadModule() async {
    //call request
    final res = await _moduleAPI.getModuleList(context);

    if (res != null) {
      print("OK");
      setState(() {
        moduleCount = res.length;
        modules = res;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var moduleInfo;

    if(widget.section == Section.BUSINESS){
       moduleInfo = Provider.of<BModuleBar>(context);
    }else{
       moduleInfo = Provider.of<MModuleBar>(context);
    }
    
    
    _loadModule();

    return Container(
      child: ListView.builder(
        itemCount: moduleCount,
        itemBuilder: (context, position) {
          return InkWell(
            onTap: () {
              moduleInfo.indexPage = 3; //editPage: 3
              moduleInfo.indexMenu = 3; //editMenu: 2
              moduleInfo.moduleSelected = modules[position];
            },
            child: Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(modules[position].name.toUpperCase(), style: TextStyle(fontSize: 20)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Status: ${modules[position].status}",
                                style: TextStyle(fontSize: 12)),
                          ]),
                    ),
                    Text(modules[position].lastUpdate),
                  ],
                )),
          );
        },
      ),
    );
  }
}
