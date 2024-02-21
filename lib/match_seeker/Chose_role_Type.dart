import 'dart:async';
import 'dart:ui';

import 'package:app_tutorial/app_tutorial.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/SeekerMyProfileDetailsController/SeekerMyProfileController.dart';
import 'package:cupid_match/controllers/SeekerToMakerController/SeekerToMakerController.dart';
import 'package:cupid_match/controllers/controller/GetAllMakerContrioller/GetAllMakerController.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/match_maker/match_maker_profile_update.dart';
import 'package:cupid_match/match_seeker/SeeAllMaker/SeAllMaker.dart';
import 'package:cupid_match/match_seeker/home_screen.dart';

import 'package:cupid_match/match_seeker/lever/new_liver.dart';
import 'package:cupid_match/match_seeker/Chat_list_Screen.dart';
import 'package:cupid_match/match_seeker/profile/filter.dart';
import 'package:cupid_match/match_seeker/profile/profile_details.dart';
import 'package:cupid_match/match_seeker/Siker_TabView.dart';
import 'package:cupid_match/match_seeker/viewMakerProfileinseeker/ViewMakerProfile.dart';
import 'package:cupid_match/res/components/general_exception.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

import '../widgets/ZodicSingWiget/ZodicSingSpinWheel.dart';
import '../widgets/userGuide.dart';
  int? selectedrole;

class Chose_Role_Type extends StatefulWidget {
  const Chose_Role_Type({Key? key}) : super(key: key);

  @override
  State<Chose_Role_Type> createState() => _Chose_Role_TypeState();
}

class _Chose_Role_TypeState extends State<Chose_Role_Type> {

  late TutorialCoachMark tutorialCoachMark;
  final incrementKey = GlobalKey();
  final avatarKey = GlobalKey();
  final textKey = GlobalKey();
  List<TutorialItem> items = [];


  final seekerMyProfileDetailsController =
      Get.put(SeekerMyProfileDetailsController());
        final ListAllMakerControllerinstance = Get.put(ListAllMakerController());
SeekerToMakerRequestController SeekerToMakerRequestControllerinstance=Get.put(SeekerToMakerRequestController());

