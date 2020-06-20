// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:bethere_app/models/request.dart';
import 'package:path_provider/path_provider.dart';

/// A class that is meant to represent a Client that would be used to call a Web
/// Service. It is responsible for fetching and persisting Request to and from the
/// cloud.
///
/// Since we're trying to keep this example simple, it doesn't communicate with
/// a real server but simply emulates the functionality.
class WebClient {
  final Duration delay;
  final Future<Directory> Function() getDirectory = getApplicationDocumentsDirectory;
//  Future<Directory> getDirectory = FileStorage(
//              '__flutter_bloc_app__',
//              getApplicationDocumentsDirectory,
//            );

  const WebClient([this.delay = const Duration(milliseconds: 3000)]);

  /// Mock that "fetches" some Request from a "web service" after a short delay
  ///
  Future<List<Request>> fetchRequests(Request request) async {
    debugPrint('load fetchRequests request: ${request}');
//    final file = await _getLocalFile();
//    final string = await file.readAsString();
    final string = await '''{
  "result": [
    {
      "id": 8,
      "title": "lksingh request for item name",
      "to_user": 179,
      "from_user": 1,
      "admin_user": 1,
      "influencer": 160,
      "seen": false,
      "seen_at": null,
      "last_message": "",
      "last_message_id": 0,
      "created_at": "2020-06-16T22:58:46.008411+05:30",
      "updated_at": "2020-06-16T22:58:46.008452+05:30",
      "created_by": "NA",
      "updated_by": "NA",
      "record_status": "1"
    },
    {
      "id": 7,
      "title": "lksingh request for item name",
      "to_user": 179,
      "from_user": 1,
      "admin_user": 1,
      "influencer": 160,
      "seen": false,
      "seen_at": null,
      "last_message": "",
      "last_message_id": 0,
      "created_at": "2020-06-16T22:40:30.424770+05:30",
      "updated_at": "2020-06-16T22:40:30.424815+05:30",
      "created_by": "NA",
      "updated_by": "NA",
      "record_status": "1"
    },
    {
      "id": 6,
      "title": "lksingh request for item name",
      "to_user": 179,
      "from_user": 1,
      "admin_user": 1,
      "influencer": 160,
      "seen": false,
      "seen_at": null,
      "last_message": "",
      "last_message_id": 0,
      "created_at": "2020-06-16T22:35:15.476777+05:30",
      "updated_at": "2020-06-16T22:35:15.476823+05:30",
      "created_by": "NA",
      "updated_by": "NA",
      "record_status": "1"
    },
    {
      "id": 5,
      "title": "lksingh request for item name",
      "to_user": 179,
      "from_user": 1,
      "admin_user": 1,
      "influencer": 160,
      "seen": false,
      "seen_at": null,
      "last_message": "",
      "last_message_id": 0,
      "created_at": "2020-06-16T22:25:22.124773+05:30",
      "updated_at": "2020-06-16T22:25:22.124849+05:30",
      "created_by": "NA",
      "updated_by": "NA",
      "record_status": "1"
    }
  ],
  "count": 4,
  "next": null,
  "previous": null,
  "status": 200
}''';

    final json = JsonDecoder().convert(string);
    debugPrint('fetchRequests json: $json');
    final requestList = (json['result'])
        .map<Request>((_request) => Request.fromJson(_request))
        .toList();
    debugPrint('requestList file: ${requestList.toString()}');
    return Future.delayed(
        delay,
        () => requestList);
  }




  /// Mock that "fetches" some Request from a "web service" after a short delay
  ///
  Future<List<RequestMessage>> fetchRequestMessages(Request request) async {
    debugPrint('load fetchRequestMessages request: ${request}');
//    final file = await _getLocalFile();
//    final string = await file.readAsString();
    final string = await '''{
            "result": [
              {
                "id": 1,
                "message_text": "Hello"
              },
              {
                "id": 2,
                "message_text": "Hello"
              },
              {
                "id": 3,
                "message_text": "Hello"
              },
              {
                "id": 4,
                "message_text": "Hello"
              }
            ],
            "count": 4,
            "next": null,
            "previous": null,
            "status": 200
          }''';

    final json = JsonDecoder().convert(string);
    debugPrint('fetchRequestMessages json: $json');
    final requestMessagesList = (json['result'])
        .map<RequestMessage>((_requestMessage) => RequestMessage.fromJson(_requestMessage))
        .toList();
    debugPrint('requestMessagesList file: ${requestMessagesList.toString()}');
    return Future.delayed(
        delay,
        () => requestMessagesList);
  }

  /// Mock that returns true or false for success or failure. In this case,
  /// it will "Always Succeed"

}
