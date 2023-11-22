import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;

import '../GlobalVariable/GlobalVariable.dart';
import '../controllers/SeekerMyProfileDetailsController/SeekerMyProfileController.dart';
import '../controllers/controller/RecentSeekerMatchesController/recent_seeker_matches_controller.dart';
import '../data/response/status.dart';
import '../match_seeker/RecentMatch/SingleRecentMatch.dart';
import '../res/components/general_exception.dart';
import '../res/components/internet_exceptions_widget.dart';

class RecentMatches extends StatefulWidget {
  const RecentMatches({Key? key}) : super(key: key);

  @override
  State<RecentMatches> createState() => _RecentMatchesState();
}

class _RecentMatchesState extends State<RecentMatches> {
  RecentSeekerMatchesController rsmController =
      Get.put(RecentSeekerMatchesController());
  final SeekerMyProfileDetailsController seekerMyProfileController =
  Get.put(SeekerMyProfileDetailsController());


  String? Getcurrentuser;
@override
  void initState() {
    // TODO: implement initState
  getcurrentuser();
    super.initState();
  }
  getcurrentuser()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    Getcurrentuser=sp.getString("Tokernid");
    setState(() {
      Getcurrentuser;
    });
    print("$Getcurrentuser======currentuser");
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Recent Matches",
            style: Theme.of(context).textTheme.titleSmall,
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.04),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Obx(() {
                  final questionsStatus = rsmController.rxRequestStatus.value;
                  if (questionsStatus == Status.ERROR) {
                    if (rsmController.rxRequestStatus.value == 'No internet') {
                      return InterNetExceptionWidget(
                        onPress: () {
                          rsmController.refreshApi();
                        },
                      );
                    } else {
                      return GeneralExceptionWidget(onPress: () {
                        rsmController.refreshApi();
                      });
                    }
                  } else if (rsmController == Status.LOADING ||
                      questionsStatus == Status.LOADING) {
                    return Center(
                        child: CircularProgressIndicator(
                          color: Colors.pink,
                        ));
                  } else {
                    if (rsmController.RecentSeekerMatchValue.value.status !=
                        "Data Not Found") {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            childAspectRatio: .50),
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: rsmController
                            .RecentSeekerMatchValue.value.data!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            child: Container(
                              width: width * .45,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          height: height * 0.32,
                                          width: width * 0.43,
                                          decoration: BoxDecoration(
                                              color: AppColors.ratingcodeColor,
                                              borderRadius:
                                              BorderRadius.circular(18)),
                                        ),
                                        Transform.rotate(
                                          angle: (math.pi / 390) * 11,
                                          origin: Offset(-190.0, 760.0),
                                          child: Container(
                                            height: height * .2,
                                            width: width * .2,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(22),
                                              image: DecorationImage(
                                                  image: rsmController
                                                      .RecentSeekerMatchValue
                                                      .value
                                                      .data![index]
                                                      .getanotherseeker!.id !=
                                                      int.parse(Getcurrentuser
                                                          .toString())
                                                      ? CachedNetworkImageProvider(
                                                      rsmController
                                                          .RecentSeekerMatchValue
                                                          .value
                                                          .data![index]
                                                          .getseeker!
                                                          .imgPath
                                                          .toString())
                                                      : CachedNetworkImageProvider(
                                                      rsmController
                                                          .RecentSeekerMatchValue
                                                          .value
                                                          .data![index]
                                                          .getanotherseeker!
                                                          .imgPath
                                                          .toString()),
                                                  fit: BoxFit.cover),
                                            ),
                                          ),
                                        ),
                                        Transform.rotate(
                                          angle: (math.pi / 850) * -40,
                                          origin: Offset(520.0, -80.0),
                                          child: Container(
                                            height: height * .2,
                                            width: width * .2,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: rsmController
                                                      .RecentSeekerMatchValue
                                                      .value
                                                      .data![index]
                                                      .getanotherseeker!.id ==
                                                      int.parse(Getcurrentuser
                                                          .toString())
                                                      ? CachedNetworkImageProvider(
                                                      rsmController
                                                          .RecentSeekerMatchValue
                                                          .value
                                                          .data![index]
                                                          .getseeker!
                                                          .imgPath
                                                          .toString())
                                                      : CachedNetworkImageProvider(
                                                      rsmController
                                                          .RecentSeekerMatchValue
                                                          .value
                                                          .data![index]
                                                          .getanotherseeker!
                                                          .imgPath
                                                          .toString()),
                                                  fit: BoxFit.cover),
                                              borderRadius:
                                              BorderRadius.circular(22),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          bottom: 10,
                                          left: 10,
                                          child: CircleAvatar(
                                            radius: 20,
                                            child: CircleAvatar(
                                              radius: 50,
                                              backgroundColor: AppColors.white,
                                              child: Icon(Icons.heart_broken),
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          left: 60,
                                          top: 6,
                                          child: CircleAvatar(
                                            radius: 20,
                                            child: CircleAvatar(
                                              radius: 50,
                                              backgroundColor: AppColors.white,
                                              child: Icon(Icons.heart_broken),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: height * .01,
                                    ),
                                    Text(
                                      "It’s a match, Jake!",
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .titleSmall
                                          ?.copyWith(color: AppColors.red),
                                      maxLines: 1,
                                    ),
                                    SizedBox(
                                      height: height * .01,
                                    ),
                                    Text(
                                      "Start a conversation now with each other",
                                      style:
                                      Theme
                                          .of(context)
                                          .textTheme
                                          .labelSmall,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            onTap: () {
                              setState(() {
                                userIdsiker = null;
                              });
                              if (rsmController
                                  .RecentSeekerMatchValue
                                  .value
                                  .data![
                              index]
                                  .getseeker!.id !=
                                  seekerMyProfileController
                                      .SeekerMyProfileDetail.value
                                      .ProfileDetail!.id) {
                                userIdsiker = rsmController
                                    .RecentSeekerMatchValue
                                    .value
                                    .data![
                                index]
                                    .getseeker!
                                    .id.toString();
                                setState(() {
                                  userIdsiker;
                                });
                                Get.to(SingalRecentMatches());
                              }
                              else {
                                userIdsiker = rsmController
                                    .RecentSeekerMatchValue
                                    .value
                                    .data![
                                index]
                                    .getanotherseeker!
                                    .id.toString();

                                setState(() {
                                  userIdsiker;
                                });
                                print("requst id $userIdsiker");
                                Get.to(SingalRecentMatches());
                              }


                              // print(userIdsiker);
                              // Get.to(SingalRecentMatches());
                            },
                            // onTap: () {
                            //     setState(() {
                            //       userIdsiker=null;
                            //     });
                            //   if(ˇ
                            //       .RecentSeekerMatchValue
                            //       .value
                            //       .data![index]
                            //       .getseeker!.id!=seekerMyProfileController.SeekerMyProfileDetail.value.ProfileDetail!.id){
                            //     Get.to(SingalRecentMatches());
                            //   }
                            //   else{
                            //     userIdsiker=rsmController
                            //         .RecentSeekerMatchValue
                            //         .value
                            //         .data![index]
                            //         .getanotherseeker!.id.toString();
                            //     print("requst id $userIdsiker");
                            //     Get.to(SingalRecentMatches());
                            //   }

                            // },
                          );
                        },
                      );
                    }
                    else {
                    return  Column(

                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: Get.height * 0.15,),
                          Container(

                            height: Get.height * 0.2,
                            width: Get.width * 0.8,
                            decoration: BoxDecoration(image: DecorationImage(image: AssetImage(
                                "assets/images/recentConversationempty.png"))),),

                          SizedBox(height: Get.height * 0.01,),
                          Center(child: Text(
                            "Reference site about Lorem Ipsum\n   giving information on its origins",
                            style: TextStyle(color: Colors.black),))
                        ],
                      );
                    }
                  }
                } )],
            ),
          ),
        ));
  }
}
