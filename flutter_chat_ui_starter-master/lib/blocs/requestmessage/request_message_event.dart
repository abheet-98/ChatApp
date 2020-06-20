import 'package:equatable/equatable.dart';
import 'package:bethere_app/models/request.dart';
//import 'package:bethere_app/models/models.dart';

abstract class RequestMessageEvent extends Equatable {
  const RequestMessageEvent();

  @override
  List<Object> get props => [];
}

class RequestMessageLoaded extends RequestMessageEvent {
  final Request request;

  const RequestMessageLoaded(this.request);

  @override
  List<Object> get props => [request];

  @override
  String toString() => 'RequestMessageLoaded { request: $request }';
}


/* class TodoAdded extends RequestMessageEvent {
  final User todo;

  const TodoAdded(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'TodoAdded { todo: $todo }';
}

class TodoUpdated extends RequestMessageEvent {
  final User todo;

  const TodoUpdated(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'TodoUpdated { updatedTodo: $todo }';
}

class TodoDeleted extends RequestMessageEvent {
  final User todo;

  const TodoDeleted(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'TodoDeleted { todo: $todo }';
} 

class ClearCompleted extends RequestMessageEvent {}

class ToggleAll extends RequestMessageEvent {}
*/