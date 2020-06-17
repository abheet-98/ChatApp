import 'package:equatable/equatable.dart';
import 'package:flutter_todos/models/models.dart';

import '../../models/user.dart';

abstract class ChatsEvent extends Equatable {
  const ChatsEvent();

  @override
  List<Object> get props => [];
}

class ChatsLoadedEvent extends ChatsEvent {

  final User user;

  const ChatsLoadedEvent(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'Chats { chats: ${user.name} }';

}