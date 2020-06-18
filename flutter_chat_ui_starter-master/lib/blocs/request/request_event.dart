import 'package:equatable/equatable.dart';
import 'package:bethere_app/models/request.dart';
//import 'package:bethere_app/models/models.dart';

abstract class RequestEvent extends Equatable {
  const RequestEvent();

  @override
  List<Object> get props => [];
}

class RequestLoaded extends RequestEvent {
  final Request request;

  const RequestLoaded(this.request);

  @override
  List<Object> get props => [request];

  @override
  String toString() => 'RequestLoaded { request: $request }';
}

class TodoAdded extends RequestEvent {
  final User todo;

  const TodoAdded(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'TodoAdded { todo: $todo }';
}

class TodoUpdated extends RequestEvent {
  final User todo;

  const TodoUpdated(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'TodoUpdated { updatedTodo: $todo }';
}

class TodoDeleted extends RequestEvent {
  final User todo;

  const TodoDeleted(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'TodoDeleted { todo: $todo }';
}

class ClearCompleted extends RequestEvent {}

class ToggleAll extends RequestEvent {}
