import 'dart:io';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as imgLib; // Im
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/controller/additionalinfoController/AdditonalInfoController.dart';
import 'package:cupid_match/match_maker/payment_screen.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class GalleryAccess extends StatefulWidget {
  const GalleryAccess({super.key});

  @override
  State<GalleryAccess> createState() => _GalleryAccessState();
}

class _GalleryAccessState extends State<GalleryAccess> {
  final AdditonalInfpMakerControllerinstance =
      Get.put(AdditonalInfpMakerController());
  final ImagePicker imgPicker = ImagePicker();


  File? imgFile;
  File? compressedFile;
  Future<void> openCamera(ImageSource source) async {
    var imgCamera = await imgPicker.pickImage(source: source);

    if (imgCamera != null) {
      setState(() {
        imgFile = File(imgCamera.path);
        Get.back();
      });

      // Run compression in a background isolate
      await compressImageInBackground(imgFile!);
    }
  }
  Future<void> compressImageInBackground(File imageFile) async {
    final compressedFile = await compute(compressImage, imageFile);
    setState(() {
      this.compressedFile = compressedFile;

      ImagetoUpload=compressedFile;
      print("${ImagetoUpload!.path}==========================");
    });
  }
  static File compressImage(File imageFile) {
    var image = imgLib.decodeImage(imageFile.readAsBytesSync())!;
    var compressedImage = imgLib.encodeJpg(image, quality: 50);
    File compressedFile = File(imageFile.path.replaceAll('.jpg', '_compressed.jpg'))
      ..writeAsBytesSync(compressedImage);
    print("Original image size: ${imageFile.lengthSync()} bytes");
    print("Compressed image size: ${compressedFile.lengthSync()} bytes");
    // print("Compressed image path: ${compressedFile.path}");

    return compressedFile;
  }


  File? galleryFile;
  final picker = ImagePicker();
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
    );}

  @override
  void initState() {
    // TODO: implement initState

    setState(() {
      imgFile = null;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff5A5A5A),
              size: 27,
            )),
        title: Text(
          "Photo ID",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.04,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Text(
                  "Photo ID",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.04, vertical: height * 0.01),
                child: Text(
                  "Please point the camera at the Id card",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: Color(0xff777777)),
                ),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: height * .4,
                width: width,
                child:
                imgFile == null
                    ? InkWell(
                      child: Center(
                          child: Container(
                            height: Get.height * 0.4,
                            width: Get.width,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage("assets/images/Upload.png"))),
                          ),
                        ),
                         onTap: () {
                              setState(() {
                                // imgFile=null;
                                showOptionsDialog(context);
                              });
                            }
                    )
                    : Center(child: Image.file(imgFile!)),
              ),
              SizedBox(
                height: height * 0.04,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      if (imgFile == null)
                        MyButton(
                            width: width * 0.4,
                            title: "Select",
                            onTap: () {
                              setState(() {
                                // imgFile=null;
                                showOptionsDialog(context);
                              });
                            }),
                      if (imgFile != null)
                        MyButton(
                            width: width * 0.4,
                            title: "Replace",
                            onTap: () {
                              setState(() {
                                imgFile = null;
                                showOptionsDialog(context);
                              });
                            }),
                    ],
                  ),
                  Column(children: [
                    Obx(
                      () => OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            side:
                                BorderSide(color: Color(0xffFE008F), width: 2),
                            fixedSize: Size(150, 60)),
                        onPressed: () {
                          if(imgFile != null){
                            AdditonalInfpMakerControllerinstance
                                .MakerAditonalApiHit();
                          }
                          else{
                            // Get.snackbar(
                            //   "Alert",
                            //   ,
                            //   backgroundColor: Color(0xffFE008F),
                            // );
                            showOptionsDialogAlert(context,"Please upload Document");
                          }

                          // Get.to(PaymentScreen());
                        },
                        child: AdditonalInfpMakerControllerinstance
                                    .loading.value ==
                                true
                            ? LoadingAnimationWidget.inkDrop(
                                color: Colors.pink,
                                size: 30,
                              )
                            : Text(
                                "Continue",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(color: Color(0xffFE008F)),
                              ),
                      ),
                    )

                    // OutlinedButton(onPressed: (){
                    //   Get.to(PaymentScreen());
                    // },
                    //     style: OutlinedButton.styleFrom(
                    //       fixedSize: Size(140, 60),
                    //       shape: RoundedRectangleBorder(
                    //         side: BorderSide(color: Color(0xff000CAA)),
                    //         borderRadius: BorderRadius.circular(30),
                    //       ),
                    //     ),
                    //     child: Text("Continue",style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Color(0xff000CAA)),))

                    // MyButton(
                    //   width: width * 0.4,
                    //     title: "Continue",
                    //     onTap: (){
                    //     Get.to(PaymentScreen());
                    //     }),
                  ]),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Future _showPicker({
    required BuildContext context,
  }) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Options"),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      getImage(ImageSource.gallery);
                      Get.back();
                      // Navigator.of(context).pop();
                    },
                  ),
                  ListTile(
                    leading: const Icon(Icons.photo_camera),
                    title: const Text('Camera'),
                    onTap: () {
                      getImage(ImageSource.camera);
                      Get.back();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  Future getImage(
    ImageSource img,
  ) async {
    final pickedFile = await picker.pickImage(source: img);
    XFile? xfilePick = pickedFile;
    setState(
      () {
        if (xfilePick != null) {
          galleryFile = File(pickedFile!.path);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(// is this context <<<
              const SnackBar(content: Text('Nothing is selected')));
        }
      },
    );
  }

  Future<void> showOptionsDialogAlert(BuildContext context, String? error) {
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
                  error.toString(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12,color: Colors.black),
                ),
              ],
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
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
              Center(
                child: MyButton(
                  width: Get.width*.27,
                  height: Get.height*.05,
                  title: "Ok", onTap: () {
                  Get.back();
                },),
              )
            ],
          ),
        );
      },
    );}

}
