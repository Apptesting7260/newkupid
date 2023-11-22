class AllMakerModel {
  AllMakerModel({
     this.status,
     this.allmakers,
  });
   String ?status;
   List<Allmakers> ?allmakers;
  
  AllMakerModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    allmakers = List.from(json['allmakers']).map((e)=>Allmakers.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['allmakers'] = allmakers!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Allmakers {
  Allmakers({
     this.id,
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
  });
   int ?id;
   String? name;
   String ?email;
   String? phone;
   String? dob;
   String? gender;
   String? location;
   String? profileImg;
   String? profileVideo;
   String? experience;
   String? aboutMaker;
   String? expectation;
   String? headingOfMaker;
   int ?status;
   int? currentStep;
   String ?imgPath;
   String ?videoPath;
  
  Allmakers.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    dob = json['dob'];
    gender = json['gender'];
    location = json['location'];
    profileImg = json['profileImg'];
    profileVideo = json['profileVideo'];
    experience = json['experience'];
    aboutMaker = json['aboutMaker'];
    expectation = json['expectation'];
    headingOfMaker = json['headingOfMaker'];
    status = json['status'];
    currentStep = json['currentStep'];
    imgPath = json['img_path'];
    videoPath = json['video_path'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['phone'] = phone;
    _data['dob'] = dob;
    _data['gender'] = gender;
    _data['location'] = location;
    _data['profile_img'] = profileImg;
    _data['profile_video'] = profileVideo;
    _data['experience'] = experience;
    _data['about_maker'] = aboutMaker;
    _data['expectation'] = expectation;
    _data['heading_of_maker'] = headingOfMaker;
    _data['status'] = status;
    _data['current_step'] = currentStep;
    _data['img_path'] = imgPath;
    _data['video_path'] = videoPath;
    return _data;
  }
}