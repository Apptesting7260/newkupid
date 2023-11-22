import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/SeekerToMakerController/SeekerToMakerController.dart';
import 'package:cupid_match/controllers/controller/IncomingRequestController/IncomingRequestController.dart';
import 'package:cupid_match/controllers/controller/OutgoingRequestController/OutgoingRequestController.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/match_maker/Create_Match/Create_Match.dart';
import 'package:cupid_match/match_maker/chat_screen.dart';
import 'package:cupid_match/match_maker/invite_state.dart';
import 'package:cupid_match/match_maker/new_matches.dart';
import 'package:cupid_match/match_maker/payment_info.dart';
import 'package:cupid_match/match_maker/pending_matches.dart';
import 'package:cupid_match/match_maker/premium.dart';
import 'package:cupid_match/match_maker/profile_maker.dart';
import 'package:cupid_match/match_maker/recent_conversations.dart';
import 'package:cupid_match/match_maker/recent_matches.dart';
import 'package:cupid_match/match_maker/request_matches.dart';
import 'package:cupid_match/match_maker/Chose_Subcription.dart';
import 'package:cupid_match/match_seeker/Chose_role_Type.dart';
import 'package:cupid_match/match_seeker/Demo/homeScreenwidget.dart';
import 'package:cupid_match/match_seeker/Requests/IncomingRequest.dart';
import 'package:cupid_match/match_seeker/Requests/outgoingRequest.dart';
import 'package:cupid_match/match_seeker/home_screen.dart';
import 'package:cupid_match/match_seeker/chat_screen.dart';
import 'package:cupid_match/res/components/general_exception.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/MakerDrawer.dart';
import 'package:cupid_match/widgets/drawer.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:cupid_match/widgets/seekershortprofile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:math' as math;

import '../controllers/SeekerMyProfileDetailsController/SeekerMyProfileController.dart';
import '../controllers/SeekerRequestController/SeekerHomePageRequestController.dart';
import '../controllers/controller/RecentSeekerMatchesController/recent_seeker_matches_controller.dart';
import '../controllers/controller/ViewSikerDetailsController/ViewSikerDetaolsController.dart';
import '../controllers/sikerProfileController/EditViewsikeerDetailsController.dart';
import 'RecentMatch/SingleRecentMatch.dart';
import 'Requests/SeekeerIncominSingalRequestPage.dart';
import 'Requests/SeekerRequestPage.dart';

class SikerHomeScreen extends StatefulWidget {
  const SikerHomeScreen({Key? key}) : super(key: key);

  @override
  State<SikerHomeScreen> createState() => _SikerHomeScreenState();
}

class _SikerHomeScreenState extends State<SikerHomeScreen> {
  // OutgoinRequestController controller = Get.put(OutgoinRequestController());
  // IncomingSeekerRequestController Incontroller = Get.put(IncomingSeekerRequestController());
  // final ViewSikerProfileDetailsControllernstance =
  //     Get.put(ViewSikerProfileDetailsController());
  RecentSeekerMatchesController recentSeekerMatchesController =
      Get.put(RecentSeekerMatchesController());
  final SeekerMyProfileDetailsController seekerMyProfileController =
  Get.put(SeekerMyProfileDetailsController());
  SeekerEditViewDeatailsController ViewSikerProfileDetailsControllerinstances = Get.put(SeekerEditViewDeatailsController());



  String? Getcurrentuser;
  @override
  HomeRequestController requestHomeController=Get.put(HomeRequestController());
  void initState() {

    requestHomeController.homeRequest();
    seekerMyProfileController.SeekerMyProfileDetailsApiHit();
    recentSeekerMatchesController.isrecentSeekermatchesApi();
    ViewSikerProfileDetailsControllerinstances.ViewSikerProfileDetailsApiHit();
    // print(requestHomeController.seekerHomeRequestValue.value.requests!.incoming![0]);
    // print(requestHomeController.seekerHomeRequestValue.value.requests!.incoming![0].getseeker?.gender);
        getcurrentuser();
    // print(  requestHomeController.seekerHomeRequestValue.value
    //     .requests!.outgoing![0].getseeker!
    //     .name
    //     .toString());
    // TODO: implement initState
    super.initState();


  }

