class LiverPoolModel {
  LiverPoolModel({
     this.status,
     this.message,
  });
   String ?status;
   String ?message;
  
  LiverPoolModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = message;
    return _data;
  }
}