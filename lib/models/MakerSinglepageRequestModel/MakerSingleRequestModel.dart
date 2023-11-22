class MakerSingleRequestPageModel {
  MakerSingleRequestPageModel({
     this.status,
     this.message,
     this.data,
  });
  String? status;
  String? message;
   Data? data;

  MakerSingleRequestPageModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data!.toJson();
    return _data;
  }
}

class Data {
  Data({
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
     this.getmaker,
     this.getseeker,
     this.getanotherseeker,
  });
  var id;
  var makerId;
  var matchFrom;
  var matchWith;
  var matchType;
  var matchWithStatus;
  var matchFromStatus;
  var status;
  var roomid;
  var createdAt;
  var updatedAt;
 Getmaker? getmaker;
 Getseeker? getseeker;
 Getanotherseeker? getanotherseeker;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    makerId = json['maker_id'];
    matchFrom = json['match_from'];
    matchWith = json['match_with'];
    matchType = json['match_type'];
    matchWithStatus = json['match_with_status'];
    matchFromStatus = json['match_from_status'];
    status = json['status'];
    roomid = json['roomid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    getmaker = Getmaker.fromJson(json['getmaker']);
    getseeker = Getseeker.fromJson(json['getseeker']);
    getanotherseeker = Getanotherseeker.fromJson(json['getanotherseeker']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['maker_id'] = makerId;
    _data['match_from'] = matchFrom;
    _data['match_with'] = matchWith;
    _data['match_type'] = matchType;
    _data['match_with_status'] = matchWithStatus;
    _data['match_from_status'] = matchFromStatus;
    _data['status'] = status;
    _data['roomid'] = roomid;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['getmaker'] = getmaker!.toJson();
    _data['getseeker'] = getseeker!.toJson();
    _data['getanotherseeker'] = getanotherseeker!.toJson();
    return _data;
  }
}

class Getmaker {
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
     this.details,
  });
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
 Details? details;

  Getmaker.fromJson(Map<String, dynamic> json){
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
    details = Details.fromJson(json['details']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['dob'] = dob;
    _data['gender'] = gender;
    _data['location'] = location;
    _data['profile_img'] = profileImg;
    _data['profile_video'] = profileVideo;
    _data['experience'] = experience;
    _data['about_maker'] = aboutMaker;
    _data['expectation'] = expectation;
    _data['heading_of_maker'] = headingOfMaker;
    _data['status'] = status;
    _data['current_step'] = currentStep;
    _data['img_path'] = imgPath;
    _data['video_path'] = videoPath;
    _data['details'] = details!.toJson();
    return _data;
  }
}

class Details {
  Details({
     this.id,
     this.makerId,
     this.nationality,
     this.verificationMethod,
     this.idProof,
     this.bankName,
     this.makerFullName,
     this.accountNumber,
     this.ifscCode,
     this.status,
     this.createdAt,
     this.updatedAt,
  });
  var id;
  var makerId;
  var nationality;
  var verificationMethod;
  var idProof;
  var bankName;
  var makerFullName;
  var accountNumber;
  var ifscCode;
  var status;
  var createdAt;
  var updatedAt;

  Details.fromJson(Map<String, dynamic> json){
    id = json['id'];
    makerId = json['maker_id'];
    nationality = json['nationality'];
    verificationMethod = json['verification_method'];
    idProof = json['id_proof'];
    bankName = json['bank_name'];
    makerFullName = json['maker_full_name'];
    accountNumber = json['account_number'];
    ifscCode = json['ifsc_code'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['maker_id'] = makerId;
    _data['nationality'] = nationality;
    _data['verification_method'] = verificationMethod;
    _data['id_proof'] = idProof;
    _data['bank_name'] = bankName;
    _data['maker_full_name'] = makerFullName;
    _data['account_number'] = accountNumber;
    _data['ifsc_code'] = ifscCode;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}

class Getseeker {
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

  Getseeker.fromJson(Map<String, dynamic> json){
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
    details = Details.fromJson(json['details']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['occupation'] = occupation;
    _data['salary'] = salary;
    _data['address'] = address;
    _data['height'] = height;
    _data['dob'] = dob;
    _data['gender'] = gender;
    _data['religion'] = religion;
    _data['current_step'] = currentStep;
    _data['img_path'] = imgPath;
    _data['video_path'] = videoPath;
    _data['occupation_name'] = occupationName;
    _data['like_status'] = likeStatus;
    _data['details'] = details!.toJson();
    return _data;
  }
}

class Getanotherseeker {
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

  Getanotherseeker.fromJson(Map<String, dynamic> json){
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
    details = Details.fromJson(json['details']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['occupation'] = occupation;
    _data['salary'] = salary;
    _data['address'] = address;
    _data['height'] = height;
    _data['dob'] = dob;
    _data['gender'] = gender;
    _data['religion'] = religion;
    _data['current_step'] = currentStep;
    _data['img_path'] = imgPath;
    _data['video_path'] = videoPath;
    _data['occupation_name'] = occupationName;
    _data['like_status'] = likeStatus;
    _data['details'] = details!.toJson();
    return _data;
  }
}