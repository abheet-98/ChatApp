import 'package:bethere_app/widgets/request_message_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bethere_app/core/todos_app_core.dart';
import 'package:bethere_app/blocs/blocs.dart';
import 'package:bethere_app/widgets/request_tile.dart';
import 'package:bethere_app/widgets/widgets.dart';
import 'package:bethere_app/screens/screens.dart';
import 'package:bethere_app/blocs/blocs.dart';
import 'package:bethere_app/blocs/blocs.dart';
import 'package:bethere_app/blocs/request/request.dart';
import '../app_keys.dart';

class RequestPage extends StatelessWidget {
  RequestPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizations = ArchSampleLocalizations.of(context);

    return BlocConsumer<RequestBloc, RequestState>(
      listener: (context, state) {
        if (state is RequestMessageOpened) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (_) {
              print(state.request.name.toString());
              return RequestMessagePage(request: state.request);
            }),
          );
        }
      },
      builder: (context, state) {
        if (state is RequestLoadInProgress) {
          return LoadingIndicator(key: ArchSampleKeys.todosLoading);
        } else if (state is RequestLoadSuccess) {
          final requests = state.requests;
          return ListView.builder(
            key: ArchSampleKeys.todoList,
            itemCount: requests.length,
            itemBuilder: (BuildContext context, int index) {
              final request = requests[index];
              //print("HEEYYYY"+request.title.toString());
              return RequestTile(
                
                request: request,
                onDismissed: (direction) {},
                onTap: () async {
                  print("tapped");
                  /* BlocProvider<RequestBloc>(
                    create: (context) =>
                        RequestBloc()..add(RequestMessageOpen(request)),
                  ); */

                  BlocProvider.of<RequestBloc>(context).add(RequestMessageOpen(request));
                },
//                onCheckboxChanged: (_) {
//                  BlocProvider.of<RequestBloc>(context).add(
//                    TodoUpdated(request.copyWith(complete: !request.complete)),
//                  );
//                },
              );
            },
          );
        } else {
          return Container(key: AppKeys.filteredRequestEmptyContainer);
        }
      },
    );
  }
}
