import 'dart:async';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/match_seeker/lever/new_liver.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:get/get.dart';

import '../../../models/StaticLiverPoolModel/StaticLiverPoolMdodel.dart';


class StaticLiverPullController extends GetxController {

  final _api = AuthRepository();

  RxString selectedAnswer="".obs;
  final rxRequestStatus = Status.LOADING.obs ;
  final staticLiverPullvalue =StaticLiverPullModel().obs ;
  RxString error = ''.obs;
  RxList<dynamic> slotImages = [].obs;
  RxList<dynamic> slotname = [].obs;

  RxBool  seekerprofilerequested=false.obs;
  void setRxRequestStatus(Status value) => rxRequestStatus.value = value ;
  void setUserProfileList(StaticLiverPullModel value) => staticLiverPullvalue.value = value ;
  void setError(String value) => error.value = value ;
 final RxInt hours = 0.obs;
  final RxInt minutes = 0.obs;
  final RxInt seconds = 0.obs;

  void startTimer(String initialTime) {
    final parts = initialTime.split(':');
    int hoursRemaining = int.tryParse(parts[0]) ?? 0;
    int minutesRemaining = int.tryParse(parts[1]) ?? 0;
    int secondsRemaining = int.tryParse(parts[2]) ?? 0;

    Timer.periodic(Duration(seconds: 1), (timer) {
      if (secondsRemaining > 0) {
        secondsRemaining--;
      } else {
        secondsRemaining = 59;
        if (minutesRemaining > 0) {
          minutesRemaining--;
        } else {
          minutesRemaining = 59;
          if (hoursRemaining > 0) {
            hoursRemaining--;
          }
        }
      }

      hours.value = hoursRemaining;
      minutes.value = minutesRemaining;
      seconds.value = secondsRemaining;

      if (hoursRemaining == 0 && minutesRemaining == 0 && secondsRemaining == 0) {
        timer.cancel();
        // Timer has expired, you can perform actions here
      }
    });
  }

  // }
  void staticLiverPullmethodapihit() {
    //  setRxRequestStatus(Status.LOADING);

    _api.StaticLiverPullApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserProfileList(value);
      print("object====");

      // String inputString = "${value.data![0].spinLeverpoolRequestedData!.hoursRemaining}";
      // List<String> parts = inputString.split(':');
      // int extractedHours = int.parse(parts[0]);
      // int extractedMinutes = int.parse(parts[1]);
      // int extractedSeconds = int.parse(parts[2]);

      // hours.value = extractedHours;
      // minutes.value = extractedMinutes;
      // seconds.value = extractedSeconds;
      // startTimer();
      Liverpooldprofiles=[];
      for (int i = 0; i < value.data!.length; i++) {
        slotImages.add(value.data![i].imgPath.toString());
        slotname.add(value.data![i].name.toString());
      }
for(int i =0; i<=2;i++){
    print(value.data![0]
                          .spinLeverpoolRequestedData!
                          .spinRequestData![i]
                          .seekerData!.id.toString(),);
    Liverpooldprofiles.add({
      "seeker_id":value.data![0]
                          .spinLeverpoolRequestedData!
                          .spinRequestData![i]
                          .seekerData!.id.toString(),
      "is_requested":value.data![0]
                          .spinLeverpoolRequestedData!.spinRequestData![i].isRequested.toString()
    });
 print(Liverpooldprofiles);
 print("againhited------");

  }

  for(int i =0; i<=2;i++){

    if(value.data![0]
                          .spinLeverpoolRequestedData!.spinRequestData![i].isRequested=="true"){
                            seekerprofilerequested.value=true;
                            print(seekerprofilerequested);
                          }
                          
                          }
startTimer(value.data![0].spinLeverpoolRequestedData!.hoursRemaining.toString());
      print("seekerprofilerequested");
      print("$slotImages===================");
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }

}