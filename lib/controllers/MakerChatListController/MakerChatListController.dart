import 'package:cupid_match/models/IncomingRequestModel/IncomingRequestModel.dart';
import 'package:get/get.dart';
import '../../../data/response/status.dart';

import '../../../models/MakerChatListModel/maker_chat_list_model.dart';
import '../../../models/RecentSeekerMatches/recent_seeker_matches_Model.dart';
import '../../../models/SeekerChatListModel/seeker_chat_list_model.dart';
import '../../../repository/Auth_Repository/Auth_Repository.dart';

class MakerChatListController extends GetxController {
  final _api = AuthRepository();
  //int? seekerRequestlenght;

  final rxRequestStatus = Status.LOADING.obs;
  final makerChatListValue = MakerChatListModel().obs;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(MakerChatListModel value) => makerChatListValue.value = value;
  void setError(String value) => error.value = value;

  Map data = {};

  void isMakerChatListApi() {
    setRxRequestStatus(Status.LOADING);

    _api.MakerChatListApi(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);

      // if (value.data!.length > 2) {
      //   seekerRequestlenght = 2;
      // } else {
      //   seekerRequestlenght = 1;
      // }
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
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
}
