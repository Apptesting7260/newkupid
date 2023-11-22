
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/SeekerRequestController/SeekerHomePageRequestController.dart';
import 'package:cupid_match/controllers/controller/RecentSeekerMatchesController/recent_seeker_matches_controller.dart';
import 'package:cupid_match/match_seeker/Siker_TabView.dart';
import 'package:cupid_match/match_seeker/chat_screen.dart';
import 'package:cupid_match/models/DoMachesModel.dart/DoMatchesModel.dart';
import 'package:cupid_match/models/ProfileScrollModel/ProfileScrollModel.dart';
import 'package:cupid_match/models/SeekerToSeekerRequestModel/SeekerToSeekerRequestModel.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:get/get.dart';

import '../../../data/response/status.dart';

class SeekerToSeekerRequestController extends GetxController {

  final _api = AuthRepository();


  final rxRequestStatus = Status.LOADING.obs ;
  final DoMatches =SikerTOSikerRequestModel().obs ;
  RxString error = ''.obs;
  RxBool loading=false.obs;
  RecentSeekerMatchesController recentSeekerMatchesController =
  Get.put(RecentSeekerMatchesController());
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void SikerTOSikerRequest(SikerTOSikerRequestModel _value) => DoMatches.value = _value ;
  void setError(String _value) => error.value = _value ;
  HomeRequestController requestHomeController=Get.put(HomeRequestController());

  void SikerTOSikerRequestApiHit(){
   setRxRequestStatus(Status.LOADING);
   loading.value=true;
   Map Data={
"match_with":match_withid,
   };

    _api.SeekerToSeekerRequestApi(Data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      SikerTOSikerRequest(value);
      print(value.msg);
          // Get.back();
        //  Get.to( Siker_Tab_View(index: 0));
          loading.value=false;

          if(value.requestId!=null){
              requestid=value.requestId.toString();

                                    if(requestid!=null){
                                      print(requestid);
                                      requestHomeController.homeRequest();
                                      recentSeekerMatchesController.isrecentSeekermatchesApi();

                                    }
    // Get.to(ChatPage());}
          }
    }).onError((error, stackTrace){
      setError(error.toString());
      print("error");

            loading.value=false;
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


