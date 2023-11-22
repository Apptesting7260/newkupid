import 'dart:async';
import 'dart:convert';
import 'package:cupid_match/controllers/controller/SignUpController/SignUpController.dart';
import 'package:cupid_match/match_seeker/profile/update_profile_details.dart';
import 'package:http/http.dart' as http;
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:cupid_match/utils/utils.dart';
import 'package:cupid_match/views/user/otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/response/status.dart';
import 'SetRoleController/SetRoleController.dart';


String? Finalcredencial;

class EditeEmailController extends GetxController {
  final _api = AuthRepository();

  final emailVerifyController = TextEditingController().obs;
  final phoneVerifyController = TextEditingController().obs;
  final SignUpControllerinstance = Get.put(SignUpController());
  final otpController = TextEditingController().obs;
  final rxRequestStatus = Status.LOADING.obs;
  RxString error = ''.obs;
  final phone_verify = 0.obs;
  final email_verify = 0.obs;
  RxBool verified = false.obs;
  RxBool optsent = false.obs;
  RxBool phone_verified = false.obs;

  RxBool loading = false.obs;
  Future<void> PhoneAndEmailVerifiyed() async {
    Map data = {};
    if (emailVerifyController.value.text.isNotEmpty) {
      data = {
        'email': emailVerifyController.value.text,
        'update_type': "email",
        "type": "2",
        'phone': SignUpControllerinstance.credentialsController.value.text,
      };
    } else {
      data = {
        'phone': phoneVerifyController.value.text,
        'update_type': "phone",
        "type": "2",
        'email': SignUpControllerinstance.credentialsController.value.text,
      };
    }
    final prefs = await SharedPreferences.getInstance();

    print(emailVerifyController.value.text);
    // _api.UserPhoneAndNumberVerfyApi(data).then((value) => null)
    print(data);

    _api.UserPhoneAndNumberVerfyApi(data).then((value) async {
      rxRequestStatus(Status.COMPLETED);
      // ViewProfileDetails(value);
      print("======================================================$value");
      print(value.otp);
      optsent.value = true;
      Get.snackbar(
        "Message",
        "Otp Sent",
        backgroundColor: Color(0xffFE008F),);
    }).onError((error, stackTrace) {
      print("${error.toString()}===============+++=");
      rxRequestStatus(Status.ERROR);
    });
  }

  Future<void> PhoneAndEmaiOtpVerifyed() async {
    Map data = {};
    if (emailVerifyController.value.text.isNotEmpty) {
      data = {
        'email': emailVerifyController.value.text,
        'otp': otpController.value.text,
        'email_otp_verified_status': "1",
        'update_type': "email_otp_verification",
        "type": "2"
      };
    } else {
      data = {
        'update_type': "phone_otp_verification",
        'phone': phoneVerifyController.value.text,
        'otp': otpController.value.text,
        'phone_otp_verification_status': "1",
        "type": "2"
      };
    }
    print("==========$data");

    final prefs = await SharedPreferences.getInstance();
    loading.value = true;
    print(otpController.value.text);
    // _api.UserPhoneAndNumberVerfyApi(data).then((value) => null)

    otpController.value.clear();
    _api.UserPhoneAndNumberVerfyApi(data).then((value) async {
      loading.value = false;
      rxRequestStatus(Status.COMPLETED);

      // ViewProfileDetails(value);
      verified.value = true;
      print("======================================================$value");
      print(value.msg);

      print(
          "hit request  maker side hyfr jfjd api 5678900bbuhc 8u0u00-09-9-9-09-9-9-09-9jkcniuicjzijnnzijxn");
      loading.value = false;
      print("==========$data");

      Get.back();
      Get.snackbar(
        "Message",
        "Varify Successfully",
        backgroundColor: Color(0xffFE008F),);
      print("fjksdfn");
    }).onError((error, stackTrace) {
      rxRequestStatus(Status.COMPLETED);
      print("==========$data");
      otpController.value.clear();
      loading.value = false;
      print("${error.toString()}===============+++=");
      rxRequestStatus(Status.ERROR);
      Get.back();
      Get.snackbar(
        "Message",
        error.toString(),
        backgroundColor: Color(0xffFE008F),
      );
    });
  }
}
