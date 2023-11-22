// To parse this JSON data, do
//
//     final seekerChatListModel = seekerChatListModelFromJson(jsonString);

import 'dart:convert';

SeekerChatListModel seekerChatListModelFromJson(String str) => SeekerChatListModel.fromJson(json.decode(str));

String seekerChatListModelToJson(SeekerChatListModel data) => json.encode(data.toJson());

class SeekerChatListModel {
  String? status;
  List<Chat>? chat;
   String? message;

  SeekerChatListModel({
     this.status,
     this.chat,
     this.message
  });

  factory SeekerChatListModel.fromJson(Map<String, dynamic> json) => SeekerChatListModel(
    status: json["status"],
    message: json["message"],
    chat: List<Chat>.from(json["chat"].map((x) => Chat.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "chat": List<dynamic>.from(chat!.map((x) => x.toJson())),
  };
}

class Chat {
 var requestid;
 var roomid;
 var makerName;
 var makerImg;
 var seekerfromName;
 var seekerwithName;
 var seekerfromImg;
 var seekerwithImg;

  Chat({
     this.requestid,
     this.roomid,
     this.makerName,
     this.makerImg,
     this.seekerfromName,
     this.seekerwithName,
     this.seekerfromImg,
     this.seekerwithImg,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
    requestid: json["requestid"],
    roomid: json["roomid"],
    makerName: json["maker_name"],
    makerImg: json["maker_img"],
    seekerfromName: json["seekerfrom_name"],
    seekerwithName: json["seekerwith_name"],
    seekerfromImg: json["seekerfrom_img"],
    seekerwithImg: json["seekerwith_img"],
  );

  Map<String, dynamic> toJson() => {
    "requestid": requestid,
    "roomid": roomid,
    "maker_name": makerName,
    "maker_img": makerImg,
    "seekerfrom_name": seekerfromName,
    "seekerwith_name": seekerwithName,
    "seekerfrom_img": seekerfromImg,
    "seekerwith_img": seekerwithImg,
  };
}
