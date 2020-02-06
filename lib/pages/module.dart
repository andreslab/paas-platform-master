import 'package:flutter/material.dart';
import '../widgets/module_main.dart';
import '../widgets/utils/action_bar.dart';

class ModulePage extends StatefulWidget {
  @override
  _ModulePageState createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ActionBarWidget(),
        Expanded(
                  child: Container(
            child: ModuleMainWidget(),
          ),
        ),
      ],
    );
  }
}