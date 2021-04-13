import 'dart:convert';

import 'package:http/http.dart';
import 'package:nikutils/utils/http/nk_errormodel.dart';

/// Used to convert Nik Architecture response into Dart models.
NkResponse<T> nkResponseFromJson<T>(
        String body, T Function(String) dataFromJson) =>
    NkResponse<T>.fromJson(json.decode(body), dataFromJson);

class NkResponse<T> {
  NkResponse({this.success, this.quantity, this.data, this.errorData, this.id});

  T? data;
  bool? success;
  int? id;
  int? quantity;
  Object? exception;
  Response? httpResponse;
  List<ErrorData>? errorData;

  factory NkResponse.fromJson(
          Map<String, dynamic> json, T Function(String) fromJson) =>
      NkResponse(
        success: json["success"],
        quantity: json["quantity"],
        id: json["id"],
        data: json["data"] == null ? null : fromJson(jsonEncode(json["data"])),
        errorData: json["errorData"] == null
            ? null
            : List<ErrorData>.from(
                json["errorData"].map((x) => ErrorData.fromJson(x))),
      );

  Map<String, dynamic> toJson(Map<String, String> Function(T) toJson) => {
        "success": success,
        "quantity": quantity,
        "data": toJson,
        "id": id,
        "errorData": List<dynamic>.from(errorData!.map((x) => x.toJson())),
      };
}

class NkHttpResponse<T> {
  T? data;
  Object? exception;
  Response? httpResponse;
}
