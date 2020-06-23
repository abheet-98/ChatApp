import 'dart:convert';

import 'package:bethere_app/config/storage_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'api.dart';

final Http http = Http();

class Http extends BaseHttp {
  @override
  void init() {
    options.baseUrl = 'http://192.168.43.240:8004/api/v1';
//    options.baseUrl = 'https://qa.be-there.co/api/v1';
    interceptors..add(ApiInterceptor())
        /*// Cookie persistence asynchronous
      ..add(CookieManager(
          PersistCookieJar(dir: StorageManager.temporaryDirectory.path)))*/
        ;
  }
}

class ApiInterceptor extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) async {
    debugPrint('---api-request--->url--> ${options.baseUrl}${options.path}' +
        ' queryParameters: ${options.queryParameters}' +
        ' data: ${options.data}');
//    SharedPreferences prefs = await SharedPreferences.getInstance();

    var token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJ1c2VybmFtZSI6Imxrc2luZ2giLCJleHAiOjE2MDgzNTU3NTcsImVtYWlsIjoibGtzaW5naC5pbmRpYUBnbWFpbC5jb20ifQ.MabwVR2S4QroWsD5TlNP-IQFhA-Cy5nrQzPIMJF3jd0";//await StorageManager.getToken();
    if (token != null) {
      options.headers.addAll({"Authorization": "JWT $token"});
    }
    return options;
  }

  @override
  onResponse(Response response) {
    debugPrint('---api-response--->resp----->${response.data}');
    var res = response.data;
    ResponseData respData = ResponseData.fromJson(res);
    if (respData.success) {
      debugPrint("API Success");
      response.data = respData.data;
      return http.resolve(response);
    } else {

      if (respData.code == -1001) {
        debugPrint("API Failed res : $res and respData : $respData");
        // If the cookies expire, remove the local storage of login information
        // StorageManager.localStorage.deleteItem(UserModel.keyUser);
        throw UnAuthorizedException(data:respData); // Need to log in to
      } else {
        debugPrint("API Failed res : $res and respData : $respData");
        throw NotSuccessException.fromRespData(res);
      }
    }
  }

  @override
  onError(DioError dioError) {
//    print(dioError.response);
    if(dioError.response.statusCode == 403 || dioError.response.statusCode == 404){
      StorageManager.deleteTokenAndUser();
      ResponseData respData = ResponseData.fromJson({"status": dioError.response.statusCode, "message": dioError.response.statusMessage, "result": dioError.response.data});
      throw UnAuthorizedException(data:respData);
    }
    return super.onError(dioError);
  }
}

class ResponseData extends BaseResponseData {
  bool get success => 200 == code || 201 == code;
  ResponseData.fromJson(Map<String, dynamic> json) {
    code = json['status'];
    error = json.containsKey('message') ? json['message'] : json["error"];
    data = json['result'];
  }
}
