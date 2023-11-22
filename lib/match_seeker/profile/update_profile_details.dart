import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:cupid_match/controllers/controller/SignUpController/SignUpController.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/match_seeker/photos.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:image/image.dart' as imgLib;
import 'package:new_pinput/new_pinput.dart';
import 'package:video_player/video_player.dart';
import '../../controllers/UserNumberAndNuberverfyController.dart';
import '../../controllers/controller/GetAllOcupationsController/GetAllOcupations.dart';
import '../../controllers/controller/MakerProfileController/MakerProfileController.dart';
import '../../controllers/controller/SeekerProfileController/SeekerProfileController.dart';
import '../../match_maker/match_maker_profile_update.dart';
import '../../models/GoogleLocationModel/GoogleLocationModel.dart';

class SikerProfileDetails extends StatefulWidget {
  const SikerProfileDetails({Key? key}) : super(key: key);

  @override
  State<SikerProfileDetails> createState() => _SikerProfileDetailsState();
}

class _SikerProfileDetailsState extends State<SikerProfileDetails> {
  // MakerProfileController MakerProfileControllerInstanse=Get.put(MakerProfileController());

  final SignUpControllerinstance = Get.put(SignUpController());
  final UserEmailAndphone = Get.put(UserEmailAndPhoneVerifyController());
  final FocusNode _pinPutFocusNode = FocusNode();

  FocusNode _dropdownFocus1 = FocusNode();
  FocusNode _dropdownFocus2 = FocusNode();
  FocusNode _dropdownFocus3 = FocusNode();
  bool _isDropdownOpen1 = false;
  bool _isDropdownOpen2 = false;
  bool _isDropdownOpen3 = false;
  bool _chooseAnswer1 = false;
  bool _chooseAnswer2 = false;
  bool _chooseAnswer3 = false;

  final _formKey = GlobalKey<FormState>();

  final locationcntroller = TextEditingController();

  final SeekerProfileControllerInstanse = Get.put(SeekerProfileController());
  final GetAllOcupationsControllerInstanse =
      Get.put(GetAllOcupationsController());
  String googleAPiKey = "AIzaSyACG0YonxAConKXfgaeVYj7RCRdXazrPYI";
  DateTime date = DateTime.now();
  List<Predictions> searchPlace = [];
  List<Location> locations = [];
  double? lat;
  double? long;
  bool isDropdownExpanded = true;
  bool selectedColor = false;

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

