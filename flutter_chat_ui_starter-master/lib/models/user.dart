import 'package:flutter_todos/core/todos_app_core.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_todos/repository/todos_repository_core.dart';

class User extends Equatable {
  final bool complete;
  final String id;
  final String note;
  final String task;
//  final int id;
  final String name;
  final String imageUrl;

  User(
    this.task, {
    this.complete = false,
    this.name,
    this.imageUrl,
    String note = '',
    String id,
  })  : this.note = note ?? '',
        this.id = id ?? Uuid().generateV4();
  
  
  User copyWith({bool complete, String id, String note, String task,String name,String imageUrl}) {
    return User(
      task ?? this.task,
      complete: complete ?? this.complete,
      id: id ?? this.id,
      note: note ?? this.note,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  List<Object> get props => [complete, id, note, task, name, imageUrl];

  @override
  String toString() {
    return 'Todo { complete: $complete, task: $task, note: $note, id: $id, name: $name, imageUrl: $imageUrl, }';
  }

  TodoEntity toEntity() {
    return TodoEntity(task, id, note, complete,name,imageUrl);
  }

  static User fromEntity(TodoEntity entity) {
    return User(
      entity.task,
      complete: entity.complete ?? false,
      note: entity.note,
      id: entity.id ?? Uuid().generateV4(),
      name: entity.name,
      imageUrl: entity.imageUrl
    );
  }
}
