


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/models/AllOcupationsModel/AllOcupationsModel.dart';
import 'package:cupid_match/models/ViewMakerProfileDetailsModel/ViewMakerProfileDetailsModel.dart';
import 'package:cupid_match/models/ViewProfileDetailsModel/ViewProfileDetailsModel.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/MakerMyProfileDetailModel/GetMyPrpfileDetailsModel.dart';

class ViewMakerMyProfileDetailsController extends GetxController {

  final _api = AuthRepository();
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final rxRequestStatus = Status.LOADING.obs ;
  final ViewProfileDetail =MakerMyprofileDetailsModel().obs ;
  RxString error = ''.obs;



  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void ViewProfileDetails(MakerMyprofileDetailsModel _value) => ViewProfileDetail.value = _value ;
  void setError(String _value) => error.value = _value ;


  void ViewMakerProfileDetailsApiHit()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferences sp = await SharedPreferences.getInstance();
    Map data;

    setRxRequestStatus(Status.LOADING);
    print("user id ========== ${sp.getString('Tokernid')}");
    print("user id ===================$Makerid");

    _api.getMakerProfileDetails().then((value) async {
      setRxRequestStatus(Status.COMPLETED);
      ViewProfileDetails(value);
      print(value);
        DocumentReference roomRef =
        _firestore.collection("m${value.requests!.id.toString()}").doc("Status");
    await roomRef.set({'status': "online"});

  
  

    // Get the toke

   
       var deviceTokenRef = _firestore.collection("m${value.requests!.id.toString()}").doc('Device Token');
    var deviceTokenRefsnapshot =  deviceTokenRef.get();
  
       deviceTokenRef.set({'device token': fcmToken});
  makerUserId=value.requests!.id.toString();
  print("====================================maker id===================$makerUserId--------------------------------------------------------------------");

      print("fjksdfn");
    }).onError((error, stackTrace){
      setError(error.toString());
      print(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }


}