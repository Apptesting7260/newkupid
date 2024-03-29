import 'dart:io';

import 'package:cupid_match/controllers/UserNumberAndNuberverfyController.dart';
import 'package:cupid_match/match_seeker/profile/profile_details.dart';
import 'package:cupid_match/match_seeker/profile/profile_page.dart';
import 'package:cupid_match/models/AllOcupationsModel/AllOcupationsModel.dart';
import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
import 'package:cupid_match/utils/utils.dart';
import 'package:cupid_match/controllers/controller/SignUpController/SignUpController.dart';
import 'package:cupid_match/views/sign_up/choose_profile.dart';
import 'package:cupid_match/views/sign_up/create_password.dart';
import 'package:cupid_match/views/user/otp.dart';
import 'package:cupid_match/views/user/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../GlobalVariable/GlobalVariable.dart';
import '../../../data/response/status.dart';
import '../../../match_maker/match_maker_profile_update.dart';
import '../../../match_maker/verify_identity.dart';
import '../../../match_seeker/photos.dart';
import '../../../models/ViewProfileDetailsModel/EditProfileDetailsModel.dart';
import '../../SeekerMyProfileDetailsController/SeekerMyProfileController.dart';
import '../../sikerProfileController/EditViewsikeerDetailsController.dart';
import '../SetRoleController/SetRoleController.dart';
import '../ViewSikerDetailsController/ViewSikerDetaolsController.dart';


var response;

class SeekerEditProfileController extends GetxController {
  final SignUpControllerinstance = Get.put(SignUpController());
  final rxRequestStatus = Status.COMPLETED.obs;

  final _api = AuthRepository();
  SeekerMyProfileDetailsController ViewSikerProfileDetailsControllerinstance = Get
      .put(SeekerMyProfileDetailsController());
  SeekerEditViewDeatailsController ViewSikerProfileDetailsControllerinstances = Get
      .put(SeekerEditViewDeatailsController());

  RxBool phone_verify = false.obs;
  final email_verify = 0.obs;
  RxBool verified = false.obs;
  RxBool optsent = false.obs;
  RxBool ciculerEdicator = false.obs;
  RxBool phone_verified = false.obs;
  RxBool resendOtp = false.obs;
  RxBool loading = false.obs;
  final NameController = TextEditingController().obs;

  // final EmailController = TextEditingController().obs;
  // final PhoneController = TextEditingController().obs;
  final TypeController = TextEditingController().obs;
  final OccupationController = TextEditingController().obs;
  final locationcntroller = TextEditingController().obs;
  final HeightController = TextEditingController().obs;
  final InchesController = TextEditingController().obs;
  final QuestionController = TextEditingController().obs;
  final FirstanswerController = TextEditingController().obs;
  final SecondanswerController = TextEditingController().obs;
  final ThirdanswerController = TextEditingController().obs;
  final CorrectanswerController = TextEditingController().obs;
  final SalaryController = TextEditingController().obs;
  final otpController = TextEditingController().obs;

  // RxString selectLocalGender="".obs;
  // ViewSikerProfileDetailsControllerinstance.ViewProfileDetail

  setDataInControoler() {
    // ViewSikerProfileDetailsControllerinstance.SeekerMyProfileDetailsApiHit();
    String numberString = ViewSikerProfileDetailsControllerinstances
        .ViewProfileDetail.value.UserData!.height.toString();

    // Convert the number to a string


    // Split the string into two parts based on the decimal point
    List<String> parts = numberString.split('.');

    NameController.value.text =
        ViewSikerProfileDetailsControllerinstances.ViewProfileDetail.value
            .UserData!.name.toString();
    // EmailController.value.text=ViewSikerProfileDetailsControllerinstances.ViewProfileDetail.value.UserData!.email.toString();
    // PhoneController.value.text=ViewSikerProfileDetailsControllerinstances.ViewProfileDetail.value.UserData!.phone.toString();
    imageUrl= ViewSikerProfileDetailsControllerinstances.ViewProfileDetail.value
        .UserData!.imgPath.toString();
    Ocupasion =
        ViewSikerProfileDetailsControllerinstances.ViewProfileDetail.value
            .UserData!.occupation.toString();
    HeightController.value.text = parts[0].toString();
    InchesController.value.text = parts.length > 1 ? parts[1].toString() : '';
    locationcntroller.value.text =
        ViewSikerProfileDetailsControllerinstances.ViewProfileDetail.value
            .UserData!.address.toString();
    datestring =
        ViewSikerProfileDetailsControllerinstances.ViewProfileDetail.value
            .UserData!.dob.toString();
    selectGender =
        ViewSikerProfileDetailsControllerinstances.ViewProfileDetail.value
            .UserData!.gender.toString();
    QuestionController.value.text =
        ViewSikerProfileDetailsControllerinstances.ViewProfileDetail.value
            .UserData!.question.toString();
    FirstanswerController.value.text =
        ViewSikerProfileDetailsControllerinstances.ViewProfileDetail.value
            .UserData!.firstAnswer.toString();
    SecondanswerController.value.text =
        ViewSikerProfileDetailsControllerinstances.ViewProfileDetail.value
            .UserData!.secondAnswer.toString();
    ThirdanswerController.value.text =
        ViewSikerProfileDetailsControllerinstances.ViewProfileDetail.value
            .UserData!.thirdAnswer.toString();
    choose = ViewSikerProfileDetailsControllerinstances.ViewProfileDetail.value
        .UserData!.correctAnswer.toString();
    datestring =
        ViewSikerProfileDetailsControllerinstances.ViewProfileDetail.value
            .UserData!.dob.toString();
    imageUrl =
        ViewSikerProfileDetailsControllerinstances.ViewProfileDetail.value
            .UserData!.imgPath.toString();
    selectSmoke =
        ViewSikerProfileDetailsControllerinstances.ViewProfileDetail.value
            .UserData!.doYouSmoke.toString();
    selectDrink =
        ViewSikerProfileDetailsControllerinstances.ViewProfileDetail.value
            .UserData!.doYouDrink.toString();
    ;
    selectchildren =
        ViewSikerProfileDetailsControllerinstances.ViewProfileDetail.value
            .UserData!.likeToHaveChildren.toString();
    ;
    selectEducation =
        ViewSikerProfileDetailsControllerinstances.ViewProfileDetail.value
            .UserData!.education.toString();
    ;
    selectHopping =
        ViewSikerProfileDetailsControllerinstances.ViewProfileDetail.value
            .UserData!.hopingToFind.toString();
    ;

    if (ViewSikerProfileDetailsControllerinstances.ViewProfileDetail.value
        .UserData!.email != null) {
      verified.value = true;
    }
    if (ViewSikerProfileDetailsControllerinstances.ViewProfileDetail.value
        .UserData!.phone != null) {
      phone_verify.value = true;
    }


    print("hhhbhbjhjjjjjjhjbjhbj  seeker data update controller  ");
    print(ViewSikerProfileDetailsControllerinstances.ViewProfileDetail.value
        .UserData!.name.toString());
  }

