import 'dart:async';

import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:cupid_match/utils/utils.dart';
import 'package:cupid_match/views/user/otp.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

String? sigupcredencial;
class SignUpController extends GetxController {

  final _api = AuthRepository();

  final credentialsController = TextEditingController().obs ;
  
  // final passwordController = TextEditingController().obs ;

  RxBool loading = false.obs;

  void SignUpapiHit(BuildContext context){
    loading.value = true ;
    print(loading.value);
    Map data = {
      'credentials' : credentialsController.value.text,
      
    };
    print(data);
    _api.SignUpApi(data).then((value){

print(value);

      // Utils.snackBar( "Message",value.msg.toString());
if(value.msg=="User Already Exist"){
showAlertDialog(value.msg.toString(),context);
loading.value = false ;
}
   Timer(Duration(seconds: 2),(){
   if(value.msg!="User Already Exist") {
    sigupcredencial=credentialsController.value.text;
Get.to(() => PinFields(
       pinPutFocusNode: FocusNode(),

       // key: _formKey,
       formKey: Key(" "),

     ));
    loading.value = false ;
   } 
   }) ;
    }).onError((error, stackTrace){
      print("error");
  
      loading.value = false ;
      Utils.snackBar('Error', error.toString());
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