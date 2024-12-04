import 'base_entity_enforce.dart';

class GenericResponse<T extends BaseEntity> {
  int statusCode;
  bool success;
  String message;
  T? data;

  GenericResponse({
    this.statusCode = 0,
    this.success = false,
    this.message = "",
    this.data,
  });

  factory GenericResponse.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) fromJsonT,
  ) {
    return GenericResponse<T>(
      statusCode: json['status_code'],
      success: json['status_code'] == 200,
      message: json['message'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
    );
  }
}
