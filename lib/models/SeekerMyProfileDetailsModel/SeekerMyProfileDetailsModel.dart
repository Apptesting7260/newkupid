class SeekerMyProfileDetailModelAutoGenerate {
  SeekerMyProfileDetailModelAutoGenerate({
     this.status,
     this.message,
     this.ProfileDetail,
     this.SpinLeverRequestedDat,
  });
   String ?status;
   String? message;
   ProfileDetails? ProfileDetail;
   SpinLeverRequestedData ?SpinLeverRequestedDat;
  
  SeekerMyProfileDetailModelAutoGenerate.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    ProfileDetail = ProfileDetails.fromJson(json['ProfileDetails']);
    SpinLeverRequestedDat = SpinLeverRequestedData.fromJson(json['SpinLeverRequestedData']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['ProfileDetails'] = ProfileDetail!.toJson();
    _data['SpinLeverRequestedData'] = SpinLeverRequestedDat!.toJson();
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
   Details ?details;
  
  ProfileDetails.fromJson(Map<String, dynamic> json){
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
   List<dynamic>? gallaryPath;
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
    createdAt = null;
    updatedAt = json['updated_at'];
    gallaryPath = List.castFrom<dynamic, dynamic>(json['gallary_path']);
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
   String ?title;
  
  InterestName.fromJson(Map<String, dynamic> json){
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    return _data;
  }
}

class SpinLeverRequestedData {
  SpinLeverRequestedData({
     this.leverpool,
     this.spin,
  });
   bool? leverpool;
   bool? spin;
  
  SpinLeverRequestedData.fromJson(Map<String, dynamic> json){
    leverpool = json['leverpool'];
    spin = json['spin'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['leverpool'] = leverpool;
    _data['spin'] = spin;
    return _data;
  }
}