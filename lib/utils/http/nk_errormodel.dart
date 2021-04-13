import 'dart:convert';

ErrorData errorDataFromJson(String str) => ErrorData.fromJson(json.decode(str));

String errorDataToJson(ErrorData data) => json.encode(data.toJson());

class ErrorData {
  ErrorData({
    this.errorForUser,
    this.errorForDeveloper,
    this.invalidFields,
  });

  /// Error for user property used in Nik Architecture.
  String? errorForUser;

  /// Error for developer property used in Nik Architecture.
  ///
  /// Most commonly used for debugging.
  String? errorForDeveloper;

  /// List of invalid properties.
  ///
  /// In architecture, it can return null.
  List<InvalidField>? invalidFields;

  /// Simple meethod that converts json [json] to data.
  factory ErrorData.fromJson(Map<String, dynamic> json) => ErrorData(
        errorForUser: json["errorForUser"],
        errorForDeveloper: json["errorForDeveloper"],
        invalidFields: List<InvalidField>.from(
            json["invalidFields"].map((x) => InvalidField.fromJson(x))),
      );

  /// Simple meethod that converts data [ErrorData] to Json.
  Map<String, dynamic> toJson() => {
        "errorForUser": errorForUser,
        "errorForDeveloper": errorForDeveloper,
        "invalidFields":
            List<dynamic>.from(invalidFields!.map((x) => x.toJson())),
      };
}

class InvalidField {
  InvalidField({
    this.field,
    this.description,
  });

  /// Invalid field used in Nik Architecture validation.
  String? field;

  /// Description of the field used in Nik Architecture validation.
  String? description;

  factory InvalidField.fromJson(Map<String, dynamic> json) => InvalidField(
        field: json["field"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "field": field,
        "description": description,
      };
}
