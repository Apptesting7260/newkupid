class MakerLikeList {
  MakerLikeList({
     this.status,
     this.message,
     this.data,
  });
   String? status;
   String? message;
   Data? data;

  MakerLikeList.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    _data['data'] = data!.toJson();
    return _data;
  }
}

class Data {
  Data({
     this.toSeeker,
  });
   List<ToSeeker>? toSeeker;

  Data.fromJson(Map<String, dynamic> json){
    toSeeker = List.from(json['to_seeker']).map((e)=>ToSeeker.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['to_seeker'] = toSeeker!.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class ToSeeker {
  ToSeeker({
     this.id,
     this.likeType,
     this.likeFrom,
     this.likeTo,
     this.likeName,
  });
   int ?id;
   int? likeType;
   int ?likeFrom;
   int ?likeTo;
   LikeName? likeName;

  ToSeeker.fromJson(Map<String, dynamic> json){
    id = json['id'];
    likeType = json['like_type'];
    likeFrom = json['like_from'];
    likeTo = json['like_to'];
    likeName = LikeName.fromJson(json['like_name']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['like_type'] = likeType;
    _data['like_from'] = likeFrom;
    _data['like_to'] = likeTo;
    _data['like_name'] = likeName!.toJson();
    return _data;
  }
}

class LikeName {
  LikeName({
     this.id,
     this.name,
     this.address,
     this.imgPath,
     this.videoPath,
     this.likeStatus,
  });
   int? id;
   String? name;
   String? address;
   String ? imgPath;
   String? videoPath;
   int? likeStatus;

  LikeName.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    address = json['address'];
    imgPath = json['img_path'];
    videoPath = json['video_path'];
    likeStatus = json['like_status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['address'] = address;
    _data['img_path'] = imgPath;
    _data['video_path'] = videoPath;
    _data['like_status'] = likeStatus;
    return _data;
  }
}