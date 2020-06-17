import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/core/todos_app_core.dart';
import 'package:flutter_todos/blocs/blocs.dart';
import 'package:flutter_todos/widgets/widgets.dart';
import 'package:flutter_todos/screens/screens.dart';
import 'package:flutter_todos/flutter_todos_keys.dart';

class RequestPage extends StatelessWidget {
  RequestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = ArchSampleLocalizations.of(context);

    return BlocBuilder<RequestBloc, RequestState>(
      builder: (context, state) {
        if (state is FilteredTodosLoadInProgress) {
          return LoadingIndicator(key: ArchSampleKeys.todosLoading);
        } else if (state is FilteredTodosLoadSuccess) {
          final users = state.filteredTodos;
          return ListView.builder(
            key: ArchSampleKeys.todoList,
            itemCount: users.length,
            itemBuilder: (BuildContext context, int index) {
              final user = users[index];
              return TodoItem(
                user: user,
                onDismissed: (direction) {
                  BlocProvider.of<TodosBloc>(context).add(TodoDeleted(user));
                  Scaffold.of(context).showSnackBar(DeleteTodoSnackBar(
                    key: ArchSampleKeys.snackbar,
                    todo: user,
                    onUndo: () => BlocProvider.of<TodosBloc>(context)
                        .add(TodoAdded(user)),
                    localizations: localizations,
                  ));
                },
                onTap: () async {
                  final removedTodo = await Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) {
                      return DetailsScreen(id: user.id);
                    }),
                  );
                  if (removedTodo != null) {
                    Scaffold.of(context).showSnackBar(DeleteTodoSnackBar(
                      key: ArchSampleKeys.snackbar,
                      todo: user,
                      onUndo: () => BlocProvider.of<TodosBloc>(context)
                          .add(TodoAdded(user)),
                      localizations: localizations,
                    ));
                  }
                },
//                onCheckboxChanged: (_) {
//                  BlocProvider.of<TodosBloc>(context).add(
//                    TodoUpdated(user.copyWith(complete: !user.complete)),
//                  );
//                },
              );
            },
          );
        } else {
          return Container(key: FlutterTodosKeys.filteredTodosEmptyContainer);
        }
      },
    );
  }
}
