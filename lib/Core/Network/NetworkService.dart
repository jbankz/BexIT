import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../Config/AppEnvironment.dart';
import '../App/App.locator.dart';
import '../Manager/SessionManager.dart';
import 'ApiErrorHandler.dart';
import 'AppInterceptor.dart';

/// description: A network provider class which manages network connections
/// between the app and external services. This is a wrapper around [Dio].
///
/// Using this class automatically handle, token management, logging, global

enum RequestMethod { post, get, put, delete, upload }

@lazySingleton
class NetworkService {
  static const int connectTimeout = 30000;
  static const int receiveTimeout = 30000;
  Dio? dio;
  String? baseUrl;

  final session = locator<SessionManager>();

  NetworkService({this.baseUrl}) {
    _initialiseDio();
  }

  /// Initialize essential class properties
  void _initialiseDio() {
    dio = Dio(BaseOptions(
      connectTimeout: connectTimeout,
      receiveTimeout: receiveTimeout,
      baseUrl: baseUrl ?? AppEnvironment.apiUrl,
    ));
    // authToken ??= session.authToken;
    dio!.interceptors
      ..add(AppInterceptor(session.authToken))
      ..add(LogInterceptor(requestBody: true))
      ..add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          maxWidth: 90));
  }

  /// Factory constructor used mainly for injecting an instance of [Dio] mock
  NetworkService.test(this.dio);

  Future<Response> request({
    required String path,
    required RequestMethod method,
    Map<String, dynamic>? queryParams,
    data,
    FormData? formData,
    ResponseType responseType = ResponseType.json,
    Options? options,
    classTag = '',
  }) async {
    // _initialiseDio();
    Response response;
    var params = queryParams ?? {};
    if (params.keys.contains("searchTerm")) {
      params["searchTerm"] = Uri.encodeQueryComponent(params["searchTerm"]);
    }
    try {
      switch (method) {
        case RequestMethod.post:
          response = await dio!.post(path,
              queryParameters: params,
              data: data,
              options: options ?? await _getOption(token: session.authToken));
          break;
        case RequestMethod.get:
          response = await dio!.get(path,
              queryParameters: params,
              options: options ?? await _getOption(token: session.authToken));

          break;
        case RequestMethod.put:
          response = await dio!.put(path,
              queryParameters: params,
              data: data,
              options: options ?? await _getOption(token: session.authToken));
          break;
        case RequestMethod.delete:
          response = await dio!.delete(path,
              queryParameters: params,
              data: data,
              options: options ?? await _getOption(token: session.authToken));
          break;
        case RequestMethod.upload:
          response = await dio!.post(path,
              data: formData,
              queryParameters: params,
              options: options ??
                  await _getOption(token: session.authToken, upload: true),
              onSendProgress: (sent, total) {});
          break;
      }
      return response;
    } catch (error, stackTrace) {
      var apiError = ApiError.fromDio(error);
      if (apiError.errorType == 401) {
        // eventBus.fire(LogoutEvent("just log out out of here pls"));
      }
      return Future.error(apiError, stackTrace);
    }
  }

  Future<Options> _getOption(
      {required String token, bool upload = false}) async {
    return Options(headers: {
      "Authorization": "Bearer $token",
      'Accept': 'application/json',
      'x-channel': 'mobile',
      if (upload) "Content-Disposition": "form-data",
      if (upload) "Content-Type": "multipart/form-data",
    });
  }
}
