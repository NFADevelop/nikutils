import 'dart:convert';

Data dataFromJson(String str) => Data.fromJson(json.decode(str));

List<Data> dataListFromJson(String str) =>
    List<Data>.from(json.decode(str).map((x) => Data.fromJson(x)));

String dataListToJson(List<Data> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Data {
  Data({
    this.statusCode,
  });

  int statusCode;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
      };
}
