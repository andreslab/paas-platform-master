import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:paas/widgets/action_bar/business/business_action_bar.dart';
import 'business_navigator.dart';

class BBusinessPage extends StatefulWidget {
  @override
  _BBusinessPageState createState() => _BBusinessPageState();
}

class _BBusinessPageState extends State<BBusinessPage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          BusinessActionBarWidget(menu: 1,),
          Expanded(
            child: Container(
              child: BBsuinessNavigatorWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
