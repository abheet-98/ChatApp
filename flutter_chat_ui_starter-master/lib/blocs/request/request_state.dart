import 'package:equatable/equatable.dart';
import 'package:bethere_app/models/request.dart';
import 'package:bethere_app/models/models.dart';

abstract class RequestState extends Equatable {
  const RequestState();

  @override
  List<Object> get props => [];
}

class RequestLoadInProgress extends RequestState {}

class RequestLoadSuccess extends RequestState {
  final List<Request> requests;

  const RequestLoadSuccess([this.requests = const []]);

  @override
  List<Object> get props => [requests];

  @override
  String toString() => 'RequestLoadSuccess { requests: $requests }';
}

class RequestLoadFailure extends RequestState {}
