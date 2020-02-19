import 'package:flutter/material.dart';
import 'package:paas/providers/business_bar.dart';
import 'package:paas/providers/home_bar.dart';
import 'package:paas/providers/module_bar.dart';
import 'package:paas/providers/template_bar.dart';
import 'package:provider/provider.dart';

class ActionBarWidget extends StatefulWidget {
  final int menu;
  ActionBarWidget({this.menu});

  @override
  _ActionBarWidgetState createState() => _ActionBarWidgetState();
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

class _ActionBarWidgetState extends State<ActionBarWidget> {

  List<Categories> categories = [
      Categories(0, "cat 1"),
      Categories(1, "cat 2"),
      Categories(2, "cat 3"),
      Categories(3, "cat 4"),
    ];
    List<RangeValue> rangeValues = [
      RangeValue(0, "0 - 10"),
      RangeValue(1, "10 - 20"),
      RangeValue(2, "20 - 30"),
      RangeValue(3, "30 - .."),
    ];
    List<RangeDate> rangeDates = [
      RangeDate(0, "last 3 days"),
      RangeDate(1, "last week"),
      RangeDate(2, "last 30 days"),
      RangeDate(3, "last 3 month"),
    ];

    String categoryHint = "Seleccione Categoria";
    String rangeValueHint = "Rango de valores";
    String rangeDateHint = "Rango de fecha";

    Categories dropDownCategory;
    RangeValue dropDownValue;
    RangeDate dropDownDate;

  @override
  Widget build(BuildContext context) {
    final homeInfo = Provider.of<HomeBar>(context);
    final businessInfo = Provider.of<BusinessBar>(context);
    final moduleInfo = Provider.of<ModuleBar>(context);
    final templateInfo = Provider.of<TemplateBar>(context);

    

    Widget homeBar = Row(
      children: <Widget>[
        SizedBox(
          width: 20,
        ),
        DropdownButton<Categories>(
            hint: Text(categoryHint),
            value: dropDownCategory,
            items: categories.map((Categories category) {
              return DropdownMenuItem<Categories>(
                  value: category, child: Text(category.name));
            }).toList(),
            onChanged: (Categories c) {
              setState(() {
                dropDownCategory = c;
                categoryHint = c.name;
              });
            }),
        SizedBox(
          width: 20,
        ),
        DropdownButton<RangeValue>(
            hint: Text(rangeValueHint),
            value: dropDownValue,
            items: rangeValues.map((RangeValue category) {
              return DropdownMenuItem<RangeValue>(
                  value: category, child: Text(category.name));
            }).toList(),
            onChanged: (RangeValue c) {
              setState(() {
                dropDownValue = c;
                rangeValueHint = c.name;
              });
            }),
        SizedBox(
          width: 20,
        ),
        DropdownButton<RangeDate>(
            hint: Text(rangeDateHint),
            value: dropDownDate,
            items: rangeDates.map((RangeDate category) {
              return DropdownMenuItem<RangeDate>(
                  value: category, child: Text(category.name));
            }).toList(),
            onChanged: (RangeDate c) {
              setState(() {
                dropDownDate = c;
                rangeDateHint = c.name;
              });
            }),
      ],
    );

    Widget businessBar = Row(
      children: <Widget>[
        FloatingActionButton(
            child: Icon(Icons.add), onPressed: () => businessInfo.indexPage = 2)
      ],
    );

    Widget moduleBar = Row(
      children: <Widget>[
        FloatingActionButton(
            child: Icon(Icons.place), onPressed: () => moduleInfo.indexPage = 2)
      ],
    );

    Widget templateBar = Row(
      children: <Widget>[
        FloatingActionButton(
            child: Icon(Icons.access_time),
            onPressed: () => templateInfo.indexPage = 2)
      ],
    );

    List<Widget> bars = <Widget>[homeBar, businessBar, moduleBar, templateBar];

    return Container(height: 80, color: Colors.blue, child: bars[widget.menu]);
  }
}
