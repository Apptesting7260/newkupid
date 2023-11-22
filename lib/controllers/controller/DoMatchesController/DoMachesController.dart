
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/models/DoMachesModel.dart/DoMatchesModel.dart';
import 'package:cupid_match/models/ProfileScrollModel/ProfileScrollModel.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:get/get.dart';

import '../../../data/response/status.dart';

class DoMatchesController extends GetxController {

  final _api = AuthRepository();


  final rxRequestStatus = Status.LOADING.obs ;
  final DoMatches =DomatchesModel().obs ;
  RxString error = ''.obs;
  RxString message="".obs;
  RxBool requestaccept=false.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void DoMatchesrequest(DomatchesModel _value) => DoMatches.value = _value ;
  void setError(String _value) => error.value = _value ;


  void DoMatchesApiHit(){
    requestaccept.value=true;
   setRxRequestStatus(Status.LOADING);
   Map Data={};
   if(requestId==null||requestId=="") {
     Data = {
       "match_type": Matchtype.toString(),
       "match_from": match_fromid,
       "match_with": match_withid,
       "maker_id": Makerid
     };
   }
   else if(Makerid==null){
     Data = {
       "match_type": Matchtype.toString(),
       "match_from": match_fromid,
       "match_with": match_withid,
       "request_id": requestId
     };
   }
   else{
     Data = {
       "match_type": Matchtype.toString(),
       "match_from": match_fromid,
       "match_with": match_withid,
       "maker_id": Makerid,
       "request_id": requestId
     };
   }
  print(Data);
    _api.DoMatcchesapi(Data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      requestaccept.value=false;
      DoMatchesrequest(value);
      print(value.msg);
      message.value=value.msg.toString();
    }).onError((error, stackTrace){
      requestaccept.value=false;

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


