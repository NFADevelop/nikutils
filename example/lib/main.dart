import 'package:flutter/material.dart';
import 'package:nikutils/utils/http/nk_http.dart';
import 'package:nikutils/utils/http/requestdata.dart';
import 'package:nikutils/utils/http/requesttype.dart';
import 'dart:async';

import 'package:nikutils/widgets/nk_button.dart';
import 'package:nikutils/widgets/nk_flatbutton.dart';
import 'package:nikutils/widgets/nk_textfield.dart';
import 'package:nikutils/extensions/nke_string.dart';
import 'package:nikutils/controls/nk_dialogs.dart';

import 'models/example.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp() {
    NkHttpService.initializeHttpInjection(baseUri: "YOUR API URI");
  }
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
  final NkHttpService service = Ioc().use<NkHttpService>('NkHttpService');

  void test() async {
    var requestData = RequestData<Data>(
        fromJson: exampleFromJson, fromJsonMethod: Data.fromJsonMethod);
    var postP = PostPrefs();
    postP.body = {
      "PROPERTYNAME1": "VALUE1",
      "PROPERTYNAME2": "VALUE2",
      "PROPERTYNAME3": "VALUE2",
    };
    requestData.headers = {
      "KE1": "VALUE1",
      "KE2": "VALUE2",
      "Authorization": "Bearer YOURTOKEN", // Example
    };
    requestData.route = "YOUR REQUEST ROUTE";
    requestData.type =
        RequestType.post; // request type: get, post, put and delete
    requestData.postPrefs = postP; //if your request is post the code uses that.
    requestData.apiUriProtocol = "httpprotoc://"; // default = https://
    var res = await service.requestNkBase<Data>(requestData);
  }

  @override
  Widget build(BuildContext context) {
    test();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exemplo NikUtils'),
      ),
      body: Form(
        key: _formKey,
        child: Center(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                  child: NkButton(
                    "NkButton",
                    onClick: () {},
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
                      if (string.isNullOrEmpty) return "Deve ter algo";
                      if (string.length < 3) return "Deve ser maior q 3";
                      return null;
                    },
                    background: (sets) {
                      return Stack(
                        children: [
                          Container(
                            width: sets.constSize.width,
                            height: sets.constSize.height,
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 1,
                              color: Colors.blueAccent,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.blueAccent)),
                            width: sets.dinamicSize.width,
                            height: sets.dinamicSize.height,
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
            ],
          ),
        ),
      ),
    );
  }
}
