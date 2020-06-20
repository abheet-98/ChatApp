import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:bethere_app/service/service.dart';
import 'package:meta/meta.dart';
import 'package:bethere_app/blocs/requestmessage/request_message.dart';
import 'package:bethere_app/models/models.dart';

class RequestMessageBloc extends Bloc<RequestMessageEvent, RequestMessageState> {
  final requestRepository = RequestRepository();

  RequestMessageBloc();

  @override
  RequestMessageState get initialState => RequestMessageLoadInProgress();

  @override
  Stream<RequestMessageState> mapEventToState(RequestMessageEvent event) async* {
    if (event is RequestMessageLoaded) {
      yield* _mapRequestLoadedToState(event);
    }
    
  }

  Stream<RequestMessageState> _mapRequestLoadedToState(event) async* {
    try {
      final requests = await this.requestRepository.getRequestMessageList(event.request);
      debugPrint(requests.toString()); 
      yield RequestMessageLoadSuccess(requests);
    } catch (error) {
      debugPrint(error.toString());
      yield RequestMessageLoadFailure();
    }
  }

  

}
