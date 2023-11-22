// class IncomingMakerRequestModel {
//   String? status;
//   String? message;
//   Requests? requests;
//
//   IncomingMakerRequestModel({this.status, this.message, this.requests});
//
//   IncomingMakerRequestModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     message = json['message'];
//     requests = json['requests'] != null
//         ? new Requests.fromJson(json['requests'])
//         : null;
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['message'] = this.message;
//     if (this.requests != null) {
//       data['requests'] = this.requests!.toJson();
//     }
//     return data;
//   }
// }
//
// class Requests {
//   List<ParticularProfile>? particularProfile;
//   List<RandomProfile>? randomProfile;
//
//   Requests({this.particularProfile, this.randomProfile});
//
//   Requests.fromJson(Map<String, dynamic> json) {
//     if (json['particular_profile'] != null) {
//       particularProfile = <ParticularProfile>[];
//       json['particular_profile'].forEach((v) {
//         particularProfile!.add(new ParticularProfile.fromJson(v));
//       });
//     }
//     if (json['random_profile'] != null) {
//       randomProfile = <RandomProfile>[];
//       json['random_profile'].forEach((v) {
//         randomProfile!.add(new RandomProfile.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.particularProfile != null) {
//       data['particular_profile'] =
//           this.particularProfile!.map((v) => v.toJson()).toList();
//     }
//     if (this.randomProfile != null) {
//       data['random_profile'] =
//           this.randomProfile!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
class IncomingMakerRequestModel {
  String? status;
  String? message;
  Requests? requests;

  IncomingMakerRequestModel({this.status, this.message, this.requests});

  IncomingMakerRequestModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    final requestsData = json['requests'];

    if (requestsData is List) {
      requests = Requests.empty();
    } else if (requestsData is Map<String, dynamic>) {
      requests = Requests.fromJson(requestsData);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.requests != null) {
      data['requests'] = this.requests!.toJson();
    }
    return data;
  }
}

class Requests {
  List<ParticularProfile>? particularProfile;
 List<RandomProfile>? randomProfile;

  Requests({this.particularProfile, this.randomProfile});

  // Create an empty Requests object
  Requests.empty();

