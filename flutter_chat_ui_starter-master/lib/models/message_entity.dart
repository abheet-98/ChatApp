// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

//

class MessageEntity {
  final bool complete;
  final String id;
  final String note;
  final String task;
  final String name;
  final String imageUrl;

  MessageEntity(this.task, this.id, this.note, this.complete,this.name,this.imageUrl);

  @override
  int get hashCode =>
      complete.hashCode ^ task.hashCode ^ note.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MessageEntity &&
          runtimeType == other.runtimeType &&
          complete == other.complete &&
          task == other.task &&
          note == other.note &&
          id == other.id &&
          name == other.name &&
          imageUrl == other.imageUrl;

  Map<String, Object> toJson() {
    return {
      'complete': complete,
      'task': task,
      'note': note,
      'id': id,
      'name':name,
      'imageUrl':imageUrl, 
    };
  }

  @override
  String toString() {
    return 'MessageEntity{complete: $complete, task: $task, note: $note, id: $id, name: $name, imageUrl: $imageUrl,}';
  }

  static MessageEntity fromJson(Map<String, Object> json) {
    return MessageEntity(
      json['task'] as String,
      json['id'] as String,
      json['note'] as String,
      json['complete'] as bool,
      json['name'] as String,
      json['imageUrl'] as String,
    );
  }

  static MessageEntity fromEntity(MessageEntity entity) {
    return MessageEntity(
      entity.task,
      entity.id,
      entity.note,
      entity.complete,
      entity.name,
      entity.imageUrl
    );
  }
}