  bool isloadding = false;
  ChoseRole() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('roll', rolevalue!);
    selectedrole = prefs.getInt("roll");
    print(prefs.getInt("roll"));
  }

  @override
  void initState() {
    ListAllMakerControllerinstance.ListAllMakerApi();
    // TODO: implement initState
    initItems();
    Future.delayed(const Duration(microseconds: 200)).then((value) {
      Tutorial.showTutorial(context, items, onTutorialComplete: () {
        // Code to be executed after the tutorial ends
        print('Tutorial is complete!');
      });
    });
    super.initState();


  }

  int _value = 1;
  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Choose one",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body:  Obx(() {
        switch (ListAllMakerControllerinstance.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator(  color: Colors.pink,));
          case Status.ERROR:
            if (ListAllMakerControllerinstance.error.value == 'No internet') {
              return InterNetExceptionWidget(
                onPress: () {},
              );
            } else {
              return GeneralExceptionWidget(onPress: () {});
            }
          case Status.COMPLETED:

            return Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: height * .02,
              ),
              Container(
                key: incrementKey,
                height: height * .075,
                width: width * 1,
                decoration: BoxDecoration(
                    border: _value != 1
                        ? Border.all(color: Colors.grey)
                        : Border.all(color: Color(0xffFE0091)),
                    borderRadius: BorderRadius.circular(35)),
                child: RadioListTile(
                    title: Text(
                      "Wheel Of Match",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black),
                    ),
                    value: 1,
                    groupValue: _value,
                    onChanged: (val) {
                      setState(() {
                        _value = val!;
                        rolevalue = 1;
                      });
                    },
                    activeColor: Color(0xffFE0091)),
              ),
              SizedBox(
                height: height * .02,
              ),
              Container(
                key: avatarKey,
                height: height * .075,
                width: width * 1,
                decoration: BoxDecoration(
                    border: _value != 2
                        ? Border.all(color: Colors.grey)
                        : Border.all(color: Color(0xffFE0091)),
                    borderRadius: BorderRadius.circular(35)),
                child: RadioListTile(
                    title: GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Match Slot",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    value: 2,
                    groupValue: _value,
                    onChanged: (val) {
                      setState(() {
                        _value = val!;
                        rolevalue = 2;
                      });
                    },
                    activeColor: Color(0xffFE0091)),
              ),
              SizedBox(
                height: height * .02,
              ),
              Center(
                child: MyButton(


                  title: "Next",
                  onTap: () {

                    setState(() {
                      isloadding = true;

                    });

                    ChoseRole();


                        if( rolevalue == 1){
                        Get.to(SpinWheel());}
                        else{
                          Get.to(DomatchscreenSiker(title:"Match Slot"));
                        }



                    //    ;
                  },
                ),
              ),
          SizedBox(height: Get.height*0.05,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Container(width: Get.width*0.4,height: 1,color: Colors.black,), Text("OR",style: TextStyle(color: Colors.black),),Container(width: Get.width*0.4,height: 1,color: Colors.black,)],),
              SizedBox(height: Get.height*0.05,),
            Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Request to Random Profile",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          InkWell(
                            child: Text(
                              "See all",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(color: Color(0xff000CAA)),
                            ),
                            onTap: () {
                              setState(() {
                                selectedseekerid=null;
                              });
                              Get.to(SeeAllMaker());
                            },
                          ),
                        ],
                      ),
                    ),
              ListAllMakerControllerinstance.userList
                 .value.allmakers!.length!=0?
                    Container(

                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: ListAllMakerControllerinstance.userList
                            .value.allmakers!.length >=4?4:ListAllMakerControllerinstance.userList
                            .value.allmakers!.length,
                        // itemExtent: 80,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  child: CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: NetworkImage(
                                        ListAllMakerControllerinstance.userList
                                            .value.allmakers![index].imgPath
                                            .toString()),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  onTap: () {
                                    Makerid = ListAllMakerControllerinstance
                                        .userList.value.allmakers![index].id
                                        .toString();
                                        print(Makerid);
                                    Get.to(ViewMakerProfileInSeeker());
                                  },
                                ),
                                SizedBox(
                                  width: width * .03,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: Get.width*0.2,
                                      child: Text(
                                        ListAllMakerControllerinstance
                                            .userList.value.allmakers![index].name
                                            .toString(),
                                        style:
                                            Theme.of(context).textTheme.titleSmall,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * .01,
                                    ),
                                    Text(
                                      "Match Maker",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(width: width * .1),
                            if(ListAllMakerControllerinstance
                                        .userList.value.allmakers![index].isRequested.toString()=="false")    GestureDetector(
                                  onTap: () {
                                    // showdilog();

                                    // String selectedseekerid= MagicProfileControllerinstance.MagicProfileList.value.requests![index].id.toString();
                                    // print(selectedseekerid);
                                   setState(() {
                                     selectedseekerid=null;
                                   });
                                    Makerid=ListAllMakerControllerinstance
                                            .userList.value.allmakers![index].id.toString();

                                            SeekerToMakerRequestControllerinstance.SeekerToMakerRequestApiHit(context);


                                  },
                                  child: Container(
                                    height: height * .04,
                                    width: width * .4,
                                    decoration: BoxDecoration(
                                      color: Color(0xffFE0091),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Request to Maker",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                 if(ListAllMakerControllerinstance
                                        .userList.value.allmakers![index].isRequested.toString()=="true")    Container(
                                          height: height * .04,
                                          width: width * .4,
                                          decoration: BoxDecoration(
                                            color: Color(0xffFE0091),
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Text(
                                                "Requested",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        )
                              ],
                            ),
                          );
                        },
                      ),
                    ):
                Column(
                mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height *0.2,
                    ),


                   Text("Data is Empty",style: TextStyle(color: Colors.black))
                  ],
                )

            ],
          ),
        ),
      );
  }}) );
  }
  void initItems() {
    items.addAll({
      TutorialItem(
        globalKey: incrementKey,
        color: Colors.black.withOpacity(0.6),
        borderRadius: const Radius.circular(15.0),
        shapeFocus: ShapeFocus.roundedSquare,
        child: const TutorialItemContent(
          title: 'Increment button',
          content: 'This is the increment button',
        ),
      ),
      TutorialItem(
        globalKey: textKey,
        shapeFocus: ShapeFocus.square,
        borderRadius: const Radius.circular(15.0),
        child: const TutorialItemContent(
          title: 'Counter text',
          content: 'This is the text that displays the status of the counter',
        ),
      ),
      TutorialItem(
        globalKey: avatarKey,
        color: Colors.black.withOpacity(0.6),
        shapeFocus: ShapeFocus.oval,
        child: const TutorialItemContent(
          title: 'Avatar',
          content: 'This is the avatar that displays something',
        ),
      ),
    });
  }

  // choseroleset()async{
  //   final sp=SharedPreferences.getInstance();

  //   await sp.s

  // }
  // void createTutorial() {
  //   tutorialCoachMark = TutorialCoachMark(
  //
  //     targets: createTargets(),
  //     colorShadow: Colors.blue, // Customize the shadow color
  //     textSkip: "SKIP",
  //     textStyleSkip: TextStyle(color: Colors.black),
  //     // paddingFocus: 10,
  //     // opacityShadow: 0.8,
  //
  //     paddingFocus: 10,
  //     opacityShadow: 0.5,
  //     imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
  //     onFinish: () {
  //       print("finish");
  //     },
  //     onClickTarget: (target) {
  //       print('onClickTarget: $target');
  //     },
  //     onClickTargetWithTapPosition: (target, tapDetails) {
  //       print("target: $target");
  //       print(
  //           "clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
  //     },
  //     onClickOverlay: (target) {
  //       print('onClickOverlay: $target');
  //     },
  //     onSkip: () {
  //       print("skip");
  //       return true;
  //     },
  //
  //   );
  // }
  //
  //
  // List<TargetFocus> createTargets () {
  //   List<TargetFocus> targets = [];
  //   // Define your targets as before
  //   targets.add(
  //
  //     TargetFocus(
  //       identify: "Target 1",
  //       keyTarget: keyButton,
  //       // Replace with the key of the first widget you want to highlight
  //
  //       shape: ShapeLightFocus.RRect,
  //       radius: 20,
  //       // shape: BeveledRectangleBorder,
  //       focusAnimationDuration: Duration(seconds: 3),
  //       // targetPosition: getTargetCurrent(),
  //       contents: [
  //
  //         TargetContent(
  //           align: ContentAlign.bottom,
  //           builder: (context, controller) {
  //             return Center(
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: <Widget>[
  //                   Text(
  //                     "Select 1 ",
  //                     style: TextStyle(
  //                       color: Colors.white,
  //                       fontSize: 18,
  //                       fontWeight: FontWeight.w500,
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: 15,
  //                   ),
  //                   InkWell(
  //                     child: Row(
  //                       mainAxisSize: MainAxisSize.min,
  //                       children: [
  //                         Container(
  //                           width: 60,
  //                           height: 35,
  //                           decoration: BoxDecoration(
  //                             color: Colors.white.withOpacity(0.67),
  //                             borderRadius: BorderRadius.circular(5),
  //                           ),
  //                           child: Center(
  //                             child: Text(
  //                               "NEXT",
  //                               style: TextStyle(
  //                                   color: Colors.black,
  //                                   fontSize: 15,
  //                                   fontWeight: FontWeight.w700),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     onTap: () {
  //                       tutorialCoachMark!.next();
  //                     },
  //                   ),
  //                 ],
  //               ),
  //             );
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  //
  //   targets.add(
  //     TargetFocus(
  //       identify: "dropDown",
  //       keyTarget: keyButton2,
  //       shape: ShapeLightFocus.RRect,
  //       alignSkip: Alignment.center,
  //       radius: 40,
  //       contents: [
  //         TargetContent(
  //           align: ContentAlign.bottom,
  //           builder: (context, controller) {
  //             return Center(
  //               child: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: <Widget>[
  //                   Text(
  //                     "Select ",
  //                     style: TextStyle(
  //                       color: Colors.white,
  //                       fontSize: 18,
  //                       fontWeight: FontWeight.w500,
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: 15,
  //                   ),
  //                   InkWell(
  //                     child: Row(
  //                       mainAxisSize: MainAxisSize.min,
  //                       children: [
  //                         Container(
  //                           width: 60,
  //                           height: 35,
  //                           decoration: BoxDecoration(
  //                             color: Colors.white.withOpacity(0.67),
  //                             borderRadius: BorderRadius.circular(5),
  //                           ),
  //                           child: Center(
  //                             child: Text(
  //                               "NEXT",
  //                               style: TextStyle(
  //                                   color: Colors.black,
  //                                   fontSize: 15,
  //                                   fontWeight: FontWeight.w700),
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                     onTap: () {
  //                       tutorialCoachMark.next();
  //                     },
  //                   ),
  //                 ],
  //               ),
  //             );
  //           },
  //         ),
  //       ],
  //     ),
  //   );
  //
  //   // Initialize TutorialCoachMark as before
  //
  //
  //   // Show the first coach marker
  //   return targets;
  // }
  //  showTutorial() {
  //   tutorialCoachMark.show(context: context);
  // }
  // void showNextTutorial() {
  //   // Call the next method to show the next tutorial
  //   tutorialCoachMark.next();
  // }









}




































// void createTutorial() {
//   tutorialCoachMark = TutorialCoachMark(
//     targets: [
//       TargetFocus(
//         identify: "dropDown",
//         keyTarget: keyButton,
//         shape: ShapeLightFocus.RRect,
//         radius: 20,
//         contents: [
//           TargetContent(
//             align: ContentAlign.bottom,
//             builder: (context, controller) {
//               return Center(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       "Select ",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     InkWell(
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Container(
//                             width: 60,
//                             height: 35,
//                             decoration: BoxDecoration(
//                               color: Colors.white.withOpacity(0.67),
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 "NEXT",
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       onTap: () {
//                         tutorialCoachMark!.next();
//                       },
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       TargetFocus(
//         identify: "AbsentCountBox",
//         keyTarget: keyButton1,
//         shape: ShapeLightFocus.RRect,
//         radius: 20,
//         contents: [
//           TargetContent(
//             align: ContentAlign.bottom,
//             builder: (context, controller) {
//               return Center(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       "ConstController().absentcountBox.value",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 19,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     InkWell(
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Container(
//                             width: 60,
//                             height: 35,
//                             decoration: BoxDecoration(
//                               color: Colors.white.withOpacity(0.67),
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 "NEXT",
//                                 style: TextStyle(
//                                     color:Colors.black,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       onTap: () {
//                         tutorialCoachMark!.next();
//                       },
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//       TargetFocus(
//         identify: "floatBtn",
//         keyTarget: keyButton3,
//         shape: ShapeLightFocus.RRect,
//         radius: 20,
//         contents: [
//           TargetContent(
//             align: ContentAlign.top,
//             builder: (context, controller) {
//               return Center(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Text(
//                       " ConstController().flotBtn.value",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 19,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     InkWell(
//                       child: Row(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Container(
//                             width: 60,
//                             height: 35,
//                             decoration: BoxDecoration(
//                               color: Colors.white.withOpacity(0.67),
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             child: Center(
//                               child: Text(
//                                 "NEXT",
//                                 style: TextStyle(
//                                     color: Colors.black,
//                                     fontSize: 15,
//                                     fontWeight: FontWeight.w700),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       onTap: () {
//                         tutorialCoachMark!.next();
//                       },
//                     ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     ],
//     colorShadow: Colors.orange,
//     skipWidget: Padding(
//       padding: EdgeInsets.fromLTRB(0,0,0,80),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Color(0xffff6666).withOpacity(0.67),
//           borderRadius: BorderRadius.circular(15),
//         ),
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Text('SKIP',
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
//           ),
//         ),
//       ),
//     ),
//   );
// }