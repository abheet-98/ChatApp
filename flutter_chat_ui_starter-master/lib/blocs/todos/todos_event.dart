import 'package:equatable/equatable.dart';
import 'package:flutter_chat_ui_starter/models/models.dart';

import '../../models/user_model.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class TodosLoaded extends TodosEvent {

  final User user;

  const TodosLoaded(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'TodoAdded { todo: ${user.name} }';

}
class TodosLoaded1 extends TodosEvent {


}
class TodosLoaded3 extends TodosEvent {


}



class ChatLoadingEvent extends TodosEvent {

  final User user;

  const ChatLoadingEvent(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'ChatLoading { todo: ${user.name} }';
}

class ChatLoadedEvent extends TodosEvent {

  final User user;

  const ChatLoadedEvent(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'ChatLoading { todo: ${user.name} }';
}