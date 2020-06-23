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
            "id": 9,
            "title": "LAKHVINDER SINGH FH FK Jrdgn",
            "image_url": "https://res.cloudinary.com/talentlync/image/upload/v1588847807/egybpyivivojrardxg7l.jpg",
            "to_user": {
                "id": 180,
                "username": "lksingh3",
                "name": "LAKHVINDER SINGH",
                "logo": "https://res.cloudinary.com/talentlync/image/upload/v1588847807/egybpyivivojrardxg7l.jpg"
            },
            "from_user": {
                "id": 1,
                "username": "lksingh",
                "name": "LK Singh INDIA",
                "logo": null
            },
            "admin_user": {
                "id": 1,
                "username": "lksingh",
                "name": "LK Singh INDIA",
                "logo": null
            },
            "influencer": 161,
            "seen": false,
            "seen_at": null,
            "last_message": "Your receipt and order updates will be sent to the email provided under Delivery Information.When your request is completed, we'll email and text you a link to view, share, or download.If for some reason your Video Message isn't completed, the ₹1000 will be return within 5-7 business days.",
            "last_message_id": 22,
            "created_at": "2020-06-23T12:34:53.866752+05:30",
            "updated_at": "2020-06-23T13:08:44.576468+05:30",
            "created_by": "NA",
            "updated_by": "NA",
            "record_status": "1"
        },
    {
            "id": 9,
            "title": "LAKHVINDER SINGH",
            "image_url": "https://res.cloudinary.com/talentlync/image/upload/v1588847807/egybpyivivojrardxg7l.jpg",
            "to_user": {
                "id": 180,
                "username": "lksingh3",
                "name": "LAKHVINDER SINGH",
                "logo": "https://res.cloudinary.com/talentlync/image/upload/v1588847807/egybpyivivojrardxg7l.jpg"
            },
            "from_user": {
                "id": 1,
                "username": "lksingh",
                "name": "LK Singh INDIA",
                "logo": null
            },
            "admin_user": {
                "id": 1,
                "username": "lksingh",
                "name": "LK Singh INDIA",
                "logo": null
            },
            "influencer": 161,
            "seen": false,
            "seen_at": null,
            "last_message": "Your receipt and order updates will be sent to the email provided under Delivery Information.When your request is completed, we'll email and text you a link to view, share, or download.If for some reason your Video Message isn't completed, the ₹1000 will be return within 5-7 business days.",
            "last_message_id": 22,
            "created_at": "2020-06-23T12:34:53.866752+05:30",
            "updated_at": "2020-06-23T13:08:44.576468+05:30",
            "created_by": "NA",
            "updated_by": "NA",
            "record_status": "1"
        },
    {
            "id": 9,
            "title": "LAKHVINDER SINGH",
            "image_url": "https://res.cloudinary.com/talentlync/image/upload/v1588847807/egybpyivivojrardxg7l.jpg",
            "to_user": {
                "id": 180,
                "username": "lksingh3",
                "name": "LAKHVINDER SINGH",
                "logo": "https://res.cloudinary.com/talentlync/image/upload/v1588847807/egybpyivivojrardxg7l.jpg"
            },
            "from_user": {
                "id": 1,
                "username": "lksingh",
                "name": "LK Singh INDIA",
                "logo": null
            },
            "admin_user": {
                "id": 1,
                "username": "lksingh",
                "name": "LK Singh INDIA",
                "logo": null
            },
            "influencer": 161,
            "seen": false,
            "seen_at": null,
            "last_message": "Your receipt and order updates will be sent to the email provided under Delivery Information.When your request is completed, we'll email and text you a link to view, share, or download.If for some reason your Video Message isn't completed, the ₹1000 will be return within 5-7 business days.",
            "last_message_id": 22,
            "created_at": "2020-06-23T12:34:53.866752+05:30",
            "updated_at": "2020-06-23T13:08:44.576468+05:30",
            "created_by": "NA",
            "updated_by": "NA",
            "record_status": "1"
        },
    {
            "id": 9,
            "title": "LAKHVINDER SINGH",
            "image_url": "https://res.cloudinary.com/talentlync/image/upload/v1588847807/egybpyivivojrardxg7l.jpg",
            "to_user": {
                "id": 180,
                "username": "lksingh3",
                "name": "LAKHVINDER SINGH",
                "logo": "https://res.cloudinary.com/talentlync/image/upload/v1588847807/egybpyivivojrardxg7l.jpg"
            },
            "from_user": {
                "id": 1,
                "username": "lksingh",
                "name": "LK Singh INDIA",
                "logo": null
            },
            "admin_user": {
                "id": 1,
                "username": "lksingh",
                "name": "LK Singh INDIA",
                "logo": null
            },
            "influencer": 161,
            "seen": false,
            "seen_at": null,
            "last_message": "Your receipt and order updates will be sent to the email provided under Delivery Information.When your request is completed, we'll email and text you a link to view, share, or download.If for some reason your Video Message isn't completed, the ₹1000 will be return within 5-7 business days.",
            "last_message_id": 22,
            "created_at": "2020-06-23T12:34:53.866752+05:30",
            "updated_at": "2020-06-23T13:08:44.576468+05:30",
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
            "id": 22,
            "item_title": "Vedio Message",
            "user": {
                "id": 1,
                "username": "lksingh",
                "name": "LK Singh INDIA",
                "logo": null
            },
            "action_by_user": null,
            "object_type": "8",
            "object_id": 161,
            "request": 9,
            "reference_message": null,
            "reply_message": null,
            "object_data": null,
            "media_data": null,
            "message_text": "Your receipt and order updates will be sent to the email provided under Delivery Information.When your request is completed, we'll email and text you a link to view, share, or download.If for some reason your Video Message isn't completed, the ₹1000 will be return within 5-7 business days.",
            "message_status": "6",
            "message_type": "4",
            "seen": true,
            "delivered": false,
            "delivered_at": null,
            "seen_at": null,
            "delivered_date": "Tue, 23/06/2020, 01:09 PM",
            "is_self": true,
            "created_date": "Tue, 23/06/2020, 01:08 PM",
            "status": {
                "text": "pending",
                "value": 6,
                "color": "#3f79e7",
                "message": "pending by LK Singh INDIA",
                "stext": "R"
            },
            "is_user": true,
            "is_influencer": false,
            "created_at": "2020-06-23T13:08:44.572529+05:30",
            "updated_at": "2020-06-23T13:08:44.572599+05:30",
            "created_by": "lksingh",
            "updated_by": "lksingh",
            "record_status": "1"
        },
        {
            "id": 21,
            "item_title": "Vedio Message",
            "user": {
                "id": 1,
                "username": "lksingh",
                "name": "LK Singh INDIA",
                "logo": null
            },
            "action_by_user": null,
            "object_type": "8",
            "object_id": 161,
            "request": 9,
            "reference_message": null,
            "reply_message": null,
            "object_data": null,
            "media_data": null,
            "message_text": "sdfdgdfgdgd",
            "message_status": "6",
            "message_type": "4",
            "seen": false,
            "delivered": false,
            "delivered_at": null,
            "seen_at": null,
            "delivered_date": "Tue, 23/06/2020, 01:09 PM",
            "is_self": true,
            "created_date": "Tue, 23/06/2020, 01:06 PM",
            "status": {
                "text": "pending",
                "value": 6,
                "color": "#3f79e7",
                "message": "pending by LK Singh INDIA",
                "stext": "R"
            },
            "is_user": true,
            "is_influencer": false,
            "created_at": "2020-06-23T13:06:16.192693+05:30",
            "updated_at": "2020-06-23T13:07:33.102289+05:30",
            "created_by": "lksingh",
            "updated_by": "lksingh",
            "record_status": "1"
        },
        {
            "id": 20,
            "item_title": "Vedio Message",
            "user": {
                "id": 1,
                "username": "lksingh",
                "name": "LK Singh INDIA",
                "logo": null
            },
            "action_by_user": null,
            "object_type": "8",
            "object_id": 161,
            "request": 9,
            "reference_message": null,
            "reply_message": null,
            "object_data": null,
            "media_data": null,
            "message_text": "sdfdgdfgdgd",
            "message_status": "6",
            "message_type": "4",
            "seen": false,
            "delivered": false,
            "delivered_at": null,
            "seen_at": null,
            "delivered_date": "Tue, 23/06/2020, 01:09 PM",
            "is_self": true,
            "created_date": "Tue, 23/06/2020, 01:04 PM",
            "status": {
                "text": "pending",
                "value": 6,
                "color": "#3f79e7",
                "message": "pending by LK Singh INDIA",
                "stext": "R"
            },
            "is_user": true,
            "is_influencer": false,
            "created_at": "2020-06-23T13:04:56.275393+05:30",
            "updated_at": "2020-06-23T13:07:33.121508+05:30",
            "created_by": "lksingh",
            "updated_by": "lksingh",
            "record_status": "1"
        },
        {
            "id": 19,
            "item_title": "Vedio Message",
            "user": {
                "id": 1,
                "username": "lksingh",
                "name": "LK Singh INDIA",
                "logo": null
            },
            "action_by_user": null,
            "object_type": "8",
            "object_id": 161,
            "request": 9,
            "reference_message": null,
            "reply_message": null,
            "object_data": null,
            "media_data": null,
            "message_text": "sdfdgdfgdgd",
            "message_status": "6",
            "message_type": "4",
            "seen": false,
            "delivered": false,
            "delivered_at": null,
            "seen_at": null,
            "delivered_date": "Tue, 23/06/2020, 01:09 PM",
            "is_self": true,
            "created_date": "Tue, 23/06/2020, 12:59 PM",
            "status": {
                "text": "pending",
                "value": 6,
                "color": "#3f79e7",
                "message": "pending by LK Singh INDIA",
                "stext": "R"
            },
            "is_user": true,
            "is_influencer": false,
            "created_at": "2020-06-23T12:59:14.974563+05:30",
            "updated_at": "2020-06-23T13:07:33.139524+05:30",
            "created_by": "lksingh",
            "updated_by": "lksingh",
            "record_status": "1"
        },
        {
            "id": 18,
            "item_title": "Vedio Message",
            "user": {
                "id": 1,
                "username": "lksingh",
                "name": "LK Singh INDIA",
                "logo": null
            },
            "action_by_user": null,
            "object_type": "8",
            "object_id": 161,
            "request": 9,
            "reference_message": null,
            "reply_message": null,
            "object_data": null,
            "media_data": null,
            "message_text": "sdfdgdfgdgd",
            "message_status": "6",
            "message_type": "4",
            "seen": false,
            "delivered": false,
            "delivered_at": null,
            "seen_at": null,
            "delivered_date": "Tue, 23/06/2020, 01:09 PM",
            "is_self": true,
            "created_date": "Tue, 23/06/2020, 12:57 PM",
            "status": {
                "text": "pending",
                "value": 6,
                "color": "#3f79e7",
                "message": "pending by LK Singh INDIA",
                "stext": "R"
            },
            "is_user": true,
            "is_influencer": false,
            "created_at": "2020-06-23T12:57:30.424712+05:30",
            "updated_at": "2020-06-23T13:07:33.156140+05:30",
            "created_by": "lksingh",
            "updated_by": "lksingh",
            "record_status": "1"
        },
        {
            "id": 17,
            "item_title": "Vedio Message",
            "user": {
                "id": 1,
                "username": "lksingh",
                "name": "LK Singh INDIA",
                "logo": null
            },
            "action_by_user": null,
            "object_type": "8",
            "object_id": 161,
            "request": 9,
            "reference_message": null,
            "reply_message": null,
            "object_data": null,
            "media_data": null,
            "message_text": "sdfdgdfgdgd",
            "message_status": "6",
            "message_type": "4",
            "seen": false,
            "delivered": false,
            "delivered_at": null,
            "seen_at": null,
            "delivered_date": "Tue, 23/06/2020, 01:09 PM",
            "is_self": true,
            "created_date": "Tue, 23/06/2020, 12:57 PM",
            "status": {
                "text": "pending",
                "value": 6,
                "color": "#3f79e7",
                "message": "pending by LK Singh INDIA",
                "stext": "R"
            },
            "is_user": true,
            "is_influencer": false,
            "created_at": "2020-06-23T12:57:15.563282+05:30",
            "updated_at": "2020-06-23T13:07:33.178495+05:30",
            "created_by": "lksingh",
            "updated_by": "lksingh",
            "record_status": "1"
        },
        {
            "id": 16,
            "item_title": "Vedio Message",
            "user": {
                "id": 1,
                "username": "lksingh",
                "name": "LK Singh INDIA",
                "logo": null
            },
            "action_by_user": null,
            "object_type": "8",
            "object_id": 161,
            "request": 9,
            "reference_message": null,
            "reply_message": null,
            "object_data": null,
            "media_data": null,
            "message_text": "sdfdgdfgdgd",
            "message_status": "6",
            "message_type": "4",
            "seen": false,
            "delivered": false,
            "delivered_at": null,
            "seen_at": null,
            "delivered_date": "Tue, 23/06/2020, 01:09 PM",
            "is_self": true,
            "created_date": "Tue, 23/06/2020, 12:55 PM",
            "status": {
                "text": "pending",
                "value": 6,
                "color": "#3f79e7",
                "message": "pending by LK Singh INDIA",
                "stext": "R"
            },
            "is_user": true,
            "is_influencer": false,
            "created_at": "2020-06-23T12:55:39.649867+05:30",
            "updated_at": "2020-06-23T13:07:33.194827+05:30",
            "created_by": "lksingh",
            "updated_by": "lksingh",
            "record_status": "1"
        },
        {
            "id": 15,
            "item_title": "Vedio Message",
            "user": {
                "id": 1,
                "username": "lksingh",
                "name": "LK Singh INDIA",
                "logo": null
            },
            "action_by_user": null,
            "object_type": "8",
            "object_id": 161,
            "request": 9,
            "reference_message": null,
            "reply_message": null,
            "object_data": null,
            "media_data": null,
            "message_text": "sdfdgdfgdgd",
            "message_status": "6",
            "message_type": "4",
            "seen": false,
            "delivered": false,
            "delivered_at": null,
            "seen_at": null,
            "delivered_date": "Tue, 23/06/2020, 01:09 PM",
            "is_self": true,
            "created_date": "Tue, 23/06/2020, 12:43 PM",
            "status": {
                "text": "pending",
                "value": 6,
                "color": "#3f79e7",
                "message": "pending by LK Singh INDIA",
                "stext": "R"
            },
            "is_user": true,
            "is_influencer": false,
            "created_at": "2020-06-23T12:43:58.707546+05:30",
            "updated_at": "2020-06-23T13:07:33.213479+05:30",
            "created_by": "lksingh",
            "updated_by": "lksingh",
            "record_status": "1"
        },
        {
            "id": 14,
            "item_title": "Vedio Message",
            "user": {
                "id": 1,
                "username": "lksingh",
                "name": "LK Singh INDIA",
                "logo": null
            },
            "action_by_user": null,
            "object_type": "8",
            "object_id": 161,
            "request": 9,
            "reference_message": null,
            "reply_message": null,
            "object_data": null,
            "media_data": null,
            "message_text": "sdfdgdfgdgd",
            "message_status": "6",
            "message_type": "4",
            "seen": false,
            "delivered": false,
            "delivered_at": null,
            "seen_at": null,
            "delivered_date": "Tue, 23/06/2020, 01:09 PM",
            "is_self": true,
            "created_date": "Tue, 23/06/2020, 12:43 PM",
            "status": {
                "text": "pending",
                "value": 6,
                "color": "#3f79e7",
                "message": "pending by LK Singh INDIA",
                "stext": "R"
            },
            "is_user": true,
            "is_influencer": false,
            "created_at": "2020-06-23T12:43:08.534216+05:30",
            "updated_at": "2020-06-23T13:07:33.230355+05:30",
            "created_by": "lksingh",
            "updated_by": "lksingh",
            "record_status": "1"
        },
        {
            "id": 13,
            "item_title": "Vedio Message",
            "user": {
                "id": 1,
                "username": "lksingh",
                "name": "LK Singh INDIA",
                "logo": null
            },
            "action_by_user": null,
            "object_type": "8",
            "object_id": 161,
            "request": 9,
            "reference_message": null,
            "reply_message": null,
            "object_data": null,
            "media_data": null,
            "message_text": "sdfdgdfgdgd",
            "message_status": "6",
            "message_type": "4",
            "seen": false,
            "delivered": false,
            "delivered_at": null,
            "seen_at": null,
            "delivered_date": "Tue, 23/06/2020, 01:09 PM",
            "is_self": true,
            "created_date": "Tue, 23/06/2020, 12:40 PM",
            "status": {
                "text": "pending",
                "value": 6,
                "color": "#3f79e7",
                "message": "pending by LK Singh INDIA",
                "stext": "R"
            },
            "is_user": true,
            "is_influencer": false,
            "created_at": "2020-06-23T12:40:57.492409+05:30",
            "updated_at": "2020-06-23T13:07:33.247512+05:30",
            "created_by": "lksingh",
            "updated_by": "lksingh",
            "record_status": "1"
        }
    ],
    "count": 13,
    "next": "2",
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
