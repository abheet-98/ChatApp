import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/core/todos_app_core.dart';
import 'package:flutter_todos/blocs/blocs.dart';
import 'package:flutter_todos/widgets/request_message.dart';
import 'package:flutter_todos/widgets/user_tile.dart';
import 'package:flutter_todos/widgets/widgets.dart';
import 'package:flutter_todos/screens/screens.dart';
import 'package:flutter_todos/flutter_todos_keys.dart';

class RequestPage extends StatelessWidget {
  RequestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = ArchSampleLocalizations.of(context);

    return BlocConsumer<FilteredRequestBloc, FilteredRequestState>(
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
              return UserTille(
                user: user,
                onDismissed: (direction) {
                  BlocProvider.of<RequestBloc>(context).add(TodoDeleted(user));
                  Scaffold.of(context).showSnackBar(DeleteTodoSnackBar(
                    key: ArchSampleKeys.snackbar,
                    todo: user,
                    onUndo: () => BlocProvider.of<RequestBloc>(context)
                        .add(TodoAdded(user)),
                    localizations: localizations,
                  ));
                },
                onTap: () async {
                  if(state is FilteredRequestMessageLoad)  {
                    Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) {
                      return RequestMessagePage(user: state.user,);
                    }),
                  );
                 
          
        }
                },
//                onCheckboxChanged: (_) {
//                  BlocProvider.of<RequestBloc>(context).add(
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
      listener: (context, state)  { 
        if(state is FilteredRequestMessageLoad)  {
           Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) {
                      return RequestMessagePage(user: state.user,);
                    }),
                  );
                 
          
        }

       },
    );
  }
}
