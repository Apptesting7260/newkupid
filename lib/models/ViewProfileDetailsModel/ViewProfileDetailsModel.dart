class ViewProfileDetailsModel {
  ViewProfileDetailsModel({
     this.status,
     this.ProfileDetail,
  });
  dynamic status;
   ProfileDetails ?ProfileDetail;
  
  ViewProfileDetailsModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    ProfileDetail = ProfileDetails.fromJson(json['ProfileDetails']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['ProfileDetails'] = ProfileDetail!.toJson();
    return _data;
  }
}

class ProfileDetails {
  ProfileDetails({
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
     this.matchMade,
     this.matchsSuccessfull,
     this.matchsDeclined,
     this.matchsCompleted,
     this.makerExperience,
     this.likedProfile,
     this.imgPath,
     this.videoPath,
     this.details,
  });
   int ?id;
  dynamic name;
  dynamic email;
  dynamic phone;
  dynamic dob;
  dynamic gender;
  dynamic location;
  dynamic profileImg;
  dynamic profileVideo;
  dynamic experience;
  dynamic aboutMaker;
  dynamic expectation;
  dynamic headingOfMaker;
   int ?status;
   int ?currentStep;
  dynamic matchMade;
  dynamic matchsSuccessfull;
  dynamic matchsDeclined;
  dynamic matchsCompleted;
  dynamic makerExperience;
  dynamic likedProfile;
  dynamic imgPath;
  dynamic videoPath;
   Details? details;
  
  ProfileDetails.fromJson(Map<String, dynamic> json){
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
    matchMade = json['match_made'];
    matchsSuccessfull = json['matchs_successfull'];
    matchsDeclined = json['matchs_declined'];
    matchsCompleted = json['matchs_completed'];
    makerExperience = json['maker_experience'];
    likedProfile = json['liked_profile'];
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
    _data['match_made'] = matchMade;
    _data['matchs_successfull'] = matchsSuccessfull;
    _data['matchs_declined'] = matchsDeclined;
    _data['matchs_completed'] = matchsCompleted;
    _data['maker_experience'] = makerExperience;
    _data['liked_profile'] = likedProfile;
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
   int? id;
  dynamic makerId;
  dynamic nationality;
  dynamic verificationMethod;
  dynamic idProof;
  dynamic bankName;
  dynamic makerFullName;
  dynamic accountNumber;
  dynamic ifscCode;
  dynamic status;
  dynamic createdAt;
  dynamic updatedAt;
  
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