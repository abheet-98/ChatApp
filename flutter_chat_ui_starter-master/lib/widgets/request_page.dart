import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/core/todos_app_core.dart';
import 'package:flutter_todos/blocs/blocs.dart';
import 'package:flutter_todos/widgets/request_tile.dart';
import 'package:flutter_todos/widgets/widgets.dart';
import 'package:flutter_todos/screens/screens.dart';
import 'package:flutter_todos/flutter_todos_keys.dart';

class RequestPage extends StatelessWidget {
  RequestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = ArchSampleLocalizations.of(context);

    return BlocConsumer<TodosBloc, TodosState>(
      listener: (context, state) {
//        if(state is )
      },
      builder: (context, state) {
        if (state is TodosLoadInProgress) {
          return LoadingIndicator(key: ArchSampleKeys.todosLoading);
        } else if (state is TodosLoadSuccess) {
          final requests = state.requests;
          return ListView.builder(
            key: ArchSampleKeys.todoList,
            itemCount: requests.length,
            itemBuilder: (BuildContext context, int index) {
              final request = requests[index];
              return RequestTile(
                request: request,
                onDismissed: (direction) {

                },
                onTap: () async {
                  final removedTodo = await Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) {
//                      return DetailsScreen(id: request.id);
                    }),
                  );

                },
//                onCheckboxChanged: (_) {
//                  BlocProvider.of<TodosBloc>(context).add(
//                    TodoUpdated(request.copyWith(complete: !request.complete)),
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
