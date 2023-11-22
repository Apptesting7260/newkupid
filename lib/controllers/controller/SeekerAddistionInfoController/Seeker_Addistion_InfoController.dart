import 'dart:io';

import 'package:cupid_match/match_seeker/Chose_Role_FirstTime.dart';
import 'package:cupid_match/match_seeker/Chose_role_Type.dart';
import 'package:cupid_match/match_seeker/Siker_TabView.dart';
import 'package:cupid_match/match_seeker/profile/interest.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:cupid_match/utils/utils.dart';
import 'package:cupid_match/controllers/controller/SignUpController/SignUpController.dart';
import 'package:cupid_match/views/sign_up/choose_profile.dart';
import 'package:cupid_match/views/sign_up/create_password.dart';
import 'package:cupid_match/views/user/otp.dart';
import 'package:cupid_match/views/user/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../GlobalVariable/GlobalVariable.dart';
import '../../../match_maker/match_maker_profile_update.dart';
import '../../../match_maker/verify_identity.dart';
import '../../../match_seeker/photos.dart';
import '../../../views/user/verification.dart';
import '../ForgotPasswordController/ForgotPasswordController.dart';
import '../OtpVarificationController/OtpVarificationController.dart';
import '../SetRoleController/SetRoleController.dart';
import 'package:get/get.dart';


var response;
class SeekerAddistionInfoController extends GetxController {

  final _api = AuthRepository();

  RxBool loading = false.obs;

  // RxList<File> Gallery1 = RxList<File>([]);

  final BioTitleController = TextEditingController().obs;
  final BioDescriptionController = TextEditingController().obs;
    RxString  intrustedin = "Male".obs;


    changeintrustedin(RxString value){
      intrustedin=value;
      print(intrustedin);
    }


