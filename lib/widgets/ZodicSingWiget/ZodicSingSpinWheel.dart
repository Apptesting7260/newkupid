import 'dart:async';
import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../GlobalVariable/GlobalVariable.dart';
import '../../controllers/SpinWheelController/SpeenWhhelController.dart';
import '../../controllers/controller/SeekerToSeekerRequestController/SeekerToSeekerRequestController.dart';
import '../../controllers/controller/liver_Pooled_Request_Controller/Liver_Pooled_Request_controller.dart';
import '../../controllers/controller/spinRequestController/SpinRequestController.dart';
import '../../data/response/status.dart';
import '../../match_seeker/Requests/outgoingRequest.dart';
import '../../match_seeker/SeeAllMaker/SeAllMaker.dart';
import '../../match_seeker/lever/StaticLiverPool.dart';
import '../../res/components/general_exception.dart';
import '../../res/components/internet_exceptions_widget.dart';
import '../Spin_Will_Wigdet.dart';

enum SwipeDirection { left, right, top }

class UserProfile {
  final String name;
  final int age;
  final String date;

  UserProfile({
    required this.name,
    required this.age,
    required this.date,
  });
}

class SpinWheel extends StatefulWidget {
  const SpinWheel({Key? key}) : super(key: key);

  @override
  State<SpinWheel> createState() => _SpinWheelState();
}
List spinedprofilelist=[];
class _SpinWheelState extends State<SpinWheel>
    with SingleTickerProviderStateMixin {
  late int randomIndex = 0;
  late bool spinning = false;

  late AnimationController rotationController;
  var totalData=0;

  AudioPlayer audioPlayer = AudioPlayer();
  var bytes;
  List<Color> colorstwo = [
    Color(0xff000CAA),
    Color(0xffFE0091),
    Color(0xff000CAA),
    Color(0xffFE0091),
    Color(0xff000CAA),
    Color(0xffFE0091),
    Color(0xff000CAA),
    Color(0xffFE0091),
    Color(0xff000CAA),
    Color(0xffFE0091),
    Color(0xff000CAA),
    Color(0xffFE0091),
  ];
  List<Map<String, String>> listOfZodic = [
    {"image": "assets/DropDownZodicSing/Mask group (10).png", "name": "Pisces"},
    {"image": "assets/DropDownZodicSing/Mask group (9).png", "name": "Aries"},
    {"image": "assets/DropDownZodicSing/Mask group (8).png", "name": "Taurus"},
    {"image": "assets/DropDownZodicSing/Mask group (6).png", "name": "Gemini"},
    {"image": "assets/DropDownZodicSing/Mask group (4).png", "name": "Cancer"},
    {"image": "assets/DropDownZodicSing/Mask group (3).png", "name": "Leo"},
    {"image": "assets/DropDownZodicSing/Mask group.png", "name": "Virgo"},
    {"image": "assets/DropDownZodicSing/Mask group (1).png", "name": "Libra"},
    {"image": "assets/DropDownZodicSing/Mask group (2).png", "name": "Scorpio"},
    {
      "image": "assets/DropDownZodicSing/Mask group (5).png",
      "name": "Sagittarius"
    },
    {
      "image": "assets/DropDownZodicSing/Mask group (7).png",
      "name": "Capricorn"
    },
    {"image": "assets/DropDownZodicSing/Group 293.png", "name": "Aquarius"},
  ];
  List<String> image = [
    "assets/horsecope/image (10).png",
    "assets/horsecope/image (9).png",
    "assets/horsecope/image (8).png",
    "assets/horsecope/image (7).png",
    "assets/horsecope/image (6).png",
    "assets/horsecope/image (5).png",
    "assets/horsecope/image (4).png",
    "assets/horsecope/image (3).png",
    "assets/horsecope/image (2).png",
    "assets/horsecope/Mask group (9) (1).png",
    "assets/horsecope/image (1).png",
    "assets/horsecope/image.png"
  ];
  List<String> listOfHoroScope = [
    "Pisces",
    "Aries",
    "Taurus",
    "Gemini",
    "Cancer",
    "Leo",
    "Virgo",
    "Libra",
    "Scorpio",
    "Sagittarius",
    "Capricorn",
    "Aquarius",
  ];
  final List<UserProfile> userProfiles = [
    UserProfile(name: 'John Doe', age: 25, date: '2022-12-01'),
    UserProfile(name: 'Jane Smith', age: 28, date: '2022-11-25'),
    UserProfile(name: 'Alice Johnson', age: 22, date: '2022-10-30'),
    UserProfile(name: 'Bob Williams', age: 30, date: '2022-09-15'),
    UserProfile(name: 'Eva Davis', age: 26, date: '2022-08-20'),
  ];
  var dataIndex;
  SpeenWheelDataController speenWheelDataController =
      Get.put(SpeenWheelDataController());
  final SpeendReqestControllerinstance = Get.put(SpeendReqestController());
  // final SpinwillTimerControllerinstance = Get.put(SpinwillTimerController());
  final spinRequestController=Get.put(SpinRequestController());
  final SeekerToSeekerRequestControllerinstance =
  Get.put(SeekerToSeekerRequestController());

  @override
  void initState() {
    super.initState();
    audioChangeInByte();
    rotationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 1,
      ),
    );
  }

  bool isButton = false;

  Future<void> audioChangeInByte() async {
    String url = "assets/audio/bike-back-wheel-coasting-74816.mp3";
    ByteData data = await rootBundle.load(url);
    bytes = BytesSource(data.buffer.asUint8List());
    audioPlayer.audioCache;
  }

  playAudio() async {
    var result = await audioPlayer.play(bytes);
    // if (result == 1) {
    //   print('Audio played successfully=======================================================================');
    // } else {
    //   print('Error playing audio===============================================================================');
    // }
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: Get.height  * .05,
              ),
              Image.asset(
                  'assets/images/match.png'),
              SizedBox(
                height: Get.height  * .03,
              ),

              if (isButton)

    Obx(() {
    switch (speenWheelDataController.rxRequestStatus.value) {
    case Status.LOADING:
    return const Center(child: CircularProgressIndicator(  color: Colors.pink,));
    case Status.ERROR:
    if (speenWheelDataController.error.value == 'No internet') {
    return InterNetExceptionWidget(
    onPress: () {},
    );
    } else {
    return GeneralExceptionWidget(onPress: () {});
    }
    case Status.COMPLETED:
             return   Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    SizedBox(
                      height: Get.height * .03,
                    ),
                    Text(
                      '${totalData + 1}/12',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,

                      ),
                    ),

                    SizedBox(
                      height: Get.height * .03,
                    ),
                    Container(
                      height: Get.height * 0.6,
                      width: Get.width * 0.9,
                      child: speenWheelDataController.SpeenWheelData.value.seekerData !=
                              [] || speenWheelDataController.SpeenWheelData.value.seekerData!.length != 0
                          ? CardSwiper(
                              cardsCount: speenWheelDataController
                                  .SpeenWheelData.value.seekerData!.length,
                              numberOfCardsDisplayed: 2,
                              backCardOffset: const Offset(0, -50),
                              padding: const EdgeInsets.all(24.0),
                              allowedSwipeDirection: AllowedSwipeDirection.only(
                                left: true,
                                right: true,
                              ),
                              onSwipe: _onSwipe,
                              cardBuilder: (context,
                                  index,
                                  horizontalThresholdPercentage,
                                  verticalThresholdPercentage) {
                                print(
                                    "horigental${horizontalThresholdPercentage}");
                                print("vertical${verticalThresholdPercentage}");

                                final userProfile = userProfiles[index];
                                var data = listOfZodic[speenWheelDataController
                                    .SpeenWheelData
                                    .value
                                    .seekerData![index]
                                    .zodiacId-1];
                                print(speenWheelDataController
                                    .SpeenWheelData
                                    .value
                                    .seekerData![index]
                                    .zodiacId);
                                return Card(
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Image goes here

                                      horizontalThresholdPercentage == 0
                                          ? Container(
                                              height: Get.height * 0.4,
                                              // Adjust the height as needed
                                              // child: Align(
                                              //   alignment: Alignment.topLeft,
                                              //   child: Padding(
                                              //     padding:
                                              //         const EdgeInsets.only(
                                              //             top: 20, left: 20),
                                              //     child: Container(
                                              //       width: 61,
                                              //       height: 34,
                                              //       child: Row(children: [
                                              //         SizedBox(
                                              //           width: Get.width * .03,
                                              //         ),
                                              //         Image.asset(
                                              //           "assets/icons/LOCATION.png",
                                              //           height: 15,
                                              //         ),
                                              //         SizedBox(
                                              //           width: Get.width * .01,
                                              //         ),
                                              //         Text(
                                              //           '1 km',
                                              //           style: TextStyle(
                                              //             color: Colors.white,
                                              //             fontSize: 12,
                                              //             fontFamily: 'Inter',
                                              //             fontWeight:
                                              //                 FontWeight.w500,
                                              //             height: 0.12,
                                              //           ),
                                              //         )
                                              //       ]),
                                              //       decoration: ShapeDecoration(
                                              //         color: Color(0x33F4F4F4),
                                              //         shape:
                                              //             RoundedRectangleBorder(
                                              //                 borderRadius:
                                              //                     BorderRadius
                                              //                         .circular(
                                              //                             7)),
                                              //       ),
                                              //     ),
                                              //   ),
                                              // ),

                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      speenWheelDataController
                                                          .SpeenWheelData
                                                          .value
                                                          .seekerData![index]
                                                          .imgPath),
                                                  // Replace with your image path
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          : Container(
                                              height: Get.height * 0.4,
                                              child:    horizontalThresholdPercentage >
                                                  0
                                                  ? Center(
                                                child: Align(
                                                  child: Image.asset(
                                                      "assets/image/like.png"),
                                                  alignment:
                                                  FractionalOffset
                                                      .center,
                                                ),
                                              )
                                                  : Center(
                                                child: Align(
                                                  child: Image.asset(
                                                      "assets/image/cancel.png"),
                                                  alignment:
                                                  FractionalOffset
                                                      .center,
                                                ),
                                              ),

                                              // Row(
                                              //   crossAxisAlignment: CrossAxisAlignment.center,
                                              //
                                              //   children: [
                                              //     Align(
                                              //       alignment:
                                              //           Alignment.topLeft,
                                              //       child: Padding(
                                              //         padding:
                                              //             const EdgeInsets.only(
                                              //                 top: 20,
                                              //                 left: 20),
                                              //         child: Container(
                                              //           width: 61,
                                              //           height: 34,
                                              //           child: Row(children: [
                                              //             SizedBox(
                                              //               width:
                                              //                   Get.width * .03,
                                              //             ),
                                              //             Image.asset(
                                              //               "assets/icons/LOCATION.png",
                                              //               height: 15,
                                              //             ),
                                              //             SizedBox(
                                              //               width:
                                              //                   Get.width * .01,
                                              //             ),
                                              //             Text(
                                              //               '1 km',
                                              //               style: TextStyle(
                                              //                 color:
                                              //                     Colors.white,
                                              //                 fontSize: 12,
                                              //                 fontFamily:
                                              //                     'Inter',
                                              //                 fontWeight:
                                              //                     FontWeight
                                              //                         .w500,
                                              //                 height: 0.12,
                                              //               ),
                                              //             )
                                              //           ]),
                                              //           decoration:
                                              //               ShapeDecoration(
                                              //             color:
                                              //                 Color(0x33F4F4F4),
                                              //             shape: RoundedRectangleBorder(
                                              //                 borderRadius:
                                              //                     BorderRadius
                                              //                         .circular(
                                              //                             7)),
                                              //           ),
                                              //         ),
                                              //       ),
                                              //     ),
                                              //     horizontalThresholdPercentage >
                                              //             0
                                              //         ? Center(
                                              //           child: Align(
                                              //               child: Image.asset(
                                              //                   "assets/image/like.png"),
                                              //               alignment:
                                              //                   FractionalOffset
                                              //                       .center,
                                              //             ),
                                              //         )
                                              //         : Center(
                                              //           child: Align(
                                              //               child: Image.asset(
                                              //                   "assets/image/cancel.png"),
                                              //               alignment:
                                              //                   FractionalOffset
                                              //                       .center,
                                              //             ),
                                              //         ),
                                              //   ],
                                              // ),

                                              // Adjust the height as needed
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15.0),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      speenWheelDataController
                                                          .SpeenWheelData
                                                          .value
                                                          .seekerData![index]
                                                          .imgPath),
                                                  // Replace with your image path
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                      SizedBox(height: 10),
                                      Padding(
                                        padding: EdgeInsets.only(left: 20,bottom: 10),
                                        child: Container(

                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(children: [
                                                Image.asset(data['image']!,height: 20,),
                                                SizedBox(
                                                  width: Get.width * 0.003,
                                                ),
                                                Text(data['name']!,  style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w500,

                                                ),)
                                              ]),

                                              Text(
                                                ' ${speenWheelDataController.SpeenWheelData.value.seekerData![index].name}',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),

                                              Text(
                                                ' ${speenWheelDataController.SpeenWheelData.value.seekerData![index].address}',

                                                style: TextStyle(
                                                  color: Color(0xFF777777),
                                                  fontSize: 14,
                                                  fontFamily: 'Inter',
                                                  fontWeight: FontWeight.w400,

                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                );
                              },
                            )
                          : Text(
                              "No Data ",
                              style: TextStyle(color: Colors.black),
                            ),
                    ),
                    // Row(
                    //   children: [
                    //     Expanded(child: Image.asset("assets/image/cancel.png")),
                    //     Expanded(child: Image.asset("assets/image/like.png"))
                    //   ],
                    // ),
                  ],
                );}}),
              SizedBox(
                height: Get.height  * .03,
              ),
              Text(
                'spin and select your match',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
              SizedBox(
                height: Get.height  * .03,
              ),
              Center(
                child: SpinWheelWidget(),
              ),
              SizedBox(height: Get.height*0.05,),
              Center(
                child:MyButton(title: 'Spin Now', onTap: () {
                  if (!spinning) {
                    startRotation();
                  }
                },),
              ),
              SizedBox(
                height: Get.height  * .05,
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    if (currentIndex != null) {
      SwipeDirection swipeDirection = SwipeDirection.left; // Default value

      if (direction.name == "left") {
        print("swiped left");
     // speenWheelDataController
     //        .SpeenWheelData
     //        .value
     //        .seekerData!.remove(previousIndex);
        totalData--;

        print("TotalData  === $totalData");
        if( totalData==-1){
          setState(() {
            isButton=false;
          });
        }
        setState(() {

        });

        swipeDirection = SwipeDirection.left;
      } else if (direction.name == "right") {
        print("swiped right");
        // speenWheelDataController
        //     .SpeenWheelData
        //     .value
        //     .seekerData!.remove(previousIndex);
        selectedseekerid =speenWheelDataController.SpeenWheelData.value.seekerData![previousIndex]!.id;
        if (selectedseekerid != null) {
          showdilog(previousIndex, selectedseekerid!);
        }

        totalData--;
        if( totalData==-1){
          setState(() {
            isButton=false;
          });
        }
        print("TotalData  === $totalData");
        setState(() {

        });
        swipeDirection = SwipeDirection.right;
      } else if (direction.name == "top") {
        print("swiped top");
        swipeDirection = SwipeDirection.top;
      }




      debugPrint(
        'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
      );
    }
    return true;
  }


  Widget SpinWheelWidget() {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: 160,
          backgroundImage: AssetImage("assets/image/Group 288.png"),
          child: Transform.rotate(
            angle: 94,
            child: CircleAvatar(
              radius: 65,
              child: FortuneWheel(
                indicators: <FortuneIndicator>[
                  FortuneIndicator(
                    alignment: Alignment.center,
                    child: Stack(
                      children: [
                        // Add any additional indicators if needed
                      ],
                    ),
                  ),
                ],
                physics: NoPanPhysics(),
                animateFirst: false,
                items: [
                  for (int i = 0; i < 12; i++) ...<FortuneItem>[
                    FortuneItem(
                      style: FortuneItemStyle(
                        borderColor: Colors.white,
                        color: colorstwo[i], // Replace with your color
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.10,
                          ),
                          Transform.rotate(
                            angle: 90 * 3.1415926535897932 / 180,
                            child: InkWell(
                              child: Transform.rotate(
                                angle: 90 * 3.1415926535897932 / 180,
                                child: Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.2,
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                  child: Image.asset(
                                      image[i]), // Replace with your image
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
        spinning
            ? Transform.rotate(
                angle: -2 * pi * (randomIndex / 12),
                child: RotationTransition(
                  turns: rotationController,
                  alignment: Alignment.center,
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Transform.rotate(
                        angle: 90 * 3.1415926535897932 / 250,
                        child: Image.asset(
                            "assets/image/Group 121.png")), // Replace with your arrow image
                  ),
                ),
              )
            : Transform.rotate(
                angle: -2 * pi * (randomIndex / 12),
                alignment: Alignment.center,
                child: InkWell(
                  onTap: () {
                    if (!spinning) {
                      startRotation();
                    }
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Transform.rotate(
                        angle: 90 * 3.1415926535897932 / 250,
                        child: Image.asset(
                            "assets/image/Group 121.png")), // Replace with your arrow image
                  ),
                ),
              ),
      ],
    );
  }

  void startRotation() {
    playAudio();
    setState(() {
      isButton = false;
      spinning = true;
      randomIndex = Random().nextInt(12);
      rotationController.repeat(); // Start rotating the arrow
    });
    var id=randomIndex+1;
    zodiac_id = id.toString();
    speenWheelDataController.SpeenWheelApi();
    Future.delayed(Duration(seconds: randomIndex == 0 ? 12 : randomIndex), () {
      audioPlayer.stop();
      setState(() {
        spinning = false;
        totalData= speenWheelDataController
            .SpeenWheelData
            .value
            .seekerData!.length;
        print(totalData);
        rotationController.reset(); // Stop rotating the arrow
        print('Stopped at index: $randomIndex');
        print(
            "=======================================${listOfHoroScope[randomIndex]}====================================");
        // horoscopeName=;
      });

      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          isButton = true;
        });
      });
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    rotationController.dispose();
    super.dispose();
  }



  showdilog(int index, int id) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          insetPadding: EdgeInsets.all(0),
          title: Column(
            children: [
              Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset("assets/icons/cancel.png"),
                  )),
              Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      height: Get.height * 0.14,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Colors.green,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              speenWheelDataController.SpeenWheelData.value.seekerData![index].imgPath),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 80,
                      left: 55,
                      right: 0,
                      child: Image.asset("assets/icons/locked 1.png"))
                ],
              ),
              Text(
                speenWheelDataController.SpeenWheelData.value.seekerData![index].questions!.question
                    .toString(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(
                height: height * .01,
              ),
              Obx(
                    () => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Select an Answer",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.black
                            )),
                      ],
                    ),
                    RadioListTile<String>(
                      title: Text(                         speenWheelDataController.SpeenWheelData.value.seekerData![index].questions!.firstAnswer

                          .toString()),
                      value: speenWheelDataController.SpeenWheelData.value.seekerData![index].questions!.firstAnswer
                          .toString(),
                      groupValue: SpeendReqestControllerinstance
                          .selectedAnswer.value
                          .toString(),
                      onChanged: (value) {
                        SpeendReqestControllerinstance.selectedAnswer.value =
                        value!;

                        SpeendReqestControllerinstance.selectedAnswer.value
                            .toString();
                        print(SpeendReqestControllerinstance
                            .selectedAnswer.value
                            .toString());
                      },
                    ),
                    RadioListTile<String>(
                      title: Text( speenWheelDataController.SpeenWheelData.value.seekerData![index].questions!
                          .secondAnswer
                          .toString()),
                      value:  speenWheelDataController.SpeenWheelData.value.seekerData![index].questions!.secondAnswer
                          .toString(),
                      groupValue: SpeendReqestControllerinstance
                          .selectedAnswer.value
                          .toString(),
                      onChanged: (value) {
                        SpeendReqestControllerinstance.selectedAnswer.value =
                        value!;

                        SpeendReqestControllerinstance.selectedAnswer.value
                            .toString();
                        print(SpeendReqestControllerinstance
                            .selectedAnswer.value
                            .toString());
                      },
                    ),
                    RadioListTile<String>(
                      title: Text( speenWheelDataController.SpeenWheelData.value.seekerData![index].questions!
                          .thirdAnswer
                          .toString()),
                      value: speenWheelDataController.SpeenWheelData.value.seekerData![index].questions!.thirdAnswer
                          .toString(),
                      groupValue: SpeendReqestControllerinstance
                          .selectedAnswer.value
                          .toString(),
                      onChanged: (value) {
                        SpeendReqestControllerinstance.selectedAnswer.value =
                        value!;

                        SpeendReqestControllerinstance.selectedAnswer.value
                            .toString();
                        print(SpeendReqestControllerinstance
                            .selectedAnswer.value
                            .toString());
                      },
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {

                    isboxloading=true;
                  });
                  print("index============================$index");
                  // spinedprofilelist[index]['is_requested'] = "true";
                  // spinRequestController.apihit();

                  if(isboxloading==true){

                    _showProgressDialog(context);
                  }

                  Timer(Duration(seconds: 2), () {
                    setState(() {
                      isboxloading=false;
                      Get.back();
                      Get.back();
                      // if (speenWheelDataController.SpeenWheelData.value.seekerData![index].questions!
                      //     .correctAnswer.toString() ==
                      //     SpeendReqestControllerinstance.selectedAnswer.value
                      //         .toString()) {
                      //   print("index============================$index");
                      //   match_withid =  speenWheelDataController.SpeenWheelData.value.seekerData![index].questions!.id
                      //       .toString();
                      //   print("match_withid===========================$match_withid");
                      //   SeekerToSeekerRequestControllerinstance
                      //       .SikerTOSikerRequestApiHit(); // T
                      //   showdiog2(index);
                      // }
                      // if (speenWheelDataController.SpeenWheelData.value.seekerData![index].questions!
                      //     .correctAnswer.toString() !=
                      //     SpeendReqestControllerinstance.selectedAnswer.value
                      //         .toString()) {
                      //   print("match_withid===========================$match_withid");
                      //   showdiologwronganswer(index);
                      // }
                      // showdiologwronganswer(index);
                    });
                  });
                  // Get.back();
                  // if ( SpeendReqestControllerinstance
                  //                                       .staticLiverPullvalue
                  //                                       .value
                  //                                       .data![0].spinLeverpoolRequestedData!.spinRequestData![index].seekerData!.questions!.correctAnswer ==
                  //     SpeendReqestControllerinstance.selectedAnswer.value
                  //         .toString()) {
                  //   showdiog2(index);
                  // }
                  // if (SpeendReqestControllerinstance.staticLiverPullvalue.value
                  //         .data![index].spinLeverpoolRequestedData!.spinRequestData![index].seekerData!.questions!.correctAnswer !=
                  //     SpeendReqestControllerinstance.selectedAnswer.value
                  //         .toString()) {
                    showdiologwronganswer(index);
                  // }
                },
                child: Container(
                  height: height * .04,
                  width: width * .3,
                  decoration: BoxDecoration(
                    color: Color(0xffFE0091),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Submit",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
            ],
          ),
        );
      },
    );
  }

  showdiog2(int index) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          insetPadding: EdgeInsets.all(0),
          title: Column(
            children: [
              // Align(
              //     alignment: Alignment.bottomRight,
              //     child: GestureDetector(
              //       onTap: () {
              //         Get.back();
              //       },
              //       child: Image.asset("assets/icons/cancel.png"),
              //     )),
              Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      height: height * .3,
                      width: width * .3,
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                            speenWheelDataController.SpeenWheelData.value.seekerData![index].imgPath
                                .toString()),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 80,
                      left: 55,
                      right: 0,
                      child: Image.asset("assets/icons/unlocked 1.png"))
                ],
              ),
              Text(
                "Profile Unlocked",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(
                height: height * .01,
              ),
              Text(
                "Your answer is correct.",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey),
              ),
              SizedBox(
                height: height * .02,
              ),
              GestureDetector(
                onTap: () {
                  Get.off(OutGoingRequest());
                  // match_withid =  SpeendReqestControllerinstance
                  //                                       .staticLiverPullvalue
                  //                                       .value
                  //                                       .data![0].spinLeverpoolRequestedData!.spinRequestData![index].seekerData!.id
                  //     .toString();
                  // print(match_withid);
                  // SeekerToSeekerRequestControllerinstance
                  //     .SikerTOSikerRequestApiHit(); // Timer(Duration(microseconds: 2), () { Get.to(ChatPage()); });
                },
                child: Container(
                  height: height * .04,
                  width: width * .3,
                  decoration: BoxDecoration(
                    color: Color(0xffFE0091),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "View",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
            ],
          ),
        );
      },
    );
  }

  showdiologwronganswer(int index) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          insetPadding: EdgeInsets.all(0),
          title: Column(
            children: [
              Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset("assets/icons/cancel.png"),
                  )),
              Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      height: height * .3,
                      width: width * .3,
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                            speenWheelDataController.SpeenWheelData.value.seekerData![index].imgPath
                                .toString()),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 80,
                      left: 50,
                      right: 0,
                      child: Image.asset("assets/icons/locked 1.png"))
                ],
              ),
              Text(
                "Profile locked",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(
                height: height * .01,
              ),
              Text(
                "Better Luck Next Time!",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey),
              ),
              SizedBox(
                height: height * .02,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: height * .04,
                  width: width * .3,
                  decoration: BoxDecoration(
                    color: Color(0xffFE0091),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Back",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              InkWell(
                child: Container(
                  height: height * .04,
                  width: width * .4,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Color(0xffFE0091))),
                  child: Center(
                    child: Text("Request To Maker",
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Color(0xffFE0091),
                        )),
                  ),
                ),
                onTap: () {


                  userIdsiker =  speenWheelDataController.SpeenWheelData.value.seekerData![index].questions!.id
                      .toString();

                  setState(() {
                    userIdsiker;
                  });
                  Timer(Duration(microseconds: 2), () {
                    Get.off(SeeAllMaker());
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showProgressDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16.0),
              Text("Loading..."),
            ],
          ),
        );
      },
    );}
}
