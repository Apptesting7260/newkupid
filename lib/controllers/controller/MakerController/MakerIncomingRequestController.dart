//
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:get_storage/get_storage.dart';
//
// import '../../../data/response/status.dart';
// import '../../../models/IncomingMakerRequestModel/incoming_maker_request_model.dart';
// import '../../../repository/Auth_Repository/Auth_Repository.dart';
//
// class IncomigRequestRequestController extends GetxController {
//   final _api = AuthRepository();
//   final rxRequestStatus = Status.LOADING.obs;
//   final IncomingMakerValue = IncomingMakerRequestModel().obs;
//   RxString error = ''.obs;
//
//   final box = GetStorage(); // Create a GetStorage instance
//
//   void setRxRequestStatus(Status value) => rxRequestStatus.value = value;
//   void setUserList(IncomingMakerRequestModel value) =>
//       IncomingMakerValue.value = value;
//   void setError(String value) => error.value = value;
//
//   void makerListApi() {
//     // Check if cached data is available
//     if (box.hasData('incomingMakerRequestData')) {
//       final cachedData = box.read('incomingMakerRequestData');
//       setUserList(cachedData);
//       setRxRequestStatus(Status.COMPLETED);
//     } else {
//       setRxRequestStatus(Status.LOADING);
//       _api.IncomingMakerRequestApi().then((value) {
//         setRxRequestStatus(Status.COMPLETED);
//         setUserList(value);
//
//         // Cache the data for future use
//         box.write('incomingMakerRequestData', value);
//       }).onError((error, stackTrace) {
//         setError(error.toString());
//         setRxRequestStatus(Status.ERROR);
//       });
//     }
//   }
// }
