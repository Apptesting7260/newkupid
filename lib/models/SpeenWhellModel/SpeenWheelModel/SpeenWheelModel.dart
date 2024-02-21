// class SpeenWheelModel {
//   SpeenWheelModel({
//      this.status,
//      this.message,
//      this.seekerData,
//   });
//   var status;
// var message;
//  List<SeekerData> ?seekerData;

//   SpeenWheelModel.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     message = json['message'];
//     seekerData = List.from(json['seeker_data']).map((e)=>SeekerData.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['message'] = message;
//     _data['seeker_data'] = seekerData!.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }

// class SeekerData {
//   SeekerData({
//      this.id,
//      this.name,
//      this.email,
//      this.phone,
//     this.occupation,
//      this.address,
//      this.height,
//      this.dob,
//     this.gender,
//      this.zodiacId,
//      this.likeToHaveChildren,
//     this.doYouDrink,
//      this.doYouSmoke,
//      this.education,
//     this.hopingToFind,
//      this.currentStep,
//      this.imgPath,
//      this.videoPath,
//      this.occupationName,
//      this.likeStatus,
//      this.details,
//     this.questions,
//   });
//   var id;
//  var name;
//  var email;
//  var phone;
//  var occupation;
//  var address;
//  var height;
//  var dob;
//  var gender;
//   var zodiacId;
//  var likeToHaveChildren;
//  var doYouDrink;
//  var doYouSmoke;
//  var education;
//  var hopingToFind;
//   var currentStep;
//  var imgPath;
//  var videoPath;
// var occupationName;
//   var likeStatus;
//  Details ? details;
//   Questions? questions;


//   SeekerData.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     occupation = null;
//     address = json['address'];
//     height = json['height'];
//     dob = json['dob'];
//     gender = null;
//     zodiacId = json['zodiac_id'];
//     likeToHaveChildren = json['like_to_have_children'];
//     doYouDrink = null;
//     doYouSmoke = json['do_you_smoke'];
//     education = json['education'];
//     hopingToFind = null;
//     currentStep = json['current_step'];
//     imgPath = json['img_path'];
//     videoPath = json['video_path'];
//     occupationName = List.castFrom<dynamic, dynamic>(json['occupation_name']);
//     likeStatus = json['like_status'];
//     details = Details.fromJson(json['details']);
//     questions = Questions.fromJson(json['questions']);

//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['email'] = email;
//     _data['phone'] = phone;
//     _data['occupation'] = occupation;
//     _data['address'] = address;
//     _data['height'] = height;
//     _data['dob'] = dob;
//     _data['gender'] = gender;
//     _data['zodiac_id'] = zodiacId;
//     _data['like_to_have_children'] = likeToHaveChildren;
//     _data['do_you_drink'] = doYouDrink;
//     _data['do_you_smoke'] = doYouSmoke;
//     _data['education'] = education;
//     _data['hoping_to_find'] = hopingToFind;
//     _data['current_step'] = currentStep;
//     _data['img_path'] = imgPath;
//     _data['video_path'] = videoPath;
//     _data['occupation_name'] = occupationName;
//     _data['like_status'] = likeStatus;
//     _data['details'] = details!.toJson();
//     _data['questions'] = questions!.toJson();
//     return _data;
//   }
// }

// class Details {
//   Details({
//      this.id,
//      this.seekerId,
//      this.profileGallery,
//      this.inInterested,
//      this.interest,
//      this.bioTitle,
//      this.bioDescription,
//      this.status,
//      this.createdAt,
//      this.updatedAt,
//      this.gallaryPath,
//      this.interestName,
//   });
//   var id;
//   var seekerId;
//  var profileGallery;
//  var inInterested;
//  var interest;
//  var bioTitle;
//  var bioDescription;
//   var status;
//  var createdAt;
//  var updatedAt;
//    List<String>? gallaryPath;
//   List<InterestName>? interestName;

