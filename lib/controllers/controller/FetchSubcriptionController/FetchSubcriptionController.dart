
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/match_maker/match_maker_profile_update.dart';
import 'package:cupid_match/models/FetchSubcriptionModel/FetchSubcriptionModel.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:get/get.dart';


class FetchSubcriptionController extends GetxController {

  final _api = AuthRepository();


  final rxRequestStatus = Status.LOADING.obs ;
  final SubcriptionList =FetchsubcriptionplanModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserList(FetchsubcriptionplanModel _value) => SubcriptionList.value = _value ;
  void setError(String _value) => error.value = _value ;
 Map Data={
"subscription_type":Subcriptiontype.toString()
 };

  void SubcriptionListApi(){
  //  setRxRequestStatus(Status.LOADING);

    _api.FetchSubcriptionApi(Data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      // print(value);
      print('done');
    }).onError((error, stackTrace){
      setError(error.toString());
      print("error");
      setRxRequestStatus(Status.ERROR);

    });
  }

  void refreshApi(){

      setRxRequestStatus(Status.LOADING);

    _api.FetchSubcriptionApi(Data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }
}