  Future<void> SeekerProfileApiHit() async {
    final prefs= await SharedPreferences.getInstance();
    loading.value = true ;
    try {
      // Replace 'your_api_endpoint' with the actual URL of your API endpoint for file upload
      var url = Uri.parse('https://urlsdemo.xyz/kupid/api/seeker/seeker-update-additional-info');

      // Create the multipart request
      var request = http.MultipartRequest('POST', url);

      // Add the file to the request
//       if(Gallery1.length<=0){
//  var fileStream1 = http.ByteStream(Gallery1[0].openRead());
//       var length1 = await Gallery1[0].length();
//       var multipartFile1 = http.MultipartFile('gallery[img0]', fileStream1, length1,

//           filename: Gallery1[0].path.split('/').last);
//       request.files.add(multipartFile1);
//       }
     

//       ////////////////////////////////////////////

//       // Add the file to the request
//       if(Gallery1.length<=1) {
//         var fileStream2 = http.ByteStream(Gallery1[1].openRead());
//       var length2 = await Gallery1[1].length();
//       var multipartFile2 = http.MultipartFile('gallery[img1]', fileStream2, length2,

//           filename: Gallery1[1].path.split('/').last);
//       request.files.add(multipartFile2);
//       }
      
    
//       ////////////////////////////////////////////

//       // Add the file to the request
//         if(Gallery1.length<=2) {
//       var fileStream3 = http.ByteStream(Gallery1[2].openRead());
//       var length3 = await Gallery1[2].length();
//       var multipartFile3 = http.MultipartFile('gallery[img2]', fileStream3, length3,

//           filename: Gallery1[2].path.split('/').last);
//       request.files.add(multipartFile3);
//         }
//       ////////////////////////////////////////////

//   if(Gallery1.length<=3) {
//       var fileStream4 = http.ByteStream(Gallery1[3].openRead());
//       var length4 = await Gallery1[3].length();
//       var multipartFile4 = http.MultipartFile('gallery[img3]', fileStream4, length4,

//           filename: Gallery1[3].path.split('/').last);
//       request.files.add(multipartFile4);
//   }
//       ////////////////////////////////////////////

//       // Add the file to the request
//         if(Gallery1.length<=4) {
//       var fileStream5 = http.ByteStream(Gallery1[4].openRead());
//       var length5 = await Gallery1[4].length();
//       var multipartFile5 = http.MultipartFile('gallery[img5]', fileStream5, length5,

//           filename: Gallery1[4].path.split('/').last);
//       request.files.add(multipartFile5);
//         }
//       ////////////////////////////////////////////

//       // Add the file to the request
//         if(Gallery1.length<=5) {

//       var fileStream6 = http.ByteStream(Gallery1[5].openRead());
//       var length6 = await Gallery1[5].length();
//       var multipartFile6 = http.MultipartFile('gallery[img1]', fileStream6, length6,

//           filename: Gallery1[5].path.split('/').last);
//       request.files.add(multipartFile6);
//         }
//       ////////////////////////////////////////////

//       // Add the file to the request
//         if(Gallery1.length<=6) {
//       var fileStream7 = http.ByteStream(Gallery1[6].openRead());
//       var length7 = await Gallery1[6].length();
//       var multipartFile7 = http.MultipartFile('gallery[img6]', fileStream7, length7,

//           filename: Gallery1[6].path.split('/').last);
//       request.files.add(multipartFile7);
//         }
//       ////////////////////////////////////////////

//       // Add the file to the request
//         if(Gallery1.length<=7) {
//       var fileStream8 = http.ByteStream(Gallery1[7].openRead());
//       var length8 = await Gallery1[7].length();
//       var multipartFile8 = http.MultipartFile('gallery[img7]', fileStream8, length8,

//           filename: Gallery1[7].path.split('/').last);
//       request.files.add(multipartFile8);
//         }
//       ////////////////////////////////////////////

//       // Add the file to the request
//         if(Gallery1.length<=8) {
//       var fileStream9 = http.ByteStream(Gallery1[8].openRead());
//       var length9 = await Gallery1[8].length();
//       var multipartFile9 = http.MultipartFile('gallery[img8]', fileStream9, length9,

//           filename: Gallery1[8].path.split('/').last);
//       request.files.add(multipartFile9);
//         }
        
      if(galleryImageFiles.isEmpty){
      
      }  else{
          for (int i = 0; i < galleryImageFiles.length; i++) {
  if (i <= 8) {
    var fileStream = http.ByteStream(galleryImageFiles[i].openRead());
    var length = await galleryImageFiles[i].length();
    var multipartFile = http.MultipartFile(
      'gallery[img$i]',
      fileStream,
      length,
      filename: galleryImageFiles[i].path.split('/').last,
    );
    request.files.add(multipartFile);
  }
}
      }
      ////////////////////////////////////////////
      print(imgFile);
      // Add other text fields to the request+
      request.fields['bio_title'] = BioTitleController.value.text;
      request.fields['bio_description'] = BioDescriptionController.value.text;
      request.fields['intrested_in'] = IntrestedIn.toString();
      request.fields['interests'] = selectedInterests.toString();
      request.headers['Authorization'] = "Bearer ${prefs.getString("BarearToken")}";
//       var videoStream = http.ByteStream(videoFile!.openRead());
//       var videoLength = await videoFile!.length();
//       var videoFileField = http.MultipartFile('pro_vedio', videoStream, videoLength, filename: videoFile!.path.split('/').last);
//       request.files.add(videoFileField);
// print(videoFile);
      print(BarrierToken);
      // Send the request and get the response
      response = await request.send();
      var responseBody = await response.stream.bytesToString();

      print(responseBody);
      // Check the response status
      if (response.statusCode== 200) {
        print('File uploaded successfully!');
        Get.offAll(() =>    Siker_Tab_View(index: 0,)  );
        loading.value = false ;
      } else {
        print('Failed to upload file. Status code: ${response.statusCode}');
        loading.value = false ;
      }
    } catch (e) {
      loading.value = false ;
      print(response);
      print('Error occurred while uploading file: $e');
    }
  }



}
