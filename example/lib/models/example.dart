import 'dart:convert';

Data exampleFromJson(String str) => Data.fromJson(json.decode(str));

class Data {
  Data({
    this.statusCode,
  });

  int statusCode;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        statusCode: json["statusCode"],
      );
  static Data fromJsonMethod(Map<String, dynamic> json) => Data(
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
      };
}
