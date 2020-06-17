import 'package:equatable/equatable.dart';
import 'package:flutter_todos/models/models.dart';

import '../../models/user.dart';

abstract class ChatsState extends Equatable {
  const ChatsState();

  @override
  List<Object> get props => [];
}

class ChatsLoadInProgress extends ChatsState {

  const ChatsLoadInProgress();

  @override
  List<Object> get props => [];

  @override
  String toString() => 'ChatsLoadInProgress ';

}

class ChatsLoadFailure extends ChatsState {
  final User user;

  const ChatsLoadFailure(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'ChatsLoadFailure { chats: ${user.name} }';

}

class ChatsLoadSuccess extends ChatsState {

  final User user;

  const ChatsLoadSuccess(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'ChatsLoadSuccess { chats: ${user.name} }';
}



