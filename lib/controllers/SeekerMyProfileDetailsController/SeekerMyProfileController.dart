
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/controller/SetRoleController/SetRoleController.dart';
import 'package:cupid_match/match_seeker/home_screen.dart';
import 'package:cupid_match/models/IncomingRequestModel/IncomingRequestModel.dart';
import 'package:cupid_match/models/SeekerMyProfileDetailsModel/SeekerMyProfileDetailsModel.dart';
import 'package:get/get.dart';
import '../../../data/response/status.dart';

import '../../../models/MakerChatListModel/maker_chat_list_model.dart';
import '../../../models/RecentSeekerMatches/recent_seeker_matches_Model.dart';
import '../../../models/SeekerChatListModel/seeker_chat_list_model.dart';
import '../../../repository/Auth_Repository/Auth_Repository.dart';

class SeekerMyProfileDetailsController extends GetxController {
  final _api = AuthRepository();
  //int? seekerRequestlenght;
 final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final rxRequestStatus = Status.LOADING.obs;
  final SeekerMyProfileDetail = SeekerMyProfileDetailModelAutoGenerate().obs;
  RxString error = ''.obs;
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void SekerMyProfileDetails(SeekerMyProfileDetailModelAutoGenerate value) =>
      SeekerMyProfileDetail.value = value;
  void setError(String value) => error.value = value;

  // Map data = {};

  void SeekerMyProfileDetailsApiHit() {
    setRxRequestStatus(Status.LOADING);

    _api.SeekerMyProfileDetailsApi().then((value) async{
      setRxRequestStatus(Status.COMPLETED);
      SekerMyProfileDetails(value);
print("${value.SpinLeverRequestedDat!.leverpool.toString()}");
   DocumentReference roomRef =
        _firestore.collection("s${value.ProfileDetail!.id.toString()}").doc("Status");
    await roomRef.set({'status': "online"});
 seekerUserId=value.ProfileDetail!.id.toString();
  
  getusers(value.ProfileDetail!.id.toString());

    // Get the toke

   
       var deviceTokenRef = _firestore.collection("s${value.ProfileDetail!.id.toString()}").doc('Device Token');
    var deviceTokenRefsnapshot =  deviceTokenRef.get();
  
       deviceTokenRef.set({'device token': fcmToken});
  

print("=================================$seekerUserId==========================================");
    
      // if (value.data!.length > 2) {
      //   seekerRequestlenght = 2;
      // } else {
      //   seekerRequestlenght = 1;
      // }  Get.off((DomatchscreenSiker()));
     print("againhited");
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      print("jhjjkjhkjhkhkijhkjhjkhjkhjh");
    });
  }
//
void refreshApi(){

    setRxRequestStatus(Status.LOADING);

  _api.SeekerMyProfileDetailsApi().then((value){
    setRxRequestStatus(Status.COMPLETED);
    SekerMyProfileDetails(value);
  }).onError((error, stackTrace){
    setError(error.toString());
    setRxRequestStatus(Status.ERROR);

  });
}

  getusers(String id) {
    var name;
    name = firestore
        .collection("s" +
            id.toString())
        .orderBy('timestamp', descending: true)
        .get();
  }
}
