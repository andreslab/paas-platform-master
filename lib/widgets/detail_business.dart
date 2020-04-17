import 'package:flutter/material.dart';
import 'package:paas/model/business.dart';
import 'package:paas/providers/business/module_bar.dart';
import 'package:paas/providers/modules/module_bar.dart';
import 'package:provider/provider.dart';
import '../utils/utils.dart';

class DetailBusinessWidget extends StatefulWidget {
  @override
  _DetailBusinessWidgetState createState() => _DetailBusinessWidgetState();
}

class _DetailBusinessWidgetState extends State<DetailBusinessWidget> {
  @override
  Widget build(BuildContext context) {


    Widget item_module(String label, bool isActive) => Container(
          child: Row(
        children: <Widget>[
          Text(label),
          Checkbox(
            value: isActive,
            onChanged: (bool value) {
              /*setState(() {
                                isActiveModule = value;
                              });*/
              print("...");
            },
          )
        ],
      ));


    return  Container(
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Row(
          children: <Widget>[
            FadeInImage.assetNetwork(
                width: 300,
                height: 300,
                placeholder: "res/img/img_business.png",
                image: "https://img.icons8.com/dusk/2x/google-logo--v1.png"),
            /*Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("res/img/img_bg_ad_slide.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),*/
            Text(
              "Nombre de empresa",
              style: TextStyle(fontSize: 25),
            )
          ],
        ),
        Text(
          "Módulos",
          style: TextStyle(fontSize: 20),
        ),
        Wrap(
          spacing: 0.0, // gap between adjacent chips
          runSpacing: 0.0, // gap between lines
          children: <Widget>[
            item_module("modulo1", true),
            item_module("modulo2", true),
            item_module("modulo3", true),
            item_module("modulo4", false),
            item_module("modulo5", false),
            item_module("modulo6", true),
            item_module("modulo7", true),
            item_module("modulo8", false),
          ],
        ),
        /*Container(
          child: Expanded(
              child: GridView.builder(
                  itemCount: 5,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Modulo"),
                        Checkbox(
                          value: true,
                          onChanged: (bool value) {
                            /*setState(() {
                                isActiveModule = value;
                              });*/
                            print("...");
                          },
                        ),
                      ],
                    );
                  })))*/
      ]),
    );
  }
}