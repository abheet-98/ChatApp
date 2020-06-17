import 'package:equatable/equatable.dart';


class Request extends Equatable {
  int id;
  String title;
  int toUser;
  int fromUser;
  int adminUser;
  int influencer;
  bool seen;
  String seenAt;
  String lastMessage;
  int lastMessageId;
  String createdAt;
  String updatedAt;
  String createdBy;
  String updatedBy;
  String recordStatus;

  Request(
      {this.id,
        this.title,
        this.toUser,
        this.fromUser,
        this.adminUser,
        this.influencer,
        this.seen,
        this.seenAt,
        this.lastMessage,
        this.lastMessageId,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy,
        this.recordStatus});

  Request.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    toUser = json['to_user'];
    fromUser = json['from_user'];
    adminUser = json['admin_user'];
    influencer = json['influencer'];
    seen = json['seen'];
    seenAt = json['seen_at'];
    lastMessage = json['last_message'];
    lastMessageId = json['last_message_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    recordStatus = json['record_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['to_user'] = this.toUser;
    data['from_user'] = this.fromUser;
    data['admin_user'] = this.adminUser;
    data['influencer'] = this.influencer;
    data['seen'] = this.seen;
    data['seen_at'] = this.seenAt;
    data['last_message'] = this.lastMessage;
    data['last_message_id'] = this.lastMessageId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['record_status'] = this.recordStatus;
    return data;
  }

  @override
  // TODO: implement props
  List<Object> get props => [];
}




class RequestMessage  extends Equatable  {
  int id;
  User user;
  int actionByUser;
  String objectType;
  int objectId;
  int filtered_request;
  int referenceMessage;
  int replyMessage;
  ObjectData objectData;
  List<MediaData> mediaData;
  String messageText;
  String messageStatus;
  String messageType;
  bool seen;
  bool delivered;
  String deliveredAt;
  String seenAt;
  String deliveredDate;
  bool isSelf;
  String createdDate;
  Status status;
  bool isUser;
  bool isInfluencer;
  String createdAt;
  String updatedAt;
  String createdBy;
  String updatedBy;
  String recordStatus;

  RequestMessage(
      {this.id,
        this.user,
        this.actionByUser,
        this.objectType,
        this.objectId,
        this.filtered_request,
        this.referenceMessage,
        this.replyMessage,
        this.objectData,
        this.mediaData,
        this.messageText,
        this.messageStatus,
        this.messageType,
        this.seen,
        this.delivered,
        this.deliveredAt,
        this.seenAt,
        this.deliveredDate,
        this.isSelf,
        this.createdDate,
        this.status,
        this.isUser,
        this.isInfluencer,
        this.createdAt,
        this.updatedAt,
        this.createdBy,
        this.updatedBy,
        this.recordStatus});

  RequestMessage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    actionByUser = json['action_by_user'];
    objectType = json['object_type'];
    objectId = json['object_id'];
    filtered_request = json['filtered_request'];
    referenceMessage = json['reference_message'];
    replyMessage = json['reply_message'];
    objectData = json['object_data'] != null
        ? new ObjectData.fromJson(json['object_data'])
        : null;
    if (json['media_data'] != null) {
      mediaData = new List<MediaData>();
      json['media_data'].forEach((v) {
        mediaData.add(new MediaData.fromJson(v));
      });
    }
    messageText = json['message_text'];
    messageStatus = json['message_status'];
    messageType = json['message_type'];
    seen = json['seen'];
    delivered = json['delivered'];
    deliveredAt = json['delivered_at'];
    seenAt = json['seen_at'];
    deliveredDate = json['delivered_date'];
    isSelf = json['is_self'];
    createdDate = json['created_date'];
    status =
    json['status'] != null ? new Status.fromJson(json['status']) : null;
    isUser = json['is_user'];
    isInfluencer = json['is_influencer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    recordStatus = json['record_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['action_by_user'] = this.actionByUser;
    data['object_type'] = this.objectType;
    data['object_id'] = this.objectId;
    data['filtered_request'] = this.filtered_request;
    data['reference_message'] = this.referenceMessage;
    data['reply_message'] = this.replyMessage;
    if (this.objectData != null) {
      data['object_data'] = this.objectData.toJson();
    }
    if (this.mediaData != null) {
      data['media_data'] = this.mediaData.map((v) => v.toJson()).toList();
    }
    data['message_text'] = this.messageText;
    data['message_status'] = this.messageStatus;
    data['message_type'] = this.messageType;
    data['seen'] = this.seen;
    data['delivered'] = this.delivered;
    data['delivered_at'] = this.deliveredAt;
    data['seen_at'] = this.seenAt;
    data['delivered_date'] = this.deliveredDate;
    data['is_self'] = this.isSelf;
    data['created_date'] = this.createdDate;
    if (this.status != null) {
      data['status'] = this.status.toJson();
    }
    data['is_user'] = this.isUser;
    data['is_influencer'] = this.isInfluencer;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['record_status'] = this.recordStatus;
    return data;
  }

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class User {
  int id;
  String username;
  String name;
  String logo;

  User({this.id, this.username, this.name, this.logo});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['name'] = this.name;
    data['logo'] = this.logo;
    return data;
  }
}

class ObjectData {
  int id;

  ObjectData({this.id});

  ObjectData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    return data;
  }
}

class MediaData {
  int id;
  String name;
  String url;

  MediaData({this.id, this.name, this.url});

  MediaData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}

class Status {
  String text;
  int value;
  String color;
  String message;
  String stext;

  Status({this.text, this.value, this.color, this.message, this.stext});

  Status.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    value = json['value'];
    color = json['color'];
    message = json['message'];
    stext = json['stext'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['value'] = this.value;
    data['color'] = this.color;
    data['message'] = this.message;
    data['stext'] = this.stext;
    return data;
  }
}