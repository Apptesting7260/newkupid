
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/models/AllMakerModel/AllMakerModel.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:get/get.dart';


class ListAllMakerController extends GetxController {

  final _api = AuthRepository();


  final rxRequestStatus = Status.LOADING.obs ;
  final userList =AllMakerModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void getAllmakerList(AllMakerModel _value) => userList.value = _value ;
  void setError(String _value) => error.value = _value ;


  void ListAllMakerApi(){
   // setRxRequestStatus(Status.LOADING);

    _api.ListAllMakerApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      getAllmakerList(value);
      print(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      print("error");
      setRxRequestStatus(Status.ERROR);

    });
  }
  //
  // void refreshApi(){
  //
  //     setRxRequestStatus(Status.LOADING);
  //
  //   _api.ListAllMakerApi().then((value){
  //     setRxRequestStatus(Status.COMPLETED);
  //     getAllmakerList(value);
  //   }).onError((error, stackTrace){
  //     setError(error.toString());
  //     setRxRequestStatus(Status.ERROR);
  //
  //   });
  // }
}