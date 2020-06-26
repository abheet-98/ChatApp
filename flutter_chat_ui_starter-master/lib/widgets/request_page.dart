import 'package:bethere_app/localization.dart';
import 'package:bethere_app/models/request.dart';
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

    return MultiBlocProvider(
        providers: [
          BlocProvider<RequestBloc>(
            create: (context) =>
                RequestBloc()..add(RequestLoaded(Request(id: 1))),
          ),
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text(FlutterBlocLocalizations.of(context).appTitle),
            actions: <Widget>[
              IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: () {
               RequestBloc()..add(RequestLoaded(Request(id: 1)));
            },
          ),
            ],
          ),
//          body: activeTab == AppTab.todos ? FilteredRequest() : Stats(),
          body: BlocConsumer<RequestBloc, RequestState>(
            listener: (context, state) {
              if (state is RequestMessageOpened) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) {
                    print(state.request.title.toString());
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
                return ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: Colors.black,
                  ),
                  key: ArchSampleKeys.todoList,
                  itemCount: requests != null && requests.length > 0
                      ? requests.length
                      : 0,
                  itemBuilder: (BuildContext context, int index) {
                    final request = requests[index];
                    //print("HEEYYYY"+request.title.toString());
                    return RequestTile(
                      request: request,
                      onDismissed: (direction) {},
                      onTap: () async {
                        print("tapped");

                        BlocProvider.of<RequestBloc>(context)
                            .add(RequestMessageOpen(request));
                      },

                    );
                  },
                );
              } else {
                return Container(key: AppKeys.filteredRequestEmptyContainer);
              }
            },
          ),
        ));
  }
}
