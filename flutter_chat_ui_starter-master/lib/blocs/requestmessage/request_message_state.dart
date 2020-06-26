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

class RequestMessageDetailsOpened extends RequestMessageState {
  final RequestMessage requestMessage;

  const RequestMessageDetailsOpened(this.requestMessage);

  @override
  List<Object> get props => [requestMessage];

  @override
  String toString() => 'RequestMessageDetailsOpened { request: $requestMessage }';
}

class RequestMessageAccepted extends RequestMessageState {
  final RequestMessage requestMessage;

  const RequestMessageAccepted(this.requestMessage);

  @override
  List<Object> get props => [requestMessage];

  @override
  String toString() => 'RequestMessageAccepted { requests: $requestMessage }';
}

class RequestMessageRejected extends RequestMessageState {
  final RequestMessage requestMessage;

  const RequestMessageRejected(this.requestMessage);

  @override
  List<Object> get props => [requestMessage];

  @override
  String toString() => 'RequestMessageRejected { requests: $requestMessage }';
}

class RequestMessageLoadFailure extends RequestMessageState {}

