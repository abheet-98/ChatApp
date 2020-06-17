// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

//

class TodoEntity {
  final bool complete;
  final String id;
  final String note;
  final String task;
  final String name;
  final String imageUrl;

  TodoEntity(this.task, this.id, this.note, this.complete,this.name,this.imageUrl);

  @override
  int get hashCode =>
      complete.hashCode ^ task.hashCode ^ note.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoEntity &&
          runtimeType == other.runtimeType &&
          complete == other.complete &&
          task == other.task &&
          note == other.note &&
          id == other.id;

  Map<String, Object> toJson() {
    return {
      'complete': complete,
      'task': task,
      'note': note,
      'id': id,
    };
  }

  @override
  String toString() {
    return 'TodoEntity{complete: $complete, task: $task, note: $note, id: $id}';
  }

  static TodoEntity fromJson(Map<String, Object> json) {
    return TodoEntity(
      json['task'] as String,
      json['id'] as String,
      json['note'] as String,
      json['complete'] as bool,
      json['name'] as String,
      json['imageUrl'] as String,
    );
  }
}
