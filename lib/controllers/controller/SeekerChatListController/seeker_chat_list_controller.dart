import 'package:cupid_match/models/IncomingRequestModel/IncomingRequestModel.dart';
import 'package:get/get.dart';
import '../../../data/response/status.dart';
import 'package:get_storage/get_storage.dart';
import '../../../models/RecentSeekerMatches/recent_seeker_matches_Model.dart';
import '../../../models/SeekerChatListModel/seeker_chat_list_model.dart';
import '../../../repository/Auth_Repository/Auth_Repository.dart';

class SeekerChatListController extends GetxController {
  final _api = AuthRepository();
  //int? seekerRequestlenght;

  final rxRequestStatus = Status.LOADING.obs;
  final seekerChatListValue = SeekerChatListModel().obs;
  RxString error = ''.obs;
final box1 = GetStorage(); 
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(SeekerChatListModel value) => seekerChatListValue.value = value;
  void setError(String value) => error.value = value;

  Map data = {};

  void isSeekerChatListApi() {
    setRxRequestStatus(Status.LOADING);
//  if (box1.hasData('seekerChatListValue')) {
//     // Use cached data if available
//     final cachedData = box1.read('seekerChatListValue');
//     setUserList(SeekerChatListModel.fromJson(cachedData));
//     setRxRequestStatus(Status.COMPLETED);
//   } else {
   _api.SeekerChatListApi(data).then((value) {
     setRxRequestStatus(Status.COMPLETED);
     setUserList(value);
     // if (value.data!.length > 2) {
     //   seekerRequestlenght = 2;
     // } else {R
     //   seekerRequestlenght = 1;
     // }
     final jsonData = value
         .toJson(); // Assuming you have a method toMap() in your model
     box1.write('seekerChatListValue', jsonData);
     print("sdfsdfsdfdsjf&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&");
   }).onError((error, stackTrace) {
     setError(error.toString());
     setRxRequestStatus(Status.ERROR);
   });
 }
    
  }
//
// void refreshApi(){
//
//     setRxRequestStatus(Status.LOADING);
//
//   _api.userListApi().then((value){
//     setRxRequestStatus(Status.COMPLETED);
//     setUserList(value);
//   }).onError((error, stackTrace){
//     setError(error.toString());
//     setRxRequestStatus(Status.ERROR);
//
//   });
// }
// }
