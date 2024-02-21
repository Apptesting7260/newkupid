import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/models/MagicProfile/MagicProfiles.dart';
import 'package:cupid_match/models/likeModel/LikeListModel.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:get/get.dart';

import '../../../models/MakerLikeListApi/MakerLikeListModel.dart';

class MakerLikeListController extends GetxController {
  final _api = AuthRepository();

  RxBool button_maker = true.obs;
  RxBool button_seeker = false.obs;
  final rxRequestStatus = Status.LOADING.obs;

  final LikeList = MakerLikeList().obs;

  RxString selectedAnswer = "".obs;
  RxString error = ''.obs;
  RxList<dynamic> slotImages = [].obs;
  RxList<dynamic> slotname = [].obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value;

  void setlikelistList(MakerLikeList _value) => LikeList.value = _value;

  void setError(String _value) => error.value = _value;

  void LikeListApiHit() {
     setRxRequestStatus(Status.LOADING);

    _api.MakerLikeListApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setlikelistList(value);

      print("$slotImages===================");
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

// void refreshApi(){

//     setRxRequestStatus(Status.LOADING);

//   _api.userListApi().then((value){
//     setRxRequestStatus(Status.COMPLETED);
//     setUserList(value);
//   }).onError((error, stackTrace){
//     setError(error.toString());
//     setRxRequestStatus(Status.ERROR);

//   });
// }
}
