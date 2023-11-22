import 'package:cupid_match/models/IncomingRequestModel/IncomingRequestModel.dart';
import 'package:get/get.dart';
import '../../../data/response/status.dart';

import '../../../models/IncomingMakerRequestModel/incoming_maker_request_model.dart';
import '../../../models/MakerRecentMatchesModel/maker_recent_matches_model.dart';
import '../../../models/OutgoingMakerRequestModle/outgoing_maker_request_model.dart';
import '../../../repository/Auth_Repository/Auth_Repository.dart';

class OutgoingMakerRequestController extends GetxController {

  final _api = AuthRepository();

  // int? RecentMakerMatchlength ;
  final rxRequestStatus = Status.LOADING.obs ;
  final OutgoingMakerRequestValue =OutgoingMakerRequestModel1().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value ;
  void setUserList(OutgoingMakerRequestModel1 value) => OutgoingMakerRequestValue.value = value ;
  void setError(String value) => error.value = value ;


  void isOutgoingMakerRequestApi(){
    setRxRequestStatus(Status.LOADING);

    _api.OutgoingMakerRequestApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print(value);
      print("out going requeat 54276462c37264782364873672674678328");
      // print( value.requests![0].getanotherseeker!.name);

      // if(value.requests!.length>2){
      //   RecentMakerMatchlength = 2;
      // }
      // else{
      //   RecentMakerMatchlength = 1;
      // }
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

      print("error");
      print(error.toString());


    });
  }

void refreshApi(){

    setRxRequestStatus(Status.LOADING);

  _api.OutgoingMakerRequestApi().then((value){
    setRxRequestStatus(Status.COMPLETED);
    setUserList(value);
  }).onError((error, stackTrace){
    setError(error.toString());
    setRxRequestStatus(Status.ERROR);

  });
}
}