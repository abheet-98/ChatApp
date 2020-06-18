part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {

  const UserEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}

class UserInitialEvent extends UserEvent {
  // TODO: implement props
  final User user;
  const UserInitialEvent(this.user);

  @override
  List<Object> get props => [this.user];
}

class UserAddedEvent extends UserEvent {
  // TODO: implement props
  final User user;
  const UserAddedEvent(this.user);

  @override
  List<Object> get props => [this.user];
}

class UserEditEvent extends UserEvent {

  final User user;
  const UserEditEvent(this.user);

  @override
  // TODO: implement props
  List<Object> get props => [];
}
class UserSaveEvent extends UserEvent {

  final User user;
  const UserSaveEvent(this.user);

  @override
  // TODO: implement props
  List<Object> get props => [user];
}

class UserHasProfile extends UserEvent {

  const UserHasProfile();

  @override
  // TODO: implement props
  List<Object> get props => [];
}
class UserLoggedOut extends UserEvent {

  const UserLoggedOut();

  @override
  // TODO: implement props
  List<Object> get props => [];
}
