
import 'package:cupid_match/models/CountryModel/country_model.dart';
import 'package:get/get.dart';

import '../data/response/status.dart';
import '../repository/Auth_Repository/Auth_Repository.dart';

class CountryController extends GetxController {

  final _api = AuthRepository();
  final rxRequestStatus = Status.LOADING.obs ;
  final userList =CountryModel().obs ;
  RxString error = ''.obs;

   List<String> countries = [];
   List<String>? countriesimage=[];
  Map<String, String> countryFlags = {};
  void setRxRequestStatus(Status _value) => rxRequestStatus.value = _value ;
  void setUserList(CountryModel _value) => userList.value = _value ;
  void setError(String _value) => error.value = _value ;


   userListApi(){
  setRxRequestStatus(Status.LOADING);
    _api.CountryCodeapi().then((value){
      setRxRequestStatus(Status.COMPLETED);
      setUserList(value);
      for(int i = 0; i<value.countries!.length; i++){
        countries!.add(value.countries![i].name);
        countriesimage!.add(value.countries![i].flagPath);

      }
      print(countries);
      // for(int i = 0; i<value.countries!.length; i++){
      //   countries!.add(value.countries![i].flagPath);}
      // print(countries);
    }).onError((error, stackTrace){
      setError(error.toString());
      setRxRequestStatus(Status.ERROR);

    });
  }


}