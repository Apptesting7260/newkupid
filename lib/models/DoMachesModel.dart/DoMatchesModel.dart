class DomatchesModel {
  DomatchesModel({
     this.status,
     this.msg,
  });
   String ?status;
   String ?msg;
  
  DomatchesModel.fromJson(Map<String, dynamic> json){
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
//
// class AutoGenerate {
//   AutoGenerate({
//     required this.status,
//     required this.message,
//   });
//   late final String status;
//   late final String message;
//
//   AutoGenerate.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['message'] = message;
//     return _data;
//   }
// }