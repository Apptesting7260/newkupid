class SpeendRequestModel {
  var status;
  var message;
  List<Data>? data;

  SpeendRequestModel({this.status, this.message, this.data});

  SpeendRequestModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
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
  SpinLeverpoolRequestedData? spinLeverpoolRequestedData;

  Data(
      {this.id,
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
      this.spinLeverpoolRequestedData});

  Data.fromJson(Map<String, dynamic> json) {
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
    spinLeverpoolRequestedData = json['spin_leverpool_requested_data'] != null
        ? new SpinLeverpoolRequestedData.fromJson(
            json['spin_leverpool_requested_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['occupation'] = this.occupation;
    data['salary'] = this.salary;
    data['address'] = this.address;
    data['height'] = this.height;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['religion'] = this.religion;
    data['current_step'] = this.currentStep;
    data['img_path'] = this.imgPath;
    data['video_path'] = this.videoPath;
    data['occupation_name'] = this.occupationName;
    data['like_status'] = this.likeStatus;
    if (this.spinLeverpoolRequestedData != null) {
      data['spin_leverpool_requested_data'] =
          this.spinLeverpoolRequestedData!.toJson();
    }
    return data;
  }
}

class SpinLeverpoolRequestedData {
  var id;
  var seekerId;
  var spinRequestTime;
  var showExpireTime;
  var hoursRemaining;
  List<SpinRequestData>? spinRequestData;
  bool? spinLiverRequestedStatus;

  SpinLeverpoolRequestedData(
      {this.id,
      this.seekerId,
      this.spinRequestTime,
      this.showExpireTime,
      this.hoursRemaining,
      this.spinRequestData,
      this.spinLiverRequestedStatus});

  SpinLeverpoolRequestedData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    seekerId = json['seeker_id'];
    spinRequestTime = json['spin_request_time'];
    showExpireTime = json['show_expire_Time'];
    hoursRemaining = json['hours_remaining'];
    if (json['spin_request_data'] != null) {
      spinRequestData = <SpinRequestData>[];
      json['spin_request_data'].forEach((v) {
        spinRequestData!.add(new SpinRequestData.fromJson(v));
      });
    }
    spinLiverRequestedStatus = json['spin_liver_requested_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seeker_id'] = this.seekerId;
    data['spin_request_time'] = this.spinRequestTime;
    data['show_expire_Time'] = this.showExpireTime;
    data['hours_remaining'] = this.hoursRemaining;
    if (this.spinRequestData != null) {
      data['spin_request_data'] =
          this.spinRequestData!.map((v) => v.toJson()).toList();
    }
    data['spin_liver_requested_status'] = this.spinLiverRequestedStatus;
    return data;
  }
}

class SpinRequestData {
  SeekerData? seekerData;
var isRequested;

  SpinRequestData({this.seekerData, this.isRequested});

  SpinRequestData.fromJson(Map<String, dynamic> json) {
    seekerData = json['seeker_data'] != null
        ? new SeekerData.fromJson(json['seeker_data'])
        : null;
    isRequested = json['is_requested'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.seekerData != null) {
      data['seeker_data'] = this.seekerData!.toJson();
    }
    data['is_requested'] = this.isRequested;
    return data;
  }
}

class SeekerData {
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

  SeekerData(
      {this.id,
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
      this.questions});

  SeekerData.fromJson(Map<String, dynamic> json) {
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
    questions = json['questions'] != null
        ? new Questions.fromJson(json['questions'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['occupation'] = this.occupation;
    data['salary'] = this.salary;
    data['address'] = this.address;
    data['height'] = this.height;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['religion'] = this.religion;
    data['current_step'] = this.currentStep;
    data['img_path'] = this.imgPath;
    data['video_path'] = this.videoPath;
    data['occupation_name'] = this.occupationName;
    data['like_status'] = this.likeStatus;
    if (this.questions != null) {
      data['questions'] = this.questions!.toJson();
    }
    return data;
  }
}

class Questions {
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

  Questions(
      {this.id,
      this.seekerId,
      this.question,
      this.firstAnswer,
      this.secondAnswer,
      this.thirdAnswer,
      this.correctAnswer,
      this.status,
      this.createdAt,
      this.updatedAt});

  Questions.fromJson(Map<String, dynamic> json) {
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seeker_id'] = this.seekerId;
    data['question'] = this.question;
    data['first_answer'] = this.firstAnswer;
    data['second_answer'] = this.secondAnswer;
    data['third_answer'] = this.thirdAnswer;
    data['correct_answer'] = this.correctAnswer;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
