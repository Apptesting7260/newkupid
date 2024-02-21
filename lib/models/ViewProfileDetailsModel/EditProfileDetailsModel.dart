//
//




import 'EditProfileDetailsModel.dart';

class EditViewprofileDetailsModel {
  EditViewprofileDetailsModel({
     this.status,
     this.UserData,
  });
 String ?status;
 UerData? UserData;

  EditViewprofileDetailsModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    UserData = UerData.fromJson(json['UerData']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['UerData'] = UserData!.toJson();
    return _data;
  }
}

class UerData {
  UerData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.occupation,
    required this.address,
    required this.height,
    required this.dob,
    required this.gender,
    this.religion,
    required this.zodiacId,
    required this.likeToHaveChildren,
    required this.doYouDrink,
    required this.doYouSmoke,
    required this.education,
    required this.hopingToFind,
    required this.currentStep,
    required this.question,
    required this.firstAnswer,
    required this.secondAnswer,
    required this.thirdAnswer,
    required this.correctAnswer,
    required this.imgPath,
    required this.videoPath,
    required this.occupationName,
    required this.likeStatus,
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
  late final Null religion;
  var zodiacId;
  var likeToHaveChildren;
  var doYouDrink;
  var doYouSmoke;
  var education;
  var hopingToFind;
  var currentStep;
  var question;
  var firstAnswer;
  var secondAnswer;
  var thirdAnswer;
  var correctAnswer;
  var imgPath;
  var videoPath;
  var occupationName;
  var likeStatus;

  UerData.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    occupation = json['occupation'];
    address = json['address'];
    height = json['height'];
    dob = json['dob'];
    gender = json['gender'];
    zodiacId = json['zodiac_id'];
    likeToHaveChildren = json['like_to_have_children'];
    doYouDrink = json['do_you_drink'];
    doYouSmoke = json['do_you_smoke'];
    education = json['education'];
    hopingToFind = json['hoping_to_find'];
    currentStep = json['current_step'];
    question = json['question'];
    firstAnswer = json['first_answer'];
    secondAnswer = json['second_answer'];
    thirdAnswer = json['third_answer'];
    correctAnswer = json['correct_answer'];
    imgPath = json['img_path'];
    videoPath = json['video_path'];
    occupationName = json['occupation_name'];
    likeStatus = json['like_status'];
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
    _data['question'] = question;
    _data['first_answer'] = firstAnswer;
    _data['second_answer'] = secondAnswer;
    _data['third_answer'] = thirdAnswer;
    _data['correct_answer'] = correctAnswer;
    _data['img_path'] = imgPath;
    _data['video_path'] = videoPath;
    _data['occupation_name'] = occupationName;
    _data['like_status'] = likeStatus;
    return _data;
  }
}
//
//
//
// class EditViewprofileDetailsModel {
//   EditViewprofileDetailsModel({
//     this.status,
//     this.UerDatas,
//   });
//   String? status;
//   UerData? UerDatas;
//
//   EditViewprofileDetailsModel.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     UerDatas = UerData.fromJson(json['UerData']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['UerData'] = UerDatas?.toJson();
//     return _data;
//   }
// }
//
// class UerData {
//   UerData({
//     this.id,
//     this.name,
//     this.email,
//     this.phone,
//     this.occupation,
//     this.address,
//     this.height,
//     this.dob,
//     this.gender,
//     this.likeToHaveChildren,
//     this.doYouDrink,
//     this.doYouSmoke,
//     this.education,
//     this.hopingToFind,
//     this.currentStep,
//     this.question,
//     this.firstAnswer,
//     this.secondAnswer,
//     this.thirdAnswer,
//     this.correctAnswer,
//     this.imgPath,
//     this.videoPath,
//     this.occupationName,
//     this.likeStatus,
//   });
//   int? id;
//   String? name;
//   String? email;
//   String? phone;
//   String? occupation;
//   String? address;
//   String? height;
//   String? dob;
//   String? gender;
//   String? likeToHaveChildren;
//   String? doYouDrink;
//   String? doYouSmoke;
//   String? education;
//   String? hopingToFind;
//   int? currentStep;
//   String? question;
//   String? firstAnswer;
//   String? secondAnswer;
//   String? thirdAnswer;
//   String? correctAnswer;
//   String? imgPath;
//   String? videoPath;
//   List<dynamic>? occupationName;
//   int? likeStatus;
//
//   UerData.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     occupation = json['occupation'];
//     address = json['address'];
//     height = json['height'];
//     dob = json['dob'];
//     gender = json['gender'];
//     likeToHaveChildren = json['like_to_have_children'];
//     doYouDrink = json['do_you_drink'];
//     doYouSmoke = json['do_you_smoke'];
//     education = json['education'];
//     hopingToFind = json['hoping_to_find'];
//     currentStep = json['current_step'];
//     question = json['question'];
//     firstAnswer = json['first_answer'];
//     secondAnswer = json['second_answer'];
//     thirdAnswer = json['third_answer'];
//     correctAnswer = json['correct_answer'];
//     imgPath = json['img_path'];
//     videoPath = json['video_path'];
//     occupationName = List.castFrom<dynamic, dynamic>(json['occupation_name']);
//     likeStatus = json['like_status'];
//   }
//
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
//     _data['like_to_have_children'] = likeToHaveChildren;
//     _data['do_you_drink'] = doYouDrink;
//     _data['do_you_smoke'] = doYouSmoke;
//     _data['education'] = education;
//     _data['hoping_to_find'] = hopingToFind;
//     _data['current_step'] = currentStep;
//     _data['question'] = question;
//     _data['first_answer'] = firstAnswer;
//     _data['second_answer'] = secondAnswer;
//     _data['third_answer'] = thirdAnswer;
//     _data['correct_answer'] = correctAnswer;
//     _data['img_path'] = imgPath;
//     _data['video_path'] = videoPath;
//     _data['occupation_name'] = occupationName;
//     _data['like_status'] = likeStatus;
//     return _data;
//   }
// }
