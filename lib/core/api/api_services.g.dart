// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_services.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ApiServices implements ApiServices {
  _ApiServices(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://rickandmortyapi.com/api/';
    _configureDio(_dio);
  }

  final Dio _dio;

  String? baseUrl;

  void _configureDio(Dio _dio) {
    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
  }


  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }


  ///////////////////////////////////////////////////////////////////////////
  ////////////////////////  MyExample APIs  ////////////////////////////////////
  ///////////////////////////////////////////////////////////////////////////

  @override
  Future<GenericResponse<T>> addItem<T extends BaseEntity>(
      Map<String, dynamic> body,
      T Function(dynamic) fromJsonT,
      String endPoint) async {
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse>(Options(
      method: 'POST',
    ).compose(_dio.options, endPoint).copyWith(
            baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ),
            data: body)));
    final value = GenericResponse<T>.fromJson(_result.data!, fromJsonT);
    return value;
  }

  @override
  Future<GenericResponse<T>> getItem<T extends BaseEntity>(
      Map<String, dynamic> body,
      T Function(dynamic) fromJsonT,
      String endPoint) async {
    const _extra = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    ).compose(_dio.options, endPoint).copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = GenericResponse<T>.fromJson(_result.data!, fromJsonT);
    return value;
  }

  @override
  Future<ListResponse<T>> getList<T extends BaseEntity>(
      Map<String, dynamic> body,
      T Function(Map<String, dynamic>) fromJsonT,
      String endPoint) async {
    const _extra = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    ).compose(_dio.options, endPoint).copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ListResponse<T>.fromJson(_result.data!, fromJsonT);
    return value;
  }

  @override
  Future<GenericResponse<T>> updateItem<T extends BaseEntity>(
      Map<String, dynamic> body,
      T Function(dynamic) fromJsonT,
      String endPoint) async {
    const _extra = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse>(Options(
      method: 'PUT',
      headers: _headers,
      extra: _extra,
    ).compose(_dio.options, endPoint).copyWith(
            baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ),
            data: body)));
    final value = GenericResponse<T>.fromJson(_result.data!, fromJsonT);
    return value;
  }

  @override
  Future<GenericResponse<T>> deleteItem<T extends BaseEntity>(
      Map<String, dynamic> body,
      T Function(dynamic) fromJsonT,
      String endPoint) async {
    const _extra = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<GenericResponse>(Options(
      method: 'DELETE',
      headers: _headers,
      extra: _extra,
    ).compose(_dio.options, endPoint).copyWith(
            baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ),
            data: body)));
    final value = GenericResponse<T>.fromJson(_result.data!, fromJsonT);
    return value;
  }
}
