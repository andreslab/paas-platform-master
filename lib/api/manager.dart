import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:paas/model/manager.dart';
import '../config.dart';
import '../model/business.dart';

class ManagerAPI {

  Future<List<ManagerModel>> getManagerByBusiness(BuildContext context) async {

    try {

      List<ManagerModel> data = new List();

      var uri = Uri.http(AppConfig.apiHost, "/api/business/manager");

      final http.Response response = await http.get(uri);
    
      //final responseString = response.body;

      print("GET MANAGER LIST | URL: " + uri.toString());

      final parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final manager = parsed["data"] as List;
        print("response 200: ${response.body}");
        print("response 200: ${manager.toString()}");
        
        //save manager
        for(var i = 0; i < manager.length; i++) {
            data.add(ManagerModel(
              manager[i]["id"], 
              manager[i]["name"], 
              manager[i]["last_name"], 
              manager[i]["phone"], 
              manager[i]["email"],
              manager[i]["created"]));
        }
        
        return data;
      }else if (response.statusCode == 500){
        //lanza excepcion
        throw PlatformException(code: "500", message: parsed["message"]);
      }

      throw PlatformException(code: "201", message: "Error getManager");

    } on PlatformException catch(e){
      print("Error ${e.code}:${e.message}");
      /* Dialogs.alert(context, title: "ERROR", message: e.message, onOk: (){

      }); */
      return null;
    }
  }
}