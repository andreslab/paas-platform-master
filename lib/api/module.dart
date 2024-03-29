import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:paas/model/module.dart';
import '../config.dart';
import 'package:http_parser/http_parser.dart';



class ModuleAPI {

  Future<List<ModuleModel>> getModuleList(BuildContext context) async {

    try {

      List<ModuleModel> data = new List();

      var uri = Uri.http(AppConfig.apiHost, "/api/modules");

      final http.Response response = await http.get(uri);
    
      //final responseString = response.body;

      print("GET MODULE LIST | CODE:${response.statusCode} | URL: " + uri.toString());

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

  Future<List<ModuleByBusinessModel>> getModuleListByBusiness(BuildContext context, int businessId) async {

    try {

      List<ModuleByBusinessModel> data = new List();

      var uri = Uri.http(AppConfig.apiHost, "/api/business/modules/$businessId");

      final http.Response response = await http.get(uri);
    
      //final responseString = response.body;

      print("GET MODULE LIST BUSINESS | CODE:${response.statusCode} | URL: " + uri.toString());

      final parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final module = parsed["data"] as List;
        print("response 200: ${response.body}");
        print("response 200: ${module.toString()}");
        
        //save module
        for(var i = 0; i < module.length; i++) {
            data.add(ModuleByBusinessModel(
              module[i]["id"], 
              module[i]["business_id"], 
              module[i]["module_id"], 
              module[i]["is_activate"], 
              module[i]["created"]));
        }

        print("casas: ${data.length}");
        
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

  Future<bool> setModuleByBusiness(BuildContext context, int moduleId, int businessId) async {

    try {

      var uri = Uri.http(AppConfig.apiHost, "/api/business/modules/0");

      Map<String, String> headers = {"Content-type": "application/json"};
      String json = '{"module_id":$moduleId,"business_id":$businessId}';

      final http.Response response = await http.post(uri, headers: headers, body: json);
    
      //final responseString = response.body;

      print("SET MODULE BY BUSINESS | CODE:${response.statusCode} | URL: " + uri.toString());

      final parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return true;
      }else if (response.statusCode == 500){
        //lanza excepcion
        throw PlatformException(code: "500", message: parsed["message"]);
      }

      throw PlatformException(code: "201", message: "Error setModuleByBusiness");

    } on PlatformException catch(e){
      print("Error ${e.code}:${e.message}");
      /* Dialogs.alert(context, title: "ERROR", message: e.message, onOk: (){

      }); */
      return false;
    }
  }

  Future<String> uploadDataModule(BuildContext context, NewModule newModule) async {

    try {

      var uri = Uri.http(AppConfig.apiHost, "/api/modules/upload/data");

      Map<String, String> headers = {"Content-type": "application/json"};
      String json = '{"name":${newModule.name},"description":${newModule.description},"status":${newModule.status}}';

      final http.Response response = await http.post(uri, headers: headers, body: json);
    
      //final responseString = response.body;

      print("GET MODULE LIST | CODE:${response.statusCode} | URL: " + uri.toString());

      final parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final htmlUpload = parsed["data"] as String;
        print("response 200: ${response.body}");
        print("response 200: ${htmlUpload.toString()}");
    
        return htmlUpload;
      }else if (response.statusCode == 500){
        //lanza excepcion
        throw PlatformException(code: "500", message: parsed["message"]);
      }

      throw PlatformException(code: "201", message: "Error getModuleList");

    } on PlatformException catch(e){
      print("Error ${e.code}:${e.message}");
      return null;
    }
  }

  Future<bool> uploadModule(List<int> _selectedFile, String nameFile) async {

    try {
      var uri = Uri.http(AppConfig.apiHost, "/api/modules/upload");
      //var url = Uri.parse("${AppConfig.apiHost}/api/modules/upload");
      
      var request = new http.MultipartRequest("POST", uri);

      request.files.add(http.MultipartFile.fromBytes('file', _selectedFile,
          contentType: new MediaType('application', 'octet-stream'),
          filename: "$nameFile.zip"));


      var statusCode = 500;

      await request.send().then((response) {
        print("test");
        print(response.statusCode);
        if (response.statusCode == 200) {
          statusCode = 200;
          print("Uploaded!");
        }
      });
      return statusCode == 200 ? true : false;
    }on PlatformException catch(e){
      print("Error ${e.code}:${e.message}");
      return null;
    }
    
  }
}