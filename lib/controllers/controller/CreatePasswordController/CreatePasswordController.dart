import 'dart:async';

import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:cupid_match/utils/utils.dart';
import 'package:cupid_match/controllers/controller/SignUpController/SignUpController.dart';
import 'package:cupid_match/views/sign_up/choose_profile.dart';
import 'package:cupid_match/views/sign_up/create_password.dart';
import 'package:cupid_match/views/user/login_Screen.dart';
import 'package:cupid_match/views/user/otp.dart';
import 'package:cupid_match/views/user/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/my_button.dart';


class CreatePasswordController extends GetxController {
  final SignUpControllerinstance=Get.put(SignUpController());
  final _api = AuthRepository();



  final PasswordController = TextEditingController().obs ;
  final ConfirmPasswordController = TextEditingController().obs ;


  RxBool loading = false.obs;


  void CreatePasswordapiiHit(BuildContext context){
    loading.value = true ;
    print(loading.value);
    Map data = {
      'credentials' : SignUpControllerinstance.credentialsController.value.text.trim(),
      'password' : PasswordController.value.text.trim(),


    };
    print(data);
    _api.CreatePasswordApi(data).then((value){
      loading.value = false ;
      print(value);
      // Utils.snackBar( "Message",value.msg.toString());
    Get.to(() => ChooseProfile());
      PasswordController.value.clear();
      ConfirmPasswordController.value.clear();

    }).onError((error, stackTrace){
      print("error");
      loading.value = false ;
      showOptionsDialog(context,error.toString());
    });



  }
  Future<void> showOptionsDialog(BuildContext context, String? error) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15) ,side: BorderSide.none ),
          title: Center(
            child: Column(
              children: [


                Text(
                  error.toString(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12,color: Colors.black),
                ),
              ],
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // GestureDetector(
              //   child: const Icon(
              //     Icons.camera_alt_outlined,
              //     color: Colors.white,
              //   ),
              //   onTap: () {
              //     _pickImage(ImageSource.camera);
              //   },
              // ),
              Center(
                child: MyButton(
                  width: Get.width*.27,
                  height: Get.height*.05,
                  title: "Ok", onTap: () {
                  Get.back();
                },),
              )
            ],
          ),
        );
      },
    );}
}