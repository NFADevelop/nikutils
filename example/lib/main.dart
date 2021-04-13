import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nikutils/nikutils.dart';
import 'package:nikutils/utils/http/nk_http.dart';
import 'package:nikutils/utils/http/requestdata.dart';
import 'package:nikutils/utils/http/requesttype.dart';
import 'package:nikutils/utils/nk_preferences.dart';
import 'dart:async';

import 'package:nikutils/widgets/nk_button.dart';
import 'package:nikutils/widgets/nk_flatbutton.dart';
import 'package:nikutils/widgets/nk_textfield.dart';
import 'package:nikutils/controls/nk_dialogs.dart';

import 'package:get/get.dart';

import 'models/example.dart';

void main() async {
  NkHttpService.initializeHttpService(baseUrl: "YOUR API URI");
  await NkPreferences.initializePrefsService();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Teste",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final NkHttpService service = Get.find();

  Future<Datas> httpExample() async {
    var requestData = RequestData<Datas>(fromJson: dataFromJson);
    var postP = PostPrefs();
    postP.body = {
      "PROPERTYNAME1": "VALUE1",
      "PROPERTYNAME2": "VALUE2",
      "PROPERTYNAME3": "VALUE2",
    };
    requestData.headers = {
      "KE1": "VALUE1",
      "KE2": "VALUE2",
      HttpHeaders.authorizationHeader: "Bearer YOURTOKEN", // Example
    };
    requestData.route = "YOUR REQUEST ROUTE";
    requestData.type =
        RequestType.post; // request type: get, post, put and delete
    requestData.contentType =
        "multipart/form-data"; // your request content type, default: "application/json"
    requestData.postPrefs =
        postP; // if your request is post the code uses that.
    requestData.apiUriProtocol = "wpp://"; // default = https://
    var res = await service.requestNkBase(requestData);
    return res.data;
  }

  Future<List<Datas>> listExample() async {
    var requestData = RequestData<List<Datas>>(
        fromJson: dataListFromJson); // you need o make a list mapper

    requestData.headers = {
      "KE1": "VALUE1",
      "KE2": "VALUE2",
      HttpHeaders.authorizationHeader: "Bearer YOURTOKEN", // Example
    };
    requestData.route = "YOUR REQUEST ROUTE";
    requestData.type =
        RequestType.get; // request type: get, post, put and delete
    requestData.contentType =
        "multipart/form-data"; // your request content type, default: "application/json"
    requestData.apiUriProtocol = "wpp://"; // default = https://
    var res = await service.requestNkBase(requestData);

    return res.data;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController val = TextEditingController();
    NkPreferences prefs = Get.find();
    var text = prefs.read("key1");
    var recordedText = "".obs;
    if (text != null) {
      recordedText.value = text;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo NikUtils'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: NkButton(
                      "NkButton",
                      onClick: () {},
                      // height: 100,
                      // width: 1000,
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(20)))),
                    )),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: NkFlatButton(
                      "NkFlatButton",
                      onClick: () {},
                    )),
                Container(
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child: NkTextField(
                      validationFunction: (string) {
                        if (string.isEmpty) return "Deve ter algo";
                        if (string.length < 3) return "Deve ser maior q 3";
                        return null;
                      },
                      customBgColor: Colors.purple,
                      background: (sets) {
                        return Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: sets.borderColor)),
                              width: sets.constSize.width,
                              height: sets.constSize.height,
                            ),
                          ],
                        );
                      },
                    )),
                Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child: NkButton(
                      "Show Error",
                      onClick: () {
                        if (_formKey.currentState.validate()) {}
                      },
                    )),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          "Dialogs",
                          style: TextStyle(fontSize: 20),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 5, top: 5),
                  child: NkButton(
                    "Show Loading",
                    onClick: () {
                      NkDialogs.showLoading(context);
                      Future.delayed(const Duration(seconds: 3), () {
                        NkDialogs.hideLoading(context);
                      });
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 5, top: 5),
                  child: NkButton(
                    "Show Widget Dialog",
                    onClick: () {
                      NkDialogs.showWidgetDialog(context,
                          child: Container(
                            child: Text("Test"),
                          ));
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 5, top: 5),
                  child: NkButton(
                    "Show Alert Dialog",
                    onClick: () {
                      NkDialogs.showAlertDialog(context,
                          prefs: NkAlertDialogPrefs("Title", "Message"));
                    },
                  ),
                ),
                NkTextField(
                  value: val,
                ),
                Container(
                  child: NkButton(
                    "Record Key",
                    onClick: () {
                      prefs.write("key1", val.text);
                      recordedText.value = val.text;
                    },
                  ),
                ),
                Obx(() => Text(recordedText.value))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
