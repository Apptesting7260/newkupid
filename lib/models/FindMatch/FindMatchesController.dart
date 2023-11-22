class CreateNewMatchesModel {
  var status;
  var message;
  List<Allseekers>? allseekers;

  CreateNewMatchesModel({this.status, this.message, this.allseekers});

  CreateNewMatchesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['allseekers'] != null) {
      allseekers = <Allseekers>[];
      json['allseekers'].forEach((v) {
        allseekers!.add(new Allseekers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.allseekers != null) {
      data['allseekers'] = this.allseekers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Allseekers {
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

  Allseekers(
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

  Allseekers.fromJson(Map<String, dynamic> json) {
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

class Details {
  var id;
  var seekerId;
  bool? profileGallery;
  var inInterested;
  var interest;
  var bioTitle;
  var bioDescription;
  var status;
  var createdAt;
  var updatedAt;
  List<String>? gallaryPath;
  List<InterestName>? interestName;

  Details(
      {this.id,
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
        this.interestName});

  Details.fromJson(Map<String, dynamic> json) {
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
    gallaryPath = json['gallary_path'].cast<String>();
    if (json['interest_name'] != null) {
      interestName = <InterestName>[];
      json['interest_name'].forEach((v) {
        interestName!.add(new InterestName.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['seeker_id'] = this.seekerId;
    data['profile_gallery'] = this.profileGallery;
    data['in_interested'] = this.inInterested;
    data['interest'] = this.interest;
    data['bio_title'] = this.bioTitle;
    data['bio_description'] = this.bioDescription;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['gallary_path'] = this.gallaryPath;
    if (this.interestName != null) {
      data['interest_name'] =
          this.interestName!.map((v) => v.toJson()).toList();
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
