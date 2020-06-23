import 'dart:async';
import 'package:bethere_app/models/request.dart';
import 'package:bethere_app/service/storage/web_client.dart';
import 'package:bethere_app/config/net/base_api.dart';
import 'package:bethere_app/models/models.dart';

class RequestApiProvider {

  final WebClient webClient;

  const RequestApiProvider({
    this.webClient = const WebClient(),
  });

  /// Loads todos first from File storage. If they don't exist or encounter an
  /// error, it attempts to load the Request from a Web Client.

  Future<List<Request>> loadRequest(Request request) async {
    var response = await http.get('/request/list/',queryParameters: request.paramToJson());
     print(response);
    return response.data
        .map<Request>((item) => Request.fromJson(item))
        .toList();
//    try {
//      return await fileStorage.loadRequest();
//    } catch (e)
    /* {
      final todos = await webClient.fetchRequests(request);

//      fileStorage.saveRequest(todos);

      return todos;
    } */
  }

  Future<List<Request>> getRequestList(Request request) async {
    var response = await http.get('/request/list/',queryParameters: request.toJson());
    // print(response);
    return response.data
        .map<Request>((item) => Request.fromJson(item))
        .toList();

  }

  Future<List<RequestMessage>> getRequestMessageList(Request request) async {
    var response = await http.get('/request/message/list/',queryParameters: request.paramToJson());
     print(response);
    return response.data
        .map<RequestMessage>((item) => RequestMessage.fromJson(item))
        .toList();

//     {
//       final todos = await webClient.fetchRequestMessages(request);

// //      fileStorage.saveRequest(todos);

//       return todos;
//     }
  }

}
