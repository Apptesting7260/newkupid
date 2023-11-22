
import 'package:get/get.dart';

import '../data/response/status.dart';
import '../models/SeekerRequestModel.dart';
import '../repository/Auth_Repository/Auth_Repository.dart';


class SeekrOutgoingRequestController extends GetxController {

  final _api = AuthRepository();
// *************************************


  RxBool button_maker = true.obs;
  RxBool button_seeker = false.obs;
  RxString  selectedLocation='Latest'.obs;
  RxString  selectedRadius='Latest'.obs;
  RxString  selectedExp='Latest'.obs;
  RxString  selectedPro='Latest'.obs;
  RxString  selectedMat='Latest'.obs;

  var items = [
    'Latest',
    'Latest2',
    'Latest3',
    'Latest4',
    'Latest5',
  ].obs;
  var items2 = [
    'Latest',
    'Latest2',
    'Latest3',
    'Latest4',
    'Latest5',
  ].obs;
  var items3 = [
    'Latest',
    'Latest2',
    'Latest3',
    'Latest4',
    'Latest5',
  ].obs;
  var items4 = [
    'Latest',
    'Latest2',
    'Latest3',
    'Latest4',
    'Latest5',
  ].obs;
  var items5 = [
    'Latest',
    'Latest2',
    'Latest3',
    'Latest4',
    'Latest5',
  ].obs;
  void setSelected(String value){
    selectedLocation.value = value;
    print(value);
  }
  void setRadius(String value){
    selectedRadius.value = value;
    print(value);
  }
  void setExp(String value){
    selectedExp.value = value;
    print(value);
  }
  void setPro(String value){
    selectedPro.value = value;
    print(value);
  }
  void setMat(String value){
    selectedMat.value = value;
    print(value);
  }



// ****************************************
  final rxRequestStatus = Status.LOADING.obs ;
  final OutgoingRequestvalue =SeekerOutgoingRequestModel().obs ;
  RxString error = ''.obs;

  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserList(SeekerOutgoingRequestModel _value) => OutgoingRequestvalue.value = _value ;
  void setError(String _value) => error.value = _value ;


  void seekerOutGoingRequest(){
    setRxRequestStatus(Status.LOADING);

    _api.SeekerOutgoingRequestListApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      print('dataaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
      setUserList(value);
      print(value.requests?.toMaker);
      print(value.requests?.toSeeker);
      print(value.requests);
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

    _api.SeekerOutgoingRequestListApi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }
}