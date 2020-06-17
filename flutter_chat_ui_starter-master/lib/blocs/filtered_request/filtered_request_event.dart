import 'package:equatable/equatable.dart';
import 'package:flutter_todos/models/models.dart';

abstract class RequestEvent extends Equatable {
  const RequestEvent();
}

class FilterUpdated extends RequestEvent {
  final VisibilityFilter filter;

  const FilterUpdated(this.filter);

  @override
  List<Object> get props => [filter];

  @override
  String toString() => 'FilterUpdated { filter: $filter }';
}

class TodosUpdated extends RequestEvent {
  final List<User> todos;

  const TodosUpdated(this.todos);

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'TodosUpdated { todos: $todos }';
}