//   Details.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     seekerId = json['seeker_id'];
//     profileGallery = json['profile_gallery'];
//     inInterested = json['in_interested'];
//     interest = json['interest'];
//     bioTitle = json['bio_title'];
//     bioDescription = json['bio_description'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     gallaryPath = List.castFrom<dynamic, String>(json['gallary_path']);
//     interestName = List.from(json['interest_name']).map((e)=>InterestName.fromJson(e)).toList();
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['seeker_id'] = seekerId;
//     _data['profile_gallery'] = profileGallery;
//     _data['in_interested'] = inInterested;
//     _data['interest'] = interest;
//     _data['bio_title'] = bioTitle;
//     _data['bio_description'] = bioDescription;
//     _data['status'] = status;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     _data['gallary_path'] = gallaryPath;
//     _data['interest_name'] = interestName!.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }

// class InterestName {
//   InterestName({
//      this.title,
//   });
//  var title;

//   InterestName.fromJson(Map<String, dynamic> json){
//     title = json['title'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['title'] = title;
//     return _data;
//   }
// }
// class Questions {
//   Questions({
//      this.id,
//      this.seekerId,
//      this.question,
//      this.firstAnswer,
//      this.secondAnswer,
//      this.thirdAnswer,
//     this.correctAnswer,
//      this.status,
//      this.createdAt,
//      this.updatedAt,
//   });
//  var id;
//  var seekerId;
//   var question;
//   var firstAnswer;
//   var secondAnswer;
//   var thirdAnswer;
//   var  correctAnswer;
//  var status;
//   var createdAt;
//   var updatedAt;

//   Questions.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     seekerId = json['seeker_id'];
//     question = json['question'];
//     firstAnswer = json['first_answer'];
//     secondAnswer = json['second_answer'];
//     thirdAnswer = json['third_answer'];
//     correctAnswer = json['correct_answer'];
//     status = json['status'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }

//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['seeker_id'] = seekerId;
//     _data['question'] = question;
//     _data['first_answer'] = firstAnswer;
//     _data['second_answer'] = secondAnswer;
//     _data['third_answer'] = thirdAnswer;
//     _data['correct_answer'] = correctAnswer;
//     _data['status'] = status;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     return _data;
//   }
// }


class SpeenWheelModel {
  SpeenWheelModel({
    this.status,
    this.message,
    this.seekerData,
  });
  var status;
  var message;
   List<SeekerData>? seekerData;
  
  SpeenWheelModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    seekerData = List.from(json['seeker_data']).map((e)=>SeekerData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['seeker_data'] = seekerData!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class SeekerData {
  SeekerData({
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
    this.questions,
  });
   var id;
  var name;
  var email;
  var phone;
  var occupation;
  var address;
  var height;
  var dob;
  var gender;
  var religion;
   var zodiacId;
  var likeToHaveChildren;
  var doYouDrink;
  var doYouSmoke;
  var education;
  var hopingToFind;
   var currentStep;
  var imgPath;
  var videoPath;
  var occupationName;
   var likeStatus;
   Details? details;
   Questions? questions;
  
  SeekerData.fromJson(Map<String, dynamic> json){
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
    questions = Questions.fromJson(json['questions']);
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
    _data['questions'] = questions!.toJson();
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
   List<String> ?gallaryPath;
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
  var title;
  
  InterestName.fromJson(Map<String, dynamic> json){
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['title'] = title;
    return _data;
  }
}

class Questions {
  Questions({
    this.id,
    this.seekerId,
    this.question,
    this.firstAnswer,
    this.secondAnswer,
    this.thirdAnswer,
    this.correctAnswer,
    this.status,
    this.createdAt,
    this.updatedAt,
  });
   var id;
   var seekerId;
  var question;
  var firstAnswer;
  var secondAnswer;
  var thirdAnswer;
  var correctAnswer;
   var status;
  var createdAt;
  var updatedAt;
  
  Questions.fromJson(Map<String, dynamic> json){
    id = json['id'];
    seekerId = json['seeker_id'];
    question = json['question'];
    firstAnswer = json['first_answer'];
    secondAnswer = json['second_answer'];
    thirdAnswer = json['third_answer'];
    correctAnswer = json['correct_answer'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['seeker_id'] = seekerId;
    _data['question'] = question;
    _data['first_answer'] = firstAnswer;
    _data['second_answer'] = secondAnswer;
    _data['third_answer'] = thirdAnswer;
    _data['correct_answer'] = correctAnswer;
    _data['status'] = status;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}