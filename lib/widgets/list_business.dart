import 'package:flutter/material.dart';
import 'package:paas/model/business.dart';
import 'package:paas/providers/business/module_bar.dart';
import 'package:paas/providers/modules/module_bar.dart';
import 'package:provider/provider.dart';
import '../utils/utils.dart';

class ModuleBusinessListWidget extends StatefulWidget {

  List<BusinessModel> dataBusiness;
  Section section;

  ModuleBusinessListWidget(this.dataBusiness, this.section);

  @override
  _ModuleBusinessListWidgetState createState() => _ModuleBusinessListWidgetState();
}

class _ModuleBusinessListWidgetState extends State<ModuleBusinessListWidget> {
  @override
  Widget build(BuildContext context) {

    var moduleInfo;

    if(widget.section == Section.BUSINESS){
       moduleInfo = Provider.of<BModuleBar>(context);
    }else{
       moduleInfo = Provider.of<MModuleBar>(context);
    }

    return Container(
      child: ListView.builder(
      itemCount: widget.dataBusiness.length,
      itemBuilder: (context, position) {
        var numModule = widget.dataBusiness[position].numModel;
        return InkWell(
          onTap: (){

            if(widget.section == Section.BUSINESS){
              moduleInfo.indexPage = 1;
              moduleInfo.indexMenu = 1;
              moduleInfo.businessSelected = widget.dataBusiness[position];
            }else{
              moduleInfo.indexPage = 1;
              moduleInfo.indexMenu = 1;
            }
          },
                  child: Container(
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
                          Text(widget.dataBusiness[position].name,
                              style: TextStyle(fontSize: 30)),
                          SizedBox(height: 20),
                          Text("$numModule MODULOS",
                              style: TextStyle(fontSize: 15))
                        ]),
                  ),
                  Icon(Icons.arrow_right)
                ],
              )),
        );
      },
    ),
    );
  }
}