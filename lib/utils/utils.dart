

import 'package:cupid_match/res/colors/app_color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

class Utils {


    static void fieldFocusChange(BuildContext context , FocusNode current , FocusNode  nextFocus ){
      current.unfocus();
      FocusScope.of(context).requestFocus(nextFocus);
    }


    static toastMessage(String message){
      Fluttertoast.showToast(
          msg: message ,
        backgroundColor:  AppColor.blackColor,
        textColor: AppColor.whiteColor,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,


      );
    }


    static toastMessageCenter(String message){
      Fluttertoast.showToast(
        msg: message ,
        backgroundColor: AppColor.blackColor ,
        gravity: ToastGravity.CENTER,
        toastLength: Toast.LENGTH_LONG,
        textColor: AppColor.whiteColor,
      );
    }

    static snackBar(String title, String message){

      Get.snackbar(
        backgroundColor: Colors.pink,
        colorText:Colors.white,
          title,
          message ,
      );
    }
    static notificationsSnackBar(String title, String message, bool error){

      Get.snackbar(title, message,
       
        backgroundColor:  Colors. pinkAccent,
        colorText: Colors.white
       );
    }
}