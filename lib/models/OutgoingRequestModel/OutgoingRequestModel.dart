class OutgoingRequestModel {
  var status;
  List<OutgoingMatchRequest>? requests;
  var message;

  OutgoingRequestModel({
    this.status,
    this.requests,
    this.message,
  });

  factory OutgoingRequestModel.fromJson(Map<String, dynamic> json) {
    return OutgoingRequestModel(
      status: json['status'],
      message: json['message'],
      requests: (json['requests'] as List<dynamic>?)
          ?.map((requestJson) => OutgoingMatchRequest.fromJson(requestJson))
          .toList(),
    );
    
  }
  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = {};
  data['status'] = status;
  data['message'] = message;
  if (requests != null) {
    data['requests'] = requests!.map((request) => request.toJson()).toList();
  }
  return data;
}

}

class OutgoingMatchRequest {
  var id;
  var makerId;
  var matchFrom;
  var matchWith;
  var matchType;
  var matchWithStatus;
  var matchFromStatus;
  var status;
  var createdAt;
  var updatedAt;
  OutgoingSeeker? getMaker;
  OutgoingSeeker? outgoing_req_getseeker; // Changed field name here

  OutgoingMatchRequest({
    this.id,
    this.makerId,
    this.matchFrom,
    this.matchWith,
    this.matchType,
    this.matchWithStatus,
    this.matchFromStatus,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.getMaker,
    this.outgoing_req_getseeker, // Changed field name here
  });

  factory OutgoingMatchRequest.fromJson(Map<String, dynamic> json) {
    return OutgoingMatchRequest(
      id: json['id'],
      makerId: json['maker_id'],
      matchFrom: json['match_from'],
      matchWith: json['match_with'],
      matchType: json['match_type'],
      matchWithStatus: json['match_with_status'],
      matchFromStatus: json['match_from_status'],
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      getMaker: json['getmaker'] != null ? OutgoingSeeker.fromJson(json['getmaker']) : null,
      outgoing_req_getseeker:json['outgoing_req_getseeker']!=null? OutgoingSeeker.fromJson(json['outgoing_req_getseeker']):null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['maker_id'] = makerId;
    data['match_from'] = matchFrom;
    data['match_with'] = matchWith;
    data['match_type'] = matchType;
    data['match_with_status'] = matchWithStatus;
    data['match_from_status'] = matchFromStatus;
    data['status'] = status;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    
    // Serialize the 'getMaker' and 'outgoing_req_getseeker' properties if they exist
    if (getMaker != null) {
      data['getmaker'] = getMaker!.toJson();
    }
    if (outgoing_req_getseeker != null) {
      data['outgoing_req_getseeker'] = outgoing_req_getseeker!.toJson();
    }

    return data;
  }
}

class OutgoingSeeker {
  var id;
  var name;
  var email;
  var phone;
  var occupation;
  var salary;
  var address;
  var height;
  var dob;
  var profileImg;
  var profileVideo;
  var gender;
  var religion;
  var currentStep;
  var imgPath;
  var videoPath;

  OutgoingSeeker({
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
  });

  factory OutgoingSeeker.fromJson(Map<String, dynamic> json) {
    return OutgoingSeeker(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      occupation: json['occupation'],
      salary: json['salary'],
      address: json['address'],
      height: json['height'],
      dob: json['dob'],
      profileImg: json['profile_img'],
      profileVideo: json['profile_video'],
      gender: json['gender'],
      religion: json['religion'],
      currentStep: json['current_step'],
      imgPath: json['img_path'],
      videoPath: json['video_path'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['occupation'] = occupation;
    data['salary'] = salary;
    data['address'] = address;
    data['height'] = height;
    data['dob'] = dob;
    data['profile_img'] = profileImg;
    data['profile_video'] = profileVideo;
    data['gender'] = gender;
    data['religion'] = religion;
    data['current_step'] = currentStep;
    data['img_path'] = imgPath;
    data['video_path'] = videoPath;

    return data;
  }
}
