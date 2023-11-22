
import 'package:get/get.dart';


import '../../GlobalVariable/GlobalVariable.dart';
import '../../data/response/status.dart';
import '../../models/FindMatch/FindMatchesController.dart';
import '../../repository/Auth_Repository/Auth_Repository.dart';


class CreateNewMatchesController extends GetxController {

  final _api = AuthRepository();

//************************** */

  var currentIndex = 0.obs;

  void setCurrentIndex(int index) {

    currentIndex.value = index;

  }

//**********************************/



  final rxRequestStatus = Status.LOADING.obs ;
  final createNewMatchesList =CreateNewMatchesModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserList(CreateNewMatchesModel _value) => createNewMatchesList.value = _value ;
  void setError(String _value) => error.value = _value ;
Map data={
  "match_from_id":userIdsiker.toString()
};


  void CreateNewMatchesApi(){
    setRxRequestStatus(Status.LOADING);
              print(data);
    _api.CreateNewMatchesApi(data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      print('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      print(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      print('errrrrrrrrrrrr');
      print(error);
      setRxRequestStatus(Status.ERROR);

    });
  }

  void refreshApi(){

    setRxRequestStatus(Status.LOADING);

    _api.CreateNewMatchesApi(data).then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }
}