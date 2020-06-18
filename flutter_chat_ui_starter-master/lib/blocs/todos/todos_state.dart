import 'package:equatable/equatable.dart';
import 'package:flutter_todos/models/request.dart';
import 'package:flutter_todos/models/models.dart';

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodosLoadInProgress extends TodosState {}

class TodosLoadSuccess extends TodosState {
  final List<Request> requests;

  const TodosLoadSuccess([this.requests = const []]);

  @override
  List<Object> get props => [requests];

  @override
  String toString() => 'TodosLoadSuccess { requests: $requests }';
}

class TodosLoadFailure extends TodosState {}
