import 'dart:async';
import 'package:flutter_todos/models/request.dart';
import 'package:flutter_todos/service/storage/web_client.dart';
import 'package:flutter_todos/config/net/base_api.dart';
import 'package:flutter_todos/models/models.dart';

class RequestApiProvider {

  final WebClient webClient;

  const RequestApiProvider({
    this.webClient = const WebClient(),
  });

  /// Loads todos first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the Todos from a Web Client.

  Future<List<Request>> loadRequest(Request request) async {
//    try {
//      return await fileStorage.loadTodos();
//    } catch (e)
    {
      final todos = await webClient.fetchRequests(request);

//      fileStorage.saveTodos(todos);

      return todos;
    }
  }

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
