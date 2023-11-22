


import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/models/AllOcupationsModel/AllOcupationsModel.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetAllOcupationsController extends GetxController {

  final _api = AuthRepository();


  final rxRequestStatus = Status.LOADING.obs ;
  final OcupationsList =AllOcupationsModel().obs ;
  RxString error = ''.obs;
  List<String> Ocupations=["Select Occupation"].obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserList(AllOcupationsModel _value) => OcupationsList.value = _value ;
  void setError(String _value) => error.value = _value ;


  void GetAllOcupationsListApiHit(){
    setRxRequestStatus(Status.LOADING);

    _api.GetAllOcupationsApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print(value);

    for(int i=0;i<value.occupations
    !.length; i++){
      Ocupations.add(value.occupations![i].name.toString());
    }

    print(Ocupations);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }

  
}