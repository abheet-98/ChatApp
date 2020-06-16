import 'package:equatable/equatable.dart';
import 'package:flutter_chat_ui_starter/models/models.dart';

import '../../models/user_model.dart';

abstract class RecentRequestState extends Equatable {
  const RecentRequestState();

  @override
  List<Object> get props => [];
}

class RecentRequestLoadInProgress extends RecentRequestState {


}

class RecentRequestLoadFailure extends RecentRequestState {}

class RecentRequestLoadSuccess extends RecentRequestState {

  final User user;

  const RecentRequestLoadSuccess(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'RecentRequestLoadSuccess { todo: ${user.name} }';
}

/* class RecentChatLoading extends RecentRequestState {

  final User user;

  const RecentChatLoading(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'ChatLoading { todo: ${user.name} }';
}
*/

class RecentChatLoaded extends RecentRequestState {

  final User user;

  const RecentChatLoaded(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'ChatLoading { todo: ${user.name} }';
}

class MessageShow extends RecentRequestState {

  final User user;

  const MessageShow(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'ChatLoading { todo: ${user.name} }';
}
