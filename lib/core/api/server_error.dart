import 'package:dio/dio.dart' hide Headers;
import 'package:flutter/foundation.dart';

import '../widgets/custom_toaster.dart';

class ServerError implements Exception {
  int? _errorCode;
  final String _errorMessage = "";

  ServerError.withError({error}) {
    _handleError(error);
  }

  getErrorCode() {
    return _errorCode;
  }

  getErrorMessage() {
    return _errorMessage;
  }

  _handleError(DioException error) {
    // showToster(error.message ?? "", isError: true);
    if (error.response == null) {
      if (kDebugMode) {
        print(error.message.toString());
      }
      return null;
    } else if (error.response!.statusCode == 400) {
      if (kDebugMode) {
        print(error.response!.data['message'].toString());
      }
      return CusFlutterToast.showToast(
          error.response!.data['message'].toString(),
          isError: true);
    } else if (error.response!.statusCode == 401) {
      if (kDebugMode) {
        print(error.response!.data['message'].toString());
      }
      return CusFlutterToast.showToast(
          error.response!.data['message'].toString(),
          isError: true);
    } else if (error.response!.statusCode == 404) {
      if (kDebugMode) {
        print(error.response!.data['message'].toString());
      }
      return CusFlutterToast.showToast(
          error.response!.data['message'].toString(),
          isError: true);
    } else if (error.response!.statusCode == 500) {
      if (kDebugMode) {
        print(error.response!.data['message'].toString());
      }
      return CusFlutterToast.showToast(
          error.response!.data['message'].toString(),
          isError: true);
    } else if (error.response!.data['errors']['old_password'] != null) {
      return CusFlutterToast.showToast(
          '${error.response!.data['errors']['old_password'][0]}',
          isError: true);
    } else if (error.response!.data['errors']['password'] != null) {
      return CusFlutterToast.showToast(
          '${error.response!.data['errors']['password'][0]}',
          isError: true);
    } else if (error.response!.data['errors']['phone_no'] != null) {
      return CusFlutterToast.showToast(
          '${error.response!.data['errors']['phone_no'][0]}',
          isError: true);
    } else if (error.response!.data['errors']['email'] != null) {
      return CusFlutterToast.showToast(
          '${error.response!.data['errors']['email'][0]}',
          isError: true);
    } else if (error.type == DioExceptionType.badResponse) {
      if (kDebugMode) {
        print(error.response!.data['message'].toString());
      }
      return CusFlutterToast.showToast(
          error.response!.data['message'].toString(),
          isError: true);
    } else if (error.type == DioExceptionType.unknown) {
      if (kDebugMode) {
        print(error.response!.data['message'].toString());
      }
      return CusFlutterToast.showToast(
          error.response!.data['message'].toString(),
          isError: true);
    } else if (error.type == DioExceptionType.cancel) {
      if (kDebugMode) {
        print(error.response!.data['message'].toString());
      }
      return CusFlutterToast.showToast('Request was cancelled', isError: true);
    } else if (error.type == DioExceptionType.connectionError) {
      if (kDebugMode) {
        print(error.response!.data['message'].toString());
      }
      return CusFlutterToast.showToast(
          'Connection failed. Please check internet connection',
          isError: true);
    } else if (error.type == DioExceptionType.connectionTimeout) {
      if (kDebugMode) {
        print(error.response!.data['message'].toString());
      }
      return CusFlutterToast.showToast('Connection timeout', isError: true);
    } else if (error.type == DioExceptionType.badCertificate) {
      if (kDebugMode) {
        print(error.response!.data['message'].toString());
      }
      return CusFlutterToast.showToast('${error.response!.data['message']}',
          isError: true);
    } else if (error.type == DioExceptionType.receiveTimeout) {
      if (kDebugMode) {
        print(error.response!.data['message'].toString());
      }
      return CusFlutterToast.showToast('Receive timeout in connection',
          isError: true);
    } else if (error.type == DioExceptionType.sendTimeout) {
      if (kDebugMode) {
        print(error.response!.data['message'].toString());
      }
      return CusFlutterToast.showToast('Receive timeout in send request',
          isError: true);
    }
    return _errorMessage;
  }
}
