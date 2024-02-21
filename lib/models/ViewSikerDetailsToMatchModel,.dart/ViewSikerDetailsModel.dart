import 'package:get/get.dart';

class ViewSikerDetailsToMatchModel {
  ViewSikerDetailsToMatchModel({
     this.status,
     this.message,
     this.profileDetails,
  });
   String? status;
   String? message;
   List<ProfileDetails> ?profileDetails;
  
  ViewSikerDetailsToMatchModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    profileDetails = List.from(json['ProfileDetails']).map((e)=>ProfileDetails.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['ProfileDetails'] = profileDetails!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ProfileDetails {
  ProfileDetails({
     this.id,
     this.name,
     this.email,
     this.phone,
     this.occupation,
     this.address,
     this.height,
     this.dob,
     this.gender,
     this.religion,
     this.zodiacId,
     this.likeToHaveChildren,
     this.doYouDrink,
     this.doYouSmoke,
     this.education,
     this.hopingToFind,
     this.currentStep,
     this.imgPath,
     this.videoPath,
     this.occupationName,
     this.likeStatus,
     this.details,
  });
   int? id;
   String? name;
   String ?email;
   String? phone;
   String? occupation;
   String? address;
   String? height;
   String? dob;
   String? gender;
   String ?religion;
   int ?zodiacId;
   String? likeToHaveChildren;
   String? doYouDrink;
   String? doYouSmoke;
   String? education;
   String? hopingToFind;
   int ?currentStep;
   String? imgPath;
   String? videoPath;
   String? occupationName;
   int ?likeStatus;
   RxBool loding=false.obs;
   Details ?details;
  
  ProfileDetails.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    occupation = json['occupation'];
    address = json['address'];
    height = json['height'];
    dob = json['dob'];
    gender = json['gender'];
    religion = json['religion'];
    zodiacId = json['zodiac_id'];
    likeToHaveChildren = json['like_to_have_children'];
    doYouDrink = json['do_you_drink'];
    doYouSmoke = json['do_you_smoke'];
    education = json['education'];
    hopingToFind = json['hoping_to_find'];
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
    _data['address'] = address;
    _data['height'] = height;
    _data['dob'] = dob;
    _data['gender'] = gender;
    _data['religion'] = religion;
    _data['zodiac_id'] = zodiacId;
    _data['like_to_have_children'] = likeToHaveChildren;
    _data['do_you_drink'] = doYouDrink;
    _data['do_you_smoke'] = doYouSmoke;
    _data['education'] = education;
    _data['hoping_to_find'] = hopingToFind;
    _data['current_step'] = currentStep;
    _data['img_path'] = imgPath;
    _data['video_path'] = videoPath;
    _data['occupation_name'] = occupationName;
    _data['like_status'] = likeStatus;
    _data['details'] = details!.toJson();
    return _data;
  }
}

class Details {
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
   int? id;
   int? seekerId;
   bool ?profileGallery;
   String? inInterested;
   String? interest;
   String ?bioTitle;
   String ?bioDescription;
   int ?status;
   String? createdAt;
   String? updatedAt;
   List<String>? gallaryPath;
   List<InterestName>? interestName;
  
  Details.fromJson(Map<String, dynamic> json){
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
    gallaryPath = List.castFrom<dynamic, String>(json['gallary_path']);
    interestName = List.from(json['interest_name']).map((e)=>InterestName.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['seeker_id'] = seekerId;
    _data['profile_gallery'] = profileGallery;
    _data['in_interested'] = inInterested;
    _data['interest'] = interest;
    _data['bio_title'] = bioTitle;
    _data['bio_description'] = bioDescription;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['gallary_path'] = gallaryPath;
    _data['interest_name'] = interestName!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class InterestName {
  InterestName({
     this.title,
  });
   String? title;
  
  InterestName.fromJson(Map<String, dynamic> json){
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    return _data;
  }
}