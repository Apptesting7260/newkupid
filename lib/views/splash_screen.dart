import 'dart:async';

import 'package:cupid_match/match_maker/Maker_TabView.dart';
import 'package:cupid_match/match_seeker/Siker_TabView.dart';
import 'package:cupid_match/views/sign_up/signup_screen.dart';
import 'package:cupid_match/views/user/login_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../match_maker/match_maker_profile_update.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();

usercheck();
    // TODO: implement initState
    super.initState();
  }


usercheck()async{
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      if(prefs.getString("BarearToken")!=null){


        if(prefs.getString('Usertype')=="1"){
                 Timer(Duration(seconds: 3), () {Get.off(Maker_TabView(index: 0,)); });

        }else{
 Timer(Duration(seconds: 3), () {Get.off(Siker_Tab_View(index: 0,)); });
   
        }
      }else{
         Timer(Duration(seconds: 3), () {Get.off(LoginScreen()); });
      }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height * 1,
          width: MediaQuery.of(context).size.width * 1,
          child: Image.asset(
            "assets/images/splash screen.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
