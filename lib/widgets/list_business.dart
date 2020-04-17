import 'package:flutter/material.dart';
import 'package:paas/model/business.dart';
import 'package:paas/providers/business/business_bar.dart';
import 'package:paas/providers/business/module_bar.dart';
import 'package:provider/provider.dart';
import '../utils/utils.dart';

class ListBusinessWidget extends StatefulWidget {

  List<BusinessModel> dataBusiness;
  SECTION section;

  ListBusinessWidget(this.dataBusiness, this.section);

  @override
  _ListBusinessWidgetState createState() => _ListBusinessWidgetState();
}

class _ListBusinessWidgetState extends State<ListBusinessWidget> {
  @override
  Widget build(BuildContext context) {

    var moduleInfo = Provider.of<BModuleBar>(context);

    return Container(
      child: ListView.builder(
      itemCount: widget.dataBusiness.length,
      itemBuilder: (context, position) {
        var numModule = widget.dataBusiness[position].numModel;
        return InkWell(
          onTap: (){
            moduleInfo.indexPage = NAVIGATOR_BUSINESS_MODULE.PAGE_LIST_BUSINESS_MODULES;
            moduleInfo.indexMenu = 1;
            moduleInfo.businessSelected = widget.dataBusiness[position];
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