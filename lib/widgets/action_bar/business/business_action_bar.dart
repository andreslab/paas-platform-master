import 'package:flutter/material.dart';
import 'package:paas/providers/business/business_bar.dart';
import 'package:paas/widgets/action_bar/business/mixin/business_mixin.dart';
import 'package:paas/utils/utils.dart';
import 'package:provider/provider.dart';

class BusinessActionBarWidget extends StatefulWidget with EventBusinessBar {
  final int menu;
  BusinessActionBarWidget({this.menu});

  @override
  _BusinessActionBarWidgetState createState() => _BusinessActionBarWidgetState();
}

class _BusinessActionBarWidgetState extends State<BusinessActionBarWidget> {
  

  @override
  Widget build(BuildContext context) {
    final businessInfo = Provider.of<BBusinessBar>(context);


    TextEditingController textEditingController = TextEditingController();
    textEditingController.addListener(() {
      print(textEditingController.text);
    });

    Widget gridBusinessBar = Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RaisedButton(
              child: Text("Nuevo"),
              onPressed: () => print("nuevo")),
          Row(
            children: <Widget>[
              Container(
                width: 300,
                child: TextField(
                  onChanged: (input) => print(input),
                  controller: textEditingController,
                ),
              ),
              SizedBox(
                width: 20,
              ),
              RaisedButton(
                child: Icon(Icons.filter),
                onPressed: () => print("filtro"),
              )
            ],
          ),
        ],
      ),
    );

    Widget detailBusinessBar = Padding(
      padding: EdgeInsets.only(left: 20, right: 20),
      child: Row(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RaisedButton(
            child: Icon(Icons.arrow_back),
            onPressed: () => widget.goBusinessMain(businessInfo),
          ),
        ],
      ),
    );


    List<Widget> bars = <Widget>[gridBusinessBar, detailBusinessBar];

    return Container(height: 80, color: Colors.blue, child: bars[widget.menu]);
  }
}
