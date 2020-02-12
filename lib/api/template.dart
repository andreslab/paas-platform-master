import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:paas/model/template.dart';
import '../config.dart';
import '../model/business.dart';

class TemplateAPI {

  Future<List<TemplateModel>> getTemplateList(BuildContext context) async {

    try {

      List<TemplateModel> data = new List();

      var uri = Uri.http(AppConfig.apiHost, "/api/template");

      final http.Response response = await http.get(uri);
    
      //final responseString = response.body;

      print("GET TEMPLATE LIST | URL: " + uri.toString());

      final parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final template = parsed["data"] as List;
        print("response 200: ${response.body}");
        print("response 200: ${template.toString()}");
        
        //save template
        for(var i = 0; i < template.length; i++) {
            data.add(TemplateModel(
              template[i]["id"], 
              template[i]["name"], 
              template[i]["status"], 
              template[i]["last_update"], 
              template[i]["created"]));
        }
        
        return data;
      }else if (response.statusCode == 500){
        //lanza excepcion
        throw PlatformException(code: "500", message: parsed["message"]);
      }

      throw PlatformException(code: "201", message: "Error getTemplateList");

    } on PlatformException catch(e){
      print("Error ${e.code}:${e.message}");
      /* Dialogs.alert(context, title: "ERROR", message: e.message, onOk: (){

      }); */
      return null;
    }
  }
}