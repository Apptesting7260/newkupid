class MakerProfileModel {
  MakerProfileModel({
     this.status,
     this.msg,
  });
   String? status;
   String? msg;

  MakerProfileModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = msg;
    return _data;
  }
}