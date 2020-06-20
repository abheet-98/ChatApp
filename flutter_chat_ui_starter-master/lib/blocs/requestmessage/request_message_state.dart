import 'package:equatable/equatable.dart';
import 'package:bethere_app/models/request.dart';
import 'package:bethere_app/models/models.dart';

abstract class RequestMessageState extends Equatable {
  const RequestMessageState();

  @override
  List<Object> get props => [];
}

class RequestMessageLoadInProgress extends RequestMessageState {}

class RequestMessageLoadSuccess extends RequestMessageState {
  final List<RequestMessage> requestmessages;

  const RequestMessageLoadSuccess(this.requestmessages);

  @override
  List<Object> get props => [requestmessages];

  @override
  String toString() => 'RequestMessageLoadSuccess { requests: $requestmessages }';
}

class RequestMessageLoadFailure extends RequestMessageState {}

