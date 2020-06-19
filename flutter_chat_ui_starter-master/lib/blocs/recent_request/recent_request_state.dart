import 'package:equatable/equatable.dart';
import 'package:flutter_todos/models/models.dart';

import '../../models/user.dart';

abstract class RecentFilteredRequestState extends Equatable {
  const RecentFilteredRequestState();

  @override
  List<Object> get props => [];
}

class RecentRequestLoadInProgress extends RecentFilteredRequestState {


}

class RecentRequestLoadFailure extends RecentFilteredRequestState {}

class RecentRequestLoadSuccess extends RecentFilteredRequestState {

  final User user;

  const RecentRequestLoadSuccess(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'RecentRequestLoadSuccess { todo: ${user.name} }';
}

/* class RecentChatLoading extends RecentFilteredRequestState {

  final User user;

  const RecentChatLoading(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'ChatLoading { todo: ${user.name} }';
}
*/

class RecentChatLoaded extends RecentFilteredRequestState {

  final User user;

  const RecentChatLoaded(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'ChatLoading { todo: ${user.name} }';
}

class MessageShow extends RecentFilteredRequestState {

  final User user;

  const MessageShow(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'ChatLoading { todo: ${user.name} }';
}
