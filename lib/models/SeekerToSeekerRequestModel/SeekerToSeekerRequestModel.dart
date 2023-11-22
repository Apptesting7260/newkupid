class SikerTOSikerRequestModel {
  SikerTOSikerRequestModel({
     this.status,
     this.msg,
     this.requestId,
  });
  String ?status;
  String ?msg;
  int ?requestId;
  
  SikerTOSikerRequestModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['request_id'] = requestId;
    return _data;
  }
}