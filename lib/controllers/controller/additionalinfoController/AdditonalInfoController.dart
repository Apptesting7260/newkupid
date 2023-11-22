import 'package:cupid_match/controllers/controller/SetRoleController/SetRoleController.dart';
import 'package:cupid_match/match_maker/match_maker_profile_update.dart';
import 'package:cupid_match/match_maker/payment_screen.dart';
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
import '../ForgotPasswordController/ForgotPasswordController.dart';
import '../OtpVarificationController/OtpVarificationController.dart';
import 'package:http/http.dart' as http;


class AdditonalInfpMakerController extends GetxController {

  final _api = AuthRepository();

  RxBool loading = false.obs;



Future<void> MakerAditonalApiHit() async {
  final prefs=await SharedPreferences.getInstance();
   loading.value = true ;
  try {
    // Replace 'your_api_endpoint' with the actual URL of your API endpoint for file upload
    var url = Uri.parse('https://urlsdemo.xyz/kupid/api/maker/update-additional-info');

    // Create the multipart request
    var request = http.MultipartRequest('POST', url);

    // Add the file to the request
    var fileStream = http.ByteStream(ImagetoUpload!.openRead());
    var length = await ImagetoUpload!.length();
    var multipartFile = http.MultipartFile('proof_photo', fileStream, length,
        filename: ImagetoUpload!.path.split('/').last);
    request.files.add(multipartFile);

    // Add other text fields to the request+
    request.fields['verification_method'] = verification_method.toString();
    request.fields['nationality'] = nationality.toString();
 print( request.fields['verification_method'] = verification_method.toString());
 print(     request.fields['nationality'] = nationality.toString());
    request.headers['Authorization'] = "Bearer ${prefs.getString("BarearToken")}";
   
print(BarrierToken);
    // Send the request and get the response
    var response = await request.send();
    var responseBody = await response.stream.bytesToString();
print(responseBody);
    // Check the response status
    if (response.statusCode== 200) {
      print('File uploaded successfully!');
      imgFile=null;
      Get.offAll(PaymentScreen());
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