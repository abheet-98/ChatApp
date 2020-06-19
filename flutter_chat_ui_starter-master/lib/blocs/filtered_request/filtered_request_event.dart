import 'package:equatable/equatable.dart';
import 'package:flutter_todos/models/models.dart';

abstract class FilteredRequestEvent extends Equatable {
  const FilteredRequestEvent();
}

class FilterUpdated extends FilteredRequestEvent {
  final VisibilityFilter filter;

  const FilterUpdated(this.filter);

  @override
  List<Object> get props => [filter];

  @override
  String toString() => 'FilterUpdated { filter: $filter }';
}

class TodosUpdated extends FilteredRequestEvent {
  final List<User> todos;

  const TodosUpdated(this.todos);

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'TodosUpdated { todos: $todos }';
}

class FilteredRequestMessageLoaded extends FilteredRequestEvent {
  final User user;

  const FilteredRequestMessageLoaded(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'FilteredRequestMessageLoaded { user: $user }';
}
