class MagicProfilesModel {
   String? status;
   List<MagicProfileRequest>? requests;

  MagicProfilesModel({
    this.status,
    this.requests,
  });

  factory MagicProfilesModel.fromJson(Map<String, dynamic>? json) {
    return MagicProfilesModel(
      status: json?['status'] as String?,
      requests: (json?['requests'] as List<dynamic>?)
          ?.map((requestJson) => MagicProfileRequest.fromJson(requestJson as Map<String, dynamic>?))
          .toList(),
    );
  }
}

class MagicProfileRequest {
   int? id;
   String? name;
   String? email;
   String? phone;
   String? occupation;
   String? salary;
   String? address;
   String? height;
   String? dob;
   String? profileImg;
   String? profileVideo;
   String? gender;
   String? religion;
   int? currentStep;
   String? imgPath;
   String? videoPath;
   MagicProfileQuestion? questions;

  MagicProfileRequest({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.occupation,
    this.salary,
    this.address,
    this.height,
    this.dob,
    this.profileImg,
    this.profileVideo,
    this.gender,
    this.religion,
    this.currentStep,
    this.imgPath,
    this.videoPath,
    this.questions,
  });

  factory MagicProfileRequest.fromJson(Map<String, dynamic>? json) {
    return MagicProfileRequest(
      id: json?['id'] as int?,
      name: json?['name'] as String?,
      email: json?['email'] as String?,
      phone: json?['phone'] as String?,
      occupation: json?['occupation'] as String?,
      salary: json?['salary'] as String?,
      address: json?['address'] as String?,
      height: json?['height'] as String?,
      dob: json?['dob'] as String?,
      profileImg: json?['profile_img'] as String?,
      profileVideo: json?['profile_video'] as String?,
      gender: json?['gender'] as String?,
      religion: json?['religion'] as String?,
      currentStep: json?['current_step'] as int?,
      imgPath: json?['img_path'] as String?,
      videoPath: json?['video_path'] as String?,
      questions: MagicProfileQuestion.fromJson(json?['questions'] as Map<String, dynamic>?),
    );
  }
}

class MagicProfileQuestion {
   int? id;
   int? seekerId;
   String? question;
   String? firstAnswer;
   String? secondAnswer;
   String? thirdAnswer;
   String? correctAnswer;
   int? status;
   String? createdAt;
   String? updatedAt;

  MagicProfileQuestion({
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

  factory MagicProfileQuestion.fromJson(Map<String, dynamic>? json) {
    return MagicProfileQuestion(
      id: json?['id'] as int?,
      seekerId: json?['seeker_id'] as int?,
      question: json?['question'] as String?,
      firstAnswer: json?['first_answer'] as String?,
      secondAnswer: json?['second_answer'] as String?,
      thirdAnswer: json?['third_answer'] as String?,
      correctAnswer: json?['correct_answer'] as String?,
      status: json?['status'] as int?,
      createdAt: json?['created_at'] as String?,
      updatedAt: json?['updated_at'] as String?,
    );
  }
}
