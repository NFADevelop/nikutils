import 'dart:convert';
import 'package:nikutils/utils/http/requesttype.dart';

/// Used in requests.
class RequestData<T> {
  RequestData(
      {required this.fromJson,
      this.contentType = "application/json",
      this.route,
      this.apiUriProtocol = "https://",
      this.body,
      this.postPrefs,
      this.headers,
      this.queryParams,
      this.type});
  String? route;
  Map<String, String>? queryParams;
  Map<String, String>? headers;
  RequestType? type;
  String apiUriProtocol;
  String contentType;
  Map<String, dynamic>? body;
  T Function(String) fromJson;
  PostPrefs? postPrefs;
}

class PostPrefs {
  PostPrefs({this.body, this.encoding});
  Map<String, dynamic>? body;
  Encoding? encoding;

  String bodyToJson() => jsonEncode(body);
}
