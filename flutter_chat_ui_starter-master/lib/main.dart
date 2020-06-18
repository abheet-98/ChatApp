import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_todos/storage/todos_repository_simple.dart';
import 'package:flutter_todos/widgets/request_page.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/core/todos_app_core.dart';
import 'package:flutter_todos/localization.dart';
import 'package:flutter_todos/blocs/blocs.dart';
import 'package:flutter_todos/models/models.dart';
import 'package:flutter_todos/screens/screens.dart';

void main() {
  // BlocSupervisor oversees Blocs and delegates to BlocDelegate.
  // We can set the BlocSupervisor's delegate to an instance of `SimpleBlocDelegate`.
  // This will allow us to handle all transitions and errors in SimpleBlocDelegate.
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(
      TodosApp()
//    BlocProvider(
//      create: (context) {
//        return TodosBloc(
//          todosRepository: const TodosRepositoryFlutter(
//            fileStorage: const FileStorage(
//              '__flutter_bloc_app__',
//              getApplicationDocumentsDirectory,
//            ),
//          ),
//        )..add(TodosLoaded());
//      },
//      child: TodosApp(),
//    ),
  );
}

class TodosApp extends StatelessWidget {
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
              BlocProvider<TodosBloc>(
                create: (context) => TodosBloc()..add(TodosLoaded(null)),
              ),

            ],
            child: Scaffold(
              appBar: AppBar(
                title: Text(FlutterBlocLocalizations.of(context).appTitle),

              ),
//          body: activeTab == AppTab.todos ? FilteredTodos() : Stats(),
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
