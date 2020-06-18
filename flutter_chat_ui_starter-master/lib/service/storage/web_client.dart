// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_todos/models/request.dart';
import 'package:flutter_todos/repository/todos_repository_core.dart';
import 'package:path_provider/path_provider.dart';

/// A class that is meant to represent a Client that would be used to call a Web
/// Service. It is responsible for fetching and persisting Todos to and from the
/// cloud.
///
/// Since we're trying to keep this example simple, it doesn't communicate with
/// a real server but simply emulates the functionality.
class WebClient {
  final Duration delay;
  Future<Directory> getDirectory = FileStorage(
              '__flutter_bloc_app__',
              getApplicationDocumentsDirectory,
            );

  const WebClient([this.delay = const Duration(milliseconds: 3000)]);

  /// Mock that "fetches" some Todos from a "web service" after a short delay
  ///
  Future<List<Request>> fetchRequests(Request request) async {
    debugPrint('load fetchRequests request: ${request}');
    final file = await _getLocalFile();
    final string = await file.readAsString();
    final json = JsonDecoder().convert(string);
    debugPrint('fetchRequests file: ${file}, json: json');
    final requestList = (json['result'])
        .map<Request>((_request) => Request.fromJson(_request))
        .toList();
    debugPrint('requestList file: ${requestList.toString()}');
    return Future.delayed(
        delay,
        () => requestList);
  }

  /// Mock that returns true or false for success or failure. In this case,
  /// it will "Always Succeed"
  Future<bool> postTodos(List<TodoEntity> todos) async {
    return Future.value(true);
  }

  Future<File> _getLocalFile() async {
    final dir = await getDirectory();
    debugPrint('load dir: ${dir}');
    debugPrint('load dir: ${dir.path}/request.json}');

    return File('${dir.path}/request.json');
//    return File('${dir.path}/ArchSampleStorage__$tag.json');
  }
}
