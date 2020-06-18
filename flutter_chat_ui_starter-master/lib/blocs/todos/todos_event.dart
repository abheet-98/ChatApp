import 'package:equatable/equatable.dart';
import 'package:flutter_todos/models/request.dart';
//import 'package:flutter_todos/models/models.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class TodosLoaded extends TodosEvent {
  final Request request;

  const TodosLoaded(this.request);

  @override
  List<Object> get props => [request];

  @override
  String toString() => 'TodosLoaded { request: $request }';
}

class TodoAdded extends TodosEvent {
  final User todo;

  const TodoAdded(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'TodoAdded { todo: $todo }';
}

class TodoUpdated extends TodosEvent {
  final User todo;

  const TodoUpdated(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'TodoUpdated { updatedTodo: $todo }';
}

class TodoDeleted extends TodosEvent {
  final User todo;

  const TodoDeleted(this.todo);

  @override
  List<Object> get props => [todo];

  @override
  String toString() => 'TodoDeleted { todo: $todo }';
}

class ClearCompleted extends TodosEvent {}

class ToggleAll extends TodosEvent {}
