// class ViewSikerDetailsToMatchModel {
//   String? status;
//   List<ProfileDetails>? profileDetails;

//   ViewSikerDetailsToMatchModel({this.status, this.profileDetails});

//   factory ViewSikerDetailsToMatchModel.fromJson(Map<String, dynamic> json) {
//     return ViewSikerDetailsToMatchModel(
//       status: json['status'],
//       profileDetails: json['ProfileDetails'] != null
//           ? List<ProfileDetails>.from(
//               json['ProfileDetails'].map((x) => ProfileDetails.fromJson(x)))
//           : null,
//     );
//   }
// }

// class ProfileDetails {
//   var id;
//   String? name;
//   String? email;
//   String? phone;
//   String? occupation;
//   String? salary;
//   String? address;
//   String? height;
//   String? dob;
//   String? profileImg;
//   String? profileVideo;
//   String? gender;
//   String? religion;
//   dynamic currentStep;
//   String? imgPath;
//   String? videoPath;
//   String? occupationName;
//   var likeStatus;
//   Details? details;

//   ProfileDetails({
//     this.id,
//     this.name,
//     this.email,
//     this.phone,
//     this.occupation,
//     this.salary,
//     this.address,
//     this.height,
//     this.dob,
//     this.profileImg,
//     this.profileVideo,
//     this.gender,
//     this.religion,
//     this.currentStep,
//     this.imgPath,
//     this.videoPath,
//     this.occupationName,
//     this.likeStatus,
//     this.details,
//   });

//   factory ProfileDetails.fromJson(Map<String, dynamic> json) {
//     return ProfileDetails(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//       phone: json['phone'],
//       occupation: json['occupation'],
//       salary: json['salary'],
//       address: json['address'],
//       height: json['height'],
//       dob: json['dob'],
//       profileImg: json['profile_img'],
//       profileVideo: json['profile_video'],
//       gender: json['gender'],
//       religion: json['religion'],
//       currentStep: json['current_step'],
//       imgPath: json['img_path'],
//       videoPath: json['video_path'],
//       occupationName: json['occupation_name'],
//       likeStatus: json['like_status'],
//       details: Details.fromJson(json['details']),
//     );
//   }
// }

// class Details {
//   var id;
//   var seekerId;
//   bool? profileGallery;
//   String? inInterested;
//   dynamic interest; // Change the type to dynamic since it can be null or a string
//   String? bioTitle;
//   String? bioDescription;
//   var status;
//   String? createdAt;
//   String? updatedAt;
//   List<String>? gallaryPath; // Change the type to List<String>
//   List<InterestName>? interestName;

//   Details({
//     this.id,
//     this.seekerId,
//     this.profileGallery,
//     this.inInterested,
//     this.interest,
//     this.bioTitle,
//     this.bioDescription,
//     this.status,
//     this.createdAt,
//     this.updatedAt,
//     this.gallaryPath,
//     this.interestName,
//   });

//   factory Details.fromJson(Map<String, dynamic> json) {
//     return Details(
//       id: json['id'],
//       seekerId: json['seeker_id'],
//       profileGallery: json['profile_gallery'],
//       inInterested: json['in_interested'],
//       interest: json['interest'], // No need for special handling ?for null here
//       bioTitle: json['bio_title'],
//       bioDescription: json['bio_description'],
//       status: json['status'],
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//       gallaryPath: json['gallary_path'] != null
//           ? List<String>.from(json['gallary_path'])
//           : null,
//       interestName: json['interest_name'] != null
//           ? List<InterestName>.from(
//               json['interest_name'].map((x) => InterestName.fromJson(x)))
//           : null,
//     );
//   }
// }

// class InterestName {
//   String? title;

//   InterestName({this.title});

//   factory InterestName.fromJson(Map<String, dynamic> json) {
//     return InterestName(
//       title: json['title'],
//     );
//   }
// }



class ViewSikerDetailsToMatchModel {
  ViewSikerDetailsToMatchModel({
     this.status,
      this.profileDetails,
  });
   var status;
   List<ProfileDetails> ?profileDetails;
  
  ViewSikerDetailsToMatchModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    profileDetails = List.from(json['ProfileDetails']).map((e)=>ProfileDetails.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
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
  List<String>? gallaryPath;
  List<dynamic> ?interestName;
  
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
    interestName = List.castFrom<dynamic, dynamic>(json['interest_name']);
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
    _data['interest_name'] = interestName;
    return _data;
  }
}