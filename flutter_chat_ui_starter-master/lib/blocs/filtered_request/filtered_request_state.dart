import 'package:equatable/equatable.dart';
import 'package:flutter_todos/models/message_entity.dart';
import 'package:flutter_todos/models/models.dart';

abstract class FilteredRequestState extends Equatable {
  const FilteredRequestState();

  @override
  List<Object> get props => [];
}

class FilteredTodosLoadInProgress extends FilteredRequestState {}

class FilteredTodosLoadSuccess extends FilteredRequestState {
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

class FilteredRequestMessageLoad extends FilteredRequestState {
  final User user;
  final List<MessageEntity> messageEntity;

  const FilteredRequestMessageLoad(this.user,this.messageEntity);

  @override
  List<Object> get props => [user,messageEntity];

  @override
  String toString() => 'FilteredRequestMessageLoad { user: $user, messageEntity: $messageEntity }';
}