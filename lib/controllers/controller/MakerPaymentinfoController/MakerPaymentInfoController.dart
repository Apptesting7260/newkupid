
import 'package:cupid_match/match_maker/Chose_Subcription.dart';

import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:cupid_match/utils/utils.dart';
import 'package:cupid_match/controllers/controller/SignUpController/SignUpController.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MakerPaymentInfoController extends GetxController {
  final SignUpControllerinstance=Get.put(SignUpController());
  final _api = AuthRepository();
  final fullnamecontroller=TextEditingController().obs;
  final banknamecontroller=TextEditingController().obs;
  final account_nocontroller=TextEditingController().obs;
  final raccount_nocontroller=TextEditingController().obs;
  final ifsc_codecontroller=TextEditingController().obs;

  RxBool loading = false.obs;

  void MakerPaymentInfoapiiHit(){
    loading.value = true ;
    print(loading.value);
    Map data = {
      'fullname' : fullnamecontroller.value.text,
      'bankname' : banknamecontroller.value.text,
      'account_no' :account_nocontroller.value.text,
      'ifsc_code' : ifsc_codecontroller.value.text,

    
    };
    print(data);
    _api.MakerPaymentInfoApi(data).then((value){
      loading.value = false ;
      print(value);
     Get.to(ChooseSubscriptions());
      // Utils.snackBar( "Message",value.message.toString());
      //
    }).onError((error, stackTrace){
      print("error");
      loading.value = false ;
      Utils.snackBar('Error', error.toString());
    });
  }
}