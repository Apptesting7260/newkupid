import 'dart:async';
import 'dart:convert';
import 'package:cupid_match/controllers/controller/SignUpController/SignUpController.dart';
import 'package:cupid_match/match_seeker/profile/update_profile_details.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/response/status.dart';
import 'controller/SetRoleController/SetRoleController.dart';

String? Finalcredencial;

class UserEmailAndPhoneVerifyController extends GetxController {
  final _api = AuthRepository();

  final emailAndPhoneVerifyController = TextEditingController().obs;
  final SignUpControllerinstance = Get.put(SignUpController());
  final otpController = TextEditingController().obs;
  final rxRequestStatus = Status.COMPLETED.obs;
  RxString error = ''.obs;
  final phone_verify = 0.obs;
  final email_verify = 0.obs;
  RxBool verified = false.obs;
  RxBool optsent = false.obs;
  RxBool ciculerEdicator = false.obs;
  RxBool phone_verified = false.obs;
  RxBool resendOtp = false.obs;


  RxBool loading = false.obs;
  Future<void> PhoneAndEmailVerifiyed() async {
    rxRequestStatus(Status.LOADING);

    Map data = {};
    if (emailAndPhoneVerifyController.value.text.contains("@")) {
      data = {
        'email': emailAndPhoneVerifyController.value.text,
        'update_type': "email",
        "type": ProfileType.toString(),
        'phone': SignUpControllerinstance.credentialsController.value.text,
      };
    } else {
      data = {
        'phone': emailAndPhoneVerifyController.value.text,
        'update_type': "phone",
        "type": ProfileType.toString(),
        'email': SignUpControllerinstance.credentialsController.value.text,
      };
    }
    final prefs = await SharedPreferences.getInstance();

    print(emailAndPhoneVerifyController.value.text);
    // _api.UserPhoneAndNumberVerfyApi(data).then((value) => null)
    print(data);

    _api.UserPhoneAndNumberVerfyApi(data).then((value) async {
      resendOtp.value=true;


      optsent.value = true;
      rxRequestStatus(Status.COMPLETED);

      // ViewProfileDetails(value);
      print("======================================================$value");
      print(value.otp);


      //
      // Get.snackbar(
      //   "Message",
      //   "Otp Sent",
      //   backgroundColor: Color(0xffFE008F),);

    }).onError((error, stackTrace) {
           rxRequestStatus(Status.COMPLETED);
      print("${error.toString()}===============+++=");
      rxRequestStatus(Status.ERROR);
    });
  }

  Future<void> PhoneAndEmaiOtpVerifyed(BuildContext context) async {
     // rxRequestStatus(Status.LOADING);
    loading.value=true;
    ciculerEdicator.value=true;
    Map data = {};
    if (emailAndPhoneVerifyController.value.text.contains("@")) {
      data = {
        'email': emailAndPhoneVerifyController.value.text,
        'otp': otpController.value.text,
        'email_otp_verified_status': "1",
        'update_type': "email_otp_verification",
        "type": ProfileType.toString()
      };
    } else {
      data = {
        'update_type': "phone_otp_verification",
        'phone': emailAndPhoneVerifyController.value.text,
        'otp': otpController.value.text,
        'phone_otp_verification_status': "1",
        "type": ProfileType.toString()
      };
    }
    print("==========$data");

    final prefs = await SharedPreferences.getInstance();
    loading.value = true;
    print(otpController.value.text);

    // _api.UserPhoneAndNumberVerfyApi(data).then((value) => null)

    otpController.value.clear();
    _api.UserPhoneAndNumberVerfyApi(data).then((value) async {
     // rxRequestStatus(Status.COMPLETED);

      ciculerEdicator.value=false;

      // ViewProfileDetails(value);
      verified.value = true;
      loading.value=false;
      print("======================================================$value");
      print(value.msg);

      print(
          "hit request  maker side hyfr jfjd api 5678900bbuhc 8u0u00-09-9-9-09-9-9-09-9jkcniuicjzijnnzijxn");
      loading.value = false;
      print("==========$data");

      Get.back();
      // Get.snackbar(
      //     "Message",
      //     "Varify Successfully",
      //     backgroundColor: Color(0xffFE008F),);
      print("fjksdfn");
    }).onError((error, stackTrace) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Center(child: Text(error.toString())),
          action: SnackBarAction(
            label: '',
            onPressed: () {
              // Handle the action when the button in the SnackBar is pressed.
            },
          ),
        ),
      );


      print("==========$data");
      otpController.value.clear();
      loading.value = false;
      print("${error.toString()}===============+++=");
      //      rxRequestStatus(Status.COMPLETED);
      // rxRequestStatus(Status.ERROR);
      ciculerEdicator.value=false;

      // Get.snackbar(
      //   "Message",
      //   error.toString(),
      //   backgroundColor: Color(0xffFE008F),
      // );
    });
  }

}
