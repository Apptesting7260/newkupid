// import 'package:cupid_match/controllers/controller/SetRoleController/SetRoleController.dart';
// import 'package:cupid_match/match_maker/match_maker_profile_update.dart';
// import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
// import 'package:cupid_match/utils/utils.dart';
// import 'package:cupid_match/controllers/controller/SignUpController/SignUpController.dart';
// import 'package:cupid_match/views/sign_up/choose_profile.dart';
// import 'package:cupid_match/views/sign_up/create_password.dart';
// import 'package:cupid_match/views/user/otp.dart';
// import 'package:cupid_match/views/user/reset_password.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:get/get.dart';

// import '../../../GlobalVariable/GlobalVariable.dart';
// import '../../../match_maker/verify_identity.dart';
// import '../../../views/user/verification.dart';

// import 'package:http/http.dart' as http;


// class MakerProfileController extends GetxController {

//   final _api = AuthRepository();

//   RxBool loading = false.obs;

//   final ProfileImageController = TextEditingController().obs;
//   final UpdateTypeController = TextEditingController().obs;
//   final NameController = TextEditingController().obs;
//   final EmailController = TextEditingController().obs;
//   final PhoneController = TextEditingController().obs;
//   final DobController = TextEditingController().obs;


//   final feetcontroller = TextEditingController().obs;
//   final Inchescontroller = TextEditingController().obs;
//   final sikerQuestionController = TextEditingController().obs;    
//   final firstAnswercontroller = TextEditingController().obs;   
//   final SecondAnswercontroller = TextEditingController().obs;    
//   final thirdanswerAnswercontroller = TextEditingController().obs;
//   final CorrectAnswercontroller = TextEditingController().obs;
//   final TypeController = TextEditingController().obs;



// Future<void> SikerProfileApiHit() async {
//   try {
//     // Replace 'your_api_endpoint' with the actual URL of your API endpoint for file upload
//     var url = Uri.parse('https://urlsdemo.xyz/kupid/api/user-profile-update');

//     // Create the multipart request
//     var request = http.MultipartRequest('POST', url);

//     // Add the file to the request
//     var fileStream = http.ByteStream(imgFile!.openRead());
//     var length = await imgFile!.length();
//     var multipartFile = http.MultipartFile('pro_img', fileStream, length,
//         filename: imgFile!.path.split('/').last);
//     request.files.add(multipartFile);

//     // Add other text fields to the request+
//     request.fields['name'] = NameController.value.text;
//     request.fields['email'] = EmailController.value.text;
//     request.fields['phone'] = PhoneController.value.text;
//     request.fields['dob'] = datestring.toString();
//     request.fields['location'] = SelectedLocation.toString();
//     request.fields['occupation'] = Ocupasion.toString();
//     request.fields['height'] = feetcontroller.value.text+Inchescontroller.value.text;
//      request.fields['question'] = sikerQuestionController.value.text;
//      request.fields['first_answer'] = firstAnswercontroller.value.text;
//      request.fields['second_answer'] = SecondAnswercontroller.value.text;
//      request.fields['third_answer'] = thirdanswerAnswercontroller.value.text;
//      request.fields['correct_answer'] = CorrectAnswercontroller.value.text;
//      request.fields['gender'] = SelectedGender.toString();
   
//     request.fields['type'] = "2";
//     request.headers['Authorization'] = "Bearer $BarrierToken";
//      var videoStream = http.ByteStream(videoFile!.openRead());
//     var videoLength = await videoFile!.length();
//       var videoFileField = http.MultipartFile('pro_vedio', videoStream, videoLength, filename: videoFile!.path.split('/').last);
//     request.files.add(videoFileField);

// print(BarrierToken);
//     // Send the request and get the response
//     var response = await request.send();
//     var responseBody = await response.stream.bytesToString();
// print(responseBody);
//     // Check the response status
//     if (response.statusCode== 200) {
//       print('File uploaded successfully!');
//     } else {
//       print('Failed to upload file. Status code: ${response.statusCode}');
//     }
//   } catch (e) {
//     print('Error occurred while uploading file: $e');
//   }
// }


// }