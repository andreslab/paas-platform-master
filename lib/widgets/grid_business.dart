import 'package:flutter/material.dart';
import 'package:paas/model/business.dart';
import 'package:paas/providers/business/module_bar.dart';
import 'package:paas/providers/modules/module_bar.dart';
import 'package:provider/provider.dart';
import 'package:paas/utils/utils.dart';
import 'package:paas/providers/business/business_bar.dart';

class GridBusinessWidget extends StatefulWidget {

  List<BusinessModel> dataBusiness;
  SECTION section;

  GridBusinessWidget(this.dataBusiness, this.section);

  @override
  _GridBusinessWidgetState createState() => _GridBusinessWidgetState();
}

class _GridBusinessWidgetState extends State<GridBusinessWidget> {
  @override
  Widget build(BuildContext context) {

    var moduleInfo = Provider.of<BBusinessBar>(context);

    return Container(
        child: GridView.builder(
        itemCount: widget.dataBusiness.length,
        gridDelegate:
            new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
        itemBuilder: (BuildContext context, int index) {
          var numModule = widget.dataBusiness[index].numModel;
          return new GestureDetector(
            child: new Card(
              elevation: 5.0,
              child: new Container(
                  alignment: Alignment.center,
                  child: Center(
                    child: Stack(children: [
                      Placeholder(
                        fallbackHeight: 50,
                        fallbackWidth: 50,
                      ),
                      Text('Item $index'),
                    ]),
                  )),
            ),
            onTap: () {
              /*showDialog(
                barrierDismissible: false,
                context: context,
                child: new CupertinoAlertDialog(
                  title: new Column(
                    children: <Widget>[
                      new Text("GridView"),
                      new Icon(
                        Icons.favorite,
                        color: Colors.green,
                      ),
                    ],
                  ),
                  content: new Text("Selected Item $index"),
                  actions: <Widget>[
                    new FlatButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: new Text("OK"))
                  ],
                ),
              );*/
              //Navigator.pushNamed(context, "detail");
              moduleInfo.indexPage = NAVIGATOR_BUSINESS_MAIN.PAGE_DETAIL_BUSINESS;
            },
          );
        }),
    );
  }
}