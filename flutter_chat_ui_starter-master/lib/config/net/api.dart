import 'dart:convert';
import 'package:dio/native_imp.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
// import 'package:flutter_todos/utils/platform_utils.dart';

// Must be the top function
_parseAndDecode(String response) {
  return jsonDecode(response);
}

parseJson(String text) {
  return compute(_parseAndDecode, text);
}

abstract class BaseHttp extends DioForNative {
  BaseHttp() {
    /// General handling initialization to join app
    (transformer as DefaultTransformer).jsonDecodeCallback = parseJson;

    /////The Release environment, inProduction to true
    // bool inProduction = bool.fromEnvironment("dart.vm.product");
    // if (!inProduction) {
    //   String proxy = "192.168.2.234:8888";
    //   (httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
    //       (HttpClient client) {
    //     client.findProxy = (uri) {
    //       //proxy all request to localhost:8888
    //       return "PROXY $proxy";
    //     };
    //     client.badCertificateCallback =
    //         (X509Certificate cert, String host, int port) => true;
    //   };
    // }
    interceptors..add(HeaderInterceptor());
    init();
  }

  void init();
}

/// Add common Header
class HeaderInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    options.connectTimeout = 1000 * 45;
    options.receiveTimeout = 1000 * 45;
    // options.contentType = 'application/x-www-form-urlencoded; charset=UTF-8';
    options.contentType = 'application/json; charset=UTF-8';

    //var appVersion = await PlatformUtils.getAppVersion();
    // var version = Map()
    //   ..addAll({
    //     'appVerison': appVersion,
    //   });
    //options.headers['version'] = version;
    // options.headers['X-Requested-With'] = 'XMLHttpRequest';
    //options.headers['platform'] = Platform.operatingSystem;
    return options;
  }
}

/// A subclass needs to be rewritten
abstract class BaseResponseData {
  int code = 0;
  String error;
  dynamic data;

  bool get success;

  BaseResponseData({this.code, this.error, this.data});

  @override
  String toString() {
    return 'BaseRespData{code: $code, message: $error, data: $data}';
  }
}

/// Interface code does not return to true anomaly
class NotSuccessException implements Exception {
  String error;
  NotSuccessException.fromRespData(BaseResponseData respData) {
    error = respData.error;
  }

  @override
  String toString() {
    return 'NotExpectedException{respData: $error}';
  }
}

/// For not login and access is not enough, need to jump authorization page
class UnAuthorizedException implements Exception {
  final data;
  UnAuthorizedException({this.data});

  @override
  String toString() => 'UnAuthorizedException';
}