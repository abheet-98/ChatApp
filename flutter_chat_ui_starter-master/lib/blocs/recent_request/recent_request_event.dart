import 'package:equatable/equatable.dart';
import 'package:flutter_todos/models/models.dart';

import '../../models/user.dart';

abstract class RecentFilteredRequestEvent extends Equatable {
  const RecentFilteredRequestEvent();

  @override
  List<Object> get props => [];
}

class RecentRequestLoadedEvent extends RecentFilteredRequestEvent {

  final User user;

  const RecentRequestLoadedEvent(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'RecentRequestLoaded { filtered_request: ${user.name} }';

}

class MessageShowEvent extends RecentFilteredRequestEvent {

  final User user;

  const MessageShowEvent(this.user);

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'RecentRequestLoaded { filtered_request: ${user.name} }';

}
