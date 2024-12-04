import 'dart:io';

import 'package:dio/io.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'api_constants.dart';
import 'base_models/base_entity_enforce.dart';
import 'base_models/generic_response.dart';
import 'base_models/list_response.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServices {
  factory ApiServices(Dio dio, {String? baseUrl}) = _ApiServices;

  ///////////////////////////////////////////////////////////////////////////
  ////////////////////////  MyExample APIs  ////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////
  @GET(ApiConstants.notification)
  Future<GenericResponse<T>> addItem<T extends BaseEntity>(
      @Body() Map<String, dynamic> body,
      T Function(dynamic) fromJsonT,
      String endPoint);

  @POST(ApiConstants.notification)
  Future<GenericResponse<T>> getItem<T extends BaseEntity>(
      @Body() Map<String, dynamic> body,
      T Function(dynamic) fromJsonT,
      String endPoint);

  @POST(ApiConstants.notification)
  Future<ListResponse<T>> getList<T extends BaseEntity>(
      @Body() Map<String, dynamic> body,
      T Function(Map<String, dynamic>) fromJsonT,
      String endPoint);

  @POST(ApiConstants.notification)
  Future<GenericResponse<T>> updateItem<T extends BaseEntity>(
      @Body() Map<String, dynamic> body,
      T Function(dynamic) fromJsonT,
      String endPoint);

  @POST(ApiConstants.notification)
  Future<GenericResponse<T>> deleteItem<T extends BaseEntity>(
      @Body() Map<String, dynamic> body,
      T Function(dynamic) fromJsonT,
      String endPoint);
}
