//
// class StaticLiverPullModel {
//   StaticLiverPullModel({
//      this.status,
//      this.message,
//      this.data,
//   });
//    String? status;
//  String? message;
//    List<Data> ?data;
//
//   StaticLiverPullModel.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     message = json['message'];
//     data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['message'] = message;
//     _data['data'] = data!.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class Data {
//   Data({
//      this.id,
//      this.name,
//      this.email,
//      this.phone,
//      this.occupation,
//      this.salary,
//      this.address,
//      this.height,
//      this.dob,
//      this.gender,
//      this.religion,
//      this.currentStep,
//      this.imgPath,
//      this.videoPath,
//      this.occupationName,
//      this.likeStatus,
//      this.spinLeverpoolRequestedData,
//   });
//   var id;
//  var name;
//  var email;
//  var phone;
//  var occupation;
//  var salary;
//  var address;
//  var height;
//  var dob;
//  var gender;
//  var religion;
//   var currentStep;
//  var imgPath;
//  var videoPath;
//  List<dynamic>? occupationName;
//   var likeStatus;
//  SpinLeverpoolRequestedData? spinLeverpoolRequestedData;
//
//   Data.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     occupation = json['occupation'];
//     salary = json['salary'];
//     address = json['address'];
//     height = json['height'];
//     dob = json['dob'];
//     gender = json['gender'];
//     religion = json['religion'];
//     currentStep = json['current_step'];
//     imgPath = json['img_path'];
//     videoPath = json['video_path'];
//     occupationName = List.castFrom<dynamic, dynamic>(json['occupation_name']);
//     likeStatus = json['like_status'];
//     spinLeverpoolRequestedData = SpinLeverpoolRequestedData.fromJson(json['spin_leverpool_requested_data']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['email'] = email;
//     _data['phone'] = phone;
//     _data['occupation'] = occupation;
//     _data['salary'] = salary;
//     _data['address'] = address;
//     _data['height'] = height;
//     _data['dob'] = dob;
//     _data['gender'] = gender;
//     _data['religion'] = religion;
//     _data['current_step'] = currentStep;
//     _data['img_path'] = imgPath;
//     _data['video_path'] = videoPath;
//     _data['occupation_name'] = occupationName;
//     _data['like_status'] = likeStatus;
//     _data['spin_leverpool_requested_data'] = spinLeverpoolRequestedData!.toJson();
//     return _data;
//   }
// }
//
// class SpinLeverpoolRequestedData {
//   SpinLeverpoolRequestedData({
//      this.id,
//      this.seekerId,
//      this.leverpoolRequestTime,
//      this.leverpoolRequestCount,
//      this.showExpireTime,
//      this.hoursRemaining,
//      this.spinRequestData,
//      this.spinLiverRequestedStatus,
//   });
//   var id;
//   var seekerId;
//  var leverpoolRequestTime;
//   var leverpoolRequestCount;
//  var showExpireTime;
//  var hoursRemaining;
//    List<SpinRequestData>? spinRequestData;
//    bool? spinLiverRequestedStatus;
//
//   SpinLeverpoolRequestedData.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     seekerId = json['seeker_id'];
//     leverpoolRequestTime = json['leverpool_request_time'];
//     leverpoolRequestCount = json['leverpool_request_count'];
//     showExpireTime = json['show_expire_Time'];
//     hoursRemaining = json['hours_remaining'];
//     spinRequestData = List.from(json['spin_request_data']).map((e)=>SpinRequestData.fromJson(e)).toList();
//     spinLiverRequestedStatus = json['spin_liver_requested_status'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['seeker_id'] = seekerId;
//     _data['leverpool_request_time'] = leverpoolRequestTime;
//     _data['leverpool_request_count'] = leverpoolRequestCount;
//     _data['show_expire_Time'] = showExpireTime;
//     _data['hours_remaining'] = hoursRemaining;
//     _data['spin_request_data'] = spinRequestData!.map((e)=>e.toJson()).toList();
//     _data['spin_liver_requested_status'] = spinLiverRequestedStatus;
//     return _data;
//   }
// }
//
// class SpinRequestData {
//   SpinRequestData({
//      this.seekerData,
//      this.isRequested,
//   });
//  SeekerData? seekerData;
//  bool? isRequested;
//
//   SpinRequestData.fromJson(Map<String, dynamic> json){
//     seekerData = SeekerData.fromJson(json['seeker_data']);
//     isRequested = json['is_requested'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['seeker_data'] = seekerData!.toJson();
//     _data['is_requested'] = isRequested;
//     return _data;
//   }
// }
//
// class SeekerData {
//   SeekerData({
//      this.id,
//      this.name,
//      this.email,
//      this.phone,
//     this.occupation,
//      this.salary,
//      this.address,
//      this.height,
//      this.dob,
//     this.gender,
//      this.religion,
//      this.currentStep,
//      this.imgPath,
//      this.videoPath,
//      this.occupationName,
//      this.likeStatus,
//      this.questions,
//   });
//   var id;
//  var name;
//  var email;
//  var phone;
//  var occupation;
//  var salary;
//  var address;
//  var height;
//  var dob;
//  var gender;
//  var religion;
//   var currentStep;
//  var imgPath;
//  var videoPath;
//    List<dynamic>? occupationName;
//   var likeStatus;
//    Questions? questions;
//
//   SeekerData.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     occupation = null;
//     salary = json['salary'];
//     address = json['address'];
//     height = json['height'];
//     dob = json['dob'];
//     gender = json['occupation_name'];
//     religion = json['religion'];
//     currentStep = json['current_step'];
//     imgPath = json['img_path'];
//     videoPath = json['video_path'];
//     occupationName = List.castFrom<dynamic, dynamic>(json['occupation_name']);
//     likeStatus = json['like_status'];
//     questions = Questions.fromJson(json['questions']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['email'] = email;
//     _data['phone'] = phone;
//     _data['occupation'] = occupation;
//     _data['salary'] = salary;
//     _data['address'] = address;
//     _data['height'] = height;
//     _data['dob'] = dob;
//     _data['gender'] = gender;
//     _data['religion'] = religion;
//     _data['current_step'] = currentStep;
//     _data['img_path'] = imgPath;
//     _data['video_path'] = videoPath;
//     _data['occupation_name'] = occupationName;
//     _data['like_status'] = likeStatus;
//     _data['questions'] = questions!.toJson();
//     return _data;
//   }
// }
//
// class Questions {
//   Questions({
//      this.id,
//      this.seekerId,
//      this.question,
//      this.firstAnswer,
//      this.secondAnswer,
//      this.thirdAnswer,
//      this.correctAnswer,
//      this.status,
//      this.createdAt,
//      this.updatedAt,
//   });
//   var id;
//   var seekerId;
//  var question;
//  var firstAnswer;
//  var secondAnswer;
//  var thirdAnswer;
//  var correctAnswer;
//   var status;
//  var createdAt;
//  var updatedAt;
//
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
//
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


