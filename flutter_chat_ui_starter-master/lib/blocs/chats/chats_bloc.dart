import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_chat_ui_starter/blocs/chats/chats.dart';

class ChatsBloc extends Bloc<ChatsEvent, ChatsState> {

  ChatsBloc();

  @override
  ChatsState get initialState => ChatsLoadInProgress();

  @override
  Stream<ChatsState> mapEventToState(ChatsEvent event) async* {
    if (event is ChatsLoaded) {
      yield* _mapTodosLoadedToState(event);
    }
    if (event is ChatsLoadedEvent) {
      yield* _mapChatLoadedToState(event);
    }

  }

  Stream<ChatsState> _mapTodosLoadedToState(event) async* {
    try {
        final user = event.user;
        final respose = user; //api call
        yield ChatsLoadSuccess(respose);
    } catch (_) {
      yield ChatsLoadFailure();
    }
  }

  Stream<ChatsState> _mapChatLoadedToState(event) async* {
    try {

        yield ChatsLoading(event.user);
        final user = event.user;
        final respose = user; //api call 2send
        yield ChatsLoaded(respose);
    } catch (_) {
      yield ChatsLoadFailure();
    }
  }

}
