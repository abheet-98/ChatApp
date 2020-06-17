import 'package:equatable/equatable.dart';
import 'package:flutter_todos/models/models.dart';

import '../../models/user.dart';

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
  String toString() => 'RecentRequestLoaded { filtered_request: ${user.name} }';

}

class MessageShowEvent extends RecentRequestEvent {

  final User user;

  const MessageShowEvent(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'RecentRequestLoaded { filtered_request: ${user.name} }';

}
