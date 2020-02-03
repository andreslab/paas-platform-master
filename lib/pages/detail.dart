import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isActiveModule = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(children: [
        Row(
          children: <Widget>[
            FadeInImage.assetNetwork(
              width: 300,
              height: 300,
              placeholder: "res/img/img_company.png", 
              image: "https://img.icons8.com/dusk/2x/google-logo--v1.png"),
            /*Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("res/img/img_bg_ad_slide.png"),
                  fit: BoxFit.fill,
                ),
              ),
            ),*/
            Text("Nombre de empresa", style: TextStyle(fontSize: 30),)
          ],
        ),
        Text("Módulos", style: TextStyle(fontSize: 30),),
        Container(
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
                            value: isActiveModule,
                            onChanged: (bool value) {
                              setState(() {
                                isActiveModule = value;
                              });
                            },
                          ),
                        ],
                      );
                    })))
      ]),
    ));
  }
}
