import 'package:cupid_match/controllers/controller/SetRoleController/SetRoleController.dart';
import 'package:cupid_match/match_maker/match_maker_profile_update.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:cupid_match/utils/utils.dart';
import 'package:cupid_match/controllers/controller/SignUpController/SignUpController.dart';
import 'package:cupid_match/views/sign_up/choose_profile.dart';
import 'package:cupid_match/views/sign_up/create_password.dart';
import 'package:cupid_match/views/user/otp.dart';
import 'package:cupid_match/views/user/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../GlobalVariable/GlobalVariable.dart';
import '../../../match_maker/verify_identity.dart';
import '../../../views/user/verification.dart';
import '../../UserNumberAndNuberverfyController.dart';
import '../ForgotPasswordController/ForgotPasswordController.dart';
import '../OtpVarificationController/OtpVarificationController.dart';
import 'package:http/http.dart' as http;

import 'MakerEditeProfileControllert.dart';


class MakerUpdateProfileController extends GetxController {

  final _api = AuthRepository();

  RxBool loading = false.obs;
  MakerEditViewDeatailsController makerEditViewDeatailsController=Get.put(MakerEditViewDeatailsController());

  final ProfileImageController = TextEditingController().obs;
  final UpdateTypeController = TextEditingController().obs;
  final NameController = TextEditingController().obs;
  final EmailController = TextEditingController().obs;
  final PhoneController = TextEditingController().obs;
  final DobController = TextEditingController().obs;

  final AboutMakerController = TextEditingController().obs;
  final ExpectFromSeekerController = TextEditingController().obs;
  final HandlingOfMakerController = TextEditingController().obs;
  final TypeController = TextEditingController().obs;
  final LocationController = TextEditingController().obs;
  final credencial=Get.put(UserEmailAndPhoneVerifyController());
  UserEmailAndPhoneVerifyController
  UserEmailAndPhoneVerifyControllerinstance =
  Get.put(UserEmailAndPhoneVerifyController());


  setData(){

        NameController.value.text=makerEditViewDeatailsController.ViewProfileDetail.value.UerData!.name;
        AboutMakerController.value.text=makerEditViewDeatailsController.ViewProfileDetail.value.UerData!.aboutMaker;
        ExpectFromSeekerController.value.text=makerEditViewDeatailsController.ViewProfileDetail.value.UerData!.expectation;
        HandlingOfMakerController.value.text=makerEditViewDeatailsController.ViewProfileDetail.value.UerData!.headingOfMaker;
        LocationController.value.text=makerEditViewDeatailsController.ViewProfileDetail.value.UerData!.location;
        datestring=makerEditViewDeatailsController.ViewProfileDetail.value.UerData!.dob;
        selectExperience=makerEditViewDeatailsController.ViewProfileDetail.value.UerData!.experience;
        imageUrl=makerEditViewDeatailsController.ViewProfileDetail.value.UerData!.profileImg;

  }


  Future<void> MakerProfileApiHit() async {
    final prefs=await SharedPreferences.getInstance();
    loading.value = true ;
    print(EmailController.value.text);
    print(PhoneController.value.text);
    try {
      var url = Uri.parse('https://urlsdemo.online/kupid/api/user-profile-update');
      var request = http.MultipartRequest('POST', url);
      // Replace 'your_api_endpoint' with the actual URL of your API endpoint for file upload

      if(ImagetoUpload==null){

      }else {
        var fileStream = http.ByteStream(ImagetoUpload!.openRead());
        var length = await ImagetoUpload!.length();
        var multipartFile = http.MultipartFile('pro_img', fileStream, length,
            filename: ImagetoUpload!
                .path
                .split('/')
                .last);
        request.files.add(multipartFile);
        print(ImagetoUpload);
      }
      // Create the multipart request


      // Add the file to the request


      // Add other text fields to the request+
      request.fields['update_type'] = "profile";
      // print("1");
      // request.fields['email']="kanarama@mailinator.com";
//  print( request.fields['email']="kanarama@mailinator.com");
// print("${UserEmailAndPhoneVerifyControllerinstance
//           .emailAndPhoneVerifyController.value.text}-----email");
//     if (UserEmailAndPhoneVerifyControllerinstance
//         .emailAndPhoneVerifyController.value.text
//         .contains("@")) {
//       String email = UserEmailAndPhoneVerifyControllerinstance
//           .emailAndPhoneVerifyController.value.text;
//       request.fields['email'] = email.toString();
// print("2");

//       request.fields['email_otp_verified_status'] = "1";
//       print("${email}email==============");
// print("3");

//     } else {
//       String phone = UserEmailAndPhoneVerifyControllerinstance
//           .emailAndPhoneVerifyController.value.text;
//       request.fields['phone'] = phone.toString();
// print("4");

//       request.fields['phone_otp_verified_status'] = "1";
//       print("${phone}phone==============");
// print("5");

//     }

      request.fields['name'] = NameController.value.text;
      print("5");

      request.fields['dob'] = datestring.toString();
      print("1");

      request.fields['location'] = SelectedLocation==null? LocationController.value.text:SelectedLocation.toString();
      print("1");

      request.fields['experience'] = selectExperience.toString();
      print("1");

      request.fields['about_maker'] = ExpectFromSeekerController.value.text;
      print("1");

      request.fields['expect_from_seeker'] = AboutMakerController.value.text;
      print("1");

      request.fields['heading_of_maker'] = HandlingOfMakerController.value.text;
      print("1");

      request.fields['gender'] = selectGender.toString();
      print("1");

      request.fields['type'] = "1";
      print("1");

      request.headers['Authorization'] = "Bearer ${prefs.getString('BarearToken')}";

      print("1");


      // if(videoFile==null){

      // }else{
      //   var videoStream = http.ByteStream(videoFile!.openRead());
      // var videoLength = await videoFile!.length();
      //   var videoFileField = http.MultipartFile('pro_vedio', videoStream, videoLength, filename: videoFile!.path.split('/').last);
      // request.files.add(videoFileField);
      // }


      print(BarrierToken);
      // Send the request and get the response
      var response = await request.send();
      var responseBody = await response.stream.bytesToString();
      print(responseBody);
      // Check the response status
      if (response.statusCode== 200) {
        print('File uploaded successfully!');
        Get.offAll(VerifyScreen());
        loading.value = false ;
      } else {
        print('Failed to upload file. Status code: ${response.statusCode}');
        loading.value = false ;
      }
    } catch (e) {
      loading.value = false ;
      print('Error occurred while uploading file: $e');
    }
  }


}