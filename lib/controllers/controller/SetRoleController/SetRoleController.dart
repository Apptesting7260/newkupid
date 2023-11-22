import 'dart:async';

import 'package:cupid_match/match_maker/match_maker_profile_update.dart';
import 'package:cupid_match/match_seeker/profile/update_profile_details.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:cupid_match/utils/utils.dart';
import 'package:cupid_match/controllers/controller/SignUpController/SignUpController.dart';
import 'package:cupid_match/views/sign_up/create_password.dart';
import 'package:cupid_match/views/user/otp.dart';
import 'package:cupid_match/views/user/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
String ?BarrierToken;
String? userId;
int ProfileType=1;
class SetRoleController extends GetxController {
  final SignUpControllerinstance=Get.put(SignUpController());
  final _api = AuthRepository();

  RxBool loading = false.obs;

  void SetRoleapiiHit()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    loading.value = true ;
    print(loading.value);
    Map data = {
      'credentials' : SignUpControllerinstance.credentialsController.value.text,
      'type' : ProfileType.toString()
    };
    print(data);
    _api.SetRoleApiApi(data).then((value){
      loading.value = false ;
      print(value);
      BarrierToken =value.token;
      userId=value.userId!.toString();
      print("user id maker ===================================${userId}");
      print(
          BarrierToken
      );


// String Tokernid=value.tokenId.toString();

prefs.setString('BarearToken', BarrierToken!);
prefs.setString('Tokernid', userId!);
print(prefs.getString("BarearToken"));
      print(prefs.getString("Tokernid"));
      // Utils.snackBar( "Message",value.msg.toString());

     Timer(Duration(seconds: 2),(){
       ProfileType != 2
           ? Get.to(() => MakerProfileDetails())
           : Get.to(() => SikerProfileDetails());
     });

    }).onError((error, stackTrace){
      print("error");
      loading.value = false ;
      Utils.snackBar('Error', error.toString());
    });
  }
}