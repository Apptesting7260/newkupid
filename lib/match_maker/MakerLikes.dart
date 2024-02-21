import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/controllers/controller/MakerLikeListController/MakerLikeListController.dart';
import 'package:cupid_match/match_maker/invite_state.dart';
import 'package:cupid_match/widgets/MakerDrawer.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../GlobalVariable/GlobalVariable.dart';
import '../data/response/status.dart';
import '../match_seeker/viewMakerProfileinseeker/ViewMakerProfile.dart';
import '../res/colors/app_color.dart';
import '../res/components/general_exception.dart';
import '../res/components/internet_exceptions_widget.dart';
import '../widgets/seekershortprofile.dart';

class MakerLikes extends StatefulWidget {
  const MakerLikes({Key? key}) : super(key: key);

  @override
  State<MakerLikes> createState() => _MakerLikesState();
}

class _MakerLikesState extends State<MakerLikes> {
  MakerLikeListController makerLikeListController=Get.put(MakerLikeListController());
  @override
  void initState() {
    // TODO: implement initState
    makerLikeListController.LikeListApiHit();
    super.initState();
  }
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return RefreshIndicator(
      onRefresh: () async {
        makerLikeListController.LikeListApiHit();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Likes",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.w600),
          ),
          centerTitle: true,
          actions: [
            Builder(
              builder: (context) {
                return GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                      MaterialLocalizations.of(context).openAppDrawerTooltip;
                    },
                    child: Image.asset("assets/icons/menu.png"));
              },
            ),
            SizedBox(width: Get.width*0.03,)
          ],
        ),
        endDrawer: Drawer(child: MakerDrawer()),
        body: Obx(() {
          switch (makerLikeListController.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator(color: Colors.pinkAccent,));
            case Status.ERROR:
              if (makerLikeListController.error.value == 'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {},
                );
              } else {
                return GeneralExceptionWidget(onPress: () {});
              }
            case Status.COMPLETED:
              return Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.01,
                  ),

                  makerLikeListController
                      .LikeList.value.data!.toSeeker!.length ==
                      0
                      ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: Get.height * 0.2,
                        ),
                        Image.asset(
                          'assets/images/likeem.png',
                          width: Get.width * 0.7,
                        ),
                        SizedBox(
                          height: Get.height * 0.05,
                        ),
                        Text("No Like, yet.",
                            style: Get
                                .theme.textTheme.headlineSmall!
                                .copyWith(
                                color: AppColor.blackColor)),
                        SizedBox(
                          height: Get.height * 0.02,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50.0),
                          child: Text(
                            "Reference site about Lorem Ipsum, giving as well as a random Lipsum generator.",
                            style: Get.theme.textTheme.bodyMedium!
                                .copyWith(
                                color: AppColor.blackColor,
                                fontWeight: FontWeight.w300),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  )
                      : ListView.builder(
                    itemCount:     makerLikeListController
                        .LikeList.value.data!.toSeeker!.length,
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.white,
                        child: ListTile(
                          visualDensity: VisualDensity(
                              vertical: -3, horizontal: -2),
                          leading: CircleAvatar(
                            radius: 22,
                            child: CircleAvatar(
                              radius: 30.0,
                              backgroundImage:
                              CachedNetworkImageProvider(
                                  makerLikeListController
                                      .LikeList.value.data!.toSeeker![index]
                                      .likeName!
                                      .imgPath
                                      .toString()),
                              backgroundColor: Colors.transparent,
                            ),
                          ),
                          title: Text(
                            makerLikeListController
                                .LikeList.value.data!.toSeeker![index]
                                .likeName!
                                .name
                                .toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                fontWeight: FontWeight.w600),
                          ),
                          subtitle: Text(
                            makerLikeListController
                                .LikeList.value.data!.toSeeker![index]
                                .likeName!.address.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(
                                fontWeight: FontWeight.w300,
                                color: Color(0xff777777)),
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              userIdsiker =    makerLikeListController
                                  .LikeList.value.data!.toSeeker![index]
                                  .likeName!
                                  .id
                                  .toString();
                              print('object');
                              Get.to(ShortProfileSeeker());
                            },
                            child: Container(
                              height: height * .04,
                              width: width * .35,
                              decoration: BoxDecoration(
                                color: Color(0xffFE0091),
                                borderRadius:
                                BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  "View Profile",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                  //     : LikeListControllerinstance
                  //     .LikeList.value.data!.toSeeker!.length ==
                  //     0
                  //     ? Center(
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.center,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       SizedBox(
                  //         height: Get.height * 0.2,
                  //       ),
                  //       Image.asset(
                  //         'assets/images/likeem.png',
                  //         width: Get.width * 0.7,
                  //       ),
                  //       SizedBox(
                  //         height: Get.height * 0.05,
                  //       ),
                  //       Text("No Like, yet.",
                  //           style: Get
                  //               .theme.textTheme.headlineSmall!
                  //               .copyWith(
                  //               color: AppColor.blackColor)),
                  //       SizedBox(
                  //         height: Get.height * 0.02,
                  //       ),
                  //       Padding(
                  //         padding: const EdgeInsets.symmetric(
                  //             horizontal: 50.0),
                  //         child: Text(
                  //           "Reference site about Lorem Ipsum, giving as well as a random Lipsum generator.",
                  //           style: Get.theme.textTheme.bodyMedium!
                  //               .copyWith(
                  //               color: AppColor.blackColor,
                  //               fontWeight: FontWeight.w300),
                  //           textAlign: TextAlign.center,
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // )
                  //     : ListView.builder(
                  //   itemCount: LikeListControllerinstance
                  //       .LikeList.value.data!.toSeeker!.length,
                  //   scrollDirection: Axis.vertical,
                  //   physics: NeverScrollableScrollPhysics(),
                  //   shrinkWrap: true,
                  //   itemBuilder: (context, index) {
                  //     return Container(
                  //       color: Colors.white,
                  //       child: ListTile(
                  //         visualDensity: VisualDensity(
                  //             vertical: -3, horizontal: -2),
                  //         leading: CircleAvatar(
                  //           radius: 22,
                  //           child: CircleAvatar(
                  //             radius: 30.0,
                  //             backgroundImage:
                  //             CachedNetworkImageProvider(
                  //                 LikeListControllerinstance
                  //                     .LikeList
                  //                     .value
                  //                     .data!
                  //                     .toSeeker![index]
                  //                     .likeName!
                  //                     .imgPath
                  //                     .toString()),
                  //             backgroundColor: Colors.transparent,
                  //           ),
                  //         ),
                  //         title: Text(
                  //           LikeListControllerinstance
                  //               .LikeList
                  //               .value
                  //               .data!
                  //               .toSeeker![index]
                  //               .likeName!
                  //               .name
                  //               .toString(),
                  //           style: Theme.of(context)
                  //               .textTheme
                  //               .bodySmall
                  //               ?.copyWith(
                  //               fontWeight: FontWeight.w600),
                  //         ),
                  //         subtitle: Text(
                  //           "India",
                  //           style: Theme.of(context)
                  //               .textTheme
                  //               .labelSmall
                  //               ?.copyWith(
                  //               fontWeight: FontWeight.w300,
                  //               color: Color(0xff777777)),
                  //         ),
                  //         trailing: GestureDetector(
                  //           onTap: () {
                  //             userIdsiker =
                  //                 LikeListControllerinstance
                  //                     .LikeList
                  //                     .value
                  //                     .data!
                  //                     .toSeeker![index]
                  //                     .likeName!
                  //                     .id
                  //                     .toString();
                  //             print('object');
                  //             Get.to(ShortProfileSeeker());
                  //           },
                  //           child: Container(
                  //             height: height * .04,
                  //             width: width * .35,
                  //             decoration: BoxDecoration(
                  //               color: Color(0xffFE0091),
                  //               borderRadius:
                  //               BorderRadius.circular(15),
                  //             ),
                  //             child: Center(
                  //               child: Text(
                  //                 "View Profile",
                  //                 style: Theme.of(context)
                  //                     .textTheme
                  //                     .bodySmall!
                  //                     .copyWith(
                  //                     color: Colors.white),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // ),
                  // if (LikeListControllerinstance.LikeList.value.message ==
                  //     'Data Not Found')
                  //   SizedBox(height: Get.height * 0.18),
                  // if (LikeListControllerinstance.LikeList.value.message ==
                  //     'Data Not Found')
                  //   Center(
                  //     child: Column(
                  //       children: [
                  //         Image.asset(
                  //           'assets/images/likeem.png',
                  //           width: Get.width * 0.7,
                  //         ),
                  //         SizedBox(
                  //           height: Get.height * 0.05,
                  //         ),
                  //         Text("No Like, yet.",
                  //             style: Get.theme.textTheme.headlineSmall!
                  //                 .copyWith(color: AppColor.blackColor)),
                  //         SizedBox(
                  //           height: Get.height * 0.02,
                  //         ),
                  //         Padding(
                  //           padding:
                  //           const EdgeInsets.symmetric(horizontal: 50.0),
                  //           child: Text(
                  //             "Reference site about Lorem Ipsum, giving as well as a random Lipsum generator.",
                  //             style: Get.theme.textTheme.bodyMedium!.copyWith(
                  //                 color: AppColor.blackColor,
                  //                 fontWeight: FontWeight.w300),
                  //             textAlign: TextAlign.center,
                  //           ),
                  //         )
                  //       ],
                  //     ),
                  //   )
                ],
              );
          }
        }),
      ),
    );
  }
}
