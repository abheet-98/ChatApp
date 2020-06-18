import 'dart:async';

import 'package:flutter_todos/models/models.dart';
import 'package:flutter_todos/service/repository/user_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserRepository userRepository;

  UserBloc({
    this.userRepository,
  })  :
        assert(userRepository != null);

  @override
  UserState get initialState => UserInitial();


  @override
  Stream<UserState> mapEventToState(UserEvent event,) async* {

  }

}