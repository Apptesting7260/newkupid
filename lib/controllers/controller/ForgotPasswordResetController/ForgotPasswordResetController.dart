import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:cupid_match/utils/utils.dart';
import 'package:cupid_match/controllers/controller/SignUpController/SignUpController.dart';
import 'package:cupid_match/views/sign_up/choose_profile.dart';
import 'package:cupid_match/views/sign_up/create_password.dart';
import 'package:cupid_match/views/user/otp.dart';
import 'package:cupid_match/views/user/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../views/user/verification.dart';
import '../ForgotPasswordController/ForgotPasswordController.dart';
import '../OtpVarificationController/OtpVarificationController.dart';


class ForgotPasswordResetController extends GetxController {

  final _api = AuthRepository();

  final PasswordController = TextEditingController().obs;
  final ConPasswordController = TextEditingController().obs;
  RxBool loading = false.obs;


  void ForgotPasswordResetApiHit(){
    loading.value = true ;
    print(loading.value);
    Map data = {
      'credentials' : Verificationemail,
      'otp' : Verificationotp,
      'password' : PasswordController.value.text,
    };
    print(data);
    _api.ForgotPasswordResetApi(data).then((value){
      loading.value = false ;
      print(value);
      // Utils.snackBar( "Message",value.msg.toString());
      //Get.to(() => Verification());

    }).onError((error, stackTrace){
      print("error");
      loading.value = false ;
      Utils.snackBar('Error', error.toString());
    });
  }
}