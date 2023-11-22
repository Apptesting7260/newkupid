class SeekerToMakerRequestModel {
  SeekerToMakerRequestModel({
     this.status,
     this.msg,
     this.requestId,
  });
  String ?status;
  String ?msg;
  int ?requestId;
  
  SeekerToMakerRequestModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['message'];
    requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['message'] = msg;
    _data['request_id'] = requestId;
    return _data;
  }
}