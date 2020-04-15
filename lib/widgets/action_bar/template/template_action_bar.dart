import 'package:flutter/material.dart';
import 'package:paas/providers/template/template_bar.dart';
import 'package:provider/provider.dart';

class TemplateActionBarWidget extends StatefulWidget {
  final int menu;
  TemplateActionBarWidget({this.menu});

  @override
  _TemplateActionBarWidgetState createState() => _TemplateActionBarWidgetState();
}

class Categories {
  int id;
  String name;
  Categories(this.id, this.name);
}

class RangeValue {
  int id;
  String name;
  RangeValue(this.id, this.name);
}

class RangeDate {
  int id;
  String name;
  RangeDate(this.id, this.name);
}

class _TemplateActionBarWidgetState extends State<TemplateActionBarWidget> {

  @override
  Widget build(BuildContext context) {

    TextEditingController textEditingController = TextEditingController();
    textEditingController.addListener(() {
      print(textEditingController.text);
    });

    Widget templateBar = Row(
      children: <Widget>[
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
                child: Icon(Icons.filter),
                onPressed: () => print("filtro"),
              )
      ],
    );

    List<Widget> bars = <Widget>[templateBar];

    return Container(height: 80, color: Colors.blue, child: bars[widget.menu]);
  }
}
