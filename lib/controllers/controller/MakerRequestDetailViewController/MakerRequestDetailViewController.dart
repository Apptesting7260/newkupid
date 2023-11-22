


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/controller/ViewMakerProfileDetailsController/ViewMakerProfileDetailscontroller.dart';
import 'package:cupid_match/controllers/controller/ViewSikerDetailsController/ViewSikerDetaolsController.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/models/AllOcupationsModel/AllOcupationsModel.dart';
import 'package:cupid_match/models/MakerSinglepageRequestModel/MakerSinglepageRequestModel.dart';
import 'package:cupid_match/models/RequestModel/RequestModel.dart';
import 'package:cupid_match/models/ViewMakerProfileDetailsModel/ViewMakerProfileDetailsModel.dart';
import 'package:cupid_match/models/ViewProfileDetailsModel/ViewProfileDetailsModel.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MakerRequestDetailsController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final ViewMakerProfileDetailsControllerinstance=Get.put(ViewMakerProfileDetailsController());
  final _api = AuthRepository();


  final rxRequestStatus = Status.LOADING.obs ;
  final ViewProfileDetail =MakersinglepageRequestModel().obs ;
  RxString error = ''.obs;
  



  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void viewRequestDetails(MakersinglepageRequestModel _value) => ViewProfileDetail.value = _value ;
  void setError(String _value) => error.value = _value ;


  Future<dynamic> MakerRequestDetailsApiHit()async{
        final SharedPreferences prefs = await SharedPreferences.getInstance();

    Map data={
"request_id":"1"

    };
    print("req$requestid");
   setRxRequestStatus(Status.LOADING);

    _api.MakerRequestDetailsApi(data).then((value)async{
      setRxRequestStatus(Status.COMPLETED);
      viewRequestDetails(value);
      print(value);
print(ViewMakerProfileDetailsControllerinstance.ViewProfileDetail.value.ProfileDetail!.id.toString());
print(value.data!.roomid.toString());

   await _firestore.collection("maker").doc(ViewMakerProfileDetailsControllerinstance.ViewProfileDetail.value.ProfileDetail!.id.toString()).collection("Request").doc(value.data!.id.toString()).set({
    "getseeker":value.data!.getseeker!.id.toString(),
    "getmaker":value.data!.getmaker==null?"": value.data!.getmaker!.id.toString(),
    "getanotherseeker":value.data!.getanotherseeker!.id.toString(),
    "requestid":value.data!.id.toString()
   });

 if(value.data!.roomid==null) {
  
  
 }else{
  await _firestore.collection("RoomId's").doc(value.data!.roomid.toString()).set({});
  }


         print("fjksdfn");
    }).onError((error, stackTrace){
      setError(error.toString());
      print(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }

  
}