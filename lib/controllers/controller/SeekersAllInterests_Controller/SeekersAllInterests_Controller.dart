
import 'package:cupid_match/models/SeekersallInterestsModel/SeekersAllInterestsModel.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:get/get.dart';


import '../../../data/response/status.dart';

class SeekersAllInterstsController extends GetxController {

  final _api = AuthRepository();


  final rxRequestStatus = Status.LOADING.obs ;
  final SeekersAllIntersestsList =SeekersAllInterestsModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void SeekersallInterstsList(SeekersAllInterestsModel _value) => SeekersAllIntersestsList.value = _value ;
  void setError(String _value) => error.value = _value ;


  void SeekersAllInterestsApi(){
   setRxRequestStatus(Status.LOADING);

    _api.SeekersAllInterestsApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      SeekersallInterstsList(value);
      print(value)
;    }).onError((error, stackTrace){
      setError(error.toString());
      print("object");
      setRxRequestStatus(Status.ERROR);

    });
  }

  void refreshApi(){

      setRxRequestStatus(Status.LOADING);

    _api.SeekersAllInterestsApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      SeekersallInterstsList(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }
}