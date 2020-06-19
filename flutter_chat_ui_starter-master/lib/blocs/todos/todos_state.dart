import 'package:equatable/equatable.dart';
import 'package:flutter_todos/models/message_entity.dart';
import 'package:flutter_todos/models/models.dart';

abstract class RequestState extends Equatable {
  const RequestState();

  @override
  List<Object> get props => [];
}

class TodosLoadInProgress extends RequestState {}

class TodosLoadSuccess extends RequestState {
  final List<User> todos;

  const TodosLoadSuccess([this.todos = const []]);

  @override
  List<Object> get props => [todos];

  @override
  String toString() => 'TodosLoadSuccess { todos: $todos }';
}

class RequestMessageLoad extends RequestState {
  final User user;
  final List<MessageEntity> messageEntity;

  const RequestMessageLoad(this.user,this.messageEntity);

  @override
  List<Object> get props => [user,messageEntity];

  @override
  String toString() => 'RequestMessageLoad { user: $user, messageEntity: $messageEntity }';
}


class TodosLoadFailure extends RequestState {}
