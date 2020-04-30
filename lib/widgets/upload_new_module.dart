/*import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:file_picker/file_picker.dart';

class UploadNewModuleWidget extends StatefulWidget {
  @override
  _UploadNewModuleWidgetState createState() => new _UploadNewModuleWidgetState();
}

class _UploadNewModuleWidgetState extends State<UploadNewModuleWidget> {
  String _fileName;
  String _path;
  Map<String, String> _paths;
  String _extension;
  bool _loadingPath = false;
  bool _multiPick = false;
  FileType _pickingType;
  TextEditingController _controller = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() => _extension = _controller.text);
  }

  void _openFileExplorer() async {
    setState(() => _loadingPath = true);
    try {
      if (_multiPick) {
        _path = null;
        _paths = await FilePicker.getMultiFilePath(
            type: _pickingType,
            allowedExtensions: (_extension?.isNotEmpty ?? false)
                ? _extension?.replaceAll(' ', '')?.split(',')
                : null);
      } else {
        _paths = null;
        _path = await FilePicker.getFilePath(
            type: _pickingType,
            allowedExtensions: (_extension?.isNotEmpty ?? false)
                ? _extension?.replaceAll(' ', '')?.split(',')
                : null);
      }
    } on PlatformException catch (e) {
      print("Unsupported operation" + e.toString());
    }
    if (!mounted) return;
    setState(() {
      _loadingPath = false;
      _fileName = _path != null
          ? _path.split('/').last
          : _paths != null ? _paths.keys.toString() : '...';
    });
  }

  @override
  Widget build(BuildContext context) {
   return new Center(
            child: new Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: new SingleChildScrollView(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: new DropdownButton(
                      hint: new Text('LOAD PATH FROM'),
                      value: _pickingType,
                      items: <DropdownMenuItem>[
                        new DropdownMenuItem(
                          child: new Text('FROM AUDIO'),
                          value: FileType.audio,
                        ),
                        new DropdownMenuItem(
                          child: new Text('FROM IMAGE'),
                          value: FileType.image,
                        ),
                        new DropdownMenuItem(
                          child: new Text('FROM VIDEO'),
                          value: FileType.video,
                        ),
                        new DropdownMenuItem(
                          child: new Text('FROM ANY'),
                          value: FileType.any,
                        ),
                        new DropdownMenuItem(
                          child: new Text('CUSTOM FORMAT'),
                          value: FileType.custom,
                        ),
                      ],
                      onChanged: (value) => setState(() {
                            _pickingType = value;
                            if (_pickingType != FileType.custom) {
                              _controller.text = _extension = '';
                            }
                          })),
                ),
                new ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 100.0),
                  child: _pickingType == FileType.custom
                      ? new TextFormField(
                          maxLength: 15,
                          autovalidate: true,
                          controller: _controller,
                          decoration:
                              InputDecoration(labelText: 'File extension'),
                          keyboardType: TextInputType.text,
                          textCapitalization: TextCapitalization.none,
                        )
                      : new Container(),
                ),
                new ConstrainedBox(
                  constraints: BoxConstraints.tightFor(width: 200.0),
                  child: new SwitchListTile.adaptive(
                    title: new Text('Pick multiple files',
                        textAlign: TextAlign.right),
                    onChanged: (bool value) =>
                        setState(() => _multiPick = value),
                    value: _multiPick,
                  ),
                ),
                new Padding(
                  padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                  child: new RaisedButton(
                    onPressed: () => _openFileExplorer(),
                    child: new Text("Open file picker"),
                  ),
                ),
                new Builder(
                  builder: (BuildContext context) => _loadingPath
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: const CircularProgressIndicator())
                      : _path != null || _paths != null
                          ? new Container(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              height: MediaQuery.of(context).size.height * 0.50,
                              child: new Scrollbar(
                                  child: new ListView.separated(
                                itemCount: _paths != null && _paths.isNotEmpty
                                    ? _paths.length
                                    : 1,
                                itemBuilder: (BuildContext context, int index) {
                                  final bool isMultiPath =
                                      _paths != null && _paths.isNotEmpty;
                                  final String name = 'File $index: ' +
                                      (isMultiPath
                                          ? _paths.keys.toList()[index]
                                          : _fileName ?? '...');
                                  final path = isMultiPath
                                      ? _paths.values.toList()[index].toString()
                                      : _path;

                                  return new ListTile(
                                    title: new Text(
                                      name,
                                    ),
                                    subtitle: new Text(path),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, int index) =>
                                        new Divider(),
                              )),
                            )
                          : new Container(),
                ),
              ],
            ),
          ),
        )); 
    
    }
    }*/

import 'package:flutter/material.dart';

//import 'package:flutter/services.dart';
//import 'package:file_picker/file_picker.dart';

import 'dart:html' as html; //web-only
import 'dart:typed_data';
import 'dart:async';
import 'dart:convert';
import 'package:http_parser/http_parser.dart';

import 'package:http/http.dart' as http;

class UploadNewModuleWidget extends StatefulWidget {
  @override
  _UploadNewModuleWidgetState createState() =>
      new _UploadNewModuleWidgetState();
}

class _UploadNewModuleWidgetState extends State<UploadNewModuleWidget> {

  List<int> _selectedFile;
  Uint8List _bytesData;

  GlobalKey _formKey = new GlobalKey();

  startWebFilePicker() async {
    html.InputElement uploadInput = html.FileUploadInputElement();
    uploadInput.multiple = true;
    uploadInput.draggable = true;
    uploadInput.click();

    uploadInput.onChange.listen((e) {
      final files = uploadInput.files;
      final file = files[0];
      final reader = new html.FileReader();

      reader.onLoadEnd.listen((e) {
        _handleResult(reader.result);
      });
      reader.readAsDataUrl(file);
    });
  }

  void _handleResult(Object result) {
    setState(() {
      _bytesData = Base64Decoder().convert(result.toString().split(",").last);
      _selectedFile = _bytesData;
    });
  }

  Future makeRequest() async {
    var url = Uri.parse("http://localhost:5000/api/modules/upload");
    var request = new http.MultipartRequest("POST", url);

    request.files.add(await http.MultipartFile.fromBytes('file', _selectedFile,
        contentType: new MediaType('application', 'octet-stream'),
        filename: "filetest.zip"));

    request.send().then((response) {
      print("test");
      print(response.statusCode);
      if (response.statusCode == 200) print("Uploaded!");
    });

    /*showDialog(
        barrierDismissible: false,
        context: context,
        child: new AlertDialog(
          title: new Text("Details"),
          //content: new Text("Hello World"),
          content: new SingleChildScrollView(
            child: new ListBody(
              children: <Widget>[
                new Text("Upload successfull"),
              ],
            ),
          ),
          actions: <Widget>[
            new FlatButton(
              child: new Text('Aceptar'),
              onPressed: () {
                
              },
            ),
          ],
        ));*/
  }

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      child: new SingleChildScrollView(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Form(
              autovalidate: true,
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(top: 16.0, left: 28),
                child: new Container(
                    width: 350,
                    child: Column(children: <Widget>[
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            MaterialButton(
                              color: Colors.pink,
                              elevation: 8,
                              highlightElevation: 2,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              textColor: Colors.white,
                              child: Text('Select a file'),
                              onPressed: () {
                                startWebFilePicker();
                              },
                            ),
                            Divider(
                              color: Colors.teal,
                            ),
                            RaisedButton(
                              color: Colors.purple,
                              elevation: 8.0,
                              textColor: Colors.white,
                              onPressed: () {
                                makeRequest();
                              },
                              child: Text('Send file to server'),
                            ),
                          ])
                    ])),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
