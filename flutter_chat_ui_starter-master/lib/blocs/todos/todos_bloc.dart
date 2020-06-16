import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter_chat_ui_starter/blocs/todos/todos.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {

  TodosBloc();

  @override
  TodosState get initialState => TodosLoadInProgress();

  @override
  Stream<TodosState> mapEventToState(TodosEvent event) async* {
    if (event is TodosLoadedEvent) {
      yield* _mapTodosLoadedToState(event);
    }
    if (event is RecentChatLoadedEvent) {
      yield* _mapChatLoadedToState(event);
    }

  }

  Stream<TodosState> _mapTodosLoadedToState(event) async* {
    try {
        final user = event.user;
        final respose = user; //api call
        yield TodosLoadSuccess(respose);
    } catch (_) {
      yield TodosLoadFailure();
    }
  }

  Stream<TodosState> _mapChatLoadedToState(event) async* {
    try {
        yield RecentChatLoading(event.user);
        final user = event.user;
        final respose = user; //api call 2send
        yield RecentChatLoaded(respose);
    } catch (_) {
      yield TodosLoadFailure();
    }
  }

}
