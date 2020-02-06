import 'package:flutter/material.dart';
import 'home.dart';
import 'company.dart';
import 'module.dart';
import 'template.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool isCollapsed = false;
  double screenWidth, screenHeight;
  final Duration duration = Duration(milliseconds: 300);

  final screen = [HomePage(), CompanyPage(), ModulePage(), TemplatePage()];
  int indexPage = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenHeight = size.height;
    screenWidth = size.width;
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Stack(children: [menu(context), dashboard(context)]),
    );
  }

  Widget menu(context) {
    return Padding(
      padding: EdgeInsets.only(left: 16),
      child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              InkWell(
                  child: Text("Consola", style: TextStyle(fontSize: 22)),
                  onTap: () {
                    setState(() {
                      indexPage = 0;
                    });
                  }),
              InkWell(
                  child: Text("Empresas", style: TextStyle(fontSize: 22)),
                  onTap: () {
                    setState(() {
                      indexPage = 1;
                    });
                  }),
              InkWell(
                  child: Text("Modulos", style: TextStyle(fontSize: 22)),
                  onTap: () {
                    setState(() {
                      indexPage = 2;
                    });
                  }),
              InkWell(
                  child: Text("Plantillas", style: TextStyle(fontSize: 22)),
                  onTap: () {
                    setState(() {
                      indexPage = 3;
                    });
                  }),
            ],
          )),
    );
  }

  Widget dashboard(context) {
    return AnimatedPositioned(
        duration: duration,
        top: 0,
        bottom: 0,
        /*left: isCollapsed ? 50 : 0.6 * screenWidth,
        right: isCollapsed ? 0 : -0.2 * screenHeight,*/
        left: isCollapsed ? 50 : 250,
        right: 0,
        child: Container(
            color: Colors.white,
            child: Column(children: [
              Row(
                children: <Widget>[
                  InkWell(
                    child: Icon(Icons.menu, color: Colors.blue),
                    onTap: () {
                      setState(() {
                        isCollapsed = !isCollapsed;
                      });
                    },
                  ),
                  SizedBox(width: 20,),
                  Text("Dashboard",
                      style: TextStyle(fontSize: 24, color: Colors.blue)),
                  
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: Container(
                  child: screen[indexPage],
                ),
              )
            ])));
  }
}
