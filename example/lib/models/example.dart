import 'dart:convert';

Datas dataFromJson(String str) => Datas.fromJson(json.decode(str));

List<Datas> dataListFromJson(String str) =>
    List<Datas>.from(json.decode(str).map((x) => Datas.fromJson(x)));

String dataListToJson(List<Datas> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Datas {
  Datas({
    this.statusCode,
  });

  int statusCode;

  factory Datas.fromJson(Map<String, dynamic> json) => Datas(
        statusCode: json["statusCode"],
      );

  Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
      };
}
