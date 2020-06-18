part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {
  User user;
  UserInitial();
  @override
  List<Object> get props => [user];
}

class UserLoading extends UserState {}

class UserNotProfile extends UserState {}

class UserLogout extends UserState {
  const UserLogout();

  @override
  List<Object> get props => [];
}

class UserProfileEdit extends UserState {
  final User user;
//  final List<UserItem> itemList;

  const UserProfileEdit({
    this.user,
  });

  UserProfileEdit copyWith({
    User user,
    bool loading,
  }) {
    return UserProfileEdit(
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [user];
}


class UserFailure extends UserState {
  final String error;

  const UserFailure({@required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'UserFailure { error: $error }';
}

class UserSaved extends UserState {
  final User user;
//  final List<UserItem> itemList;

  const UserSaved({
    this.user,
  });

  UserSaved copyWith({
    User user,
    bool loading,
  }) {
    return UserSaved(
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [user];

  @override
  String toString() =>
      'UserSaved { user: ${user.id},}';
}

class UserProfile extends UserState {
  final User user;
//  final List<UserItem> itemList;

  const UserProfile({
    this.user,
  });

  UserProfile copyWith({
    User user,
    bool loading,
  }) {
    return UserProfile(
      user: user ?? this.user,
    );
  }

  @override
  List<Object> get props => [user];

  @override
  String toString() =>
      'UserProfile { users: ${user.id},}';
}
