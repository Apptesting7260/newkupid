import 'package:cupid_match/models/OutgoingRequestModel/OutgoingRequestModel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../data/response/status.dart';

import '../../../repository/Auth_Repository/Auth_Repository.dart';
class OutgoinRequestController extends GetxController {
  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final OutgoingRequestvalue = OutgoingRequestModel().obs;
  RxString error = ''.obs;

  final box = GetStorage(); // Create a GetStorage instance

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(OutgoingRequestModel value) => OutgoingRequestvalue.value = value;
  void setError(String value) => error.value = value;

void seekerOutGoingRequest() {
  setRxRequestStatus(Status.LOADING);

  // if (box.hasData('outgoingRequestData')) {
  //   // Use cached data if available
  //   final cachedData = box.read('outgoingRequestData');
  //   setUserList(OutgoingRequestModel.fromJson(cachedData));
  //   setRxRequestStatus(Status.COMPLETED);
  // } 
  
  // else {
    // Fetch data from the API
    _api.OutgoinRequestApi().then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);

      // Manually convert and cache the data as JSON
      // final jsonData = value.toJson(); // Assuming you have a method toMap() in your model
      // box.write('outgoingRequestData', jsonData);
    }).onError((error, stackTrace) {
      setError(error.toString());
      print(error);
      setRxRequestStatus(Status.ERROR);
    });
  }
}

// }
