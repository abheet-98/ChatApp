import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_todos/blocs/chats/chats.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {

  ChatsBloc();

  @override
  ChatsState get initialState => ChatsLoadInProgress();

  @override
  Stream<ChatsState> mapEventToState(ChatsEvent event) async* {
    
    if (event is ChatsLoadedEvent) {
      yield* _mapChatLoadedToState(event);
    }

  }

  Stream<ChatsState> _mapChatLoadedToState(event) async* {
    try {

        yield ChatsLoadInProgress();
        final user = event.user;
        final respose = user; //api call 2send
        yield ChatsLoadSuccess(respose);
    } catch (_) {
      yield ChatsLoadFailure(event.user);
    }
  }

}
