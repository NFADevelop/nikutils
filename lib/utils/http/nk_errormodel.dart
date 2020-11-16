import 'dart:convert';

ErrorData errorDataFromJson(String str) => ErrorData.fromJson(json.decode(str));

String errorDataToJson(ErrorData data) => json.encode(data.toJson());

class ErrorData {
  ErrorData({
    this.errorForUser,
    this.errorForDeveloper,
    this.invalidFields,
  });

  String errorForUser;
  String errorForDeveloper;
  List<InvalidField> invalidFields;

  factory ErrorData.fromJson(Map<String, dynamic> json) => ErrorData(
        errorForUser: json["errorForUser"],
        errorForDeveloper: json["errorForDeveloper"],
        invalidFields: List<InvalidField>.from(
            json["invalidFields"].map((x) => InvalidField.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "errorForUser": errorForUser,
        "errorForDeveloper": errorForDeveloper,
        "invalidFields":
            List<dynamic>.from(invalidFields.map((x) => x.toJson())),
      };
}

class InvalidField {
  InvalidField({
    this.field,
    this.description,
  });

  String field;
  String description;

  factory InvalidField.fromJson(Map<String, dynamic> json) => InvalidField(
        field: json["field"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "field": field,
        "description": description,
      };
}
