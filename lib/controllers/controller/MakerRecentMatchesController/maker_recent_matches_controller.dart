import 'package:cupid_match/models/IncomingRequestModel/IncomingRequestModel.dart';
import 'package:get/get.dart';
import '../../../data/response/status.dart';

import '../../../models/IncomingMakerRequestModel/incoming_maker_request_model.dart';
import '../../../models/MakerRecentMatchesModel/maker_recent_matches_model.dart';
import '../../../repository/Auth_Repository/Auth_Repository.dart';

class RecentMakerMatchesController extends GetxController {

  final _api = AuthRepository();

  int? RecentMakerMatchlength ;
  final rxRequestStatus = Status.LOADING.obs ;
  final RecentMakerMatchesValue =MakerRecentMatchesModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value ;
  void setUserList(MakerRecentMatchesModel value) => RecentMakerMatchesValue.value = value ;
  void setError(String value) => error.value = value ;


  void isrecentMakerMatchApi(){
    setRxRequestStatus(Status.LOADING);

    _api.RecentMakerMatchesApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);

      if(value.requests!.length>2){
        RecentMakerMatchlength = 2;
      }
      else{
        RecentMakerMatchlength = 1;
      }
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }
//
void refreshApi(){

    setRxRequestStatus(Status.LOADING);

  _api.RecentMakerMatchesApi().then((value){
    setRxRequestStatus(Status.COMPLETED);
    setUserList(value);
  }).onError((error, stackTrace){
    setError(error.toString());
    setRxRequestStatus(Status.ERROR);

  });
}
}