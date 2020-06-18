import 'package:flutter_todos/models/request.dart';
import 'package:flutter_todos/config/net/base_api.dart';
import 'package:flutter_todos/models/models.dart';
import 'package:flutter_todos/service/provider/provider.dart';

class RequestRepository {
  final requestApiProvider = RequestApiProvider();

  Future<List<Request>> loadRequest(Request request) => requestApiProvider.loadRequest(request);

  Future<List<Request>> getRequestList(Request request) => requestApiProvider.getRequestList(request);

  Future<List<RequestMessage>> getRequestMessageList(Request request) => requestApiProvider.getRequestMessageList(request);


}
