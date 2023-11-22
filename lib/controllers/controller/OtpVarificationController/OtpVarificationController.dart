import 'dart:async';

import 'package:cupid_match/controllers/controller/ForgotPasswordController/ForgotPasswordController.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:cupid_match/utils/utils.dart';
import 'package:cupid_match/controllers/controller/SignUpController/SignUpController.dart';
import 'package:cupid_match/views/sign_up/create_password.dart';
import 'package:cupid_match/views/user/otp.dart';
import 'package:cupid_match/views/user/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/my_button.dart';

String? Verificationotp;
class OtpVarificationController extends GetxController {
final SignUpControllerinstance=Get.put(SignUpController());
ForgotPasswordController ForgotPasswordControllerInstanse=Get.put(ForgotPasswordController());
  final _api = AuthRepository();

  final OtpController = TextEditingController().obs ;

  RxBool loading = false.obs;
  RxBool  verify = false.obs;
// RxInt time=30.obs;
// late Timer _timer;
// void startTimer() {
//   const oneSecond = Duration(seconds: 1);
//   _timer = Timer.periodic(oneSecond, (timer) {
//
//     if(time>=1){
//       time--;
//     }


  void OtpVerificationapiiHit(BuildContext context){
    loading.value = true ;
    print(loading.value);
    Map data = {
      'credentials' : SignUpControllerinstance.credentialsController.value.text==null||SignUpControllerinstance.credentialsController.value.text==""?ForgotPasswordControllerInstanse.EmailController.value.text:SignUpControllerinstance.credentialsController.value.text,
      'otp' : OtpController.value.text,
    };
    print(data);
    _api.OtpVarificationApi(data).then((value) {
      loading.value = false;
      verify.value = true;
      Verificationotp = OtpController.value.text;
      print(value);
      // Utils.snackBar( "Message",value.msg.toString());

      if (value.msg == "OTP Verified") {
        Get.to(() => CreatePassword());
      }
    }
).onError((error, stackTrace){
      print("error");
      loading.value = false ;
      // Utils.snackBar('Error', error.toString());
      showAlertDialog(error.toString(),context);
    });
  }



void showAlertDialog(String error,BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(

        shape: RoundedRectangleBorder(

          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 0,

        backgroundColor: Colors.white,
        child: Container(
          decoration: BoxDecoration(border: Border.all(color: Colors.pink,width: 2),
            borderRadius: BorderRadius.circular(16.0),),
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "OOPS!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(error,style: TextStyle(color: Colors.black),),
              SizedBox(height: 16.0),
              Align(
                alignment: Alignment.center,
                child: MyButton(
                  title: "Ok",
                  width: Get.width*.2,
                  height: Get.height*0.05,
                  onTap: (){
                    Get.back();
                  },
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
}