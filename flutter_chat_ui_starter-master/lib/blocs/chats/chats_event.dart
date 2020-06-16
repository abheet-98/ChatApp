import 'package:equatable/equatable.dart';
import 'package:flutter_chat_ui_starter/models/models.dart';

import '../../models/user_model.dart';

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
  String toString() => 'TodoAdded { todo: ${user.name} }';

}
class ChatsLoaded1Event extends ChatsEvent {

  final User user;

  const ChatsLoaded1Event(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'ChatLoading { todo: ${user.name} }';

}
class ChatsLoaded3Event extends ChatsEvent {


}





class ChatLoadedEvent extends ChatsEvent {

  final User user;

  const ChatLoadedEvent(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'ChatLoading { todo: ${user.name} }';
}