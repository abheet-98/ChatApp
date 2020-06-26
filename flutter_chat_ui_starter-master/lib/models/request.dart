import 'package:equatable/equatable.dart';

class Request extends Equatable {
  int id;
  String title;
  String imageUrl;
  User toUser;
  User fromUser;
  User adminUser;
  int influencer;
  bool seen;
  Null seenAt;
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
        this.imageUrl,
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
    imageUrl = json['image_url'];
    toUser =
    json['to_user'] != null ? new User.fromJson(json['to_user']) : null;
    fromUser = json['from_user'] != null
        ? new User.fromJson(json['from_user'])
        : null;
    adminUser = json['admin_user'] != null
        ? new User.fromJson(json['admin_user'])
        : null;
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
    data['image_url'] = this.imageUrl;
    if (this.toUser != null) {
      data['to_user'] = this.toUser.toJson();
    }
    if (this.fromUser != null) {
      data['from_user'] = this.fromUser.toJson();
    }
    if (this.adminUser != null) {
      data['admin_user'] = this.adminUser.toJson();
    }
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
  Map<String, dynamic> paramToJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['request_id'] = this.id;
    return data;
  }


  @override
  // TODO: implement props
  List<Object> get props => [];
}

class RequestMessage  extends Equatable  {
  int id;
  String itemTitle;
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
        this.itemTitle,
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
    itemTitle = json['item_title'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    actionByUser = json['action_by_user'];
    objectType = json['object_type'];
    objectId = json['object_id'];
    filtered_request = json['filtered_request'];
    referenceMessage = json['reference_message'];
    replyMessage = json['reply_message'];
    objectData = json['object_data'] != null && json['object_data'].isNotEmpty
        ? new ObjectData.fromJson(json['object_data'])
        : null;
    if (json['media_data'] != null && json['media_data'].isNotEmpty) {
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
    data['item_title'] = this.itemTitle;
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
  String email;
  String mobileNumber;
  String address;

  User({this.id, this.username, this.name, this.logo,this.email,this.mobileNumber,this.address});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    username = json['username'];
    name = json['name'];
    logo = json['logo'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['name'] = this.name;
    data['logo'] = this.logo;
    data['email'] = this.email;
    data['mobile_number'] = this.mobileNumber;
    data['address'] = this.address;
    return data;
  }
}

// class ObjectData {
//   int id;

//   ObjectData({this.id});

//   ObjectData.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     return data;
//   }
// }


class ObjectData {
  int id;
  int accountInfluencer;
  int influencer;
  String influencerName;
  User user;
  String influencerUsername;
  Order order;
  int negotiateId;
  Negotiation negotiation;
  String instructions;
  String sharedLink;

  ObjectData(
      {this.id,
      this.accountInfluencer,
      this.influencer,
      this.influencerName,
      this.user,
      this.influencerUsername,
      this.order,
      this.negotiateId,
      this.negotiation,
      this.instructions,
      this.sharedLink});

  ObjectData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    accountInfluencer = json['account_influencer'];
    influencer = json['influencer'];
    influencerName = json['influencer_name'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    influencerUsername = json['influencer_username'];
    order = json['order'] != null ? new Order.fromJson(json['order']) : null;
    negotiateId = json['negotiate_id'];
    negotiation = json['negotiation'] != null
        ? new Negotiation.fromJson(json['negotiation'])
        : null;
    instructions = json['instructions'];
    sharedLink = json['shared_link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['account_influencer'] = this.accountInfluencer;
    data['influencer'] = this.influencer;
    data['influencer_name'] = this.influencerName;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['influencer_username'] = this.influencerUsername;
    if (this.order != null) {
      data['order'] = this.order.toJson();
    }
    data['negotiate_id'] = this.negotiateId;
    if (this.negotiation != null) {
      data['negotiation'] = this.negotiation.toJson();
    }
    data['instructions'] = this.instructions;
    data['shared_link'] = this.sharedLink;
    return data;
  }
}


class Order {
  int id;
  int influencerBooking;
  int promo;
  String promoCode;
  double grossAmount;
  String referenceNumber;
  double discount;
  String totalAmount;
  Null onlineOrderId;
  String onlineTransactionId;
  String advanceAmount;
  String amount;
  String orderDate;
  Item item;

  Order(
      {this.id,
      this.influencerBooking,
      this.promo,
      this.promoCode,
      this.grossAmount,
      this.referenceNumber,
      this.discount,
      this.totalAmount,
      this.onlineOrderId,
      this.onlineTransactionId,
      this.advanceAmount,
      this.amount,
      this.orderDate,
      this.item});

  Order.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    influencerBooking = json['influencer_booking'];
    promo = json['promo'];
    promoCode = json['promo_code'];
    grossAmount = json['gross_amount'];
    referenceNumber = json['reference_number'];
    discount = json['discount'];
    totalAmount = json['total_amount'];
    onlineOrderId = json['online_order_id'];
    onlineTransactionId = json['online_transaction_id'];
    advanceAmount = json['advance_amount'];
    amount = json['amount'];
    orderDate = json['order_date'];
    item = json['item'] != null ? new Item.fromJson(json['item']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['influencer_booking'] = this.influencerBooking;
    data['promo'] = this.promo;
    data['promo_code'] = this.promoCode;
    data['gross_amount'] = this.grossAmount;
    data['reference_number'] = this.referenceNumber;
    data['discount'] = this.discount;
    data['total_amount'] = this.totalAmount;
    data['online_order_id'] = this.onlineOrderId;
    data['online_transaction_id'] = this.onlineTransactionId;
    data['advance_amount'] = this.advanceAmount;
    data['amount'] = this.amount;
    data['order_date'] = this.orderDate;
    if (this.item != null) {
      data['item'] = this.item.toJson();
    }
    return data;
  }
}

class Item {
  int subItemId;
  String subItemName;

  Item({this.subItemId, this.subItemName});

  Item.fromJson(Map<String, dynamic> json) {
    subItemId = json['sub_item_id'];
    subItemName = json['sub_item_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_item_id'] = this.subItemId;
    data['sub_item_name'] = this.subItemName;
    return data;
  }
}

class Negotiation {
  int id;
  String amount;

  Negotiation({this.id, this.amount});

  Negotiation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['amount'] = this.amount;
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
//
//class RequestMessage extends Equatable {
//  int id;
//  bool seen;
//  String messageText;
//  String itemTitle;
//  String status;
//  String createdDate;
//
//  RequestMessage({
//    this.id,
//    this.seen,
//    this.messageText,
//    this.itemTitle,
//    this.status,
//    this.createdDate,
//  });
//
//  RequestMessage.fromJson(Map<String, dynamic> json) {
//    id = json['id'];
//    seen = json['seen'];
//    messageText = json['message_text'];
//    itemTitle = json['item_title'];
//    status = json['status'];
//    createdDate = json['created_date'];
//
//  }
//
//  Map<String, dynamic> toJson() {
//    final Map<String, dynamic> data = new Map<String, dynamic>();
//    data['id'] = this.id;
//    data['seen'] = this.seen;
//    data['message_text'] = this.messageText;
//    data['item_title'] = this.itemTitle;
//    data['status'] = this.status;
//    data['created_date'] = this.createdDate;
//    return data;
//  }
//
//  @override
//  // TODO: implement props
//  List<Object> get props => [];
//}
