import 'package:cupid_match/models/IncomingRequestModel/IncomingRequestModel.dart';
import 'package:get/get.dart';
import '../../../data/response/status.dart';
import '../../../models/RecentSeekerMatches/recent_seeker_matches_Model.dart';
import '../../../repository/Auth_Repository/Auth_Repository.dart';
import 'package:get_storage/get_storage.dart'; // Import GetStorage
int? seekerRequestlenght;
class RecentSeekerMatchesController extends GetxController {
  final _api = AuthRepository();


  final rxRequestStatus = Status.LOADING.obs;
  final RecentSeekerMatchValue = RecentSeekerMatchesModel().obs;
  RxString error = ''.obs;

  final box = GetStorage(); // Create a GetStorage instance

  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;

  void setUserList(RecentSeekerMatchesModel value) =>
      RecentSeekerMatchValue.value = value;

  void setError(String value) => error.value = value;

  Map data = {};

  void isrecentSeekermatchesApi() {
    // Check if cached data is available
//     if (box.hasData('recentSeekerMatchesData')) {
//       final cachedData = box.read('recentSeekerMatchesData');
//       setUserList(cachedData);

// print(seekerRequestlenght);
//       setRxRequestStatus(Status.COMPLETED);
//     } else {
    setRxRequestStatus(Status.LOADING);
    _api.RecentSeekerMatchesApi(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);


      print("DONE==========");
      // Cache the data for future use
      // box.write('recentSeekerMatchesData', value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      print("NOTDONE==========");

      setRxRequestStatus(Status.ERROR);
    });
  }

  void refreshApi() {
    setRxRequestStatus(Status.LOADING);

    _api.RecentSeekerMatchesApi(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
    });
  }
}