  Requests.fromJson(Map<String, dynamic> json) {
    if (json['particular_profile'] != null) {
      particularProfile = <ParticularProfile>[];
      json['particular_profile'].forEach((v) {
        particularProfile!.add(new ParticularProfile.fromJson(v));
      });
    }
    if (json['random_profile'] != null) {
      randomProfile = <RandomProfile>[];
      json['random_profile'].forEach((v) {
        randomProfile!.add(new RandomProfile.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.particularProfile != null) {
      data['particular_profile'] = this.particularProfile!.map((v) => v.toJson()).toList();
    }
    if (this.randomProfile != null) {
      data['random_profile'] = this.randomProfile!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
class ParticularProfile {
  var id;
  var makerId;
  var matchFrom;
  var matchWith;
  var matchType;
  var matchWithStatus;
  var matchFromStatus;
  var makerVerified;
  var status;
  var roomid;
  var createdAt;
  var updatedAt;
  Getmaker? getmaker;
  Getseeker? getseeker;
  Getseeker? getanotherseeker;

  ParticularProfile(
      {this.id,
        this.makerId,
        this.matchFrom,
        this.matchWith,
        this.matchType,
        this.matchWithStatus,
        this.matchFromStatus,
        this.makerVerified,
        this.status,
        this.roomid,
        this.createdAt,
        this.updatedAt,
        this.getmaker,
        this.getseeker,
        this.getanotherseeker});

  ParticularProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    makerId = json['maker_id'];
    matchFrom = json['match_from'];
    matchWith = json['match_with'];
    matchType = json['match_type'];
    matchWithStatus = json['match_with_status'];
    matchFromStatus = json['match_from_status'];
    makerVerified = json['maker_verified'];
    status = json['status'];
    roomid = json['roomid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    getmaker = json['getmaker'] != null
        ? new Getmaker.fromJson(json['getmaker'])
        : null;
    getseeker = json['getseeker'] != null
        ? new Getseeker.fromJson(json['getseeker'])
        : null;
    getanotherseeker = json['getanotherseeker'] != null
        ? new Getseeker.fromJson(json['getanotherseeker'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['maker_id'] = this.makerId;
    data['match_from'] = this.matchFrom;
    data['match_with'] = this.matchWith;
    data['match_type'] = this.matchType;
    data['match_with_status'] = this.matchWithStatus;
    data['match_from_status'] = this.matchFromStatus;
    data['maker_verified'] = this.makerVerified;
    data['status'] = this.status;
    data['roomid'] = this.roomid;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.getmaker != null) {
      data['getmaker'] = this.getmaker!.toJson();
    }
    if (this.getseeker != null) {
      data['getseeker'] = this.getseeker!.toJson();
    }
    if (this.getanotherseeker != null) {
      data['getanotherseeker'] = this.getanotherseeker!.toJson();
    }
    return data;
  }
}

class Getmaker {
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
  Details? details;

  Getmaker(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.dob,
        this.gender,
        this.location,
        this.profileImg,
        this.profileVideo,
        this.experience,
        this.aboutMaker,
        this.expectation,
        this.headingOfMaker,
        this.status,
        this.currentStep,
        this.imgPath,
        this.videoPath,
        this.details});

  Getmaker.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
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
    currentStep = json['current_step'];
    imgPath = json['img_path'];
    videoPath = json['video_path'];
    details =
    json['details'] != null ? new Details.fromJson(json['details']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['dob'] = this.dob;
    data['gender'] = this.gender;
    data['location'] = this.location;
    data['profile_img'] = this.profileImg;
    data['profile_video'] = this.profileVideo;
    data['experience'] = this.experience;
    data['about_maker'] = this.aboutMaker;
    data['expectation'] = this.expectation;
    data['heading_of_maker'] = this.headingOfMaker;
    data['status'] = this.status;
    data['current_step'] = this.currentStep;
    data['img_path'] = this.imgPath;
    data['video_path'] = this.videoPath;
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    return data;
  }
}

class Details {
  var id;
  var makerId;
  var nationality;
  var verificationMethod;
  var idProof;
  var bankName;
  var makerFullName;
  var accountNumber;
  var ifscCode;
  var status;
  var createdAt;
  var updatedAt;

  Details(
      {this.id,
        this.makerId,
        this.nationality,
        this.verificationMethod,
        this.idProof,
        this.bankName,
        this.makerFullName,
        this.accountNumber,
        this.ifscCode,
        this.status,
        this.createdAt,
        this.updatedAt});

  Details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    makerId = json['maker_id'];
    nationality = json['nationality'];
    verificationMethod = json['verification_method'];
    idProof = json['id_proof'];
    bankName = json['bank_name'];
    makerFullName = json['maker_full_name'];
    accountNumber = json['account_number'];
    ifscCode = json['ifsc_code'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['maker_id'] = this.makerId;
    data['nationality'] = this.nationality;
    data['verification_method'] = this.verificationMethod;
    data['id_proof'] = this.idProof;
    data['bank_name'] = this.bankName;
    data['maker_full_name'] = this.makerFullName;
    data['account_number'] = this.accountNumber;
    data['ifsc_code'] = this.ifscCode;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Getseeker {
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

  Getseeker(
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
        this.details});

  Getseeker.fromJson(Map<String, dynamic> json) {
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
    details =
    json['details'] != null ? new Details.fromJson(json['details']) : null;
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
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    return data;
  }
}



class InterestName {
  var title;

  InterestName({this.title});

  InterestName.fromJson(Map<String, dynamic> json) {
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    return data;
  }
}

class Getanotherseeker {
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

  Getanotherseeker(
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
        this.details});

  Getanotherseeker.fromJson(Map<String, dynamic> json) {
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
    details =
    json['details'] != null ? new Details.fromJson(json['details']) : null;
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
    if (this.details != null) {
      data['details'] = this.details!.toJson();
    }
    return data;
  }
}



class RandomProfile {
  var id;
  var makerId;
  var matchFrom;
  var matchWith;
  var matchType;
  var matchWithStatus;
  var matchFromStatus;
  var makerVerified;
  var status;
  var roomid;
  var createdAt;
  var updatedAt;
  Getmaker? getmaker;
  Getseeker? getseeker;
  Getseeker? getanotherseeker;

  RandomProfile(
      {this.id,
        this.makerId,
        this.matchFrom,
        this.matchWith,
        this.matchType,
        this.matchWithStatus,
        this.matchFromStatus,
        this.makerVerified,
        this.status,
        this.roomid,
        this.createdAt,
        this.updatedAt,
        this.getmaker,
        this.getseeker,
        this.getanotherseeker});

  RandomProfile.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    makerId = json['maker_id'];
    matchFrom = json['match_from'];
    matchWith = json['match_with'];
    matchType = json['match_type'];
    matchWithStatus = json['match_with_status'];
    matchFromStatus = json['match_from_status'];
    makerVerified = json['maker_verified'];
    status = json['status'];
    roomid = json['roomid'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    getmaker = json['getmaker'] != null
        ? new Getmaker.fromJson(json['getmaker'])
        : null;
    getseeker = json['getseeker'] != null
        ? new Getseeker.fromJson(json['getseeker'])
        : null;
    getanotherseeker = json['getanotherseeker'] != null
        ? new Getseeker.fromJson(json['getanotherseeker'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['maker_id'] = this.makerId;
    data['match_from'] = this.matchFrom;
    data['match_with'] = this.matchWith;
    data['match_type'] = this.matchType;
    data['match_with_status'] = this.matchWithStatus;
    data['match_from_status'] = this.matchFromStatus;
    data['maker_verified'] = this.makerVerified;
    data['status'] = this.status;
    data['roomid'] = this.roomid;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.getmaker != null) {
      data['getmaker'] = this.getmaker!.toJson();
    }
    if (this.getseeker != null) {
      data['getseeker'] = this.getseeker!.toJson();
    }
    if (this.getanotherseeker != null) {
      data['getanotherseeker'] = this.getanotherseeker!.toJson();
    }
    return data;
  }
}








// class IncomingMakerRequestModel {
//   IncomingMakerRequestModel({
//      this.status,
//      this.message,
//      this.requests,
//   });
//   String? status;
//    String? message;
//  Requests? requests;
//
//   IncomingMakerRequestModel.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     message = json['message'];
//     requests = Requests.fromJson(json['requests']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['message'] = message;
//     _data['requests'] = requests!.toJson();
//     return _data;
//   }
// }
//
// class Requests {
//   Requests({
//      this.particularProfile,
//      this.randomProfile,
//   });
//    List<ParticularProfile>?particularProfile;
//    List<dynamic>? randomProfile;
//
//   Requests.fromJson(Map<String, dynamic> json){
//     particularProfile = List.from(json['particular_profile']).map((e)=>ParticularProfile.fromJson(e)).toList();
//     randomProfile = List.castFrom<dynamic, dynamic>(json['random_profile']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['particular_profile'] = particularProfile!.map((e)=>e.toJson()).toList();
//     _data['random_profile'] = randomProfile;
//     return _data;
//   }
// }
//
// class ParticularProfile {
//   ParticularProfile({
//      this.id,
//      this.makerId,
//      this.matchFrom,
//      this.matchWith,
//      this.matchType,
//      this.matchWithStatus,
//      this.matchFromStatus,
//      this.status,
//     this.roomid,
//     this.createdAt,
//      this.updatedAt,
//      this.getmaker,
//      this.getseeker,
//      this.getanotherseeker,
//   });
//  var id;
//  var makerId;
//  var matchFrom;
//  var matchWith;
//  var matchType;
//   var matchWithStatus;
//   var matchFromStatus;
//  var status;
//   var roomid;
//   var createdAt;
//   var updatedAt;
//    Getmaker? getmaker;
//    Getseeker? getseeker;
//    Getanotherseeker? getanotherseeker;
//
//   ParticularProfile.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     makerId = json['maker_id'];
//     matchFrom = json['match_from'];
//     matchWith = json['match_with'];
//     matchType = json['match_type'];
//     matchWithStatus = json['match_with_status'];
//     matchFromStatus = json['match_from_status'];
//     status = json['status'];
//     roomid = null;
//     createdAt = null;
//     updatedAt = json['updated_at'];
//     getmaker = Getmaker.fromJson(json['getmaker']);
//     getseeker = Getseeker.fromJson(json['getseeker']);
//     getanotherseeker = Getanotherseeker.fromJson(json['getanotherseeker']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['maker_id'] = makerId;
//     _data['match_from'] = matchFrom;
//     _data['match_with'] = matchWith;
//     _data['match_type'] = matchType;
//     _data['match_with_status'] = matchWithStatus;
//     _data['match_from_status'] = matchFromStatus;
//     _data['status'] = status;
//     _data['roomid'] = roomid;
//     _data['created_at'] = createdAt;
//     _data['updated_at'] = updatedAt;
//     _data['getmaker'] = getmaker!.toJson();
//     _data['getseeker'] = getseeker!.toJson();
//     _data['getanotherseeker'] = getanotherseeker!.toJson();
//     return _data;
//   }
// }
//
// class Getmaker {
//   Getmaker({
//      this.id,
//      this.name,
//      this.email,
//      this.phone,
//      this.dob,
//      this.gender,
//      this.location,
//      this.profileImg,
//      this.profileVideo,
//      this.experience,
//      this.aboutMaker,
//      this.expectation,
//      this.headingOfMaker,
//      this.status,
//      this.currentStep,
//      this.imgPath,
//      this.videoPath,
//   });
//  var id;
//   var name;
//   var email;
//   var phone;
//   var dob;
//   var gender;
//   var location;
//   var profileImg;
//   var profileVideo;
//   var experience;
//   var aboutMaker;
//   var expectation;
//   var headingOfMaker;
//  var status;
//  var currentStep;
//   var imgPath;
//   var videoPath;
//
//   Getmaker.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     dob = json['dob'];
//     gender = json['gender'];
//     location = json['location'];
//     profileImg = json['profile_img'];
//     profileVideo = json['profile_video'];
//     experience = json['experience'];
//     aboutMaker = json['about_maker'];
//     expectation = json['expectation'];
//     headingOfMaker = json['heading_of_maker'];
//     status = json['status'];
//     currentStep = json['current_step'];
//     imgPath = json['img_path'];
//     videoPath = json['video_path'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['email'] = email;
//     _data['phone'] = phone;
//     _data['dob'] = dob;
//     _data['gender'] = gender;
//     _data['location'] = location;
//     _data['profile_img'] = profileImg;
//     _data['profile_video'] = profileVideo;
//     _data['experience'] = experience;
//     _data['about_maker'] = aboutMaker;
//     _data['expectation'] = expectation;
//     _data['heading_of_maker'] = headingOfMaker;
//     _data['status'] = status;
//     _data['current_step'] = currentStep;
//     _data['img_path'] = imgPath;
//     _data['video_path'] = videoPath;
//     return _data;
//   }
// }
//
// class Getseeker {
//   Getseeker({
//      this.id,
//      this.name,
//      this.email,
//      this.phone,
//      this.occupation,
//     this.salary,
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
//      this.details,
//   });
//  var id;
//   var name;
//   var email;
//   var phone;
//   var occupation;
//   var salary;
//   var address;
//   var height;
//   var dob;
//   var gender;
//   var religion;
//  var currentStep;
//   var imgPath;
//   var videoPath;
//   var occupationName;
//  var likeStatus;
//    Details? details;
//
//   Getseeker.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//     email = json['email'];
//     phone = json['phone'];
//     occupation = json['occupation'];
//     salary = null;
//     address = json['address'];
//     height = json['height'];
//     dob = json['dob'];
//     gender = json['gender'];
//     religion = json['religion'];
//     currentStep = json['current_step'];
//     imgPath = json['img_path'];
//     videoPath = json['video_path'];
//     occupationName = json['occupation_name'];
//     likeStatus = json['like_status'];
//     details = Details.fromJson(json['details']);
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
//     _data['details'] = details!.toJson();
//     return _data;
//   }
// }
//
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
//  var id;
//  var seekerId;
//   var profileGallery;
//   var inInterested;
//   var interest;
//   var bioTitle;
//   var bioDescription;
//  var status;
//   var createdAt;
//   var updatedAt;
//    List<String>? gallaryPath;
//    List<InterestName>? interestName;
//
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
//
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
//
// class InterestName {
//   InterestName({
//      this.title,
//   });
//   var title;
//
//   InterestName.fromJson(Map<String, dynamic> json){
//     title = json['title'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['title'] = title;
//     return _data;
//   }
// }
//
// class Getanotherseeker {
//   Getanotherseeker({
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
//      this.details,
//   });
//  var id;
//   var name;
//   var email;
//   var phone;
//   var occupation;
//   var salary;
//   var address;
//   var height;
//   var dob;
//   var gender;
//   var religion;
//  var currentStep;
//   var imgPath;
//   var videoPath;
//   var occupationName;
//  var likeStatus;
//  Details? details;
//
//   Getanotherseeker.fromJson(Map<String, dynamic> json){
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
//     occupationName = json['occupation_name'];
//     likeStatus = json['like_status'];
//     details = Details.fromJson(json['details']);
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
//     _data['details'] = details!.toJson();
//     return _data;
//   }
// }