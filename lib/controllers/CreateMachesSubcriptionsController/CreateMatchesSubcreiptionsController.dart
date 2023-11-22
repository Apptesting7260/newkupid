import 'package:cupid_match/controllers/controller/FetchSubcriptionController/FetchSubcriptionController.dart';
import 'package:cupid_match/controllers/controller/ForgotPasswordController/ForgotPasswordController.dart';
import 'package:cupid_match/match_maker/MachesSubscriptionplan.dart';
import 'package:cupid_match/match_maker/Monthly_subscription_plans.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:cupid_match/utils/utils.dart';
import 'package:cupid_match/controllers/controller/SignUpController/SignUpController.dart';
import 'package:cupid_match/views/sign_up/create_password.dart';
import 'package:cupid_match/views/user/otp.dart';
import 'package:cupid_match/views/user/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class CreateMonthplanController extends GetxController {

    final FetchSubcriptionControllerinstance=Get.put(FetchSubcriptionController());
  final _api = AuthRepository();

  final matchesController = TextEditingController().obs ;
  final AmountController = TextEditingController().obs ;

  RxBool loading = false.obs;

  void CreateMatchesPlanapiiHit(){
    loading.value = true ;
    print(loading.value);
    Map data = {
      'matches' : matchesController.value.text,
      'amount' :AmountController.value.text
    };
    print(data);
    _api.CreateMatchesPlanApi(data).then((value){
      loading.value = false ;
   FetchSubcriptionControllerinstance.SubcriptionListApi();
Get.off(MatchesSubcreiptionPlan());
      Utils.snackBar( "Message",value.msg.toString());
  


    }).onError((error, stackTrace){
      print("error");
      loading.value = false ;
      Utils.snackBar('Error', error.toString());
    });
  }
}