
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/SeekerRequestController/SeekerHomePageRequestController.dart';
import 'package:cupid_match/match_seeker/Siker_TabView.dart';
import 'package:cupid_match/match_seeker/chat_screen.dart';
import 'package:cupid_match/models/DoMachesModel.dart/DoMatchesModel.dart';
import 'package:cupid_match/models/ProfileScrollModel/ProfileScrollModel.dart';
import 'package:cupid_match/models/SeekerToMakerRequest/SeekerTomakerRequestModel.dart';
import 'package:cupid_match/models/SeekerToSeekerRequestModel/SeekerToSeekerRequestModel.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/response/status.dart';

class SeekerToMakerRequestController extends GetxController {

  final _api = AuthRepository();


  final rxRequestStatus = Status.LOADING.obs ;
  final DoMatches =SeekerToMakerRequestModel().obs ;
  RxString error = ''.obs;
  RxBool loading=false.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void SeekerToMakerRequest(SeekerToMakerRequestModel _value) => DoMatches.value = _value ;
  void setError(String _value) => error.value = _value ;
  HomeRequestController requestHomeController=Get.put(HomeRequestController());

  void SeekerToMakerRequestApiHit(BuildContext context){
   setRxRequestStatus(Status.LOADING);

     _showProgressDialog(context);


   loading.value=true;
   Map Data1={};
   if(selectedseekerid!=null){
    Data1={
"match_with":selectedseekerid.toString(),
"maker_id":Makerid.toString(),

   };}
   else {
     Data1 = {

       "maker_id": Makerid.toString()
     };
   }
    _api.SeekerToMakerRequestApi(Data1).then((value){
      print(Data1);
      setRxRequestStatus(Status.COMPLETED);
      Get.back();
      SeekerToMakerRequest(value);


      _showProgressSuccesDialog( context);
      print("ksndnvgndfkjbkdbnklnflkbnfobg${value.msg}");
      loading.value=false;




        //  Get.to( Siker_Tab_View(index: 0));


          if(value.requestId!=null){
              requestid=value.requestId.toString();

                                    if(requestid!=null){
                                      print(requestid);
                                      requestHomeController.homeRequest();}
    // Get.to(ChatPage());}
          }
    }).onError((error, stackTrace){
      setError(error.toString());
      print("error");

            loading.value=false;
      Get.back();
      print(error.toString());
      setRxRequestStatus(Status.ERROR);

    });

  }

  // void refreshApi(){

  //     setRxRequestStatus(Status.LOADING);

  //   _api.userListApi().then((value){
  //     setRxRequestStatus(Status.COMPLETED);
  //     setUserList(value);
  //   }).onError((error, stackTrace){
  //     setError(error.toString());
  //     setRxRequestStatus(Status.ERROR);

  //   });
  // }

  void _showProgressSuccesDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

             Column(
               crossAxisAlignment: CrossAxisAlignment.center,
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Text(


                   DoMatches.value.msg.toString(),
                      softWrap: true,
                      maxLines: 2,
                 textAlign: TextAlign.center,

                  ),
               ],
             ),
              SizedBox(height: Get.height*0.05,),
              MyButton(title: "ok",
                width:Get.width*0.5 ,
                height: Get.height*0.05,
                onTap: () {
                Get.back();


              },)
            ],
          ),
        );
      },
    );}
  void _showProgressDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16.0),
              Text("Loading..."),

            ],
          ),
        );
      },
    );}

}


