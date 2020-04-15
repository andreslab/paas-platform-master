import 'package:flutter/material.dart';
import 'package:paas/model/business.dart';
import 'package:paas/model/module.dart';
import 'package:paas/providers/modules/module_bar.dart';
import 'package:paas/widgets/action_bar/modules/mixin/module_mixin.dart';
import 'package:provider/provider.dart';

class ModuleActionBarWidget extends StatefulWidget with EventModuleBar {
  final int menu;
  ModuleActionBarWidget({this.menu});

  @override
  _ModuleActionBarWidgetState createState() => _ModuleActionBarWidgetState();
}

class _ModuleActionBarWidgetState extends State<ModuleActionBarWidget> {
  @override
  Widget build(BuildContext context) {
    final moduleInfo = Provider.of<MModuleBar>(context);

    TextEditingController textEditingController = TextEditingController();
    textEditingController.addListener(() {
      print(textEditingController.text);
    });

    Widget moduleListGeneralBar = Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        children: <Widget>[
          RaisedButton(
              child: Text("Upload"),
              onPressed: () => widget.goModuleUpload(moduleInfo)),
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
            onPressed: () => widget.showFilterView(),
          )
        ],
      ),
    );

    Widget moduleUploadBar = Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RaisedButton(
            child: Icon(Icons.arrow_back),
            onPressed: () => widget.goModuleMain(moduleInfo),
          ),
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
                onPressed: () => print("FILTER"),
              ),
              SizedBox(
                width: 20,
              ),
              RaisedButton(
                child: Icon(Icons.close),
                onPressed: () => widget.goModuleMain(moduleInfo),
              )
        ],
      ),
    );

    List<Widget> bars = <Widget>[
      moduleListGeneralBar,
      moduleUploadBar,
    ];

    return Container(
        height: 80, color: Colors.blue, child: bars[moduleInfo.indexMenu]);
  }
}