  Future<void> SeekerProfileApiHit() async {
    final sp = await SharedPreferences.getInstance();
    UserEmailAndPhoneVerifyController
    UserEmailAndPhoneVerifyControllerinstance =
    Get.put(UserEmailAndPhoneVerifyController());
    loading.value = true;
    try {
      // Replace 'your_api_endpoint' with the actual URL of your API endpoint for file upload
      var url = Uri.parse('https://urlsdemo.online/kupid/api/user-profile-update');

      // Create the multipart request
      var request = http.MultipartRequest('POST', url);

      // Add the file to the request
      if (ImagetoUpload == null) {

      } else {
        print("object");
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

      // Add other text fields to the request+
      request.fields['update_type'] = "seeker_update";

      request.fields['name'] = NameController.value.text;
      // if (phone_verify.value==true) {
      //   String email = EmailController.value.text;
      //   request.fields['email'] = email.toString();
      //   request.fields['email_otp_verified_status'] = "1";
      //   print("${email}email==============");
      // } if(verified.value==true) {
      //   String phone = PhoneController.value.text;
      //   request.fields['phone'] = phone.toString();
      //
      //   request.fields['phone_otp_verified_status'] = "1";
      //   print("${phone}phone==============");
      // }

      request.fields['address'] = Sikeraddress.toString();
      request.fields['height'] =
          HeightController.value.text + "." + InchesController.value.text;
      request.fields['question'] = QuestionController.value.text;
      request.fields['first_answer'] = FirstanswerController.value.text;
      request.fields['second_answer'] = SecondanswerController.value.text;
      request.fields['third_answer'] = ThirdanswerController.value.text;
      request.fields['correct_answer'] = choose!;
      request.fields['dob'] = datestring.toString();
      request.fields['location'] = SelectedLocation.toString();
      request.fields['occupation'] = Ocupasion.toString();
      request.fields['gender'] = selectGender.toString();
      request.fields['type'] = "${2}";
      request.fields['salary'] = SalaryController.value.text;
      // request.fields['religion'] = SikerReligon.toString();
      request.fields['address'] = Sikeraddress.toString();

      request.fields['like_to_have_children'] = selectchildren.toString();
      request.fields['do_you_drink'] = selectDrink.toString();
      request.fields['do_you_smoke'] = selectSmoke.toString();
      request.fields['education'] =  selectEducation.toString();
      request.fields['hoping_to_find'] = selectHopping.toString();
      request.fields['zodiac'] = selectZodic.toString();


      request.headers['Authorization'] =
      "Bearer ${sp.getString("BarearToken")}";
      if (videoFile == null) {} else {
        var videoStream = http.ByteStream(videoFile!.openRead());
        var videoLength = await videoFile!.length();
        var videoFileField = http.MultipartFile(
            'pro_vedio', videoStream, videoLength,
            filename: videoFile!
                .path
                .split('/')
                .last);
        request.files.add(videoFileField);
        print(videoFile);
        print(BarrierToken);
      }

      // Send the request and get the response
      response = await request.send();
      var responseBody = await response.stream.bytesToString();

      print(responseBody);
      // Check the response status
      if (response.statusCode == 200) {
        print('File uploaded successfully!');
        Get.to(() => ProfilePage(),);
        loading.value = false;
        Ocupasion = null;
        NameController.value.clear();
        // PhoneController.value.clear();
        OccupationController.value.clear();
        SalaryController.value.clear();
        HeightController.value.clear();
        InchesController.value.clear();
        SecondanswerController.value.clear();
        FirstanswerController.value.clear();
        ThirdanswerController.value.clear();

        CorrectanswerController.value.clear();
        QuestionController.value.clear();
        locationcntroller.value.clear();
      } else {
        print('Failed to upload file. Status code: ${response.statusCode}');
        loading.value = false;
      }
    } catch (e) {
      loading.value = false;
      print(response);
      print('Error occurred while uploading file: $e');
    }
  }


//   Future<void> PhoneAndEmailVerifiyed() async {
//         print("==================================================================");
//     rxRequestStatus(Status.LOADING);
//
//     Map data = {};
//     if (EmailController.value.text.isNotEmpty&& verified.value==false) {
//       data = {
//         'email': EmailController.value.text,
//         'update_type': "email",
//         "type": ProfileType.toString(),
//         'phone': PhoneController.value.text,
//       };
//     }    if (PhoneController.value.text.isNotEmpty&& phone_verify.value==false) {
//       data = {
//         'phone': PhoneController.value.text,
//         'update_type': "phone",
//         "type": ProfileType.toString(),
//         'email': EmailController.value.text,
//       };
//     }
//     final prefs = await SharedPreferences.getInstance();
//
//     // _api.UserPhoneAndNumberVerfyApi(data).then((value) => null)
//     print(data);
//
//     _api.UserPhoneAndNumberVerfyApi(data).then((value) async {
//       resendOtp.value=true;
//
//
//       optsent.value = true;
//       rxRequestStatus(Status.COMPLETED);
//
//       // ViewProfileDetails(value);
//       print("======================================================$value");
//       print(value.otp);
//
//
//       //
//       // Get.snackbar(
//       //   "Message",
//       //   "Otp Sent",
//       //   backgroundColor: Color(0xffFE008F),);
//
//     }).onError((error, stackTrace) {
//       rxRequestStatus(Status.COMPLETED);
//       print("${error.toString()}===============+++=");
//       rxRequestStatus(Status.ERROR);
//     });
//   }
//
//
//
//
//
//
//   Future<void> PhoneAndEmaiOtpVerifyed(BuildContext context) async {
//     print("==================================================================");
//     // rxRequestStatus(Status.LOADING);
//     loading.value=true;
//     ciculerEdicator.value=true;
//     Map data = {};
//     if (EmailController.value.text.isNotEmpty&& verified.value==false) {
//       data = {
//         'email': EmailController.value.text,
//         'otp': otpController.value.text,
//         'email_otp_verified_status': "1",
//         'update_type': "email_otp_verification",
//         "type": ProfileType.toString()
//       };
//     } if (PhoneController.value.text.isNotEmpty&& phone_verify.value==false) {
//       data = {
//         'update_type': "phone_otp_verification",
//         'phone': PhoneController.value.text,
//         'otp': otpController.value.text,
//         'phone_otp_verification_status': "1",
//         "type": ProfileType.toString()
//       };
//     }
//     print("==========$data");
//
//     final prefs = await SharedPreferences.getInstance();
//     loading.value = true;
//     print(otpController.value.text);
//
//     // _api.UserPhoneAndNumberVerfyApi(data).then((value) => null)
//
//     otpController.value.clear();
//     _api.UserPhoneAndNumberVerfyApi(data).then((value) async {
//       // rxRequestStatus(Status.COMPLETED);
//
//       ciculerEdicator.value=false;
//
//       // ViewProfileDetails(value);
//       verified.value = true;
//       phone_verify.value=true;
//       loading.value=false;
//       print("======================================================$value");
//       print(value.msg);
//
//       print(
//           "hit request  maker side hyfr jfjd api 5678900bbuhc 8u0u00-09-9-9-09-9-9-09-9jkcniuicjzijnnzijxn");
//       loading.value = false;
//       print("==========$data");
//
//       Get.back();
//       // Get.snackbar(
//       //     "Message",
//       //     "Varify Successfully",
//       //     backgroundColor: Color(0xffFE008F),);
//       print("fjksdfn");
//     }).onError((error, stackTrace) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Center(child: Text(error.toString())),
//           action: SnackBarAction(
//             label: 'ok',
//             onPressed: () {
//              Get.back();
//             },
//           ),
//         ),
//       );
//
//
//       print("==========$data");
//
//       loading.value = false;
//        otpController.value.clear();
//       print("${error.toString()}===============+++=");
//       //      rxRequestStatus(Status.COMPLETED);
//       // rxRequestStatus(Status.ERROR);
//       ciculerEdicator.value=false;
//
//       // Get.snackbar(
//       //   "Message",
//       //   error.toString(),
//       //   backgroundColor: Color(0xffFE008F),
//       // );
//     });
//   }
// }

}
