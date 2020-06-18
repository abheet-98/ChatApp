import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_todos/core/todos_app_core.dart';
import 'package:flutter_todos/blocs/todos/todos.dart';
import 'package:flutter_todos/screens/screens.dart';
import 'package:flutter_todos/flutter_todos_keys.dart';
import '../models/user.dart';

class RequestMessagePage extends StatelessWidget {
  final User user;

  RequestMessagePage({Key key, @required this.user})
      : super(key: key ?? ArchSampleKeys.todoDetailsScreen);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodosBloc, TodosState>(
      builder: (context, state) {
        final todo = (state as TodosLoadSuccess)
            .todos
            .firstWhere((todo) => todo.id == user.id, orElse: () => null);
        final localizations = ArchSampleLocalizations.of(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(this.user.name),
            /* actions: [
              IconButton(
                tooltip: localizations.deleteTodo,
                key: ArchSampleKeys.deleteTodoButton,
                icon: Icon(Icons.delete),
                onPressed: () {
                  BlocProvider.of<TodosBloc>(context).add(TodoDeleted(todo));
                  Navigator.pop(context, todo);
                },
              )
            ], */
          ),
          body: todo == null
              ? Container(key: FlutterTodosKeys.emptyDetailsContainer)
              : GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Column(
                    children: <Widget>[
                      /* Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.grey[200]),
                            child: IconButton(
                              icon: Icon(Icons.arrow_back),
                              iconSize: 35.0,
                              color: Colors.black38,
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                height: 50.0,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(60.0),
                                child: CircleAvatar(
                                  radius: 40.0,
                                  backgroundImage: AssetImage(this.id),
                                ),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                this.id,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                            ],
                          ),
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.grey[200]),
                            child: IconButton(
                              icon: Icon(Icons.more_vert),
                              iconSize: 35.0,
                              color: Colors.black38,
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ), */
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30.0),
                                topRight: Radius.circular(30.0),
                              )),
                          child: SizedBox(
                            height: 100,
                          ),
                          /* ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30.0),
                              topRight: Radius.circular(30.0),
                            ),
                            child: ListView.builder(
                              padding: EdgeInsets.only(top: 15.0),
                              itemBuilder: (BuildContext context, int index) {
                                final Message message = messages[index];
                                final bool isMe =
                                    message.sender.id == currentUser.id;
                                return Container(
                                  margin: isMe
                                      ? EdgeInsets.only(
                                          top: 8.0, bottom: 8.0, left: 80.0)
                                      : EdgeInsets.only(
                                          top: 8.0, bottom: 8.0, right: 80.0),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 25.0, vertical: 15.0),
                                  color: isMe
                                      ? Theme.of(context).accentColor
                                      : Colors.blueGrey[100],
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        message.time,
                                        style: TextStyle(fontSize: 12.0),
                                      ),
                                      SizedBox(
                                        height: 8.0,
                                      ),
                                      Text(message.text),
                                    ],
                                  ),
                                );
                              },
                              itemCount: messages.length,
                            ),
                          ), */
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        height: 70.0,
                        color: Colors.white,
                        child: Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.attachment),
                              iconSize: 25.0,
                              color: Theme.of(context).primaryColor,
                              onPressed: () {},
                            ),
                            Expanded(
                              child: TextField(
                                //controller: _textController,
                                decoration: InputDecoration.collapsed(
                                  hintText: "Type a message",
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.send),
                              iconSize: 25.0,
                              color: Theme.of(context).primaryColor,
                              //onPressed: _onSubmit,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),

          /* appBar: AppBar(
            title: Text(localizations.todoDetails),
            /* actions: [
              IconButton(
                tooltip: localizations.deleteTodo,
                key: ArchSampleKeys.deleteTodoButton,
                icon: Icon(Icons.delete),
                onPressed: () {
                  BlocProvider.of<TodosBloc>(context).add(TodoDeleted(todo));
                  Navigator.pop(context, todo);
                },
              )
            ], */
          ), */

          /* Padding(
                  padding: EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: 8.0),
                            child: Checkbox(
                                key: FlutterTodosKeys.detailsScreenCheckBox,
                                value: todo.complete,
                                onChanged: (_) {
                                  BlocProvider.of<TodosBloc>(context).add(
                                    TodoUpdated(
                                      todo.copyWith(complete: !todo.complete),
                                    ),
                                  );
                                }),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Hero(
                                  tag: '${todo.id}__heroTag',
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.only(
                                      top: 8.0,
                                      bottom: 16.0,
                                    ),
                                    child: Text(
                                      todo.task,
                                      key: ArchSampleKeys.detailsTodoItemTask,
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    ),
                                  ),
                                ),
                                Text(
                                  todo.note,
                                  key: ArchSampleKeys.detailsTodoItemNote,
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ), */
          /* floatingActionButton: FloatingActionButton(
            key: ArchSampleKeys.editTodoFab,
            tooltip: localizations.editTodo,
            child: Icon(Icons.edit),
            onPressed: todo == null
                ? null
                : () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return AddEditScreen(
                            key: ArchSampleKeys.editTodoScreen,
                            onSave: (task, note) {
                              BlocProvider.of<TodosBloc>(context).add(
                                TodoUpdated(
                                  todo.copyWith(task: task, note: note),
                                ),
                              );
                            },
                            isEditing: true,
                            todo: todo,
                          );
                        },
                      ),
                    );
                  },
          ), */
        );
      },
    );
  }
}
