import 'package:bethere_app/widgets/request_message_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bethere_app/core/todos_app_core.dart';
import 'package:bethere_app/blocs/blocs.dart';
import 'package:bethere_app/widgets/request_tile.dart';
import 'package:bethere_app/widgets/widgets.dart';
import 'package:bethere_app/screens/screens.dart';
import 'package:bethere_app/models/request.dart';
import '../app_keys.dart';

class RequestMessagePage extends StatelessWidget {
  final Request request;
  RequestMessagePage({Key key, this.request}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = ArchSampleLocalizations.of(context);

    return MultiBlocProvider(
        providers: [
          BlocProvider<RequestMessageBloc>(
            create: (context) =>
                RequestMessageBloc()..add(RequestMessageLoaded(this.request)),
          ),
        ],
        child: BlocConsumer<RequestMessageBloc, RequestMessageState>(
          listener: (context, state) {
//        if(state is )
          },
          builder: (context, state) {
            if (state is RequestMessageLoadInProgress) {
              return LoadingIndicator(key: ArchSampleKeys.todosLoading);
            } else if (state is RequestMessageLoadSuccess) {
              final requests = state.requestmessages;
              //print("Helllllo"+this.request.name.toString());
              return Scaffold(
                appBar: AppBar(
                  title: Text(this.request.name.toString()),
                ),
                body: ListView.builder(
                  key: ArchSampleKeys.todoList,
                  itemCount: requests != null ? requests.length : 0,
                  itemBuilder: (BuildContext context, int index) {
                    final request = requests[index];
                    return RequestMessageTile(
                      requestMessage: request,
                      onDismissed: (direction) {},
                      onTap: () async {
                        final removedTodo = await Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) {
//                      return DetailsScreen(id: request.id);
                          }),
                        );
                      },
//                onCheckboxChanged: (_) {
//                  BlocProvider.of<RequestMessageBloc>(context).add(
//                    TodoUpdated(request.copyWith(complete: !request.complete)),
//                  );
//                },
                    );
                  },
                ),
              );
            } else {
              return Container(key: AppKeys.filteredRequestEmptyContainer);
            }
          },
        ));
  }
}
