

import 'dart:async';
import 'dart:convert';

import 'package:cupid_match/controllers/SeekerMyProfileDetailsController/SeekerMyProfileController.dart';
import 'package:cupid_match/controllers/controller/StaticLiverPoolController/StaticLiverPoolController.dart';
import 'package:cupid_match/controllers/controller/liver_Pooled_Request_Controller/Liver_Pooled_Request_controller.dart';
import 'package:cupid_match/match_seeker/home_screen.dart';
import 'package:cupid_match/match_seeker/lever/new_liver.dart';
import 'package:cupid_match/models/IncomingRequestModel/IncomingRequestModel.dart';
import 'package:cupid_match/models/LiverPoolModel/LiverPollModel.dart';
import 'package:cupid_match/models/SeekerMyProfileDetailsModel/SeekerMyProfileDetailsModel.dart';
import 'package:cupid_match/models/SpinRequestModel/SpinRequestModel.dart';
import 'package:cupid_match/widgets/Spin_Will_Wigdet.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/response/status.dart';
import 'package:http/http.dart'as http;
import '../../../models/MakerChatListModel/maker_chat_list_model.dart';
import '../../../models/RecentSeekerMatches/recent_seeker_matches_Model.dart';
import '../../../models/SeekerChatListModel/seeker_chat_list_model.dart';
import '../../../repository/Auth_Repository/Auth_Repository.dart';

class SpinRequestController extends GetxController {
  final _api = AuthRepository();
  //int? seekerRequestlenght;

  final seekerMyProfileDetailsController =
      Get.put(SeekerMyProfileDetailsController());
  final rxRequestStatus = Status.LOADING.obs;
  final SpinRequestDetails =  SpinrequestModel().obs;
  RxString error = ''.obs;
final SpeendReqestControllerinstance = Get.put(SpeendReqestController());
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void LiverPoolRequest( SpinrequestModel value) =>
      SpinRequestDetails.value = value;
  void setError(String value) => error.value = value;
apihit()async{
     final prefs=await SharedPreferences.getInstance();
    final dio = Dio();
 var headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${prefs.getString('BarearToken')}',
  };
Map Data={
        "after_spin_request_data": [
          {
            "seeker_id":spinedprofilelist[0]["seeker_id"].toString(),
            "is_requested":spinedprofilelist[0]["is_requested"].toString()
          },
          {
            "seeker_id": spinedprofilelist[1]["seeker_id"].toString(),
            "is_requested":spinedprofilelist[1]["is_requested"].toString()
          },
          {
            "seeker_id":spinedprofilelist[2]["seeker_id"].toString(),
            "is_requested":spinedprofilelist[2]["is_requested"].toString()
          },
           {
            "seeker_id":spinedprofilelist[3]["seeker_id"].toString(),
            "is_requested":spinedprofilelist[3]["is_requested"].toString()
          }
        ]
      };
  try {
    final response = await dio.post(
      'https://urlsdemo.xyz/kupid/api/seeker/after-spin-seeker-request-profile',
      data:jsonEncode(Data),
      options: Options(headers: headers),
    );

    if (response.statusCode == 200) {
      print(response.data);
      print(spinedprofilelist);


              
              seekerMyProfileDetailsController.SeekerMyProfileDetailsApiHit();
                  SpeendReqestControllerinstance.SpeendRequestApihit();
              // staticLiverpullController.staticLiverPullmethodapihit();
              print("poooooooold=============");
            // Timer(Duration(seconds: 4), () {
                 Get.off((DomatchscreenSiker(title: 'Spin Wheel',)));
            //  });
    } else {
      print('Error: ${response.statusCode} - ${response.statusMessage}');
    }
  } catch (e) {
    print('Error: $e');
  }
}
}
//   void LiverPoolRequestApiHit() {
//     setRxRequestStatus(Status.LOADING);

    
//    Map data = {
//    "after_leverpool_request_data": Liverpooldprofiles
// };

// print(Liverpooldprofiles);
//     _api.LiverPoolRequestApi(data).then((value) {
//       setRxRequestStatus(Status.COMPLETED);
//       LiverPoolRequest(value);
// print(value);
// print("hited");
//       // if (value.data!.length > 2) {
//       //   seekerRequestlenght = 2;
//       // } else {
//       //   seekerRequestlenght = 1;
//       // }
//       staticLiverpullController.staticLiverPullmethodapihit();
//     }).onError((error, stackTrace) {
//       setError(error.toString());
//       print(error);
//       setRxRequestStatus(Status.ERROR);
//     });
  // }
//
// void refreshApi(){
//
//     setRxRequestStatus(Status.LOADING);
//
//   _api.userListApi().then((value){
//     setRxRequestStatus(Status.COMPLETED);
//     setUserList(value);
//   }).onError((error, stackTrace){
//     setError(error.toString());
//     setRxRequestStatus(Status.ERROR);
//
//   });
// }

