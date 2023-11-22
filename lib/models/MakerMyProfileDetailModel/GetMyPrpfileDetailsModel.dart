class MakerMyprofileDetailsModel {
  MakerMyprofileDetailsModel({
     this.status,
     this.message,
     this.requests,
  });
   String? status;
  String? message;
  Requests ?requests;

  MakerMyprofileDetailsModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    requests = Requests.fromJson(json['requests']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['requests'] = requests!.toJson();
    return _data;
  }
}

class Requests {
  Requests({
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

  Requests.fromJson(Map<String, dynamic> json){
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
    if (json['details'] != null) {
      details = Details.fromJson(json['details']);
    }
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