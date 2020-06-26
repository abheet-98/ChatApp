import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:bethere_app/service/service.dart';
import 'package:meta/meta.dart';
import 'package:bethere_app/blocs/requestmessagedetails/request_message_details.dart';
import 'package:bethere_app/models/models.dart';

class RequestMessageDetailsBloc extends Bloc<RequestMessageDetailsEvent, RequestMessageDetailsState> {
  final requestRepository = RequestRepository();

  RequestMessageDetailsBloc();

  @override
  RequestMessageDetailsState get initialState => RequestMessageDetailsLoadInProgress();

  @override
  Stream<RequestMessageDetailsState> mapEventToState(RequestMessageDetailsEvent event) async* {
    if (event is RequestMessageDetailsLoaded) {
      yield* _mapRequestDetailsLoadedToState(event);
    }
  }

  Stream<RequestMessageDetailsState> _mapRequestDetailsLoadedToState(event) async* {
    try {
      final objectData = await this.requestRepository.getObjectData(event.requestMessage);
      debugPrint(objectData.toString()); 
      yield RequestMessageDetailsLoadSuccess(objectData);
    } catch (error) {
      debugPrint(error.toString());
      yield RequestMessageLoadFailure();
    }
  }

  // Stream<RequestMessageDetailsState> _mapRequestAcceptToState(event) async* {
  //   // try {
  //   //   final requests = await this.requestRepository.getRequestMessageList(event.request);
  //   //   debugPrint(requests.toString()); 
  //   //   yield RequestMessageLoadSuccess(requests);
  //   // } catch (error) {
  //   //   debugPrint(error.toString());
  //   //   yield RequestMessageLoadFailure();
  //   // }
  // }

  // Stream<RequestMessageDetailsState> _mapRequestRejectToState(event) async* {
  //   // try {
  //   //   final requests = await this.requestRepository.getRequestMessageList(event.request);
  //   //   debugPrint(requests.toString()); 
  //   //   yield RequestMessageLoadSuccess(requests);
  //   // } catch (error) {
  //   //   debugPrint(error.toString());
  //   //   yield RequestMessageLoadFailure();
  //   // }
  // }

  // Stream<RequestMessageDetailsState> _mapRequestDetailsOpenToState(event) async* {
  //   try {
  //     //final requests = await this.requestRepository.loadRequest(event.request);
  //     //debugPrint(requests.toString());
  //     yield RequestMessageDetailsOpened(event.request);
  //   } catch (error) {
  //     debugPrint(error.toString());
  //     yield RequestMessageLoadFailure();
  //   }
  // }


}
