import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        child: Text("Compañias"),
        onPressed: () => Navigator.pushNamed(context, "company"),
      ),
    );
  }
}