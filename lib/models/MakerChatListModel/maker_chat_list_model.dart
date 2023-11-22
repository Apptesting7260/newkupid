// To parse this JSON data, do
//
//     final makerChatListModel = makerChatListModelFromJson(jsonString);

import 'dart:convert';

MakerChatListModel makerChatListModelFromJson(String str) => MakerChatListModel.fromJson(json.decode(str));

String makerChatListModelToJson(MakerChatListModel data) => json.encode(data.toJson());

class MakerChatListModel {
  String? status;
  List<Chat>? chat;

  MakerChatListModel({
     this.status,
     this.chat,
  });

  factory MakerChatListModel.fromJson(Map<String, dynamic> json) => MakerChatListModel(
    status: json["status"],
    chat: List<Chat>.from(json["chat"].map((x) => Chat.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "chat": List<dynamic>.from(chat!.map((x) => x.toJson())),
  };
}

class Chat {
  var  requestid;
  var makerName;
  var seekerfromName;
  var seekerwithName;
  var makerImg;
  var seekerfromImg;
  var seekerwithImg;

  Chat({
     this.requestid,
     this.makerName,
     this.seekerfromName,
     this.seekerwithName,
     this.makerImg,
     this.seekerfromImg,
     this.seekerwithImg,
  });

  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
    requestid: json["requestid"],
    makerName: json["maker_name"],
    seekerfromName: json["seekerfrom_name"],
    seekerwithName: json["seekerwith_name"],
    makerImg: json["maker_img"],
    seekerfromImg: json["seekerfrom_img"],
    seekerwithImg: json["seekerwith_img"],
  );

  Map<String, dynamic> toJson() => {
    "requestid": requestid,
    "maker_name": makerName,
    "seekerfrom_name": seekerfromName,
    "seekerwith_name": seekerwithName,
    "maker_img": makerImg,
    "seekerfrom_img": seekerfromImg,
    "seekerwith_img": seekerwithImg,
  };
}
