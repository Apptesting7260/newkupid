import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:cupid_match/controllers/UserLoginController/UserLoginController.dart';
import 'package:cupid_match/controllers/controller/SignUpController/SignUpController.dart';
import 'package:cupid_match/utils/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image/image.dart' as imgLib;
import 'package:country_list_pick/country_list_pick.dart';
import 'package:country_picker/country_picker.dart';
import 'package:cupid_match/match_maker/verify_identity.dart';
import 'package:cupid_match/models/GoogleLocationModel/GoogleLocationModel.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

// import 'package:country_picker/country_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:new_pinput/new_pinput.dart';
import 'package:video_player/video_player.dart';
// import 'package:intl_phone_field/countries.dart';

import '../GlobalVariable/GlobalVariable.dart';
import '../controllers/UserNumberAndNuberverfyController.dart';
import '../controllers/controller/MakerProfileController/MakerProfileController.dart';

import 'package:http/http.dart' as http;

import '../controllers/controller/OtpVarificationController/OtpVarificationController.dart';
import '../data/response/status.dart';
import '../data/response/status.dart';
import '../data/response/status.dart';
import '../data/response/status.dart';

enum SelectProfile { gender }

String? pachedemail;

class MakerProfileDetails extends StatefulWidget {
  const MakerProfileDetails({Key? key}) : super(key: key);

  @override
  State<MakerProfileDetails> createState() => _MakerProfileDetailsState();
}

class _MakerProfileDetailsState extends State<MakerProfileDetails> {
  final FocusNode _pinPutFocusNode = FocusNode();
  final TextEditingController _pinPutController = TextEditingController();
  final UserLoginControllerinstance = Get.put(UserLoginController());
  final UserotpControllerinstance = Get.put(OtpVarificationController());
  final UserEmailAndphone = Get.put(UserEmailAndPhoneVerifyController());

  //DateTime? startdate;
  FocusNode _dropdownFocus1 = FocusNode();
  FocusNode _dropdownFocus2 = FocusNode();
  bool _isDropdownOpen2 = false;
  bool _isDropdownOpen1 = false;

  void _onDropdownFocusChange1() {
    setState(() {
      _isDropdownOpen1 = _dropdownFocus1.hasFocus;

      print(_isDropdownOpen1);
    });
  }

  void _onDropdownFocusChange2() {
    setState(() {
      _isDropdownOpen2 = _dropdownFocus2.hasFocus;

      print(_isDropdownOpen2);
    });
  }

  List<Location> locations = [];
  double? lat;
  double? long;
  String countryCode = 'Choose country';

  DateTime date = DateTime.now();
  List<Predictions> searchPlace = [];
  final locationcntroller = TextEditingController();
  MakerProfileController MakerProfileControllerInstanse =
      Get.put(MakerProfileController());

  SignUpController SignUpControllerInstanse = Get.put(SignUpController());
  String googleAPiKey = "AIzaSyACG0YonxAConKXfgaeVYj7RCRdXazrPYI";
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  String? selectedValue;
  var items = ['22', '23', '24', '25', '26'];

  String? selectMakerGendr;
  var genderItems = ["Male", "Female", "Other"];

  String? selectLocationItems;
  var locationItems = ["Jaipur, indian", "Sikar"];

  String? selectExp;

  var experienceItems = [
    "Beginner",
    "Experience",
    "3 Month experience",
    "4 Month experience",
    "5 Month experience"
  ];

  // Future<File?> pickVideo() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.video,
  //     allowMultiple: false,
  //   );

