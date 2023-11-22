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


class MakerProfileController extends GetxController {

  final _api = AuthRepository();

  RxBool loading = false.obs;

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
  final credencial=Get.put(UserEmailAndPhoneVerifyController());
  UserEmailAndPhoneVerifyController
  UserEmailAndPhoneVerifyControllerinstance =
  Get.put(UserEmailAndPhoneVerifyController());


Future<void> MakerProfileApiHit() async {
  final prefs=await SharedPreferences.getInstance();
   loading.value = true ;
   print(EmailController.value.text);
   print(PhoneController.value.text);
  try {
    var url = Uri.parse('https://urlsdemo.xyz/kupid/api/user-profile-update');
    var request = http.MultipartRequest('POST', url);
    // Replace 'your_api_endpoint' with the actual URL of your API endpoint for file upload

    if(ImagetoUpload==null){

    }else {
      var fileStream = http.ByteStream(ImagetoUpload!.openRead());
      var length = await ImagetoUpload!.length();
      var multipartFile = http.MultipartFile('pro_img', fileStream, length,
          filename: ImagetoUpload!.path.split('/').last);
      request.files.add(multipartFile);
    }
    // Create the multipart request


    // Add the file to the request


    // Add other text fields to the request+
    request.fields['update_type'] = "profile";

    if (UserEmailAndPhoneVerifyControllerinstance
        .emailAndPhoneVerifyController.value.text
        .contains("@")) {
      String email = UserEmailAndPhoneVerifyControllerinstance
          .emailAndPhoneVerifyController.value.text;
      request.fields['email'] = email.toString();
      request.fields['email_otp_verified_status'] = "1";
      print("${email}email==============");
    } else {
      String phone = UserEmailAndPhoneVerifyControllerinstance
          .emailAndPhoneVerifyController.value.text;
      request.fields['phone'] = phone.toString();

      request.fields['phone_otp_verified_status'] = "1";
      print("${phone}phone==============");
    }

    request.fields['name'] = NameController.value.text;
    request.fields['dob'] = datestring.toString();
    request.fields['location'] = SelectedLocation.toString();
    request.fields['experience'] = selectExperience.toString();
    request.fields['about_maker'] = ExpectFromSeekerController.value.text;
    request.fields['expect_from_seeker'] = AboutMakerController.value.text;
    request.fields['heading_of_maker'] = HandlingOfMakerController.value.text;
    request.fields['gender'] = selectGender.toString();
    request.fields['type'] = "1";

    request.headers['Authorization'] = "Bearer ${prefs.getString('BarearToken')}";



    if(videoFile==null){

    }else{
      var videoStream = http.ByteStream(videoFile!.openRead());
    var videoLength = await videoFile!.length();
      var videoFileField = http.MultipartFile('pro_vedio', videoStream, videoLength, filename: videoFile!.path.split('/').last);
    request.files.add(videoFileField);
    }


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