  getcurrentuser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    Getcurrentuser = sp.getString("Tokernid");
    print("$Getcurrentuser======currentuser");
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
     edgeOffset: VisualDensity.minimumDensity,
      onRefresh: () async {
        requestHomeController.homeRequest();
        seekerMyProfileController.SeekerMyProfileDetailsApiHit();
        recentSeekerMatchesController.isrecentSeekermatchesApi();

      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text(
              "Home ",

              style: Theme.of(context).textTheme.titleSmall,
            ),
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
              )
            ],
          ),
          endDrawer: MyDrawer(),
          body: Obx(() {
        final myProfileStatus = requestHomeController.rxRequestStatus.value;

        final questionsStatus = recentSeekerMatchesController.rxRequestStatus.value;
        if (myProfileStatus == Status.ERROR ||
            questionsStatus == Status.ERROR) {
          if (recentSeekerMatchesController.rxRequestStatus.value == 'No internet' ||
              requestHomeController.rxRequestStatus.value == 'No internet') {
            return InterNetExceptionWidget(
              onPress: () {
                requestHomeController.refreshApi();
                recentSeekerMatchesController.refreshApi();
              },
            );
          } else {
            return GeneralExceptionWidget(onPress: () {
              requestHomeController.refreshApi();
              recentSeekerMatchesController.refreshApi();
            });
          }
        } else if (myProfileStatus == Status.LOADING ||
            questionsStatus == Status.LOADING) {
          return Center(
              child: CircularProgressIndicator(
                color: Colors.pink,
              ));
        } else {
          if (recentSeekerMatchesController
              .RecentSeekerMatchValue.value.message ==
              'Data Not Found' &&
              requestHomeController.seekerHomeRequestValue.value.message ==
                  'No request found') {
            return Column(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                        onTap: () {
                          Get.to(Chose_Role_Type());
                        },
                        child: Image.asset(
                            'assets/images/match.png'))),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Center(
                  child:
                  Image.asset('assets/images/homeempty.png'),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                Text(
                  "Outgoing Request",
                  style: Get.theme.textTheme.bodySmall,
                ),
                SizedBox(
                  height: Get.height * 0.01,
                ),
                Text(
                  "Find your perfect match",
                  style: Get.theme.textTheme.labelMedium!
                      .copyWith(
                      fontWeight: FontWeight.w600,
                      color: AppColors.black),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                MyButton(title: 'Find Match', onTap: () {
                  Get.to(Chose_Role_Type());
                })
              ],
            );
          }

          else {
            return
              Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * 0.05, vertical: height * 0.02),
                  child:
                  SingleChildScrollView(
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Container(
                            child: Column(
                              children: [
                                Align(
                                    alignment: Alignment.center,
                                    child: GestureDetector(
                                        onTap: () {
                                          Get.to(Chose_Role_Type());
                                        },
                                        child: Image.asset(
                                            'assets/images/match.png'))),
                                SizedBox(
                                  height: height * 0.04,
                                ),

                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "Recent Matches",
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                        Column(
                                          children: [
                                            Text("But no conversation",
                                                style: Theme
                                                    .of(context)
                                                    .textTheme
                                                    .bodyLarge)
                                          ],
                                        )
                                      ],
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Get.to(RecentMatches());
                                        },
                                        style: TextButton.styleFrom(),
                                        child: Text(
                                          'ViewAll',
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .bodySmall,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: height * .02,
                                ),

                                // Obx(() {
                                //   switch (
                                //       recentSeekerMatchesController.rxRequestStatus.value) {
                                //     case Status.LOADING:
                                //       return const Center(child: CircularProgressIndicator());
                                //     case Status.ERROR:
                                //       if (Incontroller.error.value == 'No internet') {
                                //         return InterNetExceptionWidget(
                                //           onPress: () {},
                                //         );
                                //       } else {
                                //         return GeneralExceptionWidget(onPress: () {});
                                //       }
                                //     case Status.COMPLETED:
                                //       return
                                recentSeekerMatchesController
                                    .RecentSeekerMatchValue.value.data!.isEmpty ||
                                    recentSeekerMatchesController
                                        .RecentSeekerMatchValue.value.data ==
                                        null || recentSeekerMatchesController
                                    .RecentSeekerMatchValue.value.data == [] ?
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/recentmatchempt.png',
                                      width: Get.width * 0.83,
                                    ),
                                    Text(
                                      "Reference site about Lorem Ipsum, giving information on its origins",
                                      style: Get.theme.textTheme.bodySmall,
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ) :
                                Container(
                                  width: width,
                                  height: height * .45,

                                  child: ListView.builder(

                                    scrollDirection: Axis.horizontal,
                                    physics: AlwaysScrollableScrollPhysics(),
                                    shrinkWrap: true,

                                    itemCount: recentSeekerMatchesController
                                      .RecentSeekerMatchValue.value.data!.length>=2?2:1  ,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(child: Container(
                                        width: width * .45,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Stack(
                                                children: [
                                                  Container(
                                                    height: height * 0.32,
                                                    width: width * 0.43,
                                                    decoration: BoxDecoration(
                                                        color: AppColors
                                                            .ratingcodeColor,
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(
                                                            18)),
                                                  ),
                                                  Transform.rotate(
                                                    angle:
                                                    (math.pi / 390) * 11,
                                                    origin:
                                                    Offset(-190.0, 760.0),
                                                    child: Container(
                                                      height: height * .2,
                                                      width: width * .2,
                                                      decoration:
                                                      BoxDecoration(
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(22),
                                                        image: DecorationImage(
                                                            image: recentSeekerMatchesController
                                                                .RecentSeekerMatchValue
                                                                .value
                                                                .data![
                                                            index]
                                                                .getanotherseeker!
                                                                .id
                                                                .toString() !=
                                                                Getcurrentuser
                                                                    .toString()
                                                                ? CachedNetworkImageProvider(
                                                                recentSeekerMatchesController
                                                                    .RecentSeekerMatchValue
                                                                    .value
                                                                    .data![
                                                                index]
                                                                    .getseeker!
                                                                    .imgPath
                                                                    .toString())
                                                                : CachedNetworkImageProvider(
                                                                recentSeekerMatchesController
                                                                    .RecentSeekerMatchValue
                                                                    .value
                                                                    .data![
                                                                index]
                                                                    .getanotherseeker!
                                                                    .imgPath
                                                                    .toString()),
                                                            fit:
                                                            BoxFit.cover),
                                                      ),
                                                    ),
                                                  ),
                                                  Transform.rotate(
                                                    angle:
                                                    (math.pi / 850) * -40,
                                                    origin:
                                                    Offset(520.0, -80.0),
                                                    child: Container(
                                                      height: height * .2,
                                                      width: width * .2,
                                                      decoration:
                                                      BoxDecoration(
                                                        image: DecorationImage(
                                                            image: recentSeekerMatchesController
                                                                .RecentSeekerMatchValue
                                                                .value
                                                                .data![
                                                            index]
                                                                .getanotherseeker!
                                                                .id
                                                                .toString() ==
                                                                Getcurrentuser
                                                                    .toString()
                                                                ? CachedNetworkImageProvider(
                                                                recentSeekerMatchesController
                                                                    .RecentSeekerMatchValue
                                                                    .value
                                                                    .data![
                                                                index]
                                                                    .getseeker!
                                                                    .imgPath
                                                                    .toString())
                                                                : CachedNetworkImageProvider(
                                                                recentSeekerMatchesController
                                                                    .RecentSeekerMatchValue
                                                                    .value
                                                                    .data![
                                                                index]
                                                                    .getanotherseeker!
                                                                    .imgPath
                                                                    .toString()),
                                                            fit:
                                                            BoxFit.cover),
                                                        borderRadius:
                                                        BorderRadius
                                                            .circular(22),
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
                                                        child: Icon(Icons
                                                            .heart_broken),
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
                                                        child: Icon(Icons
                                                            .heart_broken),
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
                                                    ?.copyWith(
                                                    color: AppColors.red),
                                                maxLines: 1,
                                              ),
                                              SizedBox(
                                                height: height * .01,
                                              ),
                                              Text(
                                                "Start a conversation now with each other",
                                                style: Theme
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
                                          if (recentSeekerMatchesController
                                              .RecentSeekerMatchValue
                                              .value
                                              .data![
                                          index]
                                              .getseeker!.id !=
                                              seekerMyProfileController
                                                  .SeekerMyProfileDetail.value
                                                  .ProfileDetail!.id) {
                                            userIdsiker =
                                                recentSeekerMatchesController
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
                                            userIdsiker =
                                                recentSeekerMatchesController
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
                                      );
                                    },
                                  ),
                                ),

                                SizedBox(
                                  height: height * 0.02,
                                ),
                                // Row(
                                //   mainAxisAlignment: MainAxisAlignment
                                //       .spaceBetween,
                                //   children: [
                                //     Text(
                                //       "Recent Conversations",
                                //       style: Theme
                                //           .of(context)
                                //           .textTheme
                                //           .titleLarge,
                                //     ),
                                //     TextButton(
                                //         onPressed: () {
                                //           Get.to(RecentConversations());
                                //         },
                                //         child: Text(
                                //           'ViewAll',
                                //           style: Theme
                                //               .of(context)
                                //               .textTheme
                                //               .bodySmall,
                                //         )),
                                //   ],
                                // ),

                                //********************* recent conversations *********
                                Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Recent Conversations",
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              Get.to(RecentConversations());
                                            },
                                            child: Text(
                                              'ViewAll',
                                              style: Theme
                                                  .of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            )),
                                      ],
                                    ),
                                    Image.asset(
                                      'assets/images/recentC.png',
                                      width: Get.width * 0.83,
                                    ),
                                    Text(
                                      "Reference site about Lorem Ipsum, giving information on its origins",
                                      style: Get.theme.textTheme.bodySmall,
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ),
                                // Container(
                                //   width: width,
                                //   height: height * .12,
                                //   child: ListView.builder(
                                //     scrollDirection: Axis.horizontal,
                                //     physics: AlwaysScrollableScrollPhysics(),
                                //     shrinkWrap: true,
                                //     itemCount: 2,
                                //     itemBuilder: (context, index) {
                                //       return Padding(
                                //         padding: const EdgeInsets.all(8.0),
                                //         child: Container(
                                //             decoration: BoxDecoration(
                                //                 color: AppColors.ratingcodeColor,
                                //                 borderRadius:
                                //                 BorderRadius.circular(15)),
                                //             width: width * .65,
                                //             // height: 50,
                                //             child: ListTile(
                                //               leading: Container(
                                //                 width: width * .08,
                                //                 height: height * 0.05,
                                //                 child: ListView.builder(
                                //                   scrollDirection: Axis.horizontal,
                                //                   itemCount: images.length >= 3
                                //                       ? 3
                                //                       : images.length,
                                //                   shrinkWrap: true,
                                //                   reverse: true,
                                //                   itemBuilder: (context, index) {
                                //                     return Align(
                                //                       alignment: Alignment.centerRight,
                                //                       widthFactor: 0.3,
                                //                       child: CircleAvatar(
                                //                         radius: 18,
                                //                         backgroundColor:
                                //                         AppColors.white,
                                //                         child: CircleAvatar(
                                //                           radius: 16,
                                //                           backgroundImage: NetworkImage(
                                //                               images[index]),
                                //                         ),
                                //                       ),
                                //                     );
                                //                   },
                                //                 ),
                                //               ),
                                //               title: Text(
                                //                 "Name",
                                //                 style: Theme.of(context)
                                //                     .textTheme
                                //                     .bodyMedium
                                //                     ?.copyWith(color: AppColors.black),
                                //               ),
                                //               subtitle: Text(
                                //                 "25/05/2022",
                                //                 style: Theme.of(context)
                                //                     .textTheme
                                //                     .bodyLarge
                                //                     ?.copyWith(
                                //                     fontSize: 10,
                                //                     color: AppColors.black),
                                //               ),
                                //               trailing: GestureDetector(
                                //                 // onTap: () => Get.to(() => ChatScreen()),
                                //                   child: Image.asset(
                                //                     "assets/maker/Group 221.png",
                                //                     width: width * 0.09,
                                //                   )),
                                //             )),
                                //       );
                                //     },
                                //   ),
                                // ),

                                SizedBox(
                                  height: Get.height * 0.03,
                                ),

                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Incoming Requests",
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Get.to(IncomingRequests());
                                        },
                                        child: Text(
                                          'View All',
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .bodySmall,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                // if (Incontroller.IncomingRequestvalue.value
                                //     .requests!.isNull)
                                //   Column(
                                //     children: [
                                //       Image.asset(
                                //         'assets/images/incomingr.png',
                                //         width: Get.width * 0.83,
                                //       ),
                                //       Text(
                                //         "Reference site about Lorem Ipsum, giving information on its origins",
                                //         style: Get.theme.textTheme.bodySmall,
                                //         textAlign: TextAlign.center,
                                //       )
                                //     ],
                                //   ),

                                // if (requestHomeController.seekerHomeRequestValue.value
                                //
                                // requestHomeController
                                //     .seekerHomeRequestValue.value
                                //     .requests!.incoming != null ||
                                //     requestHomeController
                                //         .seekerHomeRequestValue.value
                                //         .requests!.incoming != []||
                                //     requestHomeController
                                //         .seekerHomeRequestValue.value
                                //         .requests!.incoming!.isNotEmpty?


                                if(requestHomeController
                                    .rxRequestStatus.value==Status.LOADING)CircularProgressIndicator(),
                                if(requestHomeController
                                    .rxRequestStatus.value==Status.COMPLETED)
                                requestHomeController
                                    .seekerHomeRequestValue.value
                                    .requests!.incoming!.isEmpty ||
                                    requestHomeController
                                        .seekerHomeRequestValue.value
                                        .requests!.incoming ==
                                        null || requestHomeController
                                    .seekerHomeRequestValue.value
                                    .requests!.incoming == [] ?
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/incomingr.png',
                                      width: Get.width * 0.83,
                                    ),
                                    Text(
                                      "Reference site about Lorem Ipsum, giving information on its origins",
                                      style: Get.theme.textTheme.bodySmall,
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ) :
                            Container(
                                  width: width,
                                  height: height * .16,
                                  child:     ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    physics: AlwaysScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    itemCount: requestHomeController
                                        .seekerHomeRequestValue.value
                                        .requests!.incoming
                                    !.length,
                                    itemBuilder: (context, index) {


                                    final anotheruser=requestHomeController
                                        .seekerHomeRequestValue.value
                                        .requests!.incoming![index].getseeker!.id.toString()==seekerMyProfileController.SeekerMyProfileDetail.value.ProfileDetail!.id.toString()?requestHomeController
                                        .seekerHomeRequestValue.value
                                        .requests!.incoming![index].getanotherseeker:requestHomeController
                                        .seekerHomeRequestValue.value
                                        .requests!.incoming![index].getseeker;

                                        String createdAtString = requestHomeController
                                        .seekerHomeRequestValue.value
                                        .requests!.incoming![index].createdAt.toString();
            DateTime createdAt = DateTime.parse(createdAtString);
            String formattedDate = DateFormat('d/MM/yyyy').format(createdAt);

                                      return

                                        anotheruser!=null?InkWell(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: AppColors
                                                        .ratingcodeColor,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        15)),
                                                width: width * .65,
                                                child: requestHomeController
                                                    .seekerHomeRequestValue.value
                                                    .requests!.incoming![index]
                                                    .matchType == 1

                                                    ? InkWell(
                                                  child: Container(
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Padding(
                                                                padding: const EdgeInsets
                                                                    .only(
                                                                    left: 20,
                                                                    top: 10,
                                                                    bottom:
                                                                    10),
                                                                child: Text(
                                                                  "Seeker ",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .pink),
                                                                ),
                                                              ),
                                                              Text(
                                                                " Requested",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,

                                                            children: [
                                                              Padding(
                                                                padding:
                                                                const EdgeInsets
                                                                    .all(
                                                                    8.0),
                                                                child:
                                                                Container(
                                                                  // width: width * .29,
                                                                  child:
                                                                  Stack(
                                                                    children: [
                                                                      CircleAvatar(
                                                                          radius:
                                                                          25,
                                                                          backgroundColor:
                                                                          AppColors
                                                                              .white,
                                                                          backgroundImage: CachedNetworkImageProvider(
                                                                              anotheruser!.imgPath.toString())),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                Get.width *
                                                                    0.08,
                                                              ),
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  // SizedBox(
                                                                  //   height: Get
                                                                  //       .height *
                                                                  //       0.02,
                                                                  // ),

                                                                Container(
                                                                  child: Text(
                                                                   anotheruser.name.toString(),

                                                                    style: TextStyle(
                                                                      overflow: TextOverflow.ellipsis,
                                                                        color: Colors
                                                                            .pink,
                                                                        fontSize:15
                                                                        ,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .bold),
                                                                  ),
                                                                ),
                                                                  SizedBox(
                                                                    height: Get
                                                                        .height *
                                                                        0.02,
                                                                  ),
                                                                  Padding(
                                                                    padding: const EdgeInsets.only(left: 10),
                                                                    child: Text(


formattedDate,

                                                                      style: TextStyle(
                                                                          color:
                                                                          Colors
                                                                              .black),
                                                                    ),
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      )),
                                                  //  onTap: (){
                                                  //      userIdsiker=Incontroller.IncomingRequestvalue.value.requests![index].getSeeker!.id.toString();

                                                  //     print(userIdsiker);
                                                  //     Get.to(ShortProfileSeeker());
                                                  // },
                                                )
                                                    : Container(
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            SizedBox(
                                                              height:
                                                              Get.height *
                                                                  0.04,
                                                            ),
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                left: 20,
                                                              ),
                                                              child: Text(
                                                                "Seeker &",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                            Text(
                                                              "Maker",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .pink),
                                                            ),
                                                            Text(
                                                              " Requested",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,

                                                          children: [
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .all(
                                                                  8.0),
                                                              child:
                                                              Container(
                                                                width: width *
                                                                    .29,
                                                                child: Stack(
                                                                  children: [
                                                                    Positioned(
                                                                      right:
                                                                      30,
                                                                      child:
                                                                      CircleAvatar(
                                                                        radius:
                                                                        30.0,
                                                                        backgroundImage: CachedNetworkImageProvider(
                                                                            requestHomeController
                                                                                .seekerHomeRequestValue
                                                                                .value
                                                                                .requests!
                                                                                .incoming![index]
                                                                                .getanotherseeker!
                                                                                .imgPath
                                                                                .toString()),
                                                                        backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        shape:
                                                                        BoxShape
                                                                            .circle,
                                                                        border: Border
                                                                            .all(
                                                                            color: Colors
                                                                                .white,
                                                                            width: 2),
                                                                      ),
                                                                      child:
                                                                      CircleAvatar(
                                                                        radius:
                                                                        30.0,
                                                                        backgroundImage: CachedNetworkImageProvider(
                                                                            requestHomeController
                                                                                .seekerHomeRequestValue
                                                                                .value
                                                                                .requests!
                                                                                .incoming![index]
                                                                                .getmaker!
                                                                                .imgPath
                                                                                .toString()),
                                                                        backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Column(
                                                              children: [
                                                                SizedBox(
                                                                  height:
                                                                  Get.height *
                                                                      0.02,
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    Container(width: Get.width*.3,
                                                                      child: Text(
                                                                            requestHomeController
                                                                                .seekerHomeRequestValue
                                                                                .value
                                                                                .requests!
                                                                                .incoming![index]
                                                                                .getmaker!
                                                                                .name
                                                                                .toString(),

                                                                        style: TextStyle(
                                                                          overflow: TextOverflow.ellipsis,
                                                                            color: Colors
                                                                                .pink,
                                                                            fontSize:12
                                                                            ,
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .bold),
                                                                      ),
                                                                    ),
                                                                    Container(width: Get.width*.3,
                                                                      child: Text(
                                                                          anotheruser!.name.toString(),

                                                                        style: TextStyle(
                                                                            overflow: TextOverflow.ellipsis,
                                                                            color: Colors
                                                                                .pink,
                                                                            fontSize:12
                                                                            ,
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .bold),
                                                                      ),
                                                                    )
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                  Get.height *
                                                                      0.01,
                                                                ),
                                                                Text(
                                                             formattedDate,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ))),
                                          ),
                                          onTap: () {
                                        
                                            requestid = requestHomeController
                                                .seekerHomeRequestValue.value
                                                .requests!.incoming![index]
                                                .id
                                                .toString();
    setState(() {
                          requestid;                    requestype = "1";
                                            });
                                            if (requestid != null) {
                                              print(requestid);
                                              Get.to(
                                                  SeekerIncomingRequestSinglePage());
                                            }
                                          },
                                        ):CircularProgressIndicator();
                                    },
                                  )
                                ),

                                // Container(
                                //   child: Column(
                                //     children: [
                                //       Image.asset(
                                //         'assets/images/recentmatchempt.png',
                                //         width: Get.width * 0.83,
                                //       ),
                                //       Text(
                                //         "Reference site about Lorem Ipsum, giving information on its origins",
                                //         style: Get.theme.textTheme
                                //             .bodySmall,
                                //         textAlign: TextAlign.center,
                                //       )
                                //     ],
                                //   ),
                                // ),

                                SizedBox(
                                  height: height * 0.02,
                                ),

                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Outgoing Requests",
                                      style: Theme
                                          .of(context)
                                          .textTheme
                                          .titleLarge,
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          WidgetsBinding.instance
                                              .addPostFrameCallback((_) {
                                            // This code will run after the build is complete
                                            Get.to(OutGoingRequest());
                                          });
                                        },
                                        child: Text(
                                          'View All',
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .bodySmall,
                                        )),
                                  ],
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                // if (requestHomeController.seekerHomeRequestValue
                                //     .value
                                //     .requests!.outgoing!.isEmpty)
                                //   Column(
                                //     children: [
                                //       Image.asset(
                                //         'assets/images/outgoinc.png',
                                //         width: Get.width * 0.83,
                                //       ),
                                //       Text(
                                //         "Reference site about Lorem Ipsum, giving information on its origins",
                                //         style: Get.theme.textTheme.bodySmall,
                                //         textAlign: TextAlign.center,
                                //       )
                                //     ],
                                //   ),
                                // if (requestHomeController.seekerHomeRequestValue.value
                                //
                                //     .requests!.outgoing!.isNotEmpty)
                                // requestHomeController
                                //     .seekerHomeRequestValue.value
                                //     .requests!.outgoing != null ||
                                //     requestHomeController
                                //         .seekerHomeRequestValue.value
                                //         .requests!.outgoing != [] ?

                                // requestHomeController
                                //     .seekerHomeRequestValue.value
                                //     .requests!.outgoing!.isEmpty ||
                                //     requestHomeController
                                //         .seekerHomeRequestValue.value
                                //         .requests!.outgoing ==
                                //         null || requestHomeController
                                //     .seekerHomeRequestValue.value
                                //     .requests!.outgoing == [] ?
                                if(requestHomeController
                                    .rxRequestStatus.value==Status.LOADING)CircularProgressIndicator(),
                                if(requestHomeController
                                    .rxRequestStatus.value==Status.COMPLETED)
                                requestHomeController
                                    .seekerHomeRequestValue.value
                                    .requests!.outgoing!.isEmpty?
                                Column(
                                  children: [
                                    Image.asset(
                                      'assets/images/outgoinc.png',
                                      width: Get.width * 0.83,
                                    ),
                                    Text(
                                      "Reference site about Lorem Ipsum, giving information on its origins",
                                      style: Get.theme.textTheme.bodySmall,
                                      textAlign: TextAlign.center,
                                    )
                                  ],
                                ) :
                                Container(
                                    width: width,
                                    height: height * .18,
                                    child:  ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics: AlwaysScrollableScrollPhysics(),
                                      // shrinkWrap: true,
                                      itemCount: requestHomeController
                                          .seekerHomeRequestValue.value
                                          .requests!.outgoing!.length
                                      ,
                                      itemBuilder: (context, index) {
                                        dynamic anotheruser;



                                        if(
                                        requestHomeController
                                            .seekerHomeRequestValue.value
                                            .requests!.outgoing![index].getanotherseeker==null
                                        ){
                                          anotheruser=requestHomeController
                                              .seekerHomeRequestValue.value
                                              .requests!.outgoing![index].getmaker==null?requestHomeController
                                              .seekerHomeRequestValue.value
                                              .requests!.outgoing![index].getseeker:requestHomeController
                                              .seekerHomeRequestValue.value
                                              .requests!.outgoing![index].getmaker;

                                        }else{

                                          anotheruser=  seekerMyProfileController
                                              .SeekerMyProfileDetail.value
                                              .ProfileDetail!.id== requestHomeController
                                              .seekerHomeRequestValue.value
                                              .requests!.outgoing![index].getseeker!.id?requestHomeController
                                              .seekerHomeRequestValue.value
                                              .requests!.outgoing![index].getanotherseeker:requestHomeController
                                              .seekerHomeRequestValue.value
                                              .requests!.outgoing![index].getseeker;

                                        }

                                        String createdAt = requestHomeController
                                            .seekerHomeRequestValue.value
                                            .requests!.outgoing![index].createdAt.toString();
                                        DateTime createdAtStringd = DateTime.parse(createdAt);
                                        String createdAtString = DateFormat('d/MM/yyyy').format(createdAtStringd);
                                        return anotheruser!=null?InkWell(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    color: AppColors
                                                        .ratingcodeColor,
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        15)),
                                                width: width * .65,
                                                // height: Get.height*0.5,

                                                child:
                                                requestHomeController
                                                    .seekerHomeRequestValue.value
                                                    .requests!.outgoing![index]
                                                    .matchType == 1 ||requestHomeController
                                                    .seekerHomeRequestValue.value
                                                    .requests!.outgoing![index]
                                                    .getanotherseeker==null
                                                    ? InkWell(
                                                  child: Container(
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                height:
                                                                Get.height *
                                                                    0.04,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left:
                                                                    20),
                                                                child: Text(
                                                                  "Seeker ",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .pink),
                                                                ),
                                                              ),
                                                              Text(
                                                                " Requested",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              )
                                                            ],
                                                          ),
                                                          Row(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,

                                                            children: [
                                                              Padding(
                                                                padding:
                                                                const EdgeInsets
                                                                    .all(
                                                                    8.0),
                                                                child:
                                                                Container(
                                                                  // width: width * .29,
                                                                  child:
                                                                  Stack(
                                                                    children: [
                                                                      CircleAvatar(
                                                                          radius:
                                                                          30,
                                                                          backgroundColor:
                                                                          AppColors
                                                                              .white,
                                                                          backgroundImage: CachedNetworkImageProvider(
                                                                              anotheruser
                                                                                  .toString())),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width:
                                                                Get.width *
                                                                    0.08,
                                                              ),
                                                              Column(
                                                                children: [
                                                                  SizedBox(
                                                                    height: Get
                                                                        .height *
                                                                        0.02,
                                                                  ),
                                                                  Container(
                                                                    width: Get.width*0.3,
                                                                    child: Text(
                                                                      anotheruser
                                                                          .name
                                                                          .toString(),
                                                                      style: TextStyle(
                                                                          color: Colors
                                                                              .pink,
                                                                          fontSize:
                                                                          12,
                                                                          fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                      overflow: TextOverflow.ellipsis,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height: Get
                                                                        .height *
                                                                        0.03,
                                                                  ),
                                                                  Text(
                                                                    createdAtString,
                                                                    style: TextStyle(
                                                                        color:
                                                                        Colors
                                                                            .black),
                                                                  )
                                                                ],
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      )),
                                                  onTap: () {
                                                    requestid =
                                                        requestHomeController
                                                            .seekerHomeRequestValue
                                                            .value
                                                            .requests!
                                                            .outgoing![index].id
                                                            .toString();

                                                    print(requestid);
                                                    Get.to(
                                                        SeekerOutGoingRequestSinglePage());
                                                  },
                                                ) :

                                                Container(
                                                    child: Column(
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  left:
                                                                  20,
                                                                  top:
                                                                  10),
                                                              child: Text(
                                                                "Seeker &",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),
                                                              ),
                                                            ),
                                                            Text(
                                                              "Maker",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .pink),
                                                            ),
                                                            Text(
                                                              " Requested",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            )
                                                          ],
                                                        ),
                                                        Row(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,

                                                          children: [
                                                            Padding(
                                                              padding:
                                                              const EdgeInsets
                                                                  .all(
                                                                  8.0),
                                                              child:
                                                              Container(
                                                                width: width *
                                                                    .3,
                                                                child: Stack(
                                                                  children: [
                                                                    Positioned(
                                                                      right:
                                                                      30,
                                                                      child:
                                                                      CircleAvatar(
                                                                        radius:
                                                                        30.0,
                                                                        backgroundImage: CachedNetworkImageProvider(
                                                                            anotheruser!
                                                                                .imgPath
                                                                                .toString()

                                                                        ),
                                                                        backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                        decoration:
                                                                        BoxDecoration(
                                                                          shape:
                                                                          BoxShape
                                                                              .circle,
                                                                          border: Border
                                                                              .all(
                                                                              color: Colors
                                                                                  .white,
                                                                              width: 2),
                                                                        ),
                                                                        child:
                                                                        CircleAvatar(
                                                                          radius:
                                                                          30.0,
                                                                          backgroundImage: CachedNetworkImageProvider(
                                                                              requestHomeController
                                                                                  .seekerHomeRequestValue
                                                                                  .value
                                                                                  .requests!
                                                                                  .outgoing![index].getmaker!.imgPath.toString()

                                                                          ),
                                                                          backgroundColor:
                                                                          Colors
                                                                              .transparent,
                                                                        )
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                            Column(
                                                              children: [
                                                                SizedBox(
                                                                  height:
                                                                  Get.height *
                                                                      0.02,
                                                                ),
                                                                Column(
                                                                  children: [
                                                                    Container(
                                                                      width: Get.width*0.3,
                                                                      child:
                                                                      Text(
                                                                        requestHomeController
                                                                            .seekerHomeRequestValue
                                                                            .value
                                                                            .requests!
                                                                            .outgoing![index].getmaker!.name.toString(),

                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .pink,
                                                                            fontSize:
                                                                            12,
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .bold),
                                                                        overflow: TextOverflow.ellipsis,
                                                                      ),
                                                                    ),Container(
                                                                        width: Get.width*0.3,
                                                                        child:
                                                                        Text(
                                                                          anotheruser!
                                                                              .name
                                                                              .toString(),

                                                                          style: TextStyle(
                                                                              color: Colors
                                                                                  .pink,
                                                                              fontSize:
                                                                              12,
                                                                              fontWeight:
                                                                              FontWeight
                                                                                  .bold),
                                                                          overflow: TextOverflow.ellipsis,
                                                                        )
                                                                    ),
                                                                  ],
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                  Get.height *
                                                                      0.01,
                                                                ),
                                                                Text(
                                                                  createdAtString

                                                                  ,
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                )
                                                              ],
                                                            )
                                                          ],
                                                        )
                                                      ],
                                                    ))),
                                          ),
                                          onTap: () {
//                                             setState(() {
//                                               requestype = "2";
//                                             });
//                                             // requestid = controller
//                                             //     .OutgoingRequestvalue
//                                             //     .value
//                                             //     .requests![index]
//                                             //     .id
//                                             //     .toString();
// print(requestid);
//                                             if (requestid != null) {
//                                               print(requestid);
//                                               Get.to(ChatPage());
//                                             }
                                            print(requestHomeController
                                                .seekerHomeRequestValue.value
                                                .requests!.outgoing![index]
                                                .id);

                                          requestid = requestHomeController
                                                .seekerHomeRequestValue.value
                                                .requests!.outgoing![index].id
                                                .toString();

                                            print(requestid);
                                            Get.to(
                                                SeekerOutGoingRequestSinglePage());
                                          },
                                        ) :CircularProgressIndicator();
                                      },
                                    )

                                ) ,
                                //
                                //     : Column(
                                //   children: [
                                //     Image.asset(
                                //       'assets/images/recentmatchempt.png',
                                //       width: Get.width * 0.83,
                                //     ),
                                //     Text(
                                //       "Reference site about Lorem Ipsum, giving information on its origins",
                                //       style: Get.theme.textTheme.bodySmall,
                                //       textAlign: TextAlign.center,
                                //     )
                                //   ],
                                // )
                              ],
                            ),
                          )
                        ]),
                  ));
          }

          // final recentmachesstatus =
          //     recentSeekerMatchesController.rxRequestStatus.value;
          // // if (recentmachesstatus == Status.ERROR

          //     ) {
          //   if (recentSeekerMatchesController.error.value == 'No internet' ) {
          //     return InterNetExceptionWidget(
          //       onPress: () {
          //         // questionsViewModal.refreshApi();
          //         // myProfileView_vm.refreshApi();
          //       },
          //     );
          //   }
          //   else {
          //     if (recentSeekerMatchesController
          //                 .RecentSeekerMatchValue.value.status ==
          //             'failed') {
          //       return Column(
          //         children: [
          //           Container(
          //             child: Center(
          //               child: Container(
          //                 child: Column(
          //                   children: [
          //                     SizedBox(
          //                       height: Get.height * 0.01,
          //                     ),
          //                     Align(
          //                         alignment: Alignment.center,
          //                         child: GestureDetector(
          //                             onTap: () {
          //                               Get.to(Chose_Role_Type());
          //                             },
          //                             child: Image.asset(
          //                                 'assets/images/match.png'))),
          //                     SizedBox(
          //                       height: Get.height * 0.1,
          //                     ),
          //                     Container(
          //                       height: Get.height * .3,
          //                       width: Get.width * .9,
          //                       decoration: BoxDecoration(
          //                           image: DecorationImage(
          //                               image: AssetImage(
          //                                   "assets/images/skikerhomeempty.png"))),
          //                     ),
          //                     SizedBox(
          //                       height: Get.height * 0.02,
          //                     ),
          //                     Text(
          //                       "Outgoing Request",
          //                       style: TextStyle(
          //                           color: Colors.black, fontSize: 18),
          //                     ),
          //                     SizedBox(
          //                       height: Get.height * 0.02,
          //                     ),
          //                     Text(
          //                       "Find your perfect match",
          //                       style: TextStyle(
          //                           color: Colors.black,
          //                           fontSize: 18,
          //                           fontWeight: FontWeight.bold),
          //                     ),
          //                     SizedBox(
          //                       height: Get.height * 0.02,
          //                     ),
          //                     MyButton(
          //                         title: "Find Match",
          //                         onTap: () {
          //                           Get.to(Chose_Role_Type());
          //                         })
          //                   ],
          //                 ),
          //               ),
          //             ),
          //           ),
          //         ],
          //       );
          //     }
          //     return HomeScreenWIdget();
          //   }
          // } else if (recentmachesstatus == Status.LOADING ) {
          //   return Center(child: CircularProgressIndicator());
          // } else {
        }
            }
          )),
    );
  }

  List images = [
    "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
    "https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg"
  ];
}