  final imgPicker = ImagePicker();
  Future<void> showOptionsDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: Center(
            child: Column(
              children: [

                Text(
                  'Upload Photo',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600,fontSize: 18,color:Colors.black),
                ),
                SizedBox(height: Get.height*0.01,),
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

  File? compressedFile;
  final imageCropper = ImageCropper();

  Future<void> openCamera(ImageSource source) async {
    var pickedImage = await imgPicker.pickImage(source: source);

    if (pickedImage != null) {
      final croppedImage = await imageCropper.cropImage(
        sourcePath: pickedImage.path,
        aspectRatio: const CropAspectRatio(
            ratioX: 1.5, ratioY: 2), // Adjust aspect ratio as needed
        compressQuality: 50,
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
        ],// Adjust compression quality as needed
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


      // Run compression in a background isolate
      // await compressImageInBackground(imgFile!);
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

  String? dropdownvalue;

  File? pickedImage;

  String? selectOccupations;

  String? selectLocalGender;
  var genderItems = ["Male", "Female", "Other"];
  var smokeorNot = ["Yes", "No"];
  var haveChildren = ["Want some day", "Have some"," Not Sure Yet","No"];
  var education = ["High School", "Trade School", "College","University Undergraduate","Graduate School"];
  var hopping = ["Something Casual", "A Relationship", "Marriage Minded","Not sure yet"];
  String? selectLocalSmoke;
  String? selectLocalDrike;
  String? selectReligion;
  String? selectLocalChildren;
  String? selectLocalEducation;
  String? selectLocakHopping;
  var religionItems = ["Hindus", "Muslims", "Sikhs"];

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

  void _onDropdownFocusChange3() {
    setState(() {
      _isDropdownOpen3 = _dropdownFocus3.hasFocus;

      print(_isDropdownOpen3);
    });
  }

  bool containerBoeder = false;
  bool phoneContainerBorder = false;
  @override
  void initState() {
    GetAllOcupationsControllerInstanse.GetAllOcupationsListApiHit();

    // TODO: implement initState
    super.initState();
    phoneContainerBorder = false;
    containerBoeder = false;

    _dropdownFocus1.addListener(_onDropdownFocusChange1);
    _dropdownFocus2.addListener(_onDropdownFocusChange2);
    _dropdownFocus3.addListener(_onDropdownFocusChange3);
    startdate = null;
    selectGender = null;
    datestring = null;
    imgFile = null;
    selectSmoke=null;
    selectDrink=null;
    selectchildren=null;
    selectEducation=null;
    selectHopping=null;
    selectGender=null;
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        // drawer: MyDrawer(),
        appBar: AppBar(
          // leading: Icon(
          //   Icons.menu,
          //   size: 25,
          //   color: Colors.black,
          // ),
          title: Text(
            "Profile Details",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
        ),
        body: Obx(()=>
      Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    // Center(
                    //   child: SizedBox(
                    //     height: height * .4,
                    //     width: width * .3,
                    //     child: CircleAvatar(
                    //       radius: 30.0,
                    //        backgroundImage: NetworkImage(
                    //           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
                    //       backgroundColor: Colors.transparent,
                    //     ),
                    //   ),
                    // ),
                    //
                    // Positioned(
                    //     top: 50,
                    //     left: 55,
                    //     right: 0,
                    //     child: GestureDetector(
                    //         onTap: () {
                    //           showOptionsDialog(context);
                    //         },
                    //         child: Image.asset("assets/icons/cameraa.png")))
        
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
                                          'https://cdn-icons-png.flaticon.com/512/847/847969.png?w=740&t=st=1691391117~exp=1691391717~hmac=c402e52cf04c8941cd7bc1fae55a6ed27830a0e3f82a34da252300f7b68ce614',
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
                            //   bottom: 0,
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
                  ],
                ),
                //*************************  video uploaded comment **********
                SizedBox(
                  height: height * .05,
                ),
                //
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
                //         videoFile == null ?  Text(
                //             "Uplod Video",
                //             style: Theme.of(context)
                //                 .textTheme
                //                 .bodyMedium!
                //                 .copyWith(color: Colors.grey),
                //           ) : Row(
                //             children: [
                //               Text(
                //                 "Video Uploaded",
                //                 style: Theme.of(context)
                //                     .textTheme
                //                     .bodyMedium!
                //                     .copyWith(color: Colors.grey),
                //                 ),
                //               Icon(Icons.check_circle,size: 15,color:Colors.green,)
                //             ],
                //           ),
                //         videoFile == null ?  InkWell(
                //             child: Container(
                //               height: height * .1,
                //               width: width * .1,
                //               decoration: BoxDecoration(
                //                 shape: BoxShape.circle,
                //                 color: Colors.grey.shade300,
                //               ),
                //               child: Image.asset("assets/icons/vedio.png",color: Colors.pink,),
                //               alignment: Alignment.center,
                //             ),
                //             onTap: () {
                //               pickVideo();
                //             },
                //           ):InkWell(
                //           child: Container(
                //             height: height * .1,
                //             width: width * .1,
                //             decoration: BoxDecoration(
                //               shape: BoxShape.circle,
                //               color: Colors.grey.shade300,
                //             ),
                //             child: Icon(Icons.cancel,color:Colors.red,),
                //             alignment: Alignment.center,
                //           ),
                //           onTap: () {
                //
                //             setState(() {
                //               videoFile=null;
                //             });
                //           },
                //         ),
                //         ],
                //       ),
                //     ),
                //   ),
                // ),
                Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: height * .04),
                        Text(
                          "Name",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(height: height * .01),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.emailAddress,
                          controller: SeekerProfileControllerInstanse
                              .NameController.value,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter your name';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffFE0091))),
                              hintStyle: TextStyle(
                                  fontSize: 16, color: Color(0xffBABABA)),
                              contentPadding: EdgeInsets.all(18),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA))),
                              errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA))),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35.0)),
                                borderSide: BorderSide(color: Color(0xffBABABA)),
                              ),
                              hintText: "Enter name",
                              filled: true,
                              fillColor: Colors.white),
                        ),
                        SizedBox(height: height * .03),
        
                        Text(
                          "Phone Number",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(height: height * .01),
                        // TextFormField(
                        //   keyboardType: TextInputType.number,
                        //   controller: SeekerProfileControllerInstanse.PhoneController.value,
                        //   validator: (value) {
                        //     if (value!.isEmpty) {
                        //       return "Please Enter Phone Number";
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        //   decoration: InputDecoration(
                        //       focusedBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        //           borderSide: BorderSide(color: Color(0xffFE0091))),
                        //       hintStyle: TextStyle(fontSize: 16, color: Color(0xffBABABA)),
                        //       contentPadding: EdgeInsets.all(18),
                        //       enabledBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        //           borderSide: BorderSide(color: Color(0xffBABABA))),
                        //       errorBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        //           borderSide: BorderSide(color: Color(0xffBABABA))),
                        //       focusedErrorBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        //         borderSide: BorderSide(color: Color(0xffBABABA)),
                        //       ),
                        //       suffix: Text(
                        //         "verify",
                        //         style: Theme.of(context)
                        //             .textTheme
                        //             .bodySmall!
                        //             .copyWith(color: Color(0xffFE0091)),
                        //       ),
                        //       hintText: "Phone Number",
                        //       filled: true,
                        //       fillColor: Colors.white),
                        // ),
                        Container(
                          width: Get.width,
                          height: Get.height * 0.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: phoneContainerBorder == false
                                      ? Colors.grey
                                      : Colors.pinkAccent)
                              // border: Border.all(color: Colors.grey)
                              ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
        
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child: Container(
                                  width: Get.width * 0.7,
                                  child: TextFormField(
                                    maxLength: 15,
                                    controller: SignUpControllerinstance
                                            .credentialsController.value.text
                                            .contains("@")
                                        ? UserEmailAndphone
                                            .emailAndPhoneVerifyController.value
                                        : SignUpControllerinstance
                                            .credentialsController.value,
                                    enabled: SignUpControllerinstance
                                            .credentialsController.value.text
                                            .contains("@")
                                        ? true
                                        : false,
                                    keyboardType: TextInputType.number,
                                    textAlignVertical: TextAlignVertical.center,
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
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
                                      //suffix: Text('Verify',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xffFE0091),fontWeight: FontWeight.w400,fontSize: 12),),
                                      // focusedBorder: OutlineInputBorder(
                                      //   borderRadius: BorderRadius.circular(30),
                                      //   borderSide:
                                      //       BorderSide(color: Colors.pinkAccent),
                                      // ),
                                      // enabledBorder: OutlineInputBorder(
                                      //   borderRadius: BorderRadius.circular(30),
                                      //   borderSide:
                                      //       BorderSide(color: Color(0xffBABABA)),
                                      // ),
                                      // errorBorder: OutlineInputBorder(
                                      //   borderRadius:
                                      //       BorderRadius.all(Radius.circular(35.0)),
                                      //   borderSide: BorderSide(color: Colors.red),
                                      // ),
                                      // disabledBorder: OutlineInputBorder(
                                      //   borderRadius:
                                      //       BorderRadius.all(Radius.circular(35.0)),
                                      //   borderSide:
                                      //       BorderSide(color: Color(0xffBABABA)),
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
                                        return null;
                                      }
                                    },
                                  ),
                                ),
                              ),
                              if (SignUpControllerinstance
                                  .credentialsController.value.text
                                  .contains("@"))
                                InkWell(
                                  child: UserEmailAndphone.verified.value ==
                                          false
                                      ? InkWell(
                                    onTap: () {
        
                                   if(UserEmailAndphone
                                        .emailAndPhoneVerifyController.value.text.isNotEmpty){
                                                    UserEmailAndphone
                                          .PhoneAndEmailVerifiyed();
                                                 showAlert();
                                        }  
                                     
        
        
        
                                    },
                                          child:UserEmailAndphone.rxRequestStatus.value==Status.LOADING?
                                                      CircularProgressIndicator(): Padding(
                                                        padding: const EdgeInsets.only(right: 10),
                                                        child: Text(
                                                                                                  "Verify",
                                                                                                  style: TextStyle(
                                                                                                      color: Colors.pinkAccent,
                                                                                                      fontWeight: FontWeight.bold),
                                                                                                ),
                                                      ),
                                          // onTap: () {
                                          //   UserEmailAndphone
                                          //       .PhoneAndEmailVerifiyed();
                                          //   if (UserEmailAndphone.optsent.value == true) {
                                          //     showAlert();
                                          //   }
                                          // },
                                        )
                                      : Padding(
                                        padding: const EdgeInsets.only(right: 10),
                                        child: Text(
                                            "Verified",
                                            style: TextStyle(
                                                color: Colors.green,
                                                fontWeight: FontWeight.bold),
                                          ),
                                      ),
                                ),
                            ],
                          ),
                        ),
        
                        SizedBox(height: height * .03),
                        Text(
                          "Email Id",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(height: height * .01),
                        Container(
                          width: Get.width,
                          height: Get.height * 0.07,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  color: containerBoeder == false
                                      ? Colors.grey
                                      : Colors.pinkAccent)
                              // border: Border.all(color: Colors.grey)
                              ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Container(
                              //    width: Get.width*0.7,
                              //   child: TextFormField(),),
                              Container(
                                width: Get.width * 0.7,
                                child: TextFormField(
        
                                  textAlignVertical: TextAlignVertical.center,
                                  controller: SignUpControllerinstance
                                          .credentialsController.value.text
                                          .contains("@")
                                      ? SignUpControllerinstance
                                          .credentialsController.value
                                      : UserEmailAndphone
                                          .emailAndPhoneVerifyController.value,
                                  enabled: SignUpControllerinstance
                                          .credentialsController.value.text
                                          .contains("@")
                                      ? false
                                      : true,
                                  decoration: InputDecoration(
                                    hintText: "example@gmail.com",
                                    border: InputBorder.none,
                                    contentPadding: EdgeInsets.all(20),
                                    hintStyle: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            color: AppColors.subtitletextcolor),
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
                                    //     borderRadius: BorderRadius.circular(30),
                                    //     borderSide: BorderSide(
                                    //       color: Color(0xffBABABA),
                                    //     )),
                                  ),
                                  onFieldSubmitted: (value) {},
                                  validator: (value) {
        
                                    if (value!.isEmpty ||
                                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(value)) {
                                      setState(() {
                                        containerBoeder = true;
                                      });
                                      return null;
                                    }
                                    setState(() {
                                      containerBoeder = false;
                                    });
                                    return null;
                                  },
                                ),
                              ),
        
                              if (!SignUpControllerinstance
                                  .credentialsController.value.text
                                  .contains("@"))
                                InkWell(
                                    child: UserEmailAndphone.verified.value ==
                                            false
                                        ? InkWell(
                                            onTap: () {
        if( UserEmailAndphone
                                        .emailAndPhoneVerifyController.value.text.isNotEmpty){
          UserEmailAndphone
                                                  .PhoneAndEmailVerifiyed();
                                                  showAlert();
                                        }
                                            
                                             
        
        
        
        
                                            },
                                            child:UserEmailAndphone.rxRequestStatus.value==Status.LOADING?
                                            CircularProgressIndicator():
                                            Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                              child: Text("Verify",
                                                style: TextStyle(
                                                    color: Colors.pinkAccent,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            )
                                    )
                                        : Padding(
                                            padding:
                                                const EdgeInsets.only(right: 10),
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
                            ],
                          ),
                        ),
                        if (containerBoeder == true)
                          Row(
        
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 25),
                                child: Text(
                                  "Email cannot be empty!",
                                  style: TextStyle(color: Colors.pinkAccent,fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        SizedBox(height: height * .01),
                        Text(
                          "Occupation",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(height: height * .01),
        
                        if (GetAllOcupationsControllerInstanse
                            .Ocupations.isNotEmpty)
                          Focus(
                            focusNode: _dropdownFocus3,
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton2<String>(
                                isExpanded: true,
                                hint: Text(
                                  "Select Occupation",
                                  style: TextStyle(color: Colors.black),
                                ),
                                items: GetAllOcupationsControllerInstanse
                                    .Ocupations.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                value: dropdownvalue,
                                onChanged: (String? value) {
                                  setState(() {
                                    dropdownvalue = value!;
                                    Ocupasion = dropdownvalue;
                                    print(Ocupasion);
                                  });
                                },
                                buttonStyleData: ButtonStyleData(
                                  height: Get.height * 0.07,
                                  padding:
                                      const EdgeInsets.only(left: 14, right: 14),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    border: Border.all(
                                      color: _isDropdownOpen3 == false
                                          ? Colors.grey
                                          : Colors.pink,
                                    ),
                                    color: Colors.white,
                                  ),
                                ),
                                iconStyleData: dropdownvalue == null
                                    ? IconStyleData(
                                        icon: Icon(Icons.keyboard_arrow_down),
                                        // Change to up arrow icon
                                        iconSize: 30,
                                        iconEnabledColor: Colors.black,
                                      )
                                    : IconStyleData(
                                        icon: InkWell(
                                          child: Icon(Icons.close),
                                          onTap: () {
                                            setState(() {
                                              dropdownvalue = null;
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
                                    thickness:
                                        MaterialStateProperty.all<double>(6),
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
        
                        // ***************************   Occupation Pjdfgjdsfds ***************************
        
                        SizedBox(height: height * .03),
                        Text(
                          "Salary",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(height: height * .01),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
        
                          maxLength: 2,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please Enter Salary";
                            } else {
                              return null;
                            }
                          },
                          controller: SeekerProfileControllerInstanse
                              .SalaryController.value,
                          decoration: InputDecoration(
                              suffixText: "LPA",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffFE0091))),
                              hintStyle: TextStyle(
                                  fontSize: 16, color: Color(0xffBABABA)),
                              contentPadding: EdgeInsets.all(18),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA))),
                              errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA))),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(35.0)),
                                borderSide: BorderSide(color: Color(0xffBABABA)),
                              ),
                              hintText: "Salary",
                              filled: true,
                              fillColor: Colors.white),
                        ),
        
                        SizedBox(height: height * .03),
                        Text(
                          "Location",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(height: height * .01),
                        // TextFormField(
                        //   keyboardType: TextInputType.emailAddress,
                        //   controller: SeekerProfileControllerInstanse.AddressController.value,
                        //   validator: (value) {
                        //     if (value!.isEmpty) {
                        //       return "Please Enter Address";
                        //     } else {
                        //       return null;
                        //     }
                        //   },
                        //   decoration: InputDecoration(
                        //       focusedBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        //           borderSide: BorderSide(color: Color(0xffFE0091))),
                        //       hintStyle: TextStyle(fontSize: 16, color: Color(0xffBABABA)),
                        //       contentPadding: EdgeInsets.all(18),
                        //       enabledBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        //           borderSide: BorderSide(color: Color(0xffBABABA))),
                        //       errorBorder: OutlineInputBorder(
                        //           borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        //           borderSide: BorderSide(color: Color(0xffBABABA))),
                        //       focusedErrorBorder: OutlineInputBorder(
                        //         borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        //         borderSide: BorderSide(color: Color(0xffBABABA)),
                        //       ),
                        //       hintText: "Address",
                        //       filled: true,
                        //       fillColor: Colors.white),
                        // ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
        
                          keyboardType: TextInputType.text,
                          controller: locationcntroller,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please Enter your address';
                            }
                          },
                          onChanged: (value) {
                            print(value);
                            setState(() {
                              if (locationcntroller.text.isEmpty) {
                                Sikeraddress = value;
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35.0)),
                              borderSide: BorderSide(color: Colors.red),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35.0)),
                              borderSide: BorderSide(color: Color(0xffBABABA)),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(35.0)),
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
                                              searchPlace[index].description ??
                                                  "";
                                          _getLatLang();
                                          SelectedLocation =
                                              locationcntroller.text;
                                          // print(SelectedLocation);
                                          Sikeraddress = SelectedLocation;
                                          print("$Sikeraddress=============");
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
                        SizedBox(height: height * .03),
        
                        Text(
                          "Gender",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(height: height * .01),
                        // ****************  select gender dropdown ***********************
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
                              value: selectLocalGender,
                              onChanged: (String? value) {
                                setState(() {
                                  print(value);
                                  selectLocalGender = value;
                                  selectGender = value;
                                  print(selectGender);
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                height: Get.height * 0.07,
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
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
                              iconStyleData: selectLocalGender == null
                                  ? IconStyleData(
                                      icon: Icon(Icons.keyboard_arrow_down),
                                      // Change to up arrow icon
                                      iconSize: 30,
                                      iconEnabledColor: Colors.black,
                                    )
                                  : IconStyleData(
                                      icon: InkWell(
                                        child: Icon(Icons.close),
                                        onTap: () {
                                          setState(() {
                                            selectLocalGender = null;
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
                        SizedBox(height: height * .03),
                        Text(
                          "Would you like to have children ?",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(height: height * .01),
                        // ****************  select children or not dropdown ***********************
                        Focus(
                          focusNode: _dropdownFocus1,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: Text("Select"),
                              items: haveChildren.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              value: selectLocalChildren,
                              onChanged: (String? value) {
                                setState(() {
                                  print(value);
                                  selectLocalChildren = value;
                                  selectchildren = value;
                                  print(selectGender);
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                height: Get.height * 0.07,
                                padding:
                                const EdgeInsets.only(left: 14, right: 14),
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
                              iconStyleData: selectLocalChildren == null
                                  ? IconStyleData(
                                icon: Icon(Icons.keyboard_arrow_down),
                                // Change to up arrow icon
                                iconSize: 30,
                                iconEnabledColor: Colors.black,
                              )
                                  : IconStyleData(
                                icon: InkWell(
                                  child: Icon(Icons.close),
                                  onTap: () {
                                    setState(() {
                                      selectLocalChildren = null;
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
                        SizedBox(height: height * .03),
                        Text(
                          "Do you drink",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(height: height * .01),
                        // ****************  select children or not dropdown ***********************
                        Focus(
                          focusNode: _dropdownFocus1,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: Text("Select"),
                              items: smokeorNot.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              value: selectLocalDrike,
                              onChanged: (String? value) {
                                setState(() {
                                  print(value);
                                  selectLocalDrike = value;
                                  selectDrink = value;
                                  print(selectDrink);
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                height: Get.height * 0.07,
                                padding:
                                const EdgeInsets.only(left: 14, right: 14),
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
                              iconStyleData: selectLocalDrike == null
                                  ? IconStyleData(
                                icon: Icon(Icons.keyboard_arrow_down),
                                // Change to up arrow icon
                                iconSize: 30,
                                iconEnabledColor: Colors.black,
                              )
                                  : IconStyleData(
                                icon: InkWell(
                                  child: Icon(Icons.close),
                                  onTap: () {
                                    setState(() {
                                      selectLocalDrike = null;
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
                        SizedBox(height: height * .03),
                        Text(
                          "Do you smoke",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(height: height * .01),
                        // ****************  select children or not dropdown ***********************
                        Focus(
                          focusNode: _dropdownFocus1,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: Text("Select"),
                              items: smokeorNot.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              value: selectLocalSmoke,
                              onChanged: (String? value) {
                                setState(() {
                                  print(value);
                                  selectLocalSmoke = value;
                                  selectSmoke = value;
                                  print(selectGender);
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                height: Get.height * 0.07,
                                padding:
                                const EdgeInsets.only(left: 14, right: 14),
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
                              iconStyleData: selectLocalSmoke == null
                                  ? IconStyleData(
                                icon: Icon(Icons.keyboard_arrow_down),
                                // Change to up arrow icon
                                iconSize: 30,
                                iconEnabledColor: Colors.black,
                              )
                                  : IconStyleData(
                                icon: InkWell(
                                  child: Icon(Icons.close),
                                  onTap: () {
                                    setState(() {
                                      selectLocalSmoke = null;
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

                        SizedBox(height: height * .03),
                        Text(
                          "Education",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(height: height * .01),
                        // ****************  select children or not dropdown ***********************
                        Focus(
                          focusNode: _dropdownFocus1,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: Text("Select"),
                              items: education.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              value: selectLocalEducation,
                              onChanged: (String? value) {
                                setState(() {
                                  print(value);
                                  selectLocalEducation = value;
                                  selectEducation = value;
                                  print(selectGender);
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                height: Get.height * 0.07,
                                padding:
                                const EdgeInsets.only(left: 14, right: 14),
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
                              iconStyleData: selectLocalEducation == null
                                  ? IconStyleData(
                                icon: Icon(Icons.keyboard_arrow_down),
                                // Change to up arrow icon
                                iconSize: 30,
                                iconEnabledColor: Colors.black,
                              )
                                  : IconStyleData(
                                icon: InkWell(
                                  child: Icon(Icons.close),
                                  onTap: () {
                                    setState(() {
                                      selectLocalEducation = null;
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
                        SizedBox(height: height * .03),
                        Text(
                          "What are you hoping to find",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(height: height * .01),
                        // ****************  select children or not dropdown ***********************
                        Focus(
                          focusNode: _dropdownFocus1,
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: Text("Select"),
                              items: hopping.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              value: selectLocakHopping,
                              onChanged: (String? value) {
                                setState(() {
                                  print(value);
                                  selectLocakHopping = value;
                                  selectHopping = value;
                                  print(selectGender);
                                });
                              },
                              buttonStyleData: ButtonStyleData(
                                height: Get.height * 0.07,
                                padding:
                                const EdgeInsets.only(left: 14, right: 14),
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
                              iconStyleData: selectLocakHopping == null
                                  ? IconStyleData(
                                icon: Icon(Icons.keyboard_arrow_down),
                                // Change to up arrow icon
                                iconSize: 30,
                                iconEnabledColor: Colors.black,
                              )
                                  : IconStyleData(
                                icon: InkWell(
                                  child: Icon(Icons.close),
                                  onTap: () {
                                    setState(() {
                                      selectLocakHopping = null;
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



                        SizedBox(height: height * .03),
        
                        // // ****************  select Religion dropdown ***********************
                        // Text(
                        //   "Religion",
                        //   style: Theme.of(context).textTheme.titleSmall,
                        // ),
                        // SizedBox(height: height * .01),
                        //
                        // Focus(
                        //   focusNode: _dropdownFocus2,
                        //   child: DropdownButtonHideUnderline(
                        //     child: DropdownButton2<String>(
                        //       isExpanded: true,
                        //       hint: Text("Select Religion"),
                        //       items: religionItems.map((String items) {
                        //         return DropdownMenuItem(
                        //           value: items,
                        //           child: Text(items),
                        //         );
                        //       }).toList(),
                        //       value: selectReligion,
                        //       onChanged: (String? value) {
                        //         setState(() {
                        //           selectReligion = value;
                        //           SikerReligon = value;
                        //         });
                        //       },
                        //       buttonStyleData: ButtonStyleData(
                        //         height: Get.height * 0.07,
                        //         padding:
                        //             const EdgeInsets.only(left: 14, right: 14),
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(30),
                        //           border: Border.all(
                        //               color: _isDropdownOpen2 == false
                        //                   ? Colors.grey
                        //                   : Colors
                        //                       .pink // Set border color based on selected state
                        //               ),
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        //       iconStyleData: selectReligion == null
                        //           ? IconStyleData(
                        //               icon: Icon(Icons.keyboard_arrow_down),
                        //               iconSize: 30,
                        //               iconEnabledColor: Colors.black,
                        //             )
                        //           : IconStyleData(
                        //               icon: InkWell(
                        //                 child: Icon(Icons.close),
                        //                 onTap: () {
                        //                   setState(() {
                        //                     selectReligion = null;
                        //                   });
                        //                 },
                        //               ),
                        //               iconSize: 25,
                        //               iconEnabledColor: Colors.black,
                        //             ),
                        //       dropdownStyleData: DropdownStyleData(
                        //         width: Get.width * 0.89,
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(14),
                        //           color: Colors.white,
                        //         ),
                        //         offset: const Offset(10, 0),
                        //         scrollbarTheme: ScrollbarThemeData(
                        //           radius: const Radius.circular(40),
                        //           thickness: MaterialStateProperty.all<double>(6),
                        //           thumbVisibility:
                        //               MaterialStateProperty.all<bool>(true),
                        //         ),
                        //       ),
                        //       menuItemStyleData: const MenuItemStyleData(
                        //         height: 40,
                        //         padding: EdgeInsets.only(left: 14, right: 14),
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        //
                        // SizedBox(height: height * .03),
        
                        Text(
                          "Height",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(height: height * .01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: width * .45,
                              child: TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
        
                                keyboardType: TextInputType.number,
                                controller: SeekerProfileControllerInstanse
                                    .HeightController.value,
                                maxLength: 1,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Hieght";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35.0)),
                                        borderSide:
                                            BorderSide(color: Color(0xffFE0091))),
                                    hintStyle: TextStyle(
                                        fontSize: 16, color: Color(0xffBABABA)),
                                    contentPadding: EdgeInsets.all(18),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35.0)),
                                        borderSide:
                                            BorderSide(color: Color(0xffBABABA))),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35.0)),
                                        borderSide:
                                            BorderSide(color: Color(0xffBABABA))),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(35.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xffBABABA)),
                                    ),
                                    hintText: "Feet",
                                    filled: true,
                                    fillColor: Colors.white),
                              ),
                            ),
                            Container(
                              width: width * .45,
                              child: TextFormField(
                                autovalidateMode: AutovalidateMode.onUserInteraction,
        
                                keyboardType: TextInputType.number,
                                controller: SeekerProfileControllerInstanse
                                    .InchesController.value,
                                maxLength: 2,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter Height";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35.0)),
                                        borderSide:
                                            BorderSide(color: Color(0xffFE0091))),
                                    hintStyle: TextStyle(
                                        fontSize: 16, color: Color(0xffBABABA)),
                                    contentPadding: EdgeInsets.all(18),
                                    enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35.0)),
                                        borderSide:
                                            BorderSide(color: Color(0xffBABABA))),
                                    errorBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(35.0)),
                                        borderSide:
                                            BorderSide(color: Color(0xffBABABA))),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(35.0)),
                                      borderSide:
                                          BorderSide(color: Color(0xffBABABA)),
                                    ),
                                    hintText: "Inches",
                                    filled: true,
                                    fillColor: Colors.white),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: height * .03),
        
                        //no changes **********************************
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
                                        style: TextStyle(color: Colors.black),
                                      ),
                              ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: width * .05),
                                child: GestureDetector(
                                    onTap: () async {
                                      DateTime minimumDate = DateTime.now()
                                          .subtract(Duration(days: 365 * 18));
                                      startdate = await showDatePicker(
                                        context: context,
                                        initialDate: minimumDate,
                                        firstDate: DateTime(1900),
                                        lastDate: minimumDate,
                                      );
                                      print(startdate);
                                      datestring = DateFormat('dd-MM-yyyy')
                                          .format(DateTime.parse(
                                              startdate.toString()));
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
        
                        SizedBox(height: height * .03),
        
                        Text(
                          "Add Question",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        SizedBox(height: height * .01),
                        Container(
                          width: width * .9,
                          child: TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
        
                            keyboardType: TextInputType.emailAddress,
                            controller: SeekerProfileControllerInstanse
                                .QuestionController.value,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please add question";
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(35.0)),
                                    borderSide:
                                        BorderSide(color: Color(0xffFE0091))),
                                hintStyle: TextStyle(
                                    fontSize: 16, color: Color(0xffBABABA)),
                                contentPadding: EdgeInsets.all(18),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(35.0)),
                                    borderSide:
                                        BorderSide(color: Color(0xffBABABA))),
                                errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(35.0)),
                                    borderSide:
                                        BorderSide(color: Color(0xffBABABA))),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                hintText: "Enter your questions",
                                filled: true,
                                fillColor: Colors.white),
                          ),
                        ),
                        SizedBox(height: height * .03),
                        Text(
                          "Answer ",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w900,
                              color: Colors.black),
                        ),
                        SizedBox(height: Get.height*0.01,),
                        Text(
                          "Give The Three Option And Choose The Currect Option",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                          maxLines: 2,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 10),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: height * .03),
                            Row(
                              children: [
                                Checkbox(
                                  value: _chooseAnswer1,
                                  onChanged: (value) {
                                    if (_chooseAnswer2 == false &&
                                        _chooseAnswer3 == false) {
                                      choose = SeekerProfileControllerInstanse
                                          .FirstanswerController.value.text;
                                      setState(() {
                                        print(choose);
                                        _chooseAnswer1 = !_chooseAnswer1;
                                        // click = !click;
                                      });
                                    }
                                  },
                                ),
                                Flexible(
                                  child: TextFormField(
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
        
                                    controller: SeekerProfileControllerInstanse
                                        .FirstanswerController.value,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        hintText: "Enter your Answer",
                                        fillColor: Colors.white,
                                        filled: true,
                                        contentPadding: EdgeInsets.all(10),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                                color: Color(0xffDCDCDC))),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                                color: Color(0xffFE0091))),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                                color: Color(0xffDCDCDC)))),
                                    onFieldSubmitted: (value) {},
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'enter value';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height * .03),
                            Row(
                              children: [
                                Checkbox(
                                  value: _chooseAnswer2,
                                  onChanged: (value) {
                                    if (_chooseAnswer1 == false &&
                                        _chooseAnswer3 == false) {
                                      choose = SeekerProfileControllerInstanse
                                          .SecondanswerController.value.text;
                                      setState(() {
                                        print(choose);
                                        _chooseAnswer2 = !_chooseAnswer2;
                                        // click = !click;
                                      });
                                    }
                                  },
                                ),
                                Flexible(
                                  child: TextFormField(
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
        
                                    controller: SeekerProfileControllerInstanse
                                        .SecondanswerController.value,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        hintText: "Enter your Answer",
                                        fillColor: Colors.white,
                                        filled: true,
                                        contentPadding: EdgeInsets.all(10),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                                color: Color(0xffDCDCDC))),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                                color: Color(0xffFE0091))),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                                color: Color(0xffDCDCDC)))),
                                    onFieldSubmitted: (value) {},
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'enter value';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height * .03),
                            Row(
                              children: [
                                Checkbox(
                                  value: _chooseAnswer3,
                                  onChanged: (value) {
                                    // choose = SeekerProfileControllerInstanse.ThirdanswerController.value.text;
                                    if (_chooseAnswer1 == false &&
                                        _chooseAnswer2 == false) {
                                      choose = SeekerProfileControllerInstanse
                                          .ThirdanswerController.value.text;
                                      setState(() {
                                        print(choose);
                                        _chooseAnswer3 = !_chooseAnswer3;
                                        // click = !click;
                                      });
                                    }
                                  },
                                ),
                                Flexible(
                                  child: TextFormField(
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
        
                                    controller: SeekerProfileControllerInstanse
                                        .ThirdanswerController.value,
                                    textAlign: TextAlign.center,
                                    decoration: InputDecoration(
                                        hintText: "Enter your Answer",
                                        alignLabelWithHint: true,
                                        fillColor: Colors.white,
                                        filled: true,
                                        contentPadding: EdgeInsets.all(10),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                                color: Color(0xffDCDCDC))),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                                color: Color(0xffFE0091))),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            borderSide: BorderSide(
                                                color: Color(0xffDCDCDC)))),
                                    onFieldSubmitted: (value) {},
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'enter value';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     Flexible(
                        //       child: TextFormField(
                        //         controller: SeekerProfileControllerInstanse.FirstanswerController.value,
                        //         decoration: InputDecoration(
                        //             hintText: "Enter",
                        //             fillColor: Colors.white,
                        //             filled: true,
                        //             contentPadding: EdgeInsets.all(10),
                        //             enabledBorder: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(30),
                        //                 borderSide: BorderSide(color: Color(0xffDCDCDC))),
                        //             focusedBorder: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(30),
                        //                 borderSide: BorderSide(color: Color(0xffFE0091))),
                        //             border: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(30),
                        //                 borderSide: BorderSide(color: Color(0xffDCDCDC)))),
                        //         onFieldSubmitted: (value) {},
                        //         validator: (value) {
                        //           if (value!.isEmpty) {
                        //             return 'enter value';
                        //           }
                        //           return null;
                        //         },
                        //       ),
                        //     ),
                        //     SizedBox(width: 10),
                        //     Flexible(
                        //       child: TextFormField(
                        //         controller: SeekerProfileControllerInstanse.SecondanswerController.value,
                        //         decoration: InputDecoration(
                        //             hintText: "Enter",
                        //             fillColor: Colors.white,
                        //             filled: true,
                        //             contentPadding: EdgeInsets.all(10),
                        //             enabledBorder: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(30),
                        //                 borderSide: BorderSide(color: Color(0xffDCDCDC))),
                        //             focusedBorder: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(30),
                        //                 borderSide: BorderSide(color: Color(0xffFE0091))),
                        //             border: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(30),
                        //                 borderSide: BorderSide(color: Color(0xffDCDCDC)))),
                        //         onFieldSubmitted: (value) {},
                        //         validator: (value) {
                        //           if (value!.isEmpty) {
                        //             return 'enter value';
                        //           }
                        //           return null;
                        //         },
                        //       ),
                        //     ),
                        //     SizedBox(width: 10),
                        //     Flexible(
                        //       child: TextFormField(
                        //         controller: SeekerProfileControllerInstanse.ThirdanswerController.value,
                        //         decoration: InputDecoration(
                        //             hintText: "Enter",
                        //             fillColor: Colors.white,
                        //             filled: true,
                        //             contentPadding: EdgeInsets.all(10),
                        //             enabledBorder: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(30),
                        //                 borderSide: BorderSide(color: Color(0xffDCDCDC))),
                        //             focusedBorder: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(30),
                        //                 borderSide: BorderSide(color: Color(0xffFE0091))),
                        //             border: OutlineInputBorder(
                        //                 borderRadius: BorderRadius.circular(30),
                        //                 borderSide: BorderSide(color: Color(0xffDCDCDC)))),
                        //         onFieldSubmitted: (value) {},
                        //         validator: (value) {
                        //           if (value!.isEmpty) {
                        //             return 'enter value';
                        //           }
                        //           return null;
                        //         },
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        SizedBox(height: 5),
                      ],
                    )),
        
                // Padding(
                //   padding: const EdgeInsets.only(right: 40, left: 40),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children: [
                //       SizedBox(
                //         height: 20,
                //         width: 20,
                //         child: ElevatedButton(
                //           onPressed: () {
                //             choose = SeekerProfileControllerInstanse.FirstanswerController.value.text;
                //             setState(() {
                //
                //               print(choose);
                //             });
                //           },
                //           child: null,
                //           style: ElevatedButton.styleFrom(
                //               backgroundColor:
                //                   choose == SeekerProfileControllerInstanse.FirstanswerController.value.text ? Color(0xffFE0091) : Colors.white,
                //               shape: RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(25),
                //                   side: BorderSide(
                //                       color: Color(0xffBABABA), width: 2))),
                //         ),
                //       ),
                //       SizedBox(
                //         height: 20,
                //         width: 20,
                //         child: ElevatedButton(
                //           onPressed: () {
                //             choose = SeekerProfileControllerInstanse.SecondanswerController.value.text;
                //             setState(() {
                //               // click = !click;
                //               print(choose);
                //             });
                //           },
                //           child: null,
                //           style: ElevatedButton.styleFrom(
                //               backgroundColor:
                //                   choose == SeekerProfileControllerInstanse.SecondanswerController.value.text ? Color(0xffFE0091) : Colors.white,
                //               shape: RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(25),
                //                   side: BorderSide(
                //                       color: Color(0xffBABABA), width: 2))),
                //         ),
                //       ),
                //       SizedBox(
                //         height: 20,
                //         width: 20,
                //         child: ElevatedButton(
                //           onPressed: () {
                //             choose = SeekerProfileControllerInstanse.ThirdanswerController.value.text;
                //             setState(() {
                //               print(choose);
                //               // click = !click;
                //             });
                //           },
                //           child: null,
                //           style: ElevatedButton.styleFrom(
                //               backgroundColor:
                //                   choose == SeekerProfileControllerInstanse.ThirdanswerController.value.text ? Color(0xffFE0091) : Colors.white,
                //               shape: RoundedRectangleBorder(
                //                   borderRadius: BorderRadius.circular(25),
                //                   side: BorderSide(
                //                       color: Color(0xffBABABA), width: 2))),
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
                // Container(
                //   height: height * .11,
                //   width: width * 1,
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(15),
                //       border: Border.all(color: Colors.grey)),
                //   child: Padding(
                //     padding: const EdgeInsets.all(8.0),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         Text(
                //           "How old do you think i am?",
                //           style: Theme.of(context).textTheme.subtitle1,
                //         ),
                //         SizedBox(height: height * .02),
                //         Text(
                //           "I am 20 years old.",
                //           style: Theme.of(context)
                //               .textTheme
                //               .subtitle1!
                //               .copyWith(color: Colors.grey),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),
                SizedBox(height: height * .03),
                Obx(() => Center(
                        child: MyButton(
                      loading: SeekerProfileControllerInstanse.loading.value,
                      title: 'Confirm',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          validation();
                        }
                        // Get.to(() => PhotosScreen());
                      },
                    ))),
                SizedBox(height: Get.height * 0.05)
              ],
            ),
          ),
        ));
  }

  validation() {
    if (selectchildren == null) {
      Fluttertoast.showToast(
          msg: "Pless Select you like to have children",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (Ocupasion == null) {
      Fluttertoast.showToast(
          msg: "Pless Select Ocupasion",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    else if (selectDrink == null) {
      Fluttertoast.showToast(
          msg: "Pless Select Drink or not",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    else if (selectSmoke == null) {
      Fluttertoast.showToast(
          msg: "Pless Select smoke or not",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }   else if ( selectHopping== null) {
      Fluttertoast.showToast(
          msg: "Pless Select  you hoping to find in your partner",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }else if (selectEducation == null) {
      Fluttertoast.showToast(
          msg: "Pless Select education",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    else if (selectGender == null) {
      Fluttertoast.showToast(
          msg: "Pless Select Gender",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (imgFile == null) {
      Fluttertoast.showToast(
          msg: "Pless Select profile picture",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (datestring == null) {
      Fluttertoast.showToast(
          msg: "Pless Select birth date",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    } else if (_chooseAnswer1 == true ||
        _chooseAnswer2 == true ||
        _chooseAnswer3 == true) {
      SeekerProfileControllerInstanse.SeekerProfileApiHit();
    } else {
      Fluttertoast.showToast(
          msg: " Select One currect answer",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  void imagePickerOption() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: Text(
              'Choose Image',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  pickImage(ImageSource.camera);
                  Get.back();
                },
                child: const Text('Camera'),
              ),
              TextButton(
                onPressed: () async {
                  pickImage(ImageSource.gallery);
                  Get.back();
                },
                child: const Text('Gallery'),
              )
            ]);
      },
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

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

  void _showSnackBar(BuildContext context, String pin) {
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
            content: Obx(
               () {
                return Container(
                  height: Get.height * 0.45,
                  width: Get.width * 1,
                  child: Column(
                    children: [
                      Align(
                          alignment: Alignment.bottomRight,
                          child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset("assets/icons/cancel.png"),
                          )),
                      SizedBox(
                        height: Get.height * .04,
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
                          defaultPinTheme: PinTheme(
                            width: 56,
                            height: 56,
                            textStyle: TextStyle(
                                fontSize: 30, color: Colors.black, fontWeight: FontWeight.w600),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(40),
                            ),
                          ),
                          focusedPinTheme: PinTheme(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration( color: Color(0xffFE0091),
                            border: Border.all(color: Colors.green),
                            borderRadius: BorderRadius.circular(50),)),
                          // submittedPinTheme: submittedPinTheme,
                          onSubmitted: (String pin) => _showSnackBar(context,pin),
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
                              // if(UserEmailAndphone.emailAndPhoneVerifyController.value.text.contains("@")){
                              //   // UserEmailAndphone.email_verify.value=1;
                              // }
                              // else{
                              //   // UserEmailAndphone.phone_verify.value=1;
                              // }
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
                            }),
                      ),
                        SizedBox(
                        height: Get.height*0.01,
                      ),
                    if(UserEmailAndphone.resendOtp.value==true)  Center(
                        child: UserEmailAndphone.rxRequestStatus.value==Status.LOADING ?
                        CircularProgressIndicator() :TextButton(onPressed: () {
                          UserEmailAndphone.PhoneAndEmailVerifiyed();
                        }, child: Text("resend otp")
                        ),
                      )
                    ],
                  ),
                );
              }
            ));
      },
    );
  }
}
