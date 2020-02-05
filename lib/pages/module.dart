import 'package:flutter/material.dart';
import '../modules/register/register.dart';

class ModulePage extends StatefulWidget {
  @override
  _ModulePageState createState() => _ModulePageState();
}

class _ModulePageState extends State<ModulePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RegisterModule(),
    );
  }
}