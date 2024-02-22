class MakerEditProfileModel {
  MakerEditProfileModel({
     this.status,
     this.UerData,
  });
 String? status;
   UserData? UerData;

  MakerEditProfileModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    UerData = UserData.fromJson(json['UerData']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['UerData'] = UerData!.toJson();
    return _data;
  }
}

class UserData {
  UserData({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
    required this.dob,
    required this.gender,
    required this.location,
    required this.profileImg,
    required this.profileVideo,
    required this.experience,
    required this.aboutMaker,
    required this.expectation,
    required this.headingOfMaker,
    required this.status,
    this.currentStep,
    required this.imgPath,
    required this.videoPath,
    required this.likeStatus,
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
 var likeStatus;

  UserData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = null;
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
    currentStep = null;
    imgPath = json['img_path'];
    videoPath = json['video_path'];
    likeStatus = json['like_status'];
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
    _data['like_status'] = likeStatus;
    return _data;
  }
}