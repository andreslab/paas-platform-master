import 'package:flutter/material.dart';
import '../widgets/utils/action_bar.dart';

class TemplatePage extends StatefulWidget {
  @override
  _TemplatePageState createState() => _TemplatePageState();
}

class _TemplatePageState extends State<TemplatePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          ActionBarWidget(),
          Container()
        ]
      ),
    );
  }
}