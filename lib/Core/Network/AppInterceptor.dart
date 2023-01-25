import 'package:dio/dio.dart';

import '../App/App.locator.dart';
import '../Manager/SessionManager.dart';

/// [Interceptor] extension for setting token header
/// and other required properties for all requests
class AppInterceptor extends Interceptor {
  String authToken;
  AppInterceptor(this.authToken);

  final session = locator<SessionManager>();

  /// sets the auth token and Apptoken
  /// Apptoken is an identify for each app
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (authToken.isNotEmpty) {
      options.headers.addAll({"Authorization": "Bearer ${session.authToken}"});
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (response.statusCode! >= 200 && response.statusCode! < 400) {
      response.statusCode = 200;
    } else if (response.statusCode == 401) {
      // eventBus.fire(LogoutEvent(""));
    }
    return super.onResponse(response, handler);
  }
}
