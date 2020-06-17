import 'package:equatable/equatable.dart';
import 'package:flutter_todos/models/models.dart';

abstract class RequestState extends Equatable {
  const RequestState();

  @override
  List<Object> get props => [];
}

class FilteredTodosLoadInProgress extends RequestState {}

class FilteredTodosLoadSuccess extends RequestState {
  final List<User> filteredTodos;
  final VisibilityFilter activeFilter;

  const FilteredTodosLoadSuccess(
    this.filteredTodos,
    this.activeFilter,
  );

  @override
  List<Object> get props => [filteredTodos, activeFilter];

  @override
  String toString() {
    return 'FilteredTodosLoadSuccess { filteredTodos: $filteredTodos, activeFilter: $activeFilter }';
  }
}
