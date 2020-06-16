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

class RecentChatLoading extends TodosState {

  final User user;

  const RecentChatLoading(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'ChatLoading { todo: ${user.name} }';
}

class RecentChatLoaded extends TodosState {

  final User user;

  const RecentChatLoaded(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'ChatLoading { todo: ${user.name} }';
}
