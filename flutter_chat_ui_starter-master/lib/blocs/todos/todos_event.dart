import 'package:equatable/equatable.dart';
import 'package:flutter_chat_ui_starter/models/models.dart';

import '../../models/user_model.dart';

abstract class TodosEvent extends Equatable {
  const TodosEvent();

  @override
  List<Object> get props => [];
}

class TodosLoadedEvent extends TodosEvent {

  final User user;

  const TodosLoadedEvent(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'TodoAdded { todo: ${user.name} }';

}
class TodosLoaded1Event extends TodosEvent {


}
class TodosLoaded3Event extends TodosEvent {


}



class RecentChatLoadingEvent extends TodosEvent {

  final User user;

  const RecentChatLoadingEvent(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'ChatLoading { todo: ${user.name} }';
}

class RecentChatLoadedEvent extends TodosEvent {

  final User user;

  const RecentChatLoadedEvent(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'ChatLoading { todo: ${user.name} }';
}