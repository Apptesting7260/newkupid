

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupid_match/match_maker/Maker_TabView.dart';
import 'package:cupid_match/match_maker/match_maker_profile_update.dart';
import 'package:cupid_match/match_maker/payment_screen.dart';
import 'package:cupid_match/match_maker/verify_identity.dart';
import 'package:cupid_match/match_seeker/Siker_TabView.dart';
import 'package:cupid_match/match_seeker/photos.dart';
import 'package:cupid_match/match_seeker/profile/update_profile_details.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widgets/my_button.dart';


class UserLoginController extends GetxController {

  final _api = AuthRepository();

  final Email_Or_Phone_Controller = TextEditingController().obs ;
  final PasswordController = TextEditingController().obs ;
  
  // final passwordController = TextEditingController().obs ;

  RxBool loading = false.obs;

  void UserLoginapiHit(BuildContext context)async{
     FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    loading.value = true ;
    print(loading.value);
    Map data = {
      'credentials' : Email_Or_Phone_Controller.value.text,
      'password' : PasswordController.value.text,
      
    };
    print(data);
    _api.UserLoginapi(data).then((value)async{
      loading.value = false ;
print(value);
String Bearertoken=value.token.toString();
String Tokernid=value.tokenId.toString();
String usertype=value.userType.toString();
prefs.setString('BarearToken', Bearertoken);
prefs.setString('Tokernid', Tokernid);
prefs.setString('Usertype', usertype);
print(prefs.getString('BarearToken'));
print(prefs.getString('Usertype'));
print(prefs.getString('Tokernid'));
      // Utils.snackBar( "Message",value.message.toString());


   
   

      if(value.userType=="1"){

//        if(value.currentStep==1){
// Get.offAll(MakerProfileDetails());
// pachedemail=Email_Or_Phone_Controller.value.text;
//
//        }else if(value.currentStep==2){
// Get.offAll(VerifyScreen());
//
//        }else if(value.currentStep==3){
// Get.offAll(PaymentScreen());
//
//
//        }else if(value.currentStep==4){
        Get.offAll(Maker_TabView(index: 0,));
       // }

      }else{

        if(value.currentStep==1){
Get.offAll(SikerProfileDetails());
        }else if(value.currentStep==2){
Get.offAll(PhotosScreen());

        }else if(value.currentStep==3){
 Get.offAll(Siker_Tab_View(index: 0,));
        }
       
      }

   
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