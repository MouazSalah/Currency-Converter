import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';
import 'package:contactcars_app_retail/db/api/failure.dart';
import 'package:contactcars_app_retail/db/api/aws_response.dart';
import 'package:contactcars_app_retail/db/api/url_provider.dart';
import 'package:contactcars_app_retail/db/api/base_response.dart';
import 'package:contactcars_app_retail/db/shared/shared_pref.dart';
import 'package:contactcars_app_retail/core/routes/app_router.dart';
import 'package:contactcars_app_retail/core/routes/app_routes.dart';
import 'package:contactcars_app_retail/core/routes/navigation.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioProvider {
  static final Dio dio = Dio(
    BaseOptions(
      sendTimeout: const Duration(seconds: 30),
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );

  static bool _isConfigured =
      false; // Static flag to check interceptor configuration

  static void configureDio() {
    if (!_isConfigured) {
      // Check if interceptors are already added
      dio.interceptors.add(InterceptorsWrapper(onRequest:
          (RequestOptions options, RequestInterceptorHandler handler) async {
        handler.next(options);
      }, onError: (DioException error, handler) {
        // Handle errors
        handler.next(error); // Continue with the error
      }));

      if (kDebugMode) {
        dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
        ));
      }

      _isConfigured = true; // Set flag to true after adding interceptors
    }
  }
}

extension DioExtensions on void {
  Future<Either<Failure, dynamic>> getApi(String url,
      {Map<String, dynamic>? queryParameters}) async {
    Dio dio = DioProvider.dio;
    DioProvider.configureDio();

    try {
      final response = await dio.get('${UrlProvider.config.apiBaseURL}$url',
          queryParameters: queryParameters);
      return _handleResponse(response);
    } on DioException catch (error) {
      return _handleDioError(error);
    } catch (error) {
      return Left(ServerFailure("$error"));
    }
  }

  Future<Either<Failure, dynamic>> postJsonApi(String url,
      {String? jsonObject}) async {
    Dio dio = DioProvider.dio;
    DioProvider.configureDio();

    try {
      final response = await dio.post('${UrlProvider.config.apiBaseURL}$url',
          data: jsonObject);
      return _handleResponse(response);
    } on DioException catch (error) {
      return _handleDioError(error);
    } catch (error) {
      return Left(ServerFailure("$error"));
    }
  }

  Future<Either<Failure, dynamic>> postApi(String url,
      {String? jsonObject, Map<String, dynamic>? queryParameters}) async {
    Dio dio = DioProvider.dio;
    DioProvider.configureDio();
    try {
      final response = await dio.post('${UrlProvider.config.apiBaseURL}$url',
          data: jsonObject ?? queryParameters);
      return _handleResponse(response);
    } on DioException catch (error) {
      return _handleDioError(error);
    } catch (error) {
      return Left(ServerFailure("$error"));
    }
  }

  Either<Failure, dynamic> _handleResponse(Response response) {
    if (response.statusCode == 200) {
      final responseData = response.data;
      if (responseData is Map<String, dynamic>) {
        final baseResponse = BaseResponse.fromJson(responseData);

        if (baseResponse.status == 1) {
          return Right(baseResponse.result);
        } else {
          return Left(ApiError(baseResponse.statusDescription));
        }
      }
      if (responseData is List<int>) {
        return Right(responseData);
      } else if (responseData is bool) {
        return Right(responseData);
      } else {
        return const Left(ParsingFailure('Invalid response format'));
      }
    } else {
      return Left(
          ApiFailure('Request failed with status: ${response.statusCode}'));
    }
  }

  Either<Failure, dynamic> _handleAWSResponse(Response response) {
    if (response.statusCode == 200) {
      final responseData = response.data;

      if (responseData is Map<String, dynamic>) {
        final baseResponse = AwsImageResponse.fromMap(responseData);

        if (baseResponse.status == 1) {
          return Right(baseResponse.Result);
        } else {
          return Left(ApiError(baseResponse.statusDescription.toString()));
        }
      }
      if (responseData is List<int>) {
        return Right(responseData);
      } else if (responseData is bool) {
        return Right(responseData);
      } else {
        return const Left(ParsingFailure('Invalid response format'));
      }
    } else {
      return Left(
          ApiFailure('Request failed with status: ${response.statusCode}'));
    }
  }

  Either<Failure, dynamic> _handleDioError(DioError error) {
    if (error.response != null) {
      return Left(ServerFailure(
          'Server responded with status code: ${error.response?.statusCode}, ${error.response?.statusMessage}'));
    } else {
      return Left(ConnectionFailure('Request failed: $error'));
    }
  }
}
