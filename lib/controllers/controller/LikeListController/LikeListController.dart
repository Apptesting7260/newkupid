
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/models/MagicProfile/MagicProfiles.dart';
import 'package:cupid_match/models/likeModel/LikeListModel.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:get/get.dart';



class LikeListController extends GetxController {

  final _api = AuthRepository();


  final rxRequestStatus = Status.LOADING.obs ;
  final LikeList =LikeListModel().obs ;
  RxString selectedAnswer="".obs;
  RxString error = ''.obs;
  RxList<dynamic> slotImages = [].obs;
  RxList<dynamic> slotname = [].obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setlikelistList(LikeListModel _value) => LikeList.value = _value ;
  void setError(String _value) => error.value = _value ;


  void LikeListApiHit(){
  //  setRxRequestStatus(Status.LOADING);

    _api.likeListApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setlikelistList(value);




    print("$slotImages===================");
    }).onError((error, stackTrace){
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