import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:trust_task/core/errors/exceptions.dart';
import '../constants/api_constants.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        receiveTimeout: const Duration(seconds: 20),
        connectTimeout: const Duration(seconds: 20),
        sendTimeout: const Duration(seconds: 20),
        headers: {
          'Content-Type': ApiConstants.contentType,
          'Accept': ApiConstants.accept,
          // Applying the Basic Auth logic from your API details
          ApiConstants.authorizationHeader: ApiConstants.basicAuthCredentials,
        },
      ),
    );

    _addInterceptors();
  }

  void _addInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          if (kDebugMode) {
            print('🚀 REQUEST[${options.method}] => PATH: ${options.path}');
            print('Parameters: ${options.queryParameters}');
          }
          return handler.next(options);
        },
        onResponse: (response, handler) {
          if (kDebugMode) {
            print('✅ RESPONSE[${response.statusCode}] => DATA: ${response.data}');
          }
          return handler.next(response);
        },
        onError: (DioException e, handler) {
          if (kDebugMode) {
            print('❌ ERROR[${e.response?.statusCode}] => MESSAGE: ${e.message}');
          }
          // Convert DioException to your custom AppException
          final appException = _handleDioError(e);
          return handler.next(DioException(
            requestOptions: e.requestOptions,
            error: appException,
            response: e.response,
            type: e.type,
          ));
        },
      ),
    );
  }

  // GET Method
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      if (e.error is AppException) throw e.error as AppException;
      throw const UnknownException();
    }
  }

  // POST Method
  Future<Response> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      if (e.error is AppException) throw e.error as AppException;
      throw const UnknownException();
    }
  }

  // DELETE Method
  Future<Response> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      return await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioException catch (e) {
      if (e.error is AppException) throw e.error as AppException;
      throw const UnknownException();
    }
  }

  // Error handling logic to map Dio errors to your specific AppException classes
  AppException _handleDioError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return const ConnectionTimeoutException();
      
      case DioExceptionType.badResponse:
        final statusCode = error.response?.statusCode;
        if (statusCode == 401 || statusCode == 403) {
          return UnauthorizedException(statusCode: statusCode);
        }
        return ServerException(
          message: error.response?.data['message'] ?? 'Server Error',
          statusCode: statusCode,
        );
        
      case DioExceptionType.connectionError:
        return const NetworkException();
        
      default:
        return const UnknownException();
    }
  }
}