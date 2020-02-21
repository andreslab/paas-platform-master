import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/utils/business_action_bar.dart';
import '../widgets/business_main.dart';
import '../api/business.dart';

class BusinessPage extends StatefulWidget {
  @override
  _BusinessPageState createState() => _BusinessPageState();
}

class _BusinessPageState extends State<BusinessPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          BusinessActionBarWidget(menu: 1,),
          Expanded(
            child: Container(
              child: BusinessMainWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
