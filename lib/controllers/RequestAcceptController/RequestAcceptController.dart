




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/match_seeker/Requests/SeekeerIncominSingalRequestPage.dart';
import 'package:cupid_match/models/AllOcupationsModel/AllOcupationsModel.dart';
import 'package:cupid_match/models/RequestAcceptModel/RequestAcceptModel.dart';
import 'package:cupid_match/models/ViewProfileDetailsModel/ViewProfileDetailsModel.dart';
import 'package:cupid_match/models/ViewSikerDetailsToMatchModel,.dart/ViewSikerDetailsModel.dart';
import 'package:cupid_match/models/chatmodels/usermodel.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../SeekerMyProfileDetailsController/SeekerMyProfileController.dart';
import '../controller/RequestDetailsController/RequestDetailsController.dart';

class RequestAcceptController extends GetxController {

  final _api = AuthRepository();


  final rxRequestStatus = Status.LOADING.obs ;
  final RequestAccept =RequestAcceptModel().obs ;
  RxString error = ''.obs;



  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void RequestAccepts(RequestAcceptModel _value) => RequestAccept.value = _value ;
  void setError(String _value) => error.value = _value ;
  final ViewRequestDetailsController seekerOutgoingRequestSinglePageController = Get.put(ViewRequestDetailsController());

  void RequestAcceptApiHit()async{
    setRxRequestStatus(Status.LOADING);
 FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final prefs=await SharedPreferences.getInstance();
  final box3 = GetStorage();

    Map data={
"request_id":requestid,
"match_with_id":match_with_id,
"match_from_id":match_from_id,
"status":Requeststatus,
   "match_type"  :Requestmatchtype.toString()
    };
  // //  setRxRequestStatus(Status.LOADING);
  // if (box3.hasData('seekrprofiledata')) {
  //   // Use cached data if available
  //   final cachedData = box3.read('seekrprofiledata');
  //   RequestAccepts(ViewSikerDetailsToMatchModel.fromJson(cachedData));
  //   setRxRequestStatus(Status.COMPLETED);
  // } else {
    _api.RequestAcceptModelApi(data).then((value)async{
      setRxRequestStatus(Status.COMPLETED);
      RequestAccepts(value);
      print(value);
      print("abcd");

        seekerOutgoingRequestSinglePageController.ViewRequestDetailsApiHit();

        //  print("fjksdfn");
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.COMPLETED);
      setError(error.toString());
      print("${error.toString()}+++--*****+");
      print(seekerOutgoingRequestSinglePageController.ViewProfileDetail.value.data!.matchType.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }
  }
  
// }