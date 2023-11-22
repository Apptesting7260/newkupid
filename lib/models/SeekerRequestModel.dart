class SeekerOutgoingRequestModel {
  String? status;
  String? message;
  Requests? requests;

  SeekerOutgoingRequestModel({
    this.status,
    this.message,
    this.requests,
  });

  factory SeekerOutgoingRequestModel.fromJson(Map<String, dynamic> json) {
    return SeekerOutgoingRequestModel(
      status: json["status"],
      message: json["message"],
      requests: json["requests"] is List
          ? Requests(toMaker: [], toSeeker: [])
          : Requests.fromJson(json["requests"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "requests": requests?.toJson(),
  };
}

class Requests {
  List<ToKer>? toMaker;
  List<ToKer>? toSeeker;

  Requests({
    this.toMaker,
    this.toSeeker,
  });

  factory Requests.fromJson(Map<String, dynamic> json) {
    if (json["to_maker"] is List && json["to_seeker"] is List) {
      return Requests(
        toMaker: List<ToKer>.from(json["to_maker"].map((x) => ToKer.fromJson(x))),
        toSeeker: List<ToKer>.from(json["to_seeker"].map((x) => ToKer.fromJson(x))),
      );
    } else {
      return Requests(toMaker: [], toSeeker: []);
    }
  }

  Map<String, dynamic> toJson() => {
    "to_maker": toMaker == null
        ? []
        : List<dynamic>.from(toMaker!.map((x) => x.toJson())),
    "to_seeker": toSeeker == null
        ? []
        : List<dynamic>.from(toSeeker!.map((x) => x.toJson())),
  };
}



class ToKer {
 var id;
 var makerId;
 var matchFrom;
 var matchWith;
 var matchType;
  var matchWithStatus;
  var matchFromStatus;
  var makerVerified;
 var status;
 var roomid;
  var createdAt;
  var updatedAt;
  Getmaker? getmaker;
  OutgoingReqGetseeker? outgoingReqGetseeker;

  ToKer({
    this.id,
    this.makerId,
    this.matchFrom,
    this.matchWith,
    this.matchType,
    this.matchWithStatus,
    this.matchFromStatus,
    this.makerVerified,
    this.status,
    this.roomid,
    this.createdAt,
    this.updatedAt,
    this.getmaker,
    this.outgoingReqGetseeker,
  });

  factory ToKer.fromJson(Map<String, dynamic> json) => ToKer(
    id: json["id"],
    makerId: json["maker_id"],
    matchFrom: json["match_from"],
    matchWith: json["match_with"],
    matchType: json["match_type"],
    matchWithStatus: json["match_with_status"],
    matchFromStatus: json["match_from_status"],
    makerVerified: json["maker_verified"],

    status: json["status"],
    roomid: json["roomid"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    getmaker: json["getmaker"] == null ? null : Getmaker.fromJson(json["getmaker"]),
    outgoingReqGetseeker: json["outgoing_req_getseeker"] == null ? null : OutgoingReqGetseeker.fromJson(json["outgoing_req_getseeker"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "maker_id": makerId,
    "match_from": matchFrom,
    "match_with": matchWith,
    "match_type": matchType,
    "match_with_status": matchWithStatus,
    "match_from_status": matchFromStatus,
    'maker_verified': makerVerified,
    "status": status,
    "roomid": roomid,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "getmaker": getmaker?.toJson(),
    "outgoing_req_getseeker": outgoingReqGetseeker?.toJson(),
  };
}

class Getmaker {
 var id;
  var name;
  var email;
  var phone;
  var dob;
  var gender;
  var location;
  var profileImg;
  dynamic profileVideo;
  dynamic experience;
  var aboutMaker;
  var expectation;
  var headingOfMaker;
 var status;
 var currentStep;
  var imgPath;
  var videoPath;

  Getmaker({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.dob,
    this.gender,
    this.location,
    this.profileImg,
    this.profileVideo,
    this.experience,
    this.aboutMaker,
    this.expectation,
    this.headingOfMaker,
    this.status,
    this.currentStep,
    this.imgPath,
    this.videoPath,
  });

  factory Getmaker.fromJson(Map<String, dynamic> json) => Getmaker(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phone: json["phone"],
    dob: json["dob"],
    gender: json["gender"],
    location: json["location"],
    profileImg: json["profile_img"],
    profileVideo: json["profile_video"],
    experience: json["experience"],
    aboutMaker: json["about_maker"],
    expectation: json["expectation"],
    headingOfMaker: json["heading_of_maker"],
    status: json["status"],
    currentStep: json["current_step"],
    imgPath: json["img_path"],
    videoPath: json["video_path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "phone": phone,
    "dob": dob,
    "gender": gender,
    "location": location,
    "profile_img": profileImg,
    "profile_video": profileVideo,
    "experience": experience,
    "about_maker": aboutMaker,
    "expectation": expectation,
    "heading_of_maker": headingOfMaker,
    "status": status,
    "current_step": currentStep,
    "img_path": imgPath,
    "video_path": videoPath,
  };
}

class OutgoingReqGetseeker {
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
  Details? details;

  OutgoingReqGetseeker({
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

  factory OutgoingReqGetseeker.fromJson(Map<String, dynamic> json) => OutgoingReqGetseeker(
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
    details: json["details"] == null ? null : Details.fromJson(json["details"]),
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
    "details": details?.toJson(),
  };
}

class Details {
 var id;
 var seekerId;
  var profileGallery;
  var inInterested;
  var interest;
  var bioTitle;
  var bioDescription;
 var status;
  var createdAt;
  var updatedAt;
  List<String>? gallaryPath;
  List<InterestName>? interestName;

  Details({
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

  factory Details.fromJson(Map<String, dynamic> json) => Details(
    id: json["id"],
    seekerId: json["seeker_id"],
    profileGallery: json["profile_gallery"],
    inInterested: json["in_interested"],
    interest: json["interest"],
    bioTitle: json["bio_title"],
    bioDescription: json["bio_description"],
    status: json["status"],
    createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
    updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    gallaryPath: json["gallary_path"] == null ? [] : List<String>.from(json["gallary_path"]!.map((x) => x)),
    interestName: json["interest_name"] == null ? [] : List<InterestName>.from(json["interest_name"]!.map((x) => InterestName.fromJson(x))),
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
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "gallary_path": gallaryPath == null ? [] : List<dynamic>.from(gallaryPath!.map((x) => x)),
    "interest_name": interestName == null ? [] : List<dynamic>.from(interestName!.map((x) => x.toJson())),
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






