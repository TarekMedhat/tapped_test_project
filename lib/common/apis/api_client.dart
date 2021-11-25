import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:tapped_test_project/common/apis/api_type.dart';

class ApiException extends Equatable implements Exception {
  final String messageToBeShown;
  final String message;
  final RequestOptions requestOptions;
  final Response? response;
  final Map<String, dynamic>? responseMap;

  const ApiException({
    required this.messageToBeShown,
    required this.requestOptions,
    required this.response,
    required this.message,
    required this.responseMap,
  });

  @override
  List<Object?> get props => [
        requestOptions,
        response,
        message,
        messageToBeShown,
        responseMap,
      ];
}

class ApiClient {
  static ApiClient? _instance;
  static const int _connectTimeoutInMilliseconds = 60000;

  ApiClient._();

  factory ApiClient.instance() {
    return _instance ??= ApiClient._();
  }

  dynamic get({
    required ApiType apiType,
    Map<String, dynamic> queryParameters = const {},
  }) async {
    try {
      debugPrint("$apiType - Request - Query Parameters: $queryParameters");
      final Response response =
          await Dio(BaseOptions(connectTimeout: _connectTimeoutInMilliseconds)).get(
        apiType.url,
        queryParameters: queryParameters,
      );
      debugPrint("$apiType - Response - Data: ${response.data}");
      return response.data;
    } on DioError catch (e) {
      debugPrint("$apiType - Failure - Error: $e");
      debugPrint("$apiType - Failure - ResponseMap: ${e.response}");
      return _mapDioErrorToApiException(dioError: e);
    }
  }

  Future<Map<String, dynamic>> _mapDioErrorToApiException({required DioError dioError}) {
    Map<String, dynamic>? responseMap;
    late final String messageToBeShown;

    if (dioError.type == DioErrorType.connectTimeout ||
        (dioError.type == DioErrorType.other && dioError.response == null)) {
      messageToBeShown =
          'Connection to server failed due to internet connection error, Check your internet connection and try again';
    } else {
      final response = dioError.response;
      responseMap =
          response != null ? json.decode(response.data.toString()) as Map<String, dynamic>? : null;
      messageToBeShown = 'Something went wrong';
    }
    throw ApiException(
      message: dioError.message,
      messageToBeShown: messageToBeShown,
      requestOptions: dioError.requestOptions,
      response: dioError.response,
      responseMap: responseMap,
    );
  }
}
