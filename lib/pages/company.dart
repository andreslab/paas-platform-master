import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../widgets/utils/action_bar.dart';
import '../widgets/company_main.dart';

class CompanyPage extends StatefulWidget {
  @override
  _CompanyPageState createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ActionBarWidget(),
          Expanded(
                  child: Container(
            child: CompanyMainWidget(),
          ),
        ),
          
        ],
      ),
    );
  }

  
}
