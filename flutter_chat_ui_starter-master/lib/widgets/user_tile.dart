import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_todos/core/todos_app_core.dart';
import 'package:flutter_todos/models/models.dart';

class UserTille extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final ValueChanged<bool> onCheckboxChanged;
  final User user;

  UserTille({
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
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin:EdgeInsets.only(top: 5.0, bottom: 5.0, right: 10.0, left: 5.0),
          padding: EdgeInsets.symmetric(horizontal: 1.0, vertical: 5.0),
          decoration: BoxDecoration(color: Colors.blueGrey[50]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  CircleAvatar(
                    radius: 35.0,
                    backgroundImage: AssetImage(user.imageUrl),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        user.name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.60,
                        child: Text(
                          user.task,
                          style: TextStyle(fontSize: 15.0),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              /* Column(
            children: <Widget>[
              Text(user.),
              SizedBox(
                height: 5.0,
              ),
            ],
          ) */
            ],
          ),
        ),
      ),
    );
  }
}
