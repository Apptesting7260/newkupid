
import 'package:cupid_match/models/ProfileScrollModel/ProfileScrollModel.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:get/get.dart';

import '../../../data/response/status.dart';

class ProfileScrollController extends GetxController {

  final _api = AuthRepository();


  final rxRequestStatus = Status.LOADING.obs ;
  final ProfileScrollList =ProfilesScrollModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void ProfileScrolList(ProfilesScrollModel _value) => ProfileScrollList.value = _value ;
  void setError(String _value) => error.value = _value ;


  void ProfileScrollApiHit(){
  //  setRxRequestStatus(Status.LOADING);

    _api.ProfileScrollapi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      ProfileScrolList(value);
      print(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      print("error");
      print(error.toString());
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