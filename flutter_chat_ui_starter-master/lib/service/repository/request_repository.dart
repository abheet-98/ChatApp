import 'package:bethere_app/models/request.dart';
import 'package:bethere_app/config/net/base_api.dart';
import 'package:bethere_app/models/models.dart';
import 'package:bethere_app/service/provider/provider.dart';

class RequestRepository {
  final requestApiProvider = RequestApiProvider();

  Future<List<Request>> loadRequest(Request request) => requestApiProvider.loadRequest(request);

  Future<List<Request>> getRequestList(Request request) => requestApiProvider.getRequestList(request);

  Future<List<RequestMessage>> getRequestMessageList(Request request) => requestApiProvider.getRequestMessageList(request);


}
