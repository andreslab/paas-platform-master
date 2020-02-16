import 'package:flutter/material.dart';
import 'package:paas/model/business.dart';
import 'package:paas/providers/module_bar.dart';
import 'package:provider/provider.dart';
import '../api/business.dart';

class ModuleMainWidget extends StatefulWidget {
  @override
  _ModuleMainWidgetState createState() => _ModuleMainWidgetState();
}

class _ModuleMainWidgetState extends State<ModuleMainWidget> {
  final _businessAPI = BusinessAPI();
  //var businessCount = 0;
  List<BusinessModel> dataBusiness = List<BusinessModel>();

  _loadBusiness() async {
    //call request
    final res = await _businessAPI.getBusinessList(context);

    if (res != null) {
      print("OK");
      setState(() {
        //businessCount = res.length;
        dataBusiness = res;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    _loadBusiness();

    final moduleInfo = Provider.of<ModuleBar>(context);

    Widget listCompany = ListView.builder(
      itemCount: dataBusiness.length,
      itemBuilder: (context, position) {
        var numModule = dataBusiness[position].numModel;
        return Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Placeholder(
                  fallbackHeight: 40,
                  fallbackWidth: 40,
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(dataBusiness[position].name,
                            style: TextStyle(fontSize: 30)),
                        SizedBox(height: 20),
                        Text("$numModule MODULOS",
                            style: TextStyle(fontSize: 15))
                      ]),
                ),
                Icon(Icons.arrow_right)
              ],
            ));
      },
    );

    Widget listModuleByCompany = ListView.builder(
      itemCount: 5,
      itemBuilder: (context, position) {
        return Container(
            padding: EdgeInsets.all(20),
            child: Row(
              children: <Widget>[
                Checkbox(
                  value: true,
                  onChanged: (bool value) {
                    print("...");
                  },
                ),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("REGISTRO", style: TextStyle(fontSize: 20)),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Plantilla: Personlizada",
                            style: TextStyle(fontSize: 12)),
                      ]),
                ),
                Text("12/04/2019"),
              ],
            ));
      },
    );

    List<Widget> pages = [
      PageView(
        children: <Widget>[listCompany, listModuleByCompany],
      ),
      Container(
        child: Text("Pagina 1"),
      ),
      Container(
        child: Text("Pagina 2"),
      ),
    ];

    return Container(color: Colors.white, child: pages[moduleInfo.indexPage]);
  }
}
