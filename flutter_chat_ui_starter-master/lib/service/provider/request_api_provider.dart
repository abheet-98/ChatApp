import 'dart:async';
import 'package:flutter_todos/models/request.dart';
import 'package:flutter_todos/config/net/base_api.dart';
import 'package:flutter_todos/models/models.dart';

class RequestApiProvider {


  Future<List<Request>> getRequestList(Request request) async {
    var response = await http.get('/request/list/',queryParameters: request.toJson());
    // print(response);
    return response.data
        .map<Request>((item) => Request.fromJson(item))
        .toList();

  }

  Future<List<RequestMessage>> getRequestMessageList(Request request) async {
    var response = await http.get('/request/message/list/',queryParameters: request.toJson());
    // print(response);
    return response.data
        .map<Request>((item) => Request.fromJson(item))
        .toList();

  }

}
