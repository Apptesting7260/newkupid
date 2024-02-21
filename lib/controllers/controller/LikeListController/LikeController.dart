
import 'dart:convert';

import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/models/MagicProfile/MagicProfiles.dart';
import 'package:cupid_match/models/likeModel/LikeListModel.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:get/get.dart';

import '../../../GlobalVariable/GlobalVariable.dart';
import '../../../models/likeModel/LikeModel.dart';
import '../../sikerProfileController/sikershortprofilecontrller.dart';
import '../MakerLikeListController/MakerLikeListController.dart';
import '../ViewMakerProfileDetailsController/ViewMakerProfileDetailscontroller.dart';
import 'LikeListController.dart';



class LikeController extends GetxController {

  final _api = AuthRepository();

  MakerLikeListController makerLikeListController=Get.put(MakerLikeListController());

  final rxRequestStatus = Status.LOADING.obs ;
  final LikeList =LikeModel().obs ;
  RxString error = ''.obs;
  final ViewSikerProfileDetailsControllerinstance =
  Get.put(SikerShortProfileDetailsController());
  final LikeListControllerinstance = Get.put(LikeListController());
  final ViewMakerProfileDetailsControllerinstance =
  Get.put(ViewMakerProfileDetailsController());
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setlikelistList(LikeModel _value) => LikeList.value = _value ;
  void setError(String _value) => error.value = _value ;


  void LikeApiHit(){
    //  setRxRequestStatus(Status.LOADING);
    var data={
      // "like_to":LikeTo.toString(),
      // "profile_like":profileLike.toString(),
      'like_to': LikeTo.toString(),
      'profile_like': profileLike.toString(),
       'like_type':like_type.toString()
    };
    print(data);
    _api.likepi(data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setlikelistList(value);
  print(value);
      ViewSikerProfileDetailsControllerinstance
          .ViewProfileDetail
          .value
          .profileDetails![0]
          .likeStatus= ViewSikerProfileDetailsControllerinstance
          .ViewProfileDetail
          .value
          .profileDetails![0]
          .likeStatus == 0?1:0;
      LikeListControllerinstance.LikeListApiHit();
      ViewSikerProfileDetailsControllerinstance
          .ViewProfileDetail
          .value
          .profileDetails![0]
          .loding
          .value = false;
      print( ViewSikerProfileDetailsControllerinstance
          .ViewProfileDetail
          .value
          .profileDetails![0]
          .likeStatus);
      makerLikeListController.LikeListApiHit();

      // print("$slotImages===================");
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      print(error.toString());
      ViewSikerProfileDetailsControllerinstance
          .ViewProfileDetail
          .value
          .profileDetails![0]
          .loding
          .value = false;
    });
  }

  void SeekerToMakerLikeApiHit(){
    //  setRxRequestStatus(Status.LOADING);
    var data={
      // "like_to":LikeTo.toString(),
      // "profile_like":profileLike.toString(),
      'like_to': LikeTo.toString(),
      'profile_like': profileLike.toString(),
      'like_type':like_type.toString()
    };
    print(data);
    _api.likepi(data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setlikelistList(value);
      print(value);
      ViewMakerProfileDetailsControllerinstance
          .ViewProfileDetail
          .value
          .ProfileDetail!
          .likeStatus=ViewMakerProfileDetailsControllerinstance
          .ViewProfileDetail
          .value
          .ProfileDetail!
          .likeStatus == 0?1:0;
      LikeListControllerinstance.LikeListApiHit();
      ViewMakerProfileDetailsControllerinstance
          .ViewProfileDetail
          .value
          .ProfileDetail!
          .lodding
          .value = false;
      print( ViewMakerProfileDetailsControllerinstance
          .ViewProfileDetail
          .value
          .ProfileDetail!
          .likeStatus);

      // print("$slotImages===================");
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      print(error.toString());
      ViewMakerProfileDetailsControllerinstance
          .ViewProfileDetail
          .value
          .ProfileDetail!
          .lodding
          .value = false;
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
}