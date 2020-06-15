import 'package:equatable/equatable.dart';
import 'package:flutter_chat_ui_starter/models/models.dart';

import '../../models/user_model.dart';

abstract class TodosState extends Equatable {
  const TodosState();

  @override
  List<Object> get props => [];
}

class TodosLoadInProgress extends TodosState {


}

class TodosLoadFailure extends TodosState {}

class TodosLoadSuccess extends TodosState {

  final User user;

  const TodosLoadSuccess(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'TodosLoadSuccess { todo: ${user.name} }';
}

class ChatLoading extends TodosState {

  final User user;

  const ChatLoading(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'ChatLoading { todo: ${user.name} }';
}

class ChatLoaded extends TodosState {

  final User user;

  const ChatLoaded(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'ChatLoading { todo: ${user.name} }';
}
