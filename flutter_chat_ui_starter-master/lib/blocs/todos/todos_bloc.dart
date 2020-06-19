import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_todos/models/message_entity.dart';
import 'package:flutter_todos/service/blocs/user/user_bloc.dart';
import 'package:flutter_todos/storage/repository.dart';
import 'package:meta/meta.dart';
import 'package:flutter_todos/blocs/todos/todos.dart';
import 'package:flutter_todos/models/models.dart';

class RequestBloc extends Bloc<RequestEvent, RequestState> {
  final TodosRepositoryFlutter todosRepository;

  RequestBloc({@required this.todosRepository});

  @override
  RequestState get initialState => TodosLoadInProgress();

  @override
  Stream<RequestState> mapEventToState(RequestEvent event) async* {
    if (event is TodosLoaded) {
      yield* _mapTodosLoadedToState();
    } else if (event is TodoAdded) {
      yield* _mapTodoAddedToState(event);
    } else if (event is TodoUpdated) {
      yield* _mapTodoUpdatedToState(event);
    } else if (event is TodoDeleted) {
      yield* _mapTodoDeletedToState(event);
    } else if (event is ToggleAll) {
      yield* _mapToggleAllToState();
    } else if (event is ClearCompleted) {
      yield* _mapClearCompletedToState();
    }

    if (event is RequestMessageLoaded) {
      yield* _mapRequestMessagaeLoadedToState(event.user);
    }

  }

  Stream<RequestState> _mapTodosLoadedToState() async* {
    try {
      final todos = await this.todosRepository.loadTodos();
      yield TodosLoadSuccess(
        todos.map(User.fromEntity).toList(),
      );
    } catch (_) {
      yield TodosLoadFailure();
    }
  }

  Stream<RequestState> _mapRequestMessagaeLoadedToState(User user) async* {
    try {
      final todos = await this.todosRepository.loadRequestMessage();
      yield RequestMessageLoad(
        user,
        todos.map(MessageEntity.fromEntity).toList(),
      );
    } catch (_) {
      yield TodosLoadFailure();
    }
  }

  Stream<RequestState> _mapTodoAddedToState(TodoAdded event) async* {
    if (state is TodosLoadSuccess) {
      final List<User> updatedTodos =
          List.from((state as TodosLoadSuccess).todos)..add(event.user);
      yield TodosLoadSuccess(updatedTodos);
      _saveTodos(updatedTodos);
    }
  }

  Stream<RequestState> _mapTodoUpdatedToState(TodoUpdated event) async* {
    if (state is TodosLoadSuccess) {
      final List<User> updatedTodos =
          (state as TodosLoadSuccess).todos.map((todo) {
        return todo.id == event.user.id ? event.user : todo;
      }).toList();
      yield TodosLoadSuccess(updatedTodos);
      _saveTodos(updatedTodos);
    }
  }

  Stream<RequestState> _mapTodoDeletedToState(TodoDeleted event) async* {
    if (state is TodosLoadSuccess) {
      final updatedTodos = (state as TodosLoadSuccess)
          .todos
          .where((todo) => todo.id != event.user.id)
          .toList();
      yield TodosLoadSuccess(updatedTodos);
      _saveTodos(updatedTodos);
    }
  }

  Stream<RequestState> _mapToggleAllToState() async* {
    if (state is TodosLoadSuccess) {
      final allComplete =
          (state as TodosLoadSuccess).todos.every((todo) => todo.complete);
      final List<User> updatedTodos = (state as TodosLoadSuccess)
          .todos
          .map((todo) => todo.copyWith(complete: !allComplete))
          .toList();
      yield TodosLoadSuccess(updatedTodos);
      _saveTodos(updatedTodos);
    }
  }

  Stream<RequestState> _mapClearCompletedToState() async* {
    if (state is TodosLoadSuccess) {
      final List<User> updatedTodos = (state as TodosLoadSuccess)
          .todos
          .where((todo) => !todo.complete)
          .toList();
      yield TodosLoadSuccess(updatedTodos);
      _saveTodos(updatedTodos);
    }
  }

  Future _saveTodos(List<User> todos) {
    return todosRepository.saveTodos(
      todos.map((todo) => todo.toEntity()).toList(),
    );
  }
}
