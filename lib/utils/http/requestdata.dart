import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nikutils/utils/http/requesttype.dart';

class RequestData<T> {
  RequestData(
      {@required this.fromJson,
      @required this.fromJsonMethod,
      this.contentType = "application/json",
      this.route,
      this.apiUriProtocol = "https://",
      this.body,
      this.postPrefs,
      this.headers,
      this.queryParams,
      this.type});
  String route;
  Map<String, String> queryParams;
  Map<String, String> headers;
  RequestType type;
  String apiUriProtocol;
  String contentType;
  T body;
  T Function(String) fromJson;
  T Function(Map<String, dynamic> json) fromJsonMethod;
  PostPrefs postPrefs;
}

class PostPrefs<T> {
  PostPrefs({this.body, this.encoding});
  T body;
  Encoding encoding;

  String bodyToJson() => jsonEncode(body);
}
