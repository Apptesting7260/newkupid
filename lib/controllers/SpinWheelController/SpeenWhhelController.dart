import 'package:cupid_match/models/IncomingRequestModel/IncomingRequestModel.dart';
import 'package:get/get.dart';
import '../../../data/response/status.dart';
import '../../../models/IncomingMakerRequestModel/incoming_maker_request_model.dart';
import '../../../repository/Auth_Repository/Auth_Repository.dart';
import 'package:get_storage/get_storage.dart';

import '../../GlobalVariable/GlobalVariable.dart';
import '../../models/SpeenWhellModel/SpeenWheelModel/SpeenWheelModel.dart'; // Import GetStorage

class SpeenWheelDataController  extends GetxController {
  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs;
  final SpeenWheelData = SpeenWheelModel().obs;
  RxString error = ''.obs;

  RxBool button_praticular = true.obs;
  RxBool button_random = false.obs;



  void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
  void setUserList(SpeenWheelModel value) =>
      SpeenWheelData.value = value;
  void setError(String value) => error.value = value;

  void SpeenWheelApi() {
    Map data={
      'zodiac_id':zodiac_id
    };

    print(data);

    setRxRequestStatus(Status.LOADING);
    _api.SpeenWheellApi(data).then((value) {
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print(value);
      print("7293874988783b c7388398u9u9b32g 45 345345  35");
      //
    }).onError((error, stackTrace) {
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);
      print(error.toString());
      print("request error maker side 23459uyh87hjjghtagvygdygdygfugsfuygfggfsg233242424235432========");
    });
  }
}
// }
