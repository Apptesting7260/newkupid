import 'package:cupid_match/models/IncomingRequestModel/IncomingRequestModel.dart';
import 'package:get/get.dart';
import '../../../data/response/status.dart';
import '../../../repository/Auth_Repository/Auth_Repository.dart';
import 'package:get_storage/get_storage.dart'; // Import GetStorage

class IncomingSeekerRequestController extends GetxController {
  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final IncomingRequestvalue = IncomingSeekerRequestModel().obs;
  RxString error = ''.obs;

  final box = GetStorage(); // Create a GetStorage instance

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(IncomingSeekerRequestModel value) => IncomingRequestvalue.value = value;
  void setError(String value) => error.value = value;

  void seekerIncomingGoingRequest() {
    setRxRequestStatus(Status.LOADING);

    // if (box.hasData('incomingRequestData')) {
    //   // Use cached data if available
    //   final cachedData = box.read('incomingRequestData');
    //   setUserList(IncomingRequestModel.fromJson(cachedData));
    //   setRxRequestStatus(Status.COMPLETED);
    // } else {
    //   // Fetch data from the API
      _api.IncomingRequestApi().then((value) {
        setRxRequestStatus(Status.COMPLETED);
        setUserList(value);

          // Manually convert and cache the data as JSON
          // final jsonData = value.toJson();
          // box.write('incomingRequestData', jsonData)

        print("354653643++++546536================================================");
      }).onError((error, stackTrace) {
        setError(error.toString());
print(error.toString());
        print("errrrrrrrrr");
        setRxRequestStatus(Status.ERROR);
      });
    }

  void refreshApi(){

    setRxRequestStatus(Status.LOADING);

    _api.IncomingRequestApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }
  }
// }
//