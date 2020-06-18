import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_todos/service/service.dart';
import 'package:meta/meta.dart';
import 'package:flutter_todos/blocs/todos/todos.dart';
import 'package:flutter_todos/models/models.dart';

class TodosBloc extends Bloc<TodosEvent, TodosState> {
  final requestRepository = RequestRepository();

  TodosBloc();

  @override
  TodosState get initialState => TodosLoadInProgress();

  @override
  Stream<TodosState> mapEventToState(TodosEvent event) async* {
    if (event is TodosLoaded) {
      yield* _mapTodosLoadedToState(event);
    }
  }

  Stream<TodosState> _mapTodosLoadedToState(event) async* {
    try {
      final requests = await this.requestRepository.loadRequest(event.request);
      debugPrint(requests.toString());
      yield TodosLoadSuccess(requests);
    } catch (error) {
      debugPrint(error.toString());
      yield TodosLoadFailure();
    }
  }

}
