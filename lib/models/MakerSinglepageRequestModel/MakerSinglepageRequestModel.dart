class MakersinglepageRequestModel {
  var status;
  var message;
  Data? data;

  MakersinglepageRequestModel({this.status, this.message, this.data});

  MakersinglepageRequestModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
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
  Getseeker? getseeker;
  Getseeker? getanotherseeker;

  Data(
      {this.id,
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
        this.getseeker,
        this.getanotherseeker});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    makerId = json['maker_id'];
    matchFrom = json['match_from'];
    matchWith = json['match_with'].toString();
    matchType = json['match_type'];
    matchWithStatus = json['match_with_status'];
    matchFromStatus = json['match_from_status'];
    makerVerified = json['maker_verified'];
    status = json['status'];
    roomid = json['roomid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    getmaker = json['getmaker'] != null
        ? new Getmaker.fromJson(json['getmaker'])
        : null;
    getseeker = json['getseeker'] != null
        ? new Getseeker.fromJson(json['getseeker'])
        : null;
    getanotherseeker = json['getanotherseeker'] != null
        ? new Getseeker.fromJson(json['getanotherseeker'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['maker_id'] = this.makerId;
    data['match_from'] = this.matchFrom;
    data['match_with'] = this.matchWith;
    data['match_type'] = this.matchType;
    data['match_with_status'] = this.matchWithStatus;
    data['match_from_status'] = this.matchFromStatus;
    data['maker_verified'] = this.makerVerified;
    data['status'] = this.status;
    data['roomid'] = this.roomid;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.getmaker != null) {
      data['getmaker'] = this.getmaker!.toJson();
    }
    if (this.getseeker != null) {
      data['getseeker'] = this.getseeker!.toJson();
    }
    if (this.getanotherseeker != null) {
      data['getanotherseeker'] = this.getanotherseeker!.toJson();
    }
    return data;
  }
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
  var profileVideo;
  var experience;
  var aboutMaker;
  var expectation;
  var headingOfMaker;
  var status;
  var currentStep;
  var imgPath;
  var videoPath;

  Getmaker(
      {this.id,
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
        this.videoPath});

  Getmaker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    dob = json['dob'];
    gender = json['gender'];
    location = json['location'];
    profileImg = json['profile_img'];
    profileVideo = json['profile_video'];
    experience = json['experience'];
    aboutMaker = json['about_maker'];
    expectation = json['expectation'];
    headingOfMaker = json['heading_of_maker'];
    status = json['status'];
    currentStep = json['current_step'];
    imgPath = json['img_path'];
    videoPath = json['video_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['location'] = this.location;
    data['profile_img'] = this.profileImg;
    data['profile_video'] = this.profileVideo;
    data['experience'] = this.experience;
    data['about_maker'] = this.aboutMaker;
    data['expectation'] = this.expectation;
    data['heading_of_maker'] = this.headingOfMaker;
    data['status'] = this.status;
    data['current_step'] = this.currentStep;
    data['img_path'] = this.imgPath;
    data['video_path'] = this.videoPath;
    return data;
  }
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
  Details? details;

  Getseeker(
      {this.id,
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
        this.details});

  Getseeker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    occupation = json['occupation'];
    salary = json['salary'];
    address = json['address'];
    height = json['height'];
    dob = json['dob'];
    gender = json['gender'];
    religion = json['religion'];
    currentStep = json['current_step'];
    imgPath = json['img_path'];
    videoPath = json['video_path'];
    occupationName = json['occupation_name'];
    likeStatus = json['like_status'];
    details =
    json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['occupation'] = this.occupation;
    data['salary'] = this.salary;
    data['address'] = this.address;
    data['height'] = this.height;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['religion'] = this.religion;
    data['current_step'] = this.currentStep;
    data['img_path'] = this.imgPath;
    data['video_path'] = this.videoPath;
    data['occupation_name'] = this.occupationName;
    data['like_status'] = this.likeStatus;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    return data;
  }
}

class Details {
  var id;
  var seekerId;
  bool? profileGallery;
  var inInterested;
  var interest;
  var bioTitle;
  var bioDescription;
  var status;
  var createdAt;
  var updatedAt;
  List<String>? gallaryPath;
  List<InterestName>? interestName;

  Details(
      {this.id,
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
        this.interestName});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seekerId = json['seeker_id'];
    profileGallery = json['profile_gallery'];
    inInterested = json['in_interested'];
    interest = json['interest'];
    bioTitle = json['bio_title'];
    bioDescription = json['bio_description'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    gallaryPath = json['gallary_path'].cast<String>();
    if (json['interest_name'] != null) {
      interestName = <InterestName>[];
      json['interest_name'].forEach((v) {
        interestName!.add(new InterestName.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seeker_id'] = this.seekerId;
    data['profile_gallery'] = this.profileGallery;
    data['in_interested'] = this.inInterested;
    data['interest'] = this.interest;
    data['bio_title'] = this.bioTitle;
    data['bio_description'] = this.bioDescription;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['gallary_path'] = this.gallaryPath;
    if (this.interestName != null) {
      data['interest_name'] =
          this.interestName!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class InterestName {
  var title;

  InterestName({this.title});

  InterestName.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    return data;
  }
}

