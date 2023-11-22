// To parse this JSON data, do
//
//     final recentSeekerMatchesModel = recentSeekerMatchesModelFromJson(jsonString);

import 'dart:convert';

RecentSeekerMatchesModel recentSeekerMatchesModelFromJson(String str) => RecentSeekerMatchesModel.fromJson(json.decode(str));

String recentSeekerMatchesModelToJson(RecentSeekerMatchesModel data) => json.encode(data.toJson());

class RecentSeekerMatchesModel {
  String? status;
  String? message;
  List<Datum>? data;

  RecentSeekerMatchesModel({
     this.status,
     this.data,
     this.message
  });

  factory RecentSeekerMatchesModel.fromJson(Map<String, dynamic> json) => RecentSeekerMatchesModel(
    status: json["status"],
    message: json["message"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
  var id;
  var makerId;
  var matchFrom;
  var matchWith;
  var matchType;
  var matchWithStatus;
  var  matchFromStatus;
  var status;
  var roomid;
  var  createdAt;
  var  updatedAt;
  Getseeker? getseeker;
  Getanotherseeker? getanotherseeker;

  Datum({
   this.id,
   this.makerId,
   this.matchFrom,
   this.matchWith,
   this.matchType,
   this.matchWithStatus,
   this.matchFromStatus,
   this.status,
   this.roomid,
   this.createdAt,
   this.updatedAt,
   this.getseeker,
   this.getanotherseeker,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    makerId: json["maker_id"],
    matchFrom: json["match_from"],
    matchWith: json["match_with"],
    matchType: json["match_type"],
    matchWithStatus: json["match_with_status"],
    matchFromStatus: json["match_from_status"],
    status: json["status"],
    roomid: json["roomid"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    getseeker: Getseeker.fromJson(json["getseeker"]),
    getanotherseeker: Getanotherseeker.fromJson(json["getanotherseeker"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "maker_id": makerId,
    "match_from": matchFrom,
    "match_with": matchWith,
    "match_type": matchType,
    "match_with_status": matchWithStatus,
    "match_from_status": matchFromStatus,
    "status": status,
    "roomid": roomid,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "getseeker": getseeker!.toJson(),
    "getanotherseeker": getanotherseeker!.toJson(),
  };
}

class Getanotherseeker {
  var id;
  var name;
  var email;
  var phone;
  var occupation;
  var  salary;
  var address;
  var height;
  var dob;
  var gender;
  var  religion;
  var currentStep;
  var imgPath;
  var videoPath;
  var occupationName;
  var likeStatus;
  GetanotherseekerDetails? details;

  Getanotherseeker({
   this.id,
   this.name,
   this.email,
   this.phone,
   this.occupation,
   this.salary,
   this.address,
   this.height,
   this.dob,
   this.gender,
   this.religion,
   this.currentStep,
   this.imgPath,
   this.videoPath,
   this.occupationName,
   this.likeStatus,
   this.details,
  });

  factory Getanotherseeker.fromJson(Map<String, dynamic> json) => Getanotherseeker(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    occupation: json["occupation"],
    salary: json["salary"],
    address: json["address"],
    height: json["height"],
    dob: json["dob"],
    gender: json["gender"],
    religion: json["religion"],
    currentStep: json["current_step"],
    imgPath: json["img_path"],
    videoPath: json["video_path"],
    occupationName: json["occupation_name"],
    likeStatus: json["like_status"],
    details: GetanotherseekerDetails.fromJson(json["details"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "occupation": occupation,
    "salary": salary,
    "address": address,
    "height": height,
    "dob": dob,
    "gender": gender,
    "religion": religion,
    "current_step": currentStep,
    "img_path": imgPath,
    "video_path": videoPath,
    "occupation_name": occupationName,
    "like_status": likeStatus,
    "details": details!.toJson(),
  };
}

class GetanotherseekerDetails {
  var id;
  var seekerId;
  var profileGallery;
  var inInterested;
  var  interest;
  var bioTitle;
  var bioDescription;
  var status;
  var  createdAt;
  var updatedAt;
  List<String> ?gallaryPath;
  List<InterestName> ?interestName;

  GetanotherseekerDetails({
   this.id,
   this.seekerId,
   this.profileGallery,
   this.inInterested,
   this.interest,
   this.bioTitle,
   this.bioDescription,
   this.status,
   this.createdAt,
   this.updatedAt,
   this.gallaryPath,
   this.interestName,
  });

  factory GetanotherseekerDetails.fromJson(Map<String, dynamic> json) => GetanotherseekerDetails(
    id: json["id"],
    seekerId: json["seeker_id"],
    profileGallery: json["profile_gallery"],
    inInterested: json["in_interested"],
    interest: json["interest"],
    bioTitle: json["bio_title"],
    bioDescription: json["bio_description"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    gallaryPath: json["gallary_path"]==null?[]:List<String>.from(json["gallary_path"].map((x) => x)),
    interestName: json["interest_name"]==null?[]:List<InterestName>.from(json["interest_name"].map((x) => InterestName.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "seeker_id": seekerId,
    "profile_gallery": profileGallery,
    "in_interested": inInterested,
    "interest": interest,
    "bio_title": bioTitle,
    "bio_description": bioDescription,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "gallary_path": List<dynamic>.from(gallaryPath!.map((x) => x)),
    "interest_name": List<dynamic>.from(interestName!.map((x) => x.toJson())),
  };
}

class InterestName {
  var title;

  InterestName({
   this.title,
  });

  factory InterestName.fromJson(Map<String, dynamic> json) => InterestName(
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
  };
}

class Getseeker {
  var id;
  var name;
  var email;
  var phone;
  var occupation;
  var salary;
  var address;
  var height;
  var dob;
  var gender;
  var religion;
  var currentStep;
  var imgPath;
  var videoPath;
  var occupationName;
  var likeStatus;
  GetseekerDetails? details;

  Getseeker({
   this.id,
   this.name,
   this.email,
   this.phone,
   this.occupation,
   this.salary,
   this.address,
   this.height,
   this.dob,
   this.gender,
   this.religion,
   this.currentStep,
   this.imgPath,
   this.videoPath,
   this.occupationName,
   this.likeStatus,
   this.details,
  });

  factory Getseeker.fromJson(Map<String, dynamic> json) => Getseeker(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    occupation: json["occupation"],
    salary: json["salary"],
    address: json["address"],
    height: json["height"],
    dob: json["dob"],
    gender: json["gender"],
    religion: json["religion"],
    currentStep: json["current_step"],
    imgPath: json["img_path"],
    videoPath: json["video_path"],
    occupationName: json["occupation_name"],
    likeStatus: json["like_status"],
    details: GetseekerDetails.fromJson(json["details"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "occupation": occupation,
    "salary": salary,
    "address": address,
    "height": height,
    "dob": dob,
    "gender": gender,
    "religion": religion,
    "current_step": currentStep,
    "img_path": imgPath,
    "video_path": videoPath,
    "occupation_name": occupationName,
    "like_status": likeStatus,
    "details": details!.toJson(),
  };
}

class GetseekerDetails {
  var id;
  var seekerId;
 var profileGallery;
  var inInterested;
  var interest;
  var bioTitle;
  var bioDescription;
  var status;
  var  createdAt;
  var updatedAt;
  List<String>? gallaryPath;
  List<InterestName> ?interestName;

  GetseekerDetails({
   this.id,
   this.seekerId,
   this.profileGallery,
   this.inInterested,
   this.interest,
   this.bioTitle,
   this.bioDescription,
   this.status,
   this.createdAt,
   this.updatedAt,
   this.gallaryPath,
   this.interestName,
  });

  factory GetseekerDetails.fromJson(Map<String, dynamic> json) => GetseekerDetails(
    id: json["id"],
    seekerId: json["seeker_id"],
    profileGallery: json["profile_gallery"],
    inInterested: json["in_interested"],
    interest: json["interest"],
    bioTitle: json["bio_title"],
    bioDescription: json["bio_description"],
    status: json["status"],
    createdAt: json["created_at"],
    updatedAt: json["updated_at"],
    gallaryPath:json["gallary_path"]==null?[]: List<String>.from(json["gallary_path"].map((x) => x)),
    interestName:json["interest_name"]==null?[]: List<InterestName>.from(json["interest_name"].map((x) => InterestName.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "seeker_id": seekerId,
    "profile_gallery": profileGallery,
    "in_interested": inInterested,
    "interest": interest,
    "bio_title": bioTitle,
    "bio_description": bioDescription,
    "status": status,
    "created_at": createdAt,
    "updated_at": updatedAt,
    "gallary_path": List<dynamic>.from(gallaryPath!.map((x) => x)),
    "interest_name": List<dynamic>.from(interestName!.map((x) => x.toJson())),
  };
}
