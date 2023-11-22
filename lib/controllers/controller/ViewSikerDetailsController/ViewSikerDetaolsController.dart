




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/models/AllOcupationsModel/AllOcupationsModel.dart';
import 'package:cupid_match/models/ViewProfileDetailsModel/ViewProfileDetailsModel.dart';
import 'package:cupid_match/models/ViewSikerDetailsToMatchModel,.dart/ViewSikerDetailsModel.dart';
import 'package:cupid_match/models/chatmodels/usermodel.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ViewSikerProfileDetailsController extends GetxController {

  final _api = AuthRepository();


  final rxRequestStatus = Status.LOADING.obs ;
  final ViewProfileDetail =ViewSikerDetailsToMatchModel().obs ;
  RxString error = ''.obs;



  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void ViewProfileDetails(ViewSikerDetailsToMatchModel _value) => ViewProfileDetail.value = _value ;
  void setError(String _value) => error.value = _value ;


  void ViewSikerProfileDetailsApiHit()async{
    setRxRequestStatus(Status.LOADING);
 FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final prefs=await SharedPreferences.getInstance();
  final box3 = GetStorage(); 
    Map data={
"user_id":userIdsiker
    };
  // //  setRxRequestStatus(Status.LOADING);
  // if (box3.hasData('seekrprofiledata')) {
  //   // Use cached data if available
  //   final cachedData = box3.read('seekrprofiledata');
  //   ViewProfileDetails(ViewSikerDetailsToMatchModel.fromJson(cachedData));
  //   setRxRequestStatus(Status.COMPLETED);
  // } else {
    _api.ViewSikerDetailsToMatchApi(data).then((value)async{
      print(data);
      print("abcd");
      setRxRequestStatus(Status.COMPLETED);
      ViewProfileDetails(value);
      print(value);
      print("abcd");

  

        //  print("fjksdfn");
    }).onError((error, stackTrace){
      setRxRequestStatus(Status.COMPLETED);
      setError(error.toString());
      print("${error.toString()}+++--*****+");
      setRxRequestStatus(Status.ERROR);

    });
  }
  }
  
// }