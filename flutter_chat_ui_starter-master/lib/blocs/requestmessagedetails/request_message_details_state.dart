import 'package:equatable/equatable.dart';
import 'package:bethere_app/models/request.dart';
import 'package:bethere_app/models/models.dart';

abstract class RequestMessageDetailsState extends Equatable {
  const RequestMessageDetailsState();

  @override
  List<Object> get props => [];
}

class RequestMessageDetailsLoadInProgress extends RequestMessageDetailsState {}

class RequestMessageDetailsLoadSuccess extends RequestMessageDetailsState {
  final ObjectData objectData;

  const RequestMessageDetailsLoadSuccess(this.objectData);

  @override
  List<Object> get props => [objectData];

  @override
  String toString() => 'RequestMessageDetailsLoadSuccess { objectData: $objectData }';
}


class RequestMessageLoadFailure extends RequestMessageDetailsState {}