class StaticLiverPullModel {
  StaticLiverPullModel({
     this.status,
     this.message,
     this.data,
  });
   String? status;
   String ?message;
   List<Data> ?data;

  StaticLiverPullModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
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
     this.spinLeverpoolRequestedData,
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
   SpinLeverpoolRequestedData ?spinLeverpoolRequestedData;

  Data.fromJson(Map<String, dynamic> json){
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
    spinLeverpoolRequestedData = SpinLeverpoolRequestedData.fromJson(json['spin_leverpool_requested_data']);
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
    _data['spin_leverpool_requested_data'] = spinLeverpoolRequestedData!.toJson();
    return _data;
  }
}

class SpinLeverpoolRequestedData {
  SpinLeverpoolRequestedData({
     this.id,
     this.seekerId,
     this.showExpireTime,
     this.leverpoolRequestCount,
     this.hoursRemaining,
     this.spinRequestData,
     this.spinLiverRequestedStatus,
  });
   var id;
   var seekerId;
   var showExpireTime;
var leverpoolRequestCount;
   var hoursRemaining;
   List<SpinRequestData> ?spinRequestData;
   var spinLiverRequestedStatus;

  SpinLeverpoolRequestedData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    seekerId = json['seeker_id'];
    showExpireTime = json['show_expire_Time'];
    leverpoolRequestCount = json['leverpool_request_count'];


    hoursRemaining = json['hours_remaining'];
    spinRequestData = List.from(json['spin_request_data']).map((e)=>SpinRequestData.fromJson(e)).toList();
    spinLiverRequestedStatus = json['spin_liver_requested_status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['seeker_id'] = seekerId;
    _data['show_expire_Time'] = showExpireTime;
_data['leverpool_request_count'] = leverpoolRequestCount;
    _data['hours_remaining'] = hoursRemaining;
    _data['spin_request_data'] = spinRequestData!.map((e)=>e.toJson()).toList();
    _data['spin_liver_requested_status'] = spinLiverRequestedStatus;
    return _data;
  }
}

class SpinRequestData {
  SpinRequestData({
     this.seekerData,
     this.isRequested,
  });
   SeekerData ?seekerData;
   var isRequested;

  SpinRequestData.fromJson(Map<String, dynamic> json){
    seekerData = SeekerData.fromJson(json['seeker_data']);
    isRequested = json['is_requested'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['seeker_data'] = seekerData!.toJson();
    _data['is_requested'] = isRequested;
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
     this.questions,
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
   Questions? questions;

  SeekerData.fromJson(Map<String, dynamic> json){
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
    currentStep = json['currentStep'];
    imgPath = json['img_path'];
    videoPath = json['video_path'];
    occupationName = json['occupation_name'];
    likeStatus = json['like_status'];
    questions = Questions.fromJson(json['questions']);
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
    _data['questions'] = questions!.toJson();
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