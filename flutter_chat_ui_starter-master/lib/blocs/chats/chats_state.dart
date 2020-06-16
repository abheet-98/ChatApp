import 'package:equatable/equatable.dart';
import 'package:flutter_chat_ui_starter/models/models.dart';

import '../../models/user_model.dart';

abstract class ChatsState extends Equatable {
  const ChatsState();

  @override
  List<Object> get props => [];
}

class ChatsLoadInProgress extends ChatsState {


}

class ChatsLoadFailure extends ChatsState {}

class ChatsLoadSuccess extends ChatsState {

  final User user;

  const ChatsLoadSuccess(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'TodosLoadSuccess { todo: ${user.name} }';
}

class ChatsLoading extends ChatsState {

  final User user;

  const ChatsLoading(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'ChatLoading { todo: ${user.name} }';
}

class ChatsLoaded extends ChatsState {

  final User user;

  const ChatsLoaded(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'ChatLoading { todo: ${user.name} }';
}
