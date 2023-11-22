import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:math' as math;

import '../GlobalVariable/GlobalVariable.dart';
import '../controllers/controller/MakerRecentMatchesController/maker_recent_matches_controller.dart';
import '../controllers/controller/RecentSeekerMatchesController/recent_seeker_matches_controller.dart';
import '../data/response/status.dart';
import '../res/components/general_exception.dart';
import '../res/components/internet_exceptions_widget.dart';
import 'makerRequest/MakerRecentSingleRequstPage.dart';

class RecentMakerMatchesViewAll extends StatefulWidget {
  const RecentMakerMatchesViewAll({Key? key}) : super(key: key);

  @override
  State<RecentMakerMatchesViewAll> createState() =>
      _RecentMakerMatchesViewAllState();
}

class _RecentMakerMatchesViewAllState extends State<RecentMakerMatchesViewAll> {
  RecentMakerMatchesController recentMakerMatchesController =
      Get.put(RecentMakerMatchesController());

  String? Getcurrentuser;

  @override
  void initState() {
    // TODO: implement initState
    // getcurrentuser();
    super.initState();
  }

  // getcurrentuser()async{
  //   SharedPreferences sp=await SharedPreferences.getInstance();
  //   Getcurrentuser=sp.getString("Tokernid");
  //   setState(() {
  //     Getcurrentuser;
  //   });
  //   print("$Getcurrentuser======currentuser");
  // }
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
                  switch (recentMakerMatchesController.rxRequestStatus.value) {
                    case Status.LOADING:
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,


                        children: [
                          const Center(

                              child: CircularProgressIndicator()),
                        ],
                      );
                    case Status.ERROR:
                      if (recentMakerMatchesController.error.value ==
                          'No internet') {
                        return InterNetExceptionWidget(
                          onPress: () {
                            recentMakerMatchesController.refreshApi();
                          },
                        );
                      } else {
                        return GeneralExceptionWidget(onPress: () {});
                      }
                    case Status.COMPLETED:
                      if (recentMakerMatchesController
                              .RecentMakerMatchesValue.value.message ==
                          'No request found'|| recentMakerMatchesController
                          .RecentMakerMatchesValue.value.requests!.length==0|| recentMakerMatchesController
                          .RecentMakerMatchesValue.value.requests==null) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,


                          children: [
                               SizedBox(
                                 height: Get.height*0.2,
                               ),
                            Center(
                              child: Image.asset(
                                'assets/images/recentmatchempt.png',
                                width: Get.width * 0.83,
                              ),
                            ),
                            Text(
                              "Reference site about Lorem Ipsum, giving information on its origins",
                              style: Get.theme.textTheme.bodySmall,
                              textAlign: TextAlign.center,
                            )
                          ],
                        );
                      } else {
                        return GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: .50),
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: recentMakerMatchesController
                              .RecentMakerMatchesValue.value.requests!.length,
                          itemBuilder: (context, index) {
                            return InkWell(
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
                                                  color:
                                                      AppColors.ratingcodeColor,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          18)),
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
                                                      image: CachedNetworkImageProvider(
                                                          recentMakerMatchesController
                                                              .RecentMakerMatchesValue
                                                              .value
                                                              .requests![index]
                                                              .getseeker!
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
                                                      image: CachedNetworkImageProvider(
                                                          recentMakerMatchesController
                                                              .RecentMakerMatchesValue
                                                              .value
                                                              .requests![index]
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
                                                  backgroundColor:
                                                      AppColors.white,
                                                  child:
                                                      Icon(Icons.heart_broken),
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
                                                  backgroundColor:
                                                      AppColors.white,
                                                  child:
                                                      Icon(Icons.heart_broken),
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
                                          style: Theme.of(context)
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
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    requestid = null;
                                  });

                                  requestid = recentMakerMatchesController
                                      .RecentMakerMatchesValue
                                      .value
                                      .requests![index]!
                                      .id
                                      .toString();
                                  print(requestid);

                                  if (requestid != null) {
                                    print(requestid);
                                    Get.to(SingleRecentPageRequest());
                                  }
                                });
                          },
                        );
                      }
                  }
                }),
              ],
            ),
          ),
        ));
  }
}
