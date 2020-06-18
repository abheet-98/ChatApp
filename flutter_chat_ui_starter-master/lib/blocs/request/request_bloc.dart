import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:bethere_app/service/service.dart';
import 'package:meta/meta.dart';
import 'package:bethere_app/blocs/request/request.dart';
import 'package:bethere_app/models/models.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  final requestRepository = RequestRepository();

  RequestBloc();

  @override
  RequestState get initialState => RequestLoadInProgress();

  @override
  Stream<RequestState> mapEventToState(RequestEvent event) async* {
    if (event is RequestLoaded) {
      yield* _mapRequestLoadedToState(event);
    }
  }

  Stream<RequestState> _mapRequestLoadedToState(event) async* {
    try {
      final requests = await this.requestRepository.loadRequest(event.request);
      debugPrint(requests.toString());
      yield RequestLoadSuccess(requests);
    } catch (error) {
      debugPrint(error.toString());
      yield RequestLoadFailure();
    }
  }

}
