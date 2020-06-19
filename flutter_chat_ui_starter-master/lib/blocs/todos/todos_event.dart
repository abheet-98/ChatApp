import 'package:equatable/equatable.dart';
import 'package:flutter_todos/models/models.dart';

abstract class RequestEvent extends Equatable {
  const RequestEvent();

  @override
  List<Object> get props => [];
}

class TodosLoaded extends RequestEvent {}

class TodoAdded extends RequestEvent {
  final User user;

  const TodoAdded(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'TodoAdded { user: $user }';
}

class RequestMessageLoaded extends RequestEvent {
  final User user;

  const RequestMessageLoaded(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'RequestMessageLoaded { user: $user }';
}

class TodoUpdated extends RequestEvent {
  final User user;

  const TodoUpdated(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'TodoUpdated { updatedTodo: $user }';
}

class TodoDeleted extends RequestEvent {
  final User user;

  const TodoDeleted(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'TodoDeleted { user: $user }';
}

class ClearCompleted extends RequestEvent {}

class ToggleAll extends RequestEvent {}
