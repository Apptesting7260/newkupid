




import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/models/AllOcupationsModel/AllOcupationsModel.dart';
import 'package:cupid_match/models/ViewProfileDetailsModel/ViewProfileDetailsModel.dart';
import 'package:cupid_match/models/ViewSikerDetailsToMatchModel,.dart/ViewSikerDetailsModel.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../models/MakerProfileModel/MakerEditrviewProfileModel.dart';

class MakerEditViewDeatailsController extends GetxController {

  final _api = AuthRepository();


  final rxRequestStatus = Status.LOADING.obs ;
  final ViewProfileDetail =MakerEditProfileModel().obs ;
  RxString error = ''.obs;



  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void ViewProfileDetails(MakerEditProfileModel _value) => ViewProfileDetail.value = _value ;
  void setError(String _value) => error.value = _value ;


  void ViewSikerProfileDetailsApiHit()async{

    final prefs=await SharedPreferences.getInstance();


    setRxRequestStatus(Status.LOADING);

    _api.ViewMakerEditeDetails().then((value){
      setRxRequestStatus(Status.COMPLETED);
      ViewProfileDetails(value);
      print(value);

      print("fjksdfn");
    }).onError((error, stackTrace){
      setError(error.toString());
      print(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }



}