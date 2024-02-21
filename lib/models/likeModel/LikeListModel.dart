//



class LikeListModel {
  LikeListModel({
     this.status,
     this.message,
     this.data,
  });
  String ?status;
  String? message;
  Data ?data;

  LikeListModel.fromJson(Map<String, dynamic> json){
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
     this.toMaker,
  });
  List<ToSeeker>? toSeeker;
  List<ToMaker>? toMaker;

  Data.fromJson(Map<String, dynamic> json){
    toSeeker = List.from(json['to_seeker']).map((e)=>ToSeeker.fromJson(e)).toList();
    toMaker = List.from(json['to_maker']).map((e)=>ToMaker.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['to_seeker'] = toSeeker!.map((e)=>e.toJson()).toList();
    _data['to_maker'] = toMaker!.map((e)=>e.toJson()).toList();
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
var id;
var likeType;
var likeFrom;
var likeTo;
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
     this.imgPath,
     this.videoPath,
     this.likeStatus,
    this.address,
  });
var id;
  String? name;
  String? imgPath;
  String? videoPath;
var likeStatus;
  String? address;

  LikeName.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    imgPath = json['img_path'];
    videoPath = json['video_path'];
    likeStatus = json['like_status'];
    address = json['address']==null?json['location']: json['address'];



  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['img_path'] = imgPath;
    _data['video_path'] = videoPath;
    _data['address']!=null? _data['address'] :_data['location'] = address;
    _data['like_status'] = likeStatus;
    return _data;
  }
}

class ToMaker {
  ToMaker({
     this.id,
     this.likeType,
     this.likeFrom,
     this.likeTo,
     this.likeName,
  });
var id;
var likeType;
var likeFrom;
var likeTo;
  LikeName? likeName;

  ToMaker.fromJson(Map<String, dynamic> json){
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


// class LikeListModel {
//   LikeListModel({
//      this.status,
//      this.message,
//      this.data,
//   });
//  String? status;
//  String? message;
//  List<Data>? data;
//
//   LikeListModel.fromJson(Map<String, dynamic> json){
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
//      this.likeFrom,
//      this.likeTo,
//      this.likeName,
//   });
//  int? id;
//  int? likeFrom;
//  int? likeTo;
//  LikeName? likeName;
//
//   Data.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     likeFrom = json['like_from'];
//     likeTo = json['like_to'];
//     likeName = LikeName.fromJson(json['like_name']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['like_from'] = likeFrom;
//     _data['like_to'] = likeTo;
//     _data['like_name'] = likeName!.toJson();
//     return _data;
//   }
// }
//
// class LikeName {
//   LikeName({
//      this.id,
//      this.name,
//      this.imgPath,
//      this.videoPath,
//      this.likeStatus,
//   });
//  int? id;
//  String? name;
//  String ?imgPath;
//  String? videoPath;
//  int? likeStatus;
//
//   LikeName.fromJson(Map<String, dynamic> json){
//     id = json['id'];
//     name = json['name'];
//     imgPath = json['img_path'];
//     videoPath = json['video_path'];
//     likeStatus = json['like_status'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['id'] = id;
//     _data['name'] = name;
//     _data['img_path'] = imgPath;
//     _data['video_path'] = videoPath;
//     _data['like_status'] = likeStatus;
//     return _data;
//   }
// }
//
//
// // class LikeListModel {
// //   LikeListModel({
// //      this.status,
// //     this.message,
// //      this.data,
// //   });
// //    String ?status;
// //    String ? message;
// //    List<Data>? data;
// //
// //   LikeListModel.fromJson(Map<String, dynamic> json){
// //     status = json['status'];
// //     message = json['message'];
// //     data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final _data = <String, dynamic>{};
// //     _data['status'] = status;
// //     _data['message'] = message;
// //     _data['data'] = data!.map((e)=>e.toJson()).toList();
// //     return _data;
// //   }
// // }
// //
// // class Data {
// //   Data({
// //      this.id,
// //      this.likeFrom,
// //      this.likeTo,
// //      this.likeName,
// //   });
// //    int ?id;
// //    int ?likeFrom;
// //    int ?likeTo;
// //    List<LikeName>? likeName;
// //
// //   Data.fromJson(Map<String, dynamic> json){
// //     id = json['id'];
// //     likeFrom = json['like_from'];
// //     likeTo = json['like_to'];
// //     likeName = List.from(json['like_name']).map((e)=>LikeName.fromJson(e)).toList();
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final _data = <String, dynamic>{};
// //     _data['id'] = id;
// //     _data['like_from'] = likeFrom;
// //     _data['like_to'] = likeTo;
// //     _data['like_name'] = likeName!.map((e)=>e.toJson()).toList();
// //     return _data;
// //   }
// // }
// //
// // class LikeName {
// //   LikeName({
// //      this.id,
// //      this.name,
// //      this.profileImg,
// //      this.imgPath,
// //      this.videoPath,
// //      this.likeStatus,
// //   });
// //    int? id;
// //    String? name;
// //    String? profileImg;
// //    String? imgPath;
// //    String ?videoPath;
// //    int ?likeStatus;
// //
// //   LikeName.fromJson(Map<String, dynamic> json){
// //     id = json['id'];
// //     name = json['name'];
// //     profileImg = json['profile_img'];
// //     imgPath = json['img_path'];
// //     videoPath = json['video_path'];
// //     likeStatus = json['like_status'];
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     final _data = <String, dynamic>{};
// //     _data['id'] = id;
// //     _data['name'] = name;
// //     _data['profile_img'] = profileImg;
// //     _data['img_path'] = imgPath;
// //     _data['video_path'] = videoPath;
// //     _data['like_status'] = likeStatus;
// //     return _data;
// //   }
// // }