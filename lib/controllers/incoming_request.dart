import 'package:get/state_manager.dart';


class RequestController extends GetxController {
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
}