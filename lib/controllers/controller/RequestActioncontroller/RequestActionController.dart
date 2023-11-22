


import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/controller/RequestDetailsController/RequestDetailsController.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/models/AllOcupationsModel/AllOcupationsModel.dart';
import 'package:cupid_match/models/RequestActionModel/RequestActionModel.dart';
import 'package:cupid_match/models/ViewMakerProfileDetailsModel/ViewMakerProfileDetailsModel.dart';
import 'package:cupid_match/models/ViewProfileDetailsModel/ViewProfileDetailsModel.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestActionController extends GetxController {

  final ViewRequestDetailsControllerinstance=Get.put(ViewRequestDetailsController());
  final _api = AuthRepository();


  final rxRequestStatus = Status.LOADING.obs ;
  final RequestActionDetail =RequestActionModel().obs ;
  RxString error = ''.obs;
RxBool loading=false.obs;


  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void RequestActionDetails(RequestActionModel _value) => RequestActionDetail.value = _value ;
  void setError(String _value) => error.value = _value ;


  void RequestActionApiHit()async{
        final SharedPreferences prefs = await SharedPreferences.getInstance();
loading.value=true;
    Map data={
"request_id":requestid,
"action_with":action_with==null?"":action_with,
"action_from":action_from==null?"":action_from,
"action":actiontype,


    };
    print(data);
   setRxRequestStatus(Status.LOADING);

    _api.RequestActionApi(data).then((value){
   
      RequestActionDetails(value);
      print(value);
ViewRequestDetailsControllerinstance.ViewRequestDetailsApiHit();
    loading.value=false;
         print("fjksdfn");
    }).onError((error, stackTrace){
      setError(error.toString());
      print(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }

  
}