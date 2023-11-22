class LikeListModel {
  LikeListModel({
     this.status,
    this.message,
     this.data,
  });
   String ?status;
   String ? message;
   List<Data>? data;
  
  LikeListModel.fromJson(Map<String, dynamic> json){
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
     this.likeFrom,
     this.likeTo,
     this.likeName,
  });
   int ?id;
   int ?likeFrom;
   int ?likeTo;
   List<LikeName>? likeName;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    likeFrom = json['like_from'];
    likeTo = json['like_to'];
    likeName = List.from(json['like_name']).map((e)=>LikeName.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['like_from'] = likeFrom;
    _data['like_to'] = likeTo;
    _data['like_name'] = likeName!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class LikeName {
  LikeName({
     this.id,
     this.name,
     this.profileImg,
     this.imgPath,
     this.videoPath,
     this.likeStatus,
  });
   int? id;
   String? name;
   String? profileImg;
   String? imgPath;
   String ?videoPath;
   int ?likeStatus;
  
  LikeName.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    profileImg = json['profile_img'];
    imgPath = json['img_path'];
    videoPath = json['video_path'];
    likeStatus = json['like_status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['profile_img'] = profileImg;
    _data['img_path'] = imgPath;
    _data['video_path'] = videoPath;
    _data['like_status'] = likeStatus;
    return _data;
  }
}