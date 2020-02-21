import 'package:flutter/material.dart';
import 'package:paas/model/business.dart';
import 'package:paas/providers/module_bar.dart';
import 'package:provider/provider.dart';

class ModuleBusinessListWidget extends StatefulWidget {

  List<BusinessModel> dataBusiness;

  ModuleBusinessListWidget(this.dataBusiness);

  @override
  _ModuleBusinessListWidgetState createState() => _ModuleBusinessListWidgetState();
}

class _ModuleBusinessListWidgetState extends State<ModuleBusinessListWidget> {
  @override
  Widget build(BuildContext context) {

    final moduleInfo = Provider.of<ModuleBar>(context);

    return Container(
      child: ListView.builder(
      itemCount: widget.dataBusiness.length,
      itemBuilder: (context, position) {
        var numModule = widget.dataBusiness[position].numModel;
        return InkWell(
          onTap: (){
            moduleInfo.indexPage = 1;
            moduleInfo.indexMenu = 1;
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