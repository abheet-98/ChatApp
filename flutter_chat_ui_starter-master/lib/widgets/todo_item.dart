import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todos/core/todos_app_core.dart';
import 'package:flutter_todos/models/models.dart';

class TodoItem extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final ValueChanged<bool> onCheckboxChanged;
  final User user;

  TodoItem({
    Key key,
    @required this.onDismissed,
    @required this.onTap,
    @required this.onCheckboxChanged,
    @required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ArchSampleKeys.todoItem(user.id),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        leading: Checkbox(
          key: ArchSampleKeys.todoItemCheckbox(user.id),
          value: user.complete,
          onChanged: onCheckboxChanged,
        ),
        title: Hero(
          tag: '${user.id}__heroTag',
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Text(
              user.task,
              key: ArchSampleKeys.todoItemTask(user.id),
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        subtitle: user.note.isNotEmpty
            ? Text(
                user.note,
                key: ArchSampleKeys.todoItemNote(user.id),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.subtitle1,
              )
            : null,
      ),
    );
  }
}