  //   if (result != null) {
  //     videoFile = File(result.files.single.path!);
  //     setState(() {
  //       videoFile;
  //     });
  //     print(videoFile);
  //     return videoFile;
  //   } else {
  //     // User canceled the file picker
  //     return null;
  //   }
  // }
  Future<File?> pickVideo() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.video,
      allowMultiple: false,
    );

    if (result != null) {
      videoFile = File(result.files.single.path!);

      // Validate video size
      final videoSize = videoFile!.lengthSync(); // in bytes

      if (videoSize > 5 * 1024 * 1024) {
        print('Video size exceeds 5 MB');
        Utils.snackBar("Message", "Video size exceeds It Should heighest 5 MB");
        return null;
      }

      // Validate video duration
      final VideoPlayerController controller =
          VideoPlayerController.file(videoFile!);
      await controller.initialize();
      final videoDuration = controller.value.duration;
      await controller.dispose();

      if (videoDuration <= Duration(seconds: 30)) {
        print('Selected video duration: ${videoDuration.inSeconds} seconds');
        print(videoFile!.path);
        setState(() {
          videoFile;
        });

        return videoFile;
      } else {
        print('Video duration exceeds 30 seconds');
        Utils.snackBar("Message", "Video duration exceeds 30 seconds");

        return null;
      }
    } else {
      // User canceled the file picker
      print('User canceled file picking');
      return null;
    }
  }

  File? galleryFile;
  final picker = ImagePicker();
  File? compressedFile;
  final imageCropper = ImageCropper();


  Future<void> openCamera(ImageSource source) async {
    var pickedImage = await imgPicker.pickImage(source: source);

    if (pickedImage != null) {
      final croppedImage = await imageCropper.cropImage(
        sourcePath: pickedImage.path,
        aspectRatio: const CropAspectRatio(
            ratioX: 1.5, ratioY: 2), // Adjust aspect ratio as needed
        compressQuality: 50, // Adjust compression quality as needed

        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
          WebUiSettings(
            context: context,
            presentStyle: CropperPresentStyle.dialog,
            boundary: const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            viewPort:
            const CroppieViewPort(width: 480, height: 480, type: 'circle'),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
          ),
        ],
      );

      setState(() {
        imgFile = File(croppedImage!.path);
        ImagetoUpload = File(croppedImage!.path);
        print(imgFile);
        Get.back();
      });

    // if (imgCamera != null) {
    //   setState(() {
    //     imgFile = File(imgCamera.path);
    //     Get.back();
    //   });
    //
    //   // Run compression in a background isolate
    //   await compressImageInBackground(imgFile!);
    }
  }

  Future<void> compressImageInBackground(File imageFile) async {
    final compressedFile = await compute(compressImage, imageFile);
    setState(() {
      this.compressedFile = compressedFile;

      ImagetoUpload = compressedFile;
      print("${ImagetoUpload!.path}==========================");
    });
  }

  static File compressImage(File imageFile) {
    var image = imgLib.decodeImage(imageFile.readAsBytesSync())!;
    var compressedImage = imgLib.encodeJpg(image, quality: 50);
    File compressedFile =
        File(imageFile.path.replaceAll('.jpg', '_compressed.jpg'))
          ..writeAsBytesSync(compressedImage);
    print("Original image size: ${imageFile.lengthSync()} bytes");
    print("Compressed image size: ${compressedFile.lengthSync()} bytes");
    // print("Compressed image path: ${compressedFile.path}");

    return compressedFile;
  }

  Future getVideo(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickVideo(
        source: img,
        preferredCameraDevice: CameraDevice.front,
        maxDuration: Duration(minutes: 10));
    XFile? xfilePick = pickedFile;
    setState(() {
      () {
        if (xfilePick != null) {
          galleryFile = File(pickedFile!.path);
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Nothing is selected')));
        }
      };
    });
  }

  bool containerBoeder = false;
  bool phoneContainerBorder = false;
  bool verify = true;

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      pachedemail;
      verify = true;
      phoneContainerBorder = false;
      containerBoeder = false;
    });
    super.initState();

    _dropdownFocus1.addListener(_onDropdownFocusChange1);
    _dropdownFocus2.addListener(_onDropdownFocusChange2);
    startdate = null;
    imgFile = null;
    selectGender = null;
  }

  final imgPicker = ImagePicker();

  Future<void> showOptionsDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15) ,side: BorderSide.none ),
          title: Center(
            child: Column(
              children: [

                Text(
                  'Upload Photo',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600,fontSize: 18,color:Colors.black),
                ),
                Text(
                  'Please choose image',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12,color: Colors.black),
                ),
              ],
            ),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // GestureDetector(
                  //   child: const Icon(
                  //     Icons.camera_alt_outlined,
                  //     color: Colors.white,
                  //   ),
                  //   onTap: () {
                  //     _pickImage(ImageSource.camera);
                  //   },
                  // ),
                  MyButton(
                    width: Get.width*.27,
                    height: Get.height*.05,
                    title: "Camera", onTap: () {
                      openCamera(ImageSource.camera);
                  },)
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // GestureDetector(
                  //   child: const Icon(
                  //     Icons.photo_library,
                  //     color: Colors.white,
                  //   ),
                  //   onTap: () {
                  //     _pickImage(ImageSource.gallery);
                  //   },
                  // ),
                  MyButton(
                    width: Get.width*.25,
                    height: Get.height*.05,
                    title: "Gallery", onTap: () {
                     openCamera(ImageSource.gallery);
                  },)
                ],
              ),
            ],
          ),
        );
      },
    );
    
    // showDialog(
    //     context: context,
    //     builder: (BuildContext context) {
    //       return AlertDialog(
    //         title: Center(
    //             child: Text(
    //           "Choose",
    //           style: Theme.of(context).textTheme.titleLarge,
    //         )),
    //         //Image Picker
    //         content: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             GestureDetector(
    //               child: Cont
    //               onTap: () {
    //                 openCamera(ImageSource.camera);
    //                 Navigator.of(context).pop();
    //               },
    //             ),

    //             GestureDetector(
    //               child: Icon(
    //                 Icons.photo_library,
    //                 color: Colors.pinkAccent,
    //               ),
    //               onTap: () {
    //                 openCamera(ImageSource.gallery);
    //                 Navigator.of(context).pop();
    //               },
    //             ),
    //             // GestureDetector(
    //             //   child: Text("Gallery",style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 13),),
    //             //   onTap: () {
    //             //     openCamera(ImageSource.gallery);
    //             //   },
    //             // ),
    //           ],
    //         ),
    //       );
        
  }

  SelectProfile selectProfile = SelectProfile.gender;

  @override
  Widget build(BuildContext context) {
    final BoxDecoration _pinPutDecoration = BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all());
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(40),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      color: Color(0xffFE0091),
      border: Border.all(color: Colors.green),
      borderRadius: BorderRadius.circular(50),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
          color: Color(0xffFE0091), borderRadius: BorderRadius.circular(50)),
    );

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff5A5A5A),
              size: 27,
            )),
        title: Text(
          "Profile Details",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
        // actions: [
        //    Image(image: AssetImage("assets/images/menu (2) 1.png")),
        // ],
      ),
      body: Obx(()=>
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.04, vertical: height * .02),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                Column(
                  children: <Widget>[
                    Center(
                      child: SizedBox(
                        height: height * .14,
                        width: width * .30,
                        child: Stack(
                          clipBehavior: Clip.none,
                          fit: StackFit.expand,
                          children: [
                            CircleAvatar(
                              child: ClipOval(
                                  child: imgFile == null
                                      ? Image.network(
                                          'https://cdn-icons-png.flaticon.com/512/847/847969.png?w=740&t=st=1691407400~exp=1691408000~hmac=50e7754305b51bd502a2e16302b93ac076a3b959f6944c407253738aaf65d357',
                                          height: 200,
                                          width: 200,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.file(
                                          imgFile!,
                                          height: height,
                                          width: width,
                                          fit: BoxFit.cover,
                                        )),
                            ),

                            Positioned(
                                top: 60,
                                left: 65,
                                right: 0,
                                child: GestureDetector(
                                    onTap: () {
                                      showOptionsDialog(context);
                                    },
                                    child:
                                    imgFile == null?
                                    Image.asset("assets/icons/cameraa.png"):
                                    Image.asset("assets/icons/edit.png")))
      
                            // Positioned(
                            //   bottom: -9,
                            //   right: -8,
                            //   child:
                            //   Container(
                            //     height: height*0.06,
                            //     width: width*.12,
                            //     decoration: BoxDecoration(
                            //         border: Border.all(
                            //             color: AppColors.white),
                            //         borderRadius: BorderRadius.circular(50),
                            //         color: Color(0xff777777)
                            //     ),
                            //     child: IconButton(
                            //       onPressed: (){
                            //         showOptionsDialog(context);
                            //       },
                            //       icon: Icon(
                            //         Icons.camera_alt,
                            //         color: Colors.white,
                            //       ),
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Text(
                      "Upload photo",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: AppColors.black),
                    ),
      
                    //************** video uploaded video ************
                    SizedBox(height: height * 0.05),
      
                    // Center(
                    //   child: Container(
                    //     height: height * .075,
                    //     width: width * .7,
                    //     decoration: BoxDecoration(
                    //         color: Color(0xffF3F3F3),
                    //         borderRadius: BorderRadius.circular(35)),
                    //     child: Padding(
                    //       padding: const EdgeInsets.all(12.0),
                    //       child: Row(
                    //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //         children: [
                    //           videoFile == null
                    //               ? Text(
                    //                   "Upload Video",
                    //                   style: Theme.of(context)
                    //                       .textTheme
                    //                       .bodyMedium!
                    //                       .copyWith(color: Colors.grey),
                    //                 )
                    //               : Row(
                    //                   children: [
                    //                     Text(
                    //                       " Video Uploaded ",
                    //                       style: Theme.of(context)
                    //                           .textTheme
                    //                           .bodyMedium!
                    //                           .copyWith(color: Colors.black),
                    //                     ),
                    //                     Icon(
                    //                       Icons.check_circle,
                    //                       size: 15,
                    //                       color: Colors.green,
                    //                     )
                    //                   ],
                    //                 ),
                    //           videoFile == null
                    //               ? InkWell(
                    //                   child: Container(
                    //                     height: height * .1,
                    //                     width: width * .1,
                    //                     decoration: BoxDecoration(
                    //                       shape: BoxShape.circle,
                    //                       color: Colors.grey.shade300,
                    //                     ),
                    //                     child: Image.asset(
                    //                       "assets/icons/vedio.png",
                    //                       color: Colors.pink,
                    //                     ),
                    //                     alignment: Alignment.center,
                    //                   ),
                    //                   onTap: () {
                    //                     pickVideo();
                    //                   },
                    //                 )
                    //               : InkWell(
                    //                   child: Container(
                    //                     height: height * .1,
                    //                     width: width * .1,
                    //                     decoration: BoxDecoration(
                    //                       shape: BoxShape.circle,
                    //                       color: Colors.grey.shade300,
                    //                     ),
                    //                     child: Icon(
                    //                       Icons.cancel,
                    //                       color: Colors.red,
                    //                     ),
                    //                     alignment: Alignment.center,
                    //                   ),
                    //                   onTap: () {
                    //                     setState(() {
                    //                       videoFile = null;
                    //                     });
                    //                   },
                    //                 )
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
      
                    SizedBox(
                      height: height * .03,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Name",
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(fontWeight: FontWeight.w600)),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textAlignVertical: TextAlignVertical.center,
                      controller:
                          MakerProfileControllerInstanse.NameController.value,
                      decoration: InputDecoration(
                        hintText: "Name",
                        contentPadding: EdgeInsets.all(20),
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppColors.subtitletextcolor),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.pinkAccent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Color(0xffBABABA)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                          borderSide: BorderSide(color: Color(0xffBABABA)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color(0xffBABABA),
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onFieldSubmitted: (value) {},
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter a valid name";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Email",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
      // Check if the user is not registered (pachedemail is null)
                    if (pachedemail == null)
                      Container(
                        width: Get.width,
                        height: Get.height * 0.07,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                color: containerBoeder == false
                                    ? Colors.grey
                                    : Colors.pinkAccent)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: Get.width * 0.7,
                              child: TextFormField(
      
                                controller: SignUpControllerInstanse
                                        .credentialsController.value.text
                                        .contains("@")
                                    ? SignUpControllerInstanse
                                        .credentialsController.value
                                    : UserEmailAndphone
                                        .emailAndPhoneVerifyController.value,
      
                                enabled: SignUpControllerInstanse
                                        .credentialsController.value.text
                                        .contains("@")
                                    ? false
                                    : true,
                                // Set to true to enable the field
                                decoration: InputDecoration(
                                  //************** *****alert box************************************
                                  //  suffixText: verify==true?"Verifyed":"Verify",
                                  //  suffixStyle: TextStyle(color:verify==true?Colors.green:Colors.pinkAccent, ),
                                  //
                                  // suffixIcon: IconButton(onPressed: () {
                                  //
                                  //
                                  //
                                  //
                                  //
                                  //
                                  //
                                  //
                                  //
                                  //   showAlert();
                                  //
                                  //
                                  //
                                  //
                                  //
                                  //
                                  //
                                  //
                                  //
                                  //
                                  //
                                  //
                                  //
                                  //
                                  //
                                  //
                                  // }, icon: Icon(Icons.verified_outlined)),
                                  // suffixIconColor:Colors.pinkAccent ,
                                  hintText: "example@gmail.com",
                                  // Placeholder text
                                  contentPadding: EdgeInsets.all(20),
                                  // contentPadding: EdgeInsets.all(20),
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          color: AppColors.subtitletextcolor),
                                  border: InputBorder.none,
      
                                  // focusedBorder: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.circular(30),
                                  //   borderSide: BorderSide(color: Colors.pinkAccent),
                                  // ),
                                  // enabledBorder: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.circular(30),
                                  //   borderSide: BorderSide(color: Color(0xffBABABA)),
                                  // ),
                                  // errorBorder: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                  //   borderSide: BorderSide(color: Colors.red),
                                  // ),
                                  // disabledBorder: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                  //   borderSide: BorderSide(color: Color(0xffBABABA)),
                                  // ),
                                  // focusedErrorBorder: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.all(Radius.circular(35.0)),
                                  //   borderSide: BorderSide(color: Colors.pink),
                                  // ),
                                  // border: OutlineInputBorder(
                                  //   borderSide: BorderSide(
                                  //     color: Color(0xffBABABA),
                                  //   ),
                                  //   borderRadius: BorderRadius.circular(30),
                                  // ),
                                  // hintStyle: Theme.of(context)
                                  //     .textTheme
                                  //     .bodyLarge
                                  //     ?.copyWith(color: AppColors.subtitletextcolor),
                                  // focusedBorder: OutlineInputBorder(
                                  //   borderRadius: BorderRadius.circular(30),
                                  //   borderSide: BorderSide(color: Colors.pinkAccent),
                                  // ),
                                  // ... Other decoration properties ...
                                ),
                                // Validation logic can be added here
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    setState(() {
                                      containerBoeder = true;
                                    });
                                    return null;
                                  }
                                  // Additional email validation logic can be added here
                                  setState(() {
                                    containerBoeder = false;
                                  });
                                  return null; // Return null if validation passes
                                },
                              ),
                            ),
                            if (!SignUpControllerInstanse
                                .credentialsController.value.text
                                .contains("@"))
                             Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: InkWell(
                                      child: UserEmailAndphone.verified.value == false
                                          ? InkWell(
                                              onTap: () {
                                            if(UserEmailAndphone
                                          .emailAndPhoneVerifyController.value.text.isNotEmpty){
                                UserEmailAndphone
                                                    .PhoneAndEmailVerifiyed();
                              
                                                     showAlert();
                                          }  
                                                // Timer(Duration(seconds: 3), () {
                                                //   setState(() {
                                                //    
                                                //   });
                                                //   if (UserEmailAndphone
                                                //           .optsent.value ==
                                                //       true) {
                                                //     showAlert();
                                                //   }
                                                // });
                                              },
                                              child:UserEmailAndphone.rxRequestStatus.value==Status.LOADING?
                                              CircularProgressIndicator(): Text(
                                                "Verify",
                                                style: TextStyle(
                                                    color: Colors.pinkAccent,
                                                    fontWeight: FontWeight.bold),
                                              ))
                                          : Text(
                                            "Verified",
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold),
                                          )
                                      //                       onTap: (){
                                      //  UserEmailAndphone. PhoneAndEmailVerifiyed();
                                      //                         if(UserEmailAndphone.otpsent.value==true){
                                      //        showAlert();
                                      //                         }
                              
                                      //                       },
                                      ),
                              
                              ),
                          ],
                        ),
                      )
      // User is already registered (pachedemail is not null)
                    else
                      TextFormField(
                        enabled: true,
                        decoration: InputDecoration(
                          hintText: pachedemail,
                          contentPadding: EdgeInsets.all(20),
                          hintStyle: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: AppColors.subtitletextcolor),
                          //suffix: Text('Verify',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xffFE0091),fontWeight: FontWeight.w400,fontSize: 12),),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Colors.pinkAccent),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide(color: Color(0xffBABABA)),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(35.0)),
                            borderSide: BorderSide(color: Colors.red),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(35.0)),
                            borderSide: BorderSide(color: Color(0xffBABABA)),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(35.0)),
                            borderSide: BorderSide(color: Colors.pink),
                          ),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                color: Color(0xffBABABA),
                              )),
                        ),
                      ),
      
                    // if(pachedemail!.isNotEmpty)
                    // TextFormField(
                    //
                    //       enabled: false,
                    //   decoration: InputDecoration(
                    //     hintText:pachedemail,
                    //     contentPadding: EdgeInsets.all(20),
                    //     hintStyle: Theme.of(context)
                    //         .textTheme
                    //         .bodyLarge
                    //         ?.copyWith(color: AppColors.subtitletextcolor),
                    //     //suffix: Text('Verify',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xffFE0091),fontWeight: FontWeight.w400,fontSize: 12),),
                    //     focusedBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(30),
                    //       borderSide: BorderSide(color: Colors.pinkAccent),
                    //     ),
                    //     enabledBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.circular(30),
                    //       borderSide: BorderSide(color: Color(0xffBABABA)),
                    //     ),
                    //     errorBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    //       borderSide: BorderSide(color: Colors.red),
                    //     ),
                    //     disabledBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    //       borderSide: BorderSide(color: Color(0xffBABABA)),
                    //     ),
                    //     focusedErrorBorder: OutlineInputBorder(
                    //       borderRadius: BorderRadius.all(Radius.circular(35.0)),
                    //       borderSide: BorderSide(color: Colors.pink),
                    //     ),
                    //     border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(30),
                    //         borderSide: BorderSide(
                    //           color: Color(0xffBABABA),
                    //         )),
                    //   ),),
                    if (containerBoeder == true)
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Email cannot be empty!",
                              style: TextStyle(color: Colors.red,fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Phone Number",
                          style: Theme.of(context).textTheme.titleSmall,
                        )),
                    SizedBox(
                      height: height * .01,
                    ),
      
                    Container(
                      width: Get.width,
                      height: Get.height * 0.07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                              color: phoneContainerBorder == false
                                  ? Colors.grey
                                  : Colors.pinkAccent)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Container(
                              width: Get.width * 0.7,

                              child: TextFormField(
                                maxLength: 15,
                                textAlignVertical: TextAlignVertical.center,

                                controller: SignUpControllerInstanse
                                        .credentialsController.value.text
                                        .contains("@")
                                    ? UserEmailAndphone
                                        .emailAndPhoneVerifyController.value
                                    : SignUpControllerInstanse
                                        .credentialsController.value,
                                // SignUpControllerInstanse.credentialsController.value.text.contains("@")?true:false
                                enabled: SignUpControllerInstanse
                                        .credentialsController.value.text
                                        .contains("@")
                                    ? true
                                    : false,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(

                                    counter: Offstage(),
                                    prefixIcon: CountryListPick(
                                      theme: CountryTheme(
                                        initialSelection: '+91',
                                        isShowFlag: true,
                                        isShowTitle: false,
                                        isShowCode: true,
                                        isDownIcon: true,
                                        showEnglishName: true,

                                        labelColor: Colors.blueAccent,
                                      ),
                                      initialSelection: '+91',
                                      onChanged: (code) {},
                                    ),
                                    hintText: "Mobile number",


                                    // contentPadding: EdgeInsets.all(20),
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            color: AppColors.subtitletextcolor),
                                    border: InputBorder.none
                                    //suffix: Text('Verify',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xffFE0091),fontWeight: FontWeight.w400,fontSize: 12),),
                                    // focusedBorder: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.circular(30),
                                    //   borderSide: BorderSide(color: Colors.pinkAccent),
                                    // ),
                                    // enabledBorder: OutlineInputBorder(
                                    //   borderRadius: BorderRadius.circular(30),
                                    //   borderSide: BorderSide(color: Color(0xffBABABA)),
                                    // ),
                                    // errorBorder: OutlineInputBorder(
                                    //   borderRadius:
                                    //       BorderRadius.all(Radius.circular(35.0)),
                                    //   borderSide: BorderSide(color: Colors.red),
                                    // ),
                                    // disabledBorder: OutlineInputBorder(
                                    //   borderRadius:
                                    //       BorderRadius.all(Radius.circular(35.0)),
                                    //   borderSide: BorderSide(color: Color(0xffBABABA)),
                                    // ),
                                    // focusedErrorBorder: OutlineInputBorder(
                                    //   borderRadius:
                                    //       BorderRadius.all(Radius.circular(35.0)),
                                    //   borderSide: BorderSide(color: Colors.pink),
                                    // ),
                                    // border: OutlineInputBorder(
                                    //     borderRadius: BorderRadius.circular(30),
                                    //     borderSide: BorderSide(
                                    //       color: Color(0xffBABABA),
                                    //     )),

                                    ),

                                onFieldSubmitted: (value) {},
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    setState(() {
                                      phoneContainerBorder = true;
                                    });
                                    return null;
                                  } else if (!RegExp(
                                          r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. )]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$')
                                      .hasMatch(value)) {
                                    setState(() {
                                      phoneContainerBorder = true;
                                    });
                                    setState(() {
                                      phoneContainerBorder = false;
                                    });
                                    return null;
                                  }
                                },
                              ),
                            ),
                          ),
                          if (SignUpControllerInstanse
                              .credentialsController.value.text
                              .contains("@"))
                            Obx((){
                              return Padding(
                                padding: const EdgeInsets.only(right: 15),
                                child: InkWell(
                                    child: UserEmailAndphone.verified.value == false
                                        ? InkWell(
                                            onTap: () {
                                          if(UserEmailAndphone
                                        .emailAndPhoneVerifyController.value.text.isNotEmpty) {
                            UserEmailAndphone
                                                  .PhoneAndEmailVerifiyed();
                                                   showAlert();
                                        }  
                                              // Timer(Duration(seconds: 3), () {
                                              //   setState(() {
                                              //     UserEmailAndphone.optsent;
                                              //   });
                                              //   if (UserEmailAndphone.optsent.value ==
                                              //       true) {
                                              //     showAlert();
                                              //   }
                                              // });
                                            },
                                            child: UserEmailAndphone.rxRequestStatus.value==Status.LOADING?
                                            CircularProgressIndicator():Text(
                                              "Verify",
                                              style: TextStyle(
                                                  color: Colors.pinkAccent,
                                                  fontWeight: FontWeight.bold),
                                            ))
                                        : Padding(
                                            padding: const EdgeInsets.only(right: 10),
                                            child: Text(
                                              "Verified",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          )
                                    //                       onTap: (){
                                    //  UserEmailAndphone. PhoneAndEmailVerifiyed();
                                    //                         if(UserEmailAndphone.otpsent.value==true){
                                    //        showAlert();
                                    //                         }
                            
                                    //                       },
                                    ),
                              );}
                            ),
                        ],
                      ),
                    ),
                    if (phoneContainerBorder == true)
                      Row(
      
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              "Plesse Enter Valid number!",
                              style: TextStyle(color: Colors.pinkAccent,fontSize: 12),
                            ),
                          ),
                        ],
                      ),
      
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Gender",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Focus(
                      focusNode: _dropdownFocus1,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text("Select Gender"),
                          items: genderItems.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          value: selectMakerGendr,
                          onChanged: (String? value) {
                            setState(() {
                              selectMakerGendr = value;
                              selectGender = selectMakerGendr;
                              print(selectGender);
                            });
                          },
                          buttonStyleData: ButtonStyleData(
                            height: Get.height * 0.07,
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: _isDropdownOpen1 == false
                                    ? Colors.grey
                                    : Colors.pink,
                              ),
                              color: Colors.white,
                            ),
                          ),
                          iconStyleData: selectMakerGendr == null
                              ? IconStyleData(
                                  icon: Icon(Icons
                                      .keyboard_arrow_down), // Change to up arrow icon
                                  iconSize: 30,
                                  iconEnabledColor: Colors.black,
                                )
                              : IconStyleData(
                                  icon: InkWell(
                                    child: Icon(Icons.close),
                                    onTap: () {
                                      setState(() {
                                        selectMakerGendr = null;
                                      });
                                    },
                                  ), // Change to down arrow icon
                                  iconSize: 25,
                                  //iconEnabledColor: Colors.black,
                                ),
                          dropdownStyleData: DropdownStyleData(
                            width: Get.width * 0.89,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white,
                            ),
                            offset: const Offset(10, 0),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all<double>(6),
                              thumbVisibility:
                                  MaterialStateProperty.all<bool>(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
      
                    Container(
                      height: height * .08,
                      width: width,
                      decoration: BoxDecoration(
                        color: Color(0xffF3F3F3),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * .05),
                            child: startdate == null
                                ? Text(
                                    "Choose birthday date",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            color: Colors.pink,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w800),
                                  )
                                : Text(
                                    DateFormat('dd-MM-yyyy').format(
                                        DateTime.parse(startdate.toString())),
                                    style: TextStyle(color: Colors.pink),
                                  ),
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * .05),
                            child: GestureDetector(
                                onTap: () async {
                                  DateTime minimumDate = DateTime.now().subtract(
                                      Duration(
                                          days: 365 *
                                              18)); // 18 years ago from today
      
                                  startdate = await showDatePicker(
                                    context: context,
                                    initialDate: minimumDate,
                                    firstDate: DateTime(1900),
                                    lastDate: minimumDate,
                                  );
                                  print(startdate);
                                  datestring = DateFormat('dd-MM-yyyy').format(
                                      DateTime.parse(startdate.toString()));
                                  print(datestring);
      
                                  setState(() {
                                    datestring;
                                  });
                                },
                                child: Image.asset(
                                  'assets/icons/Calendar.png',
                                  height: 30,
                                  color: Colors.pink,
                                )),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Location",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    // DropdownButtonFormField(value: selectLocationItems,
                    //     icon: const Icon(Icons.keyboard_arrow_down,color: Color(0xff000000),size: 28,),
                    //     style: Theme.of(context).textTheme.bodyLarge,
                    //     items: locationItems.map((String items) {
                    //       return DropdownMenuItem(
                    //         value: items,
                    //         child: Text(items),
                    //       );
                    //     }).toList(),
                    //     validator: (value) {
                    //       if (value == null)
                    //         return "select your location";
                    //       return null;
                    //     },
                    //     onChanged: (String? newValue) {
                    //       setState(() {
                    //         selectLocationItems = newValue!;
                    //         SelectedLocation=newValue;
                    //       });
                    //     },
                    //     decoration: InputDecoration(
                    //       contentPadding: EdgeInsets.all(20),
                    //       hintText: "Select your location",
                    //       hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.subtitletextcolor),
                    //       focusedBorder: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(30),
                    //         borderSide: BorderSide(color: Color(0xffBABABA)),
                    //       ),
                    //       enabledBorder:  OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(30),
                    //         borderSide: BorderSide(color: Color(0xffBABABA)),
                    //       ),
                    //       border: OutlineInputBorder(
                    //           borderRadius: BorderRadius.circular(30),
                    //           borderSide: BorderSide(color: Color(0xffBABABA))),
                    //     )
                    // ),
      
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.text,
                      controller: locationcntroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required';
                        }
                      },
                      onChanged: (value) {
                        print(value);
                        setState(() {
                          if (locationcntroller.text.isEmpty) {
                            // searchPlace.clear();
                          }
                        });
                        searchAutocomplete(value);
                      },
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        hintText: "Please Enter your address",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppColors.subtitletextcolor),
                        //border: InputBorder.none,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Colors.pinkAccent),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(color: Color(0xffBABABA)),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                          borderSide: BorderSide(color: Colors.red),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                          borderSide: BorderSide(color: Color(0xffBABABA)),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(35.0)),
                          borderSide: BorderSide(color: Colors.pink),
                        ),
                      ),
                    ),
                    Visibility(
                      visible: locationcntroller.text.isNotEmpty,
                      child: Container(
                        width: double.infinity,
                        child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: searchPlace.length,
                            itemBuilder: (context, index) => ListTile(
                                  onTap: () {
                                    setState(() {
                                      locationcntroller.text =
                                          searchPlace[index].description ?? "";
                                      _getLatLang();
                                      SelectedLocation = locationcntroller.text;
                                      print(SelectedLocation);
                                      setState(() {
                                        searchPlace.clear();
                                      });
                                    });
                                  },
                                  horizontalTitleGap: 0,
                                  title: Text(
                                    searchPlace[index].description ?? "",
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                )),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
      
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Match Maker Experience:",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
      
                    //******************************************************
                    Focus(
                      focusNode: _dropdownFocus2,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton2<String>(
                          isExpanded: true,
                          hint: Text("Select Experience"),
                          items: experienceItems.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          value: selectExp,
                          onChanged: (String? value) {
                            setState(() {
                              selectExp = value;
                              selectExperience = selectExp;
                              print(selectExperience);
                            });
                          },
                          buttonStyleData: ButtonStyleData(
                            height: Get.height * 0.07,
                            padding: const EdgeInsets.only(left: 14, right: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                color: _isDropdownOpen2 == false
                                    ? Colors.grey
                                    : Colors.pink,
                              ),
                              color: Colors.white,
                            ),
                          ),
                          iconStyleData: selectExp == null
                              ? IconStyleData(
                                  icon: Icon(Icons
                                      .keyboard_arrow_down), // Change to up arrow icon
                                  iconSize: 30,
                                  iconEnabledColor: Colors.black,
                                )
                              : IconStyleData(
                                  icon: InkWell(
                                    child: Icon(Icons.close),
                                    onTap: () {
                                      setState(() {
                                        selectExp = null;
                                      });
                                    },
                                  ), // Change to down arrow icon
                                  iconSize: 25,
                                  //iconEnabledColor: Colors.black,
                                ),
                          dropdownStyleData: DropdownStyleData(
                            width: Get.width * 0.89,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Colors.white,
                            ),
                            offset: const Offset(10, 0),
                            scrollbarTheme: ScrollbarThemeData(
                              radius: const Radius.circular(40),
                              thickness: MaterialStateProperty.all<double>(6),
                              thumbVisibility:
                                  MaterialStateProperty.all<bool>(true),
                            ),
                          ),
                          menuItemStyleData: const MenuItemStyleData(
                            height: 40,
                            padding: EdgeInsets.only(left: 14, right: 14),
                          ),
                        ),
                      ),
                    ),
      
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "About the Match Maker",
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: MakerProfileControllerInstanse
                          .AboutMakerController.value,
                      maxLines: 4,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        hintText: "Type Something about the Match Maker",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppColors.subtitletextcolor),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xffFE0091)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xffBABABA)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xffBABABA)),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "What do you expect from your match seekers",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: AppColors.black),
                      ),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: MakerProfileControllerInstanse
                          .ExpectFromSeekerController.value,
                      maxLines: 4,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        hintText: "Type Something about the Match seekers",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppColors.subtitletextcolor),
                        //contentPadding: EdgeInsets.symmetric(vertical: height * 0.05,horizontal: width * 0.04),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xffFE0091)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xffBABABA)),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xffBABABA)),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Required";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: height * 0.04,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Match Maker Heading that they want everyone to see:",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(color: AppColors.black),
                      ),
                    ),
                    SizedBox(
                      height: height * .01,
                    ),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: MakerProfileControllerInstanse
                          .HandlingOfMakerController.value,
                      maxLines: 4,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        hintText: "Type Something about the Match Maker Heading",
                        hintStyle: Theme.of(context)
                            .textTheme
                            .bodyLarge
                            ?.copyWith(color: AppColors.subtitletextcolor),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xffFE0091)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Color(0xffBABABA)),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Color(0xffBABABA))),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          if (value.isEmpty) {
                            return "Required";
                          }
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: height * 0.06,
                    ),
      
                    Obx(
                      () => MyButton(
                        loading: MakerProfileControllerInstanse.loading.value,
                        width: width * 0.8,
                        title: 'Save',
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            validate();
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.06,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  //////////google location api method //////////////

  void searchAutocomplete(String query) async {
    print("calling");
    Uri uri = Uri.https(
        "maps.googleapis.com",
        "maps/api/place/autocomplete/json",
        {"input": query, "key": googleAPiKey});
    print(uri);
    try {
      final response = await http.get(uri);
      print(response.statusCode);
      final parse = jsonDecode(response.body);
      print(parse);
      if (parse['status'] == "OK") {
        setState(() {
          SearchPlaceModel searchPlaceModel = SearchPlaceModel.fromJson(parse);
          searchPlace = searchPlaceModel.predictions!;

          print(searchPlace.length);
        });
      }
    } catch (err) {}
  }

  Future<void> _getLatLang() async {
    final query = locationcntroller.text;
    locations = await locationFromAddress(query);

    setState(() {
      var first = locations.first;
      lat = first.latitude;
      long = first.longitude;
      print("*****lat ${lat} : ${long}**********long");
    });
  }

  validate() {
    if (startdate == null) {
      Fluttertoast.showToast(
          msg: "Pless Select birth date",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (imgFile == null) {
      Fluttertoast.showToast(
          msg: "Pless Select your profile picture",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (selectGender == null) {
      Fluttertoast.showToast(
          msg: "Pless Select gender",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      _submit();
      MakerProfileControllerInstanse.MakerProfileApiHit();
    }
  }

  void _showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Container(
        height: 80.0,
        child: Center(
          child: Text(
            'Plesse Enter Vaild otp',
            style: const TextStyle(fontSize: 25.0),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).highlightColor,
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  showAlert() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(

            // Color(0xffFFFFFF)
            backgroundColor: Color(0xffFFFFFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            content: Obx(() {


              return Container(
                height: Get.height * 0.4,
                width: Get.width * 1,
                child: Column(
                  children: [
                    SizedBox(
                      height: Get.height * .03,
                    ),
                    Center(
                      child: Text(
                        "Type the verification code\n         we've sent you",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * .05,
                    ),
                    Center(
                      child: Pinput(
                        validator: (value) {
                          if (value!.isEmpty && value.length != 6) {
                            return "Please enter your 6 digit pin";
                          } else {
                            return null;
                          }
                        },
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        length: 6,
                        autofocus: true,
                        //
                        // validator: (s) {
                        //   if (s?.contains('1')??false) return null;
                        //   return 'NOT VALID';
                        // },
                        useNativeKeyboard: true,
                        keyboardType: TextInputType.number,
                        defaultPinTheme:  PinTheme(
                          width: 56,
                          height: 56,
                          textStyle: TextStyle(
                              fontSize: 30, color: Colors.black, fontWeight: FontWeight.w600),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(40),
                          ),
                        ),
                        // focusedPinTheme: focusedPinTheme,
                        focusedPinTheme:  PinTheme(
                            width: 56,
                            height: 56,
                            decoration: BoxDecoration( color: Color(0xffFE0091),
                              border: Border.all(color: Colors.green),
                              borderRadius: BorderRadius.circular(50),)),
                        onSubmitted: (String pin) => _showSnackBar(context),
                        focusNode: _pinPutFocusNode,
                        controller: UserEmailAndphone.otpController.value,
                        // submittedPinTheme: PinTheme(
                        //     height: 56,
                        //     width: 56,
                        //     decoration: BoxDecoration(
                        //         borderRadius: BorderRadius.circular(40.0),
                        //         border: Border.all(color: Color(0xffFE0091)),
                        //         color: Color(0xffFe0091))),
                        // focusedPinTheme: defaultPinTheme,
                        // followingPinTheme: defaultPinTheme,
                      ),
                    ),
                    SizedBox(height: Get.height * .05),
                    Center(
                      child: MyButton(
                        loading: UserEmailAndphone.loading.value,
                        title: "Verify",
                        onTap: () {
                          if(UserEmailAndphone.otpController.value.text.isNotEmpty) {
                            UserEmailAndphone.PhoneAndEmaiOtpVerifyed(context);
                          }
                          else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Center(child: Text("full fill the otp")),
                                action: SnackBarAction(
                                  label: '',
                                  onPressed: () {
                                    // Handle the action when the button in the SnackBar is pressed.
                                  },
                                ),
                              ),
                            );
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: Get.height*0.01,
                    ),
                    if(UserEmailAndphone.resendOtp.value==true) Center(
                      child: UserEmailAndphone.rxRequestStatus.value==Status.LOADING ?
                        CircularProgressIndicator() :TextButton(onPressed: () {
                        UserEmailAndphone.PhoneAndEmailVerifiyed();
                      }, child: Text("resend otp")),
                    )
                  ],
                ),
              );
            },)
    );
      },
    );
  }
}
