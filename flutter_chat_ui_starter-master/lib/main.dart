import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:bethere_app/widgets/request_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bethere_app/core/todos_app_core.dart';
import 'package:bethere_app/localization.dart';
import 'package:bethere_app/blocs/blocs.dart';
import 'package:bethere_app/models/models.dart';
import 'package:bethere_app/screens/screens.dart';

void main() {
  // BlocSupervisor oversees Blocs and delegates to BlocDelegate.
  // We can set the BlocSupervisor's delegate to an instance of `SimpleBlocDelegate`.
  // This will allow us to handle all transitions and errors in SimpleBlocDelegate.
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(RequestApp()
//    BlocProvider(
//      create: (context) {
//        return RequestBloc(
//          todosRepository: const RequestRepositoryFlutter(
//            fileStorage: const FileStorage(
//              '__flutter_bloc_app__',
//              getApplicationDocumentsDirectory,
//            ),
//          ),
//        )..add(RequestLoaded());
//      },
//      child: RequestApp(),
//    ),
      );
}

class RequestApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: FlutterBlocLocalizations().appTitle,
      theme: ArchSampleTheme.theme,
      localizationsDelegates: [
        ArchSampleLocalizationsDelegate(),
        FlutterBlocLocalizationsDelegate(),
      ],
      routes: {
        ArchSampleRoutes.home: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<RequestBloc>(
                create: (context) => RequestBloc()..add(RequestLoaded(Request(id: 1))),
              ),
            ],
            child: Scaffold(
              appBar: AppBar(
                title: Text(FlutterBlocLocalizations.of(context).appTitle),
              ),
//          body: activeTab == AppTab.todos ? FilteredRequest() : Stats(),
              body: RequestPage(),
              floatingActionButton: FloatingActionButton(
                key: ArchSampleKeys.addTodoFab,
                onPressed: () {
                  Navigator.pushNamed(context, ArchSampleRoutes.addTodo);
                },
                child: Icon(Icons.add),
                tooltip: ArchSampleLocalizations.of(context).addTodo,
              ),
//          bottomNavigationBar: TabSelector(
//            activeTab: activeTab,
//            onTabSelected: (tab) =>
//                BlocProvider.of<TabBloc>(context).add(TabUpdated(tab)),
//          ),
            ),
          );
        },
      },
    );
  }
}
