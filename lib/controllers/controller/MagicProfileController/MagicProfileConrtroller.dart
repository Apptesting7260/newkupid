
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/models/MagicProfile/MagicProfiles.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:get/get.dart';



class MagicProfileController extends GetxController {

  final _api = AuthRepository();


  final rxRequestStatus = Status.LOADING.obs ;
  final MagicProfileList =MagicProfilesModel().obs ;
  RxString selectedAnswer="".obs;
  RxString error = ''.obs;
  RxList<dynamic> slotImages = [].obs;
  RxList<dynamic> slotname = [].obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserProfileList(MagicProfilesModel _value) => MagicProfileList.value = _value ;
  void setError(String _value) => error.value = _value ;


  void MagicProfileApiHit(){
  //  setRxRequestStatus(Status.LOADING);

    _api.MagicProfileApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserProfileList(value);
      print("object====");
      for(int i=0; i<value.requests!.length; i++){
slotImages.add(value.requests![i].imgPath.toString());
slotname.add(value.requests![i].name.toString());
      }
print("object");
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