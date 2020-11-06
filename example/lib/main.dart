import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:nikutils/nikutils.dart';
import 'package:nikutils/widgets/nk_button.dart';
import 'package:nikutils/widgets/nk_flatbutton.dart';
import 'package:nikutils/widgets/nk_textfield.dart';
import 'package:nikutils/extensions/nke_string.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
