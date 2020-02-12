import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:paas/model/module.dart';
import '../config.dart';
import '../model/business.dart';

class ModuleAPI {

  Future<List<ModuleModel>> getModuleList(BuildContext context) async {

    try {

      List<ModuleModel> data = new List();

      var uri = Uri.http(AppConfig.apiHost, "/api/module");

      final http.Response response = await http.get(uri);
    
      //final responseString = response.body;

      print("GET MODULE LIST | URL: " + uri.toString());

      final parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final module = parsed["data"] as List;
        print("response 200: ${response.body}");
        print("response 200: ${module.toString()}");
        
        //save module
        for(var i = 0; i < module.length; i++) {
            data.add(ModuleModel(
              module[i]["id"], 
              module[i]["name"], 
              module[i]["status"], 
              module[i]["last_update"], 
              module[i]["created"]));
        }
        
        return data;
      }else if (response.statusCode == 500){
        //lanza excepcion
        throw PlatformException(code: "500", message: parsed["message"]);
      }

      throw PlatformException(code: "201", message: "Error getModuleList");

    } on PlatformException catch(e){
      print("Error ${e.code}:${e.message}");
      /* Dialogs.alert(context, title: "ERROR", message: e.message, onOk: (){

      }); */
      return null;
    }
  }
}