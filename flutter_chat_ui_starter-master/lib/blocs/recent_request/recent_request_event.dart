import 'package:equatable/equatable.dart';
import 'package:flutter_chat_ui_starter/models/models.dart';

import '../../models/user_model.dart';

abstract class RecentRequestEvent extends Equatable {
  const RecentRequestEvent();

  @override
  List<Object> get props => [];
}

class RecentRequestLoadedEvent extends RecentRequestEvent {

  final User user;

  const RecentRequestLoadedEvent(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'RecentRequestLoaded { request: ${user.name} }';

}

class MessageShowEvent extends RecentRequestEvent {

  final User user;

  const MessageShowEvent(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'RecentRequestLoaded { request: ${user.name} }';

}
