import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/match_maker/Create_Match/Create_Match.dart';
import 'package:cupid_match/match_maker/chat_screen.dart';
import 'package:cupid_match/match_maker/invite_state.dart';
import 'package:cupid_match/match_maker/new_matches.dart';
import 'package:cupid_match/match_maker/payment_info.dart';
import 'package:cupid_match/match_maker/pending_matches.dart';
import 'package:cupid_match/match_maker/premium.dart';
import 'package:cupid_match/match_maker/profile_maker.dart';
import 'package:cupid_match/match_maker/recent_conversations.dart';
import 'package:cupid_match/match_maker/recent_maker_matches_view_all.dart';
import 'package:cupid_match/match_maker/recent_matches.dart';
import 'package:cupid_match/match_maker/request_matches.dart';
import 'package:cupid_match/match_maker/Chose_Subcription.dart';
import 'package:cupid_match/match_seeker/chat_screen.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/MakerDrawer.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:new_pinput/new_pinput.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:math' as math;

import '../GlobalVariable/GlobalVariable.dart';
import '../controllers/MakerGetMyProfileDetails/MakerGetProfileDetailsController.dart';
import '../controllers/MakerHomePageController/MakerHomePageController.dart';
import '../controllers/controller/IncomingMakerRequestController/incoming_maker_request_ controller.dart';
import '../controllers/controller/MakerRecentMatchesController/maker_recent_matches_controller.dart';
import '../controllers/controller/OutgoingMakerRequestController/outgoing_maker_request_controller.dart';
import '../controllers/controller/ViewMakerProfileDetailsController/ViewMakerProfileDetailscontroller.dart';
import '../data/response/status.dart';
import '../match_seeker/Chose_role_Type.dart';
import '../match_seeker/Requests/IncomingRequest.dart';
import '../match_seeker/Requests/outgoingRequest.dart';
import '../res/components/general_exception.dart';
import '../res/components/internet_exceptions_widget.dart';
import '../views/splash_screen.dart';
import 'makerRequest/MakerRecentSingleRequstPage.dart';
import 'makerRequest/MakerSingleIncomingRequest.dart';
import 'makerRequest/incoming_maker_rqt.dart';
import 'makerRequest/outgoin_maker_rqt.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // IncomingMakerRequestController incomingMakerRequestController =
  //     Get.put(IncomingMakerRequestController());
  RecentMakerMatchesController recentMakerMatchesController =
      Get.put(RecentMakerMatchesController());

  //
  MakerHomePageRequestController makerRequestController =
      Get.put(MakerHomePageRequestController());
  final ViewMakerProfileDetailsControllerinstance=Get.put(ViewMakerMyProfileDetailsController());


  @override
  void initState() {
    makerRequestController.makerListApi();
    recentMakerMatchesController.isrecentMakerMatchApi();
    ViewMakerProfileDetailsControllerinstance.ViewMakerProfileDetailsApiHit();

    super.initState();

    // outgoingMakerRequestController.isOutgoingMakerRequestApi();
  }

  int x = 5;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      onRefresh: () async {
        makerRequestController.makerListApi();
        recentMakerMatchesController.isrecentMakerMatchApi();
        ViewMakerProfileDetailsControllerinstance.ViewMakerProfileDetailsApiHit();
      },
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: Text(
              "Home",
              style: Theme.of(context).textTheme.titleSmall,
            ),
            actions: [
              Builder(
                builder: (context) {
                  return GestureDetector(
                      onTap: () async {
                        Scaffold.of(context).openEndDrawer();
                        MaterialLocalizations.of(context).openAppDrawerTooltip;
                        // final SharedPreferences sp =
                        //     await SharedPreferences.getInstance();

                        // Delete the cached data when the user logs out

                        // sp.remove("BarearToken");

                        // You can also clear all data in the storage if needed
                        // box.erase();

                        // Add any other logout logic you have here
                        // Get.off(SplashScreen());
                        // print("Logged out successfully");
                      },
                      child: Image.asset("assets/icons/menu.png"));
                },
              )
            ],
          ),
          endDrawer: Drawer(child: MakerDrawer()),
          body: SingleChildScrollView(child: Obx(() {

      final myProfileStatus = recentMakerMatchesController.rxRequestStatus.value;

      final questionsStatus = makerRequestController.rxRequestStatus.value;
      if (myProfileStatus == Status.ERROR ||
      questionsStatus == Status.ERROR) {
      if (recentMakerMatchesController.rxRequestStatus.value == 'No internet' ||
          makerRequestController.rxRequestStatus.value == 'No internet') {
      return InterNetExceptionWidget(
      onPress: () {
        recentMakerMatchesController.refreshApi();
        makerRequestController.refreshApi();
      },
      );
      } else {
      return GeneralExceptionWidget(onPress: () {
        recentMakerMatchesController.refreshApi();
      makerRequestController.refreshApi();
      });
      }
      } else if (myProfileStatus == Status.LOADING ||
      questionsStatus == Status.LOADING) {
      return Container(
        height: Get.height *0.9,
        child: Center(
        child: CircularProgressIndicator(
        color: Colors.pink,
        )),
      );
      } else {
        if (recentMakerMatchesController
            .RecentMakerMatchesValue.value.message ==
            'No request found' &&
            makerRequestController.makerHomePageValue.value.message ==
                'No request found') {
          return RefreshIndicator(
            onRefresh: () async{
              makerRequestController.makerListApi();
              recentMakerMatchesController.isrecentMakerMatchApi();
              ViewMakerProfileDetailsControllerinstance.ViewMakerProfileDetailsApiHit();
            },
            child: Column(
              children: [
                Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                        onTap: () {
                          Get.to(Chose_Role_Type());
                        },
                        child: Image.asset('assets/images/match.png'))),
                SizedBox(
                  height: Get.height * 0.05,
                ),
                Center(
                  child: Image.asset('assets/images/homeempty.png'),
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
                  style: Get.theme.textTheme.labelMedium!.copyWith(
                      fontWeight: FontWeight.w600, color: AppColors.black),
                ),
                SizedBox(
                  height: Get.height * 0.04,
                ),
                MyButton(
                    title: 'Find Match',
                    onTap: () {
                      Get.to(MatchScreen());
                    })
              ],
            ),
          );
        } else {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: height * 0.02),
                child: SingleChildScrollView(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                                onTap: () {
                                  Get.to(MatchScreen());
                                },
                                child: Image.asset(
                                    'assets/maker/Mask_group.png'))),
                        SizedBox(
                          height: height * 0.04,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  "Recent Matches",
                                  style:
                                  Theme
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
                                  Get.to(RecentMakerMatchesViewAll());
                                },
                                style: TextButton.styleFrom(),
                                child: Text(
                                  'ViewAll',
                                  style:
                                  Theme
                                      .of(context)
                                      .textTheme
                                      .bodySmall,
                                )),
                          ],
                        ),
                        // Align(
                        //   alignment: Alignment.centerLeft,
                        //   child: Text(
                        //     "But no conversation",
                        //     style: Theme.of(context)
                        //         .textTheme
                        //         .bodySmall
                        //         ?.copyWith(
                        //             color: AppColors.black, fontSize: 13),
                        //   ),
                        // ),
                        SizedBox(
                          height: height * .02,
                        ),

                        // Obx(() {
                        //   switch (recentMakerMatchesController
                        //       .rxRequestStatus.value) {
                        //     case Status.LOADING:
                        //       return const Center(
                        //           child: CircularProgressIndicator());
                        //     case Status.ERROR:
                        //       if (recentMakerMatchesController.error.value ==
                        //           'No internet') {
                        //         return InterNetExceptionWidget(
                        //           onPress: () {},
                        //         );
                        //       } else {
                        //         return GeneralExceptionWidget(onPress: () {});
                        //       }
                        //     case Status.COMPLETED:
                        recentMakerMatchesController
                            .RecentMakerMatchesValue
                            .value
                            .requests!.isEmpty||
                            recentMakerMatchesController
                                .RecentMakerMatchesValue
                                .value
                                .requests == [] ||
                            recentMakerMatchesController
                                .RecentMakerMatchesValue
                                .value
                                .requests!.length == 0 ||
                            recentMakerMatchesController
                                .RecentMakerMatchesValue
                                .value
                                .requests == null ?
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
                            ):
                        Container(
                          width: width,
                          height: height * .45,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: AlwaysScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: recentMakerMatchesController
                                .RecentMakerMatchlength,
                            itemBuilder: (context, index) {
                              return InkWell(
                                  child: Container(
                                    width: width * .45,
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.all(8.0),
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
                                                angle: (math.pi / 390) *
                                                    11,
                                                origin: Offset(
                                                    -190.0, 760.0),
                                                child: Container(
                                                  height: height * .2,
                                                  width: width * .2,
                                                  decoration:
                                                  BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        22),
                                                    image: DecorationImage(
                                                        image: CachedNetworkImageProvider(
                                                            recentMakerMatchesController
                                                                .RecentMakerMatchesValue
                                                                .value
                                                                .requests![
                                                            index]
                                                                .getseeker!
                                                                .imgPath
                                                                .toString()),
                                                        fit: BoxFit
                                                            .cover),
                                                  ),
                                                ),
                                              ),
                                              Transform.rotate(
                                                angle: (math.pi / 850) *
                                                    -40,
                                                origin: Offset(
                                                    520.0, -80.0),
                                                child: Container(
                                                  height: height * .2,
                                                  width: width * .2,
                                                  decoration:
                                                  BoxDecoration(
                                                    image: DecorationImage(
                                                        image: CachedNetworkImageProvider(
                                                            recentMakerMatchesController
                                                                .RecentMakerMatchesValue
                                                                .value
                                                                .requests![
                                                            index]
                                                                .getanotherseeker!
                                                                .imgPath
                                                                .toString()),
                                                        fit: BoxFit
                                                            .cover),
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        22),
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
                                                color:
                                                AppColors.red),
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
                                      requestid = null;
                                    });

                                    requestid =
                                        recentMakerMatchesController
                                            .RecentMakerMatchesValue
                                            .value
                                            .requests![index]!.id
                                            .toString();
                                    print(requestid);

                                    if (requestid != null) {
                                      print(requestid);
                                      Get.to(SingleRecentPageRequest());
                                    }
                                  });
                            },
                          ),
                        ) ,
                        //   }
                        // }),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  style:
                                  Theme
                                      .of(context)
                                      .textTheme
                                      .bodySmall,
                                )),
                          ],
                        ),

                        SizedBox(
                          height: height * 0.02,
                        ),

                        Container(
                          width: width,
                          height: height * .12,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: AlwaysScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 2,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                        color: AppColors.ratingcodeColor,
                                        borderRadius:
                                        BorderRadius.circular(15)),
                                    width: width * .65,
                                    // height: 50,
                                    child: ListTile(
                                      leading: Container(
                                        width: width * .08,
                                        height: height * 0.05,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: images.length >= 3
                                              ? 3
                                              : images.length,
                                          shrinkWrap: true,
                                          reverse: true,
                                          itemBuilder: (context, index) {
                                            return Align(
                                              alignment:
                                              Alignment.centerRight,
                                              widthFactor: 0.3,
                                              child: CircleAvatar(
                                                radius: 18,
                                                backgroundColor:
                                                AppColors.white,
                                                child: CircleAvatar(
                                                  radius: 16,
                                                  backgroundImage:
                                                  NetworkImage(
                                                      images[index]),
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                      title: Text(
                                        "Name",
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                            color: AppColors.black),
                                      ),
                                      subtitle: Text(
                                        "25/05/2022",
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .bodyLarge
                                            ?.copyWith(
                                            fontSize: 10,
                                            color: AppColors.black),
                                      ),
                                      trailing: GestureDetector(
                                          onTap: () =>
                                              Get.to(() => ChatPage()),
                                          child: Image.asset(
                                            "assets/maker/Group 221.png",
                                            width: width * 0.09,
                                          )),
                                    )),
                              );
                            },
                          ),
                        ),
                        //********************** Incoming Request ************
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Incoming Request",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleLarge,
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(IncomingMakerRequest());

                                  print("abcdaa");
                                },
                                child: Text(
                                  'View All',
                                  style:
                                  Theme
                                      .of(context)
                                      .textTheme
                                      .bodySmall,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        // Obx(() {
                        //   switch (
                        //       makerRequestController.rxRequestStatus.value) {
                        //     case Status.LOADING:
                        //       return const Center(
                        //           child: CircularProgressIndicator());
                        //     case Status.ERROR:
                        //       if (makerRequestController.error.value ==
                        //           'No internet') {
                        //         return InterNetExceptionWidget(
                        //           onPress: () {},
                        //         );
                        //       } else {
                        //         return GeneralExceptionWidget(onPress: () {});
                        //       }
                        //     case Status.COMPLETED:

                            makerRequestController
                                .makerHomePageValue
                                .value
                                .requests!
                                .incoming!.length ==
                                0
                            ?
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

                            ):
                        Container(
                            width: width,
                            height: height * .18,
                            child:
                            ListView.builder(
                              scrollDirection: Axis.horizontal,
                              physics:
                              AlwaysScrollableScrollPhysics(),
                              // shrinkWrap: true,
                              itemCount: makerRequestController
                                  .makerHomePageValue
                                  .value
                                  .requests!
                                  .incoming!
                                  .length,
                              itemBuilder: (context, index) {
                                String createdAtString =makerRequestController
                                    .makerHomePageValue
                                    .value
                                    .requests!
                                    .incoming![index].createdAt.toString();
                                DateTime createdAt = DateTime.parse(createdAtString);
                                String formattedDate = DateFormat('d/MM/yyyy').format(createdAt);
                                if (makerRequestController
                                    .makerHomePageValue
                                    .value
                                    .requests!
                                    .incoming![index]
                                    .getanotherseeker !=null) {
                                  return InkWell(
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.all(
                                          8.0),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors
                                                  .ratingcodeColor,
                                              borderRadius:
                                              BorderRadius
                                                  .circular(
                                                  15)),
                                          width: width * .65,
                                          child: x == 5
                                              ? InkWell(
                                            child:
                                            Container(
                                                child:
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .only(
                                                              left: 20,
                                                              top: 10,
                                                              bottom: 10),
                                                          child:
                                                          Text(
                                                            "Maker ",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .pink),
                                                          ),
                                                        ),
                                                        Text(
                                                          " Requested",
                                                          style:
                                                          TextStyle(color: Colors
                                                              .black),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                          child:
                                                          Container(
                                                            width: width * .21,
                                                            child: Stack(
                                                              children: [
                                                                makerRequestController
                                                                    .makerHomePageValue
                                                                    .value
                                                                    .requests!
                                                                    .incoming![index]
                                                                    .getanotherseeker!
                                                                    .imgPath !=
                                                                    null||makerRequestController
                                                                    .makerHomePageValue
                                                                    .value
                                                                    .requests!
                                                                    .incoming![index]
                                                                    .getanotherseeker!
                                                                    .imgPath !=[]
                                                                    ? CircleAvatar(
                                                                  backgroundImage: CachedNetworkImageProvider(
                                                                      makerRequestController
                                                                          .makerHomePageValue
                                                                          .value
                                                                          .requests!
                                                                          .incoming![index]
                                                                          .getanotherseeker!
                                                                          .imgPath
                                                                          .toString()),
                                                                  radius: 30,
                                                                  backgroundColor: AppColors
                                                                      .white,
                                                                )
                                                                    : CircleAvatar(
                                                                  radius: 30.0,
                                                                  backgroundColor: Colors
                                                                      .transparent,
                                                                  backgroundImage: NetworkImage(
                                                                      'https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                                                                ),
                                                                Positioned(
                                                                  left: 25,
                                                                  child:makerRequestController
                                                                      .makerHomePageValue
                                                                      .value
                                                                      .requests!
                                                                      .incoming![
                                                                  index]
                                                                      .getseeker!
                                                                      .imgPath !=null ?
                                                                  CircleAvatar(
                                                                    backgroundImage: CachedNetworkImageProvider(
                                                                        makerRequestController
                                                                            .makerHomePageValue
                                                                            .value
                                                                            .requests!
                                                                            .incoming![
                                                                        index]
                                                                            .getseeker!
                                                                            .imgPath
                                                                            .toString()),
                                                                    radius: 30,
                                                                    backgroundColor:
                                                                    AppColors
                                                                        .white,
                                                                  ):CircleAvatar(
                                                                    radius: 30.0,
                                                                    backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                    backgroundImage:
                                                                    NetworkImage(
                                                                        'https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                          Get.width * 0.08,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          // mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                            SizedBox(
                                                              height: Get.height *
                                                                  0.02,
                                                            ),
                                                            Column(
                                                              // crossAxisAlignment: CrossAxisAlignment.center,
                                                              // mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                Container(
                                                                  width: Get.width*0.3,
                                                                  child: Text(
                                                                    makerRequestController
                                                                        .makerHomePageValue
                                                                        .value.requests!
                                                                        .incoming![index]
                                                                        .getanotherseeker!
                                                                        .name
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .pink,
                                                                        fontSize: 15,
                                                                        fontWeight: FontWeight
                                                                            .bold),
                                                                    overflow: TextOverflow.ellipsis,
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: Get.width*0.3,
                                                                  child: Text(
                                                                    makerRequestController
                                                                        .makerHomePageValue
                                                                        .value.requests!
                                                                        .incoming![index]
                                                                        .getseeker!
                                                                        .name
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .pink,
                                                                        fontSize: 15,
                                                                        fontWeight: FontWeight
                                                                            .bold),
                                                                    overflow: TextOverflow.ellipsis,
                                                                  ),

                                                                ),

                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: Get.height *
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
                                                )),
                                          )
                                              : Container(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        height:
                                                        Get.height * 0.04,
                                                      ),
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets.only(
                                                          left:
                                                          20,
                                                        ),
                                                        child:
                                                        Text(
                                                          "Seeker &",
                                                          style:
                                                          TextStyle(color: Colors
                                                              .black),
                                                        ),
                                                      ),
                                                      Text(
                                                        "Maker",
                                                        style:
                                                        TextStyle(
                                                            color: Colors.pink),
                                                      ),
                                                      Text(
                                                        " Requested",
                                                        style:
                                                        TextStyle(
                                                            color: Colors.black),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets
                                                            .all(
                                                            8.0),
                                                        child:
                                                        Container(
                                                          width:
                                                          width * .29,
                                                          child:
                                                          Stack(
                                                            children: [
                                                              Positioned(
                                                                right: 25,
                                                                child: CircleAvatar(
                                                                  radius: 30.0,
                                                                  backgroundColor: Colors
                                                                      .transparent,
                                                                  backgroundImage: NetworkImage(
                                                                      'https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                                                                ),
                                                              ),
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  border: Border
                                                                      .all(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2),
                                                                ),
                                                                child: CircleAvatar(
                                                                  backgroundImage: NetworkImage(
                                                                      'https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                                                                  radius: 30.0,
                                                                  backgroundColor: Colors
                                                                      .transparent,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      // Column(
                                                      //   children: [
                                                      //     SizedBox(
                                                      //       height: Get.height *
                                                      //           0.02,
                                                      //     ),
                                                      //     Text(
                                                      //       "hhh",
                                                      //       style: TextStyle(
                                                      //           color: Colors
                                                      //               .pink,
                                                      //           fontSize: 20,
                                                      //           fontWeight: FontWeight
                                                      //               .bold),
                                                      //     ),
                                                      //     SizedBox(
                                                      //       height: Get.height *
                                                      //           0.01,
                                                      //     ),
                                                      //     Text(
                                                      //       "mmnnhnn",
                                                      //       style: TextStyle(
                                                      //           color: Colors
                                                      //               .black),
                                                      //     )
                                                      //   ],
                                                      // )
                                                    ],
                                                  )
                                                ],
                                              ))),
                                    ),
                                    onTap: () {
                                      // setState(() {
                                      //   requestype = "1";
                                      // });
                                      setState(() {
                                        requestid = null;
                                      });
                                      requestid =
                                          makerRequestController
                                              .makerHomePageValue
                                              .value
                                              .requests!
                                              .incoming![index]
                                              .id
                                              .toString();

                                      print(requestid);

                                      if (requestid != null) {
                                        print(requestid);
                                        Get.to(MakerSingleRequstPage(
                                            title:
                                            'Incoming Request'));
                                      }
                                      print("makerrequest");
                                    },
                                  );
                                }
                                else{
                               return   InkWell(
                                    child: Padding(
                                      padding:
                                      const EdgeInsets.all(
                                          8.0),
                                      child: Container(
                                          decoration: BoxDecoration(
                                              color: AppColors
                                                  .ratingcodeColor,
                                              borderRadius:
                                              BorderRadius
                                                  .circular(
                                                  15)),
                                          width: width * .65,
                                          child: x == 5
                                              ? InkWell(
                                            child:
                                            Container(
                                                child:
                                                Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Padding(
                                                          padding: const EdgeInsets
                                                              .only(
                                                              left: 20,
                                                              top: 10,
                                                              bottom: 10),
                                                          child:
                                                          Text(
                                                            "Maker ",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .pink),
                                                          ),
                                                        ),
                                                        Text(
                                                          " Requested",
                                                          style:
                                                          TextStyle(color: Colors
                                                              .black),
                                                        )
                                                      ],
                                                    ),
                                                    Row(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                          child:
                                                          Container(
                                                            width: width * .21,
                                                            child: Stack(
                                                              children: [
                                                                makerRequestController
                                                                    .makerHomePageValue
                                                                    .value
                                                                    .requests!
                                                                    .incoming![index]
                                                                    .getseeker!
                                                                    .imgPath !=null
                                                                    ? CircleAvatar(
                                                                  backgroundImage: CachedNetworkImageProvider(
                                                                      makerRequestController
                                                                          .makerHomePageValue
                                                                          .value
                                                                          .requests!
                                                                          .incoming![index]
                                                                          .getseeker!
                                                                          .imgPath
                                                                          .toString()),
                                                                  radius: 30,
                                                                  backgroundColor: AppColors
                                                                      .white,
                                                                )
                                                                    : CircleAvatar(
                                                                  radius: 30.0,
                                                                  backgroundColor: Colors
                                                                      .transparent,
                                                                  backgroundImage: NetworkImage(
                                                                      'https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                                                                ),
                                                                // Positioned(
                                                                //   left: 25,
                                                                //   child:makerRequestController
                                                                //       .makerHomePageValue
                                                                //       .value
                                                                //       .requests!
                                                                //       .incoming![
                                                                //   index]
                                                                //       .getanotherseeker!
                                                                //       .imgPath !=null ?
                                                                //   CircleAvatar(
                                                                //     backgroundImage: CachedNetworkImageProvider(
                                                                //         makerRequestController
                                                                //             .makerHomePageValue
                                                                //             .value
                                                                //             .requests!
                                                                //             .incoming![
                                                                //         index]
                                                                //             .getanotherseeker!
                                                                //             .imgPath
                                                                //             .toString()),
                                                                //     radius: 30,
                                                                //     backgroundColor:
                                                                //     AppColors
                                                                //         .white,
                                                                //   ):CircleAvatar(
                                                                //     radius: 30.0,
                                                                //     backgroundColor:
                                                                //     Colors
                                                                //         .transparent,
                                                                //     backgroundImage:
                                                                //     NetworkImage(
                                                                //         'https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                                                                //   ),
                                                                // ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width:
                                                          Get.width * 0.01,
                                                        ),
                                                        Column(
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            SizedBox(
                                                              height: Get.height *
                                                                  0.02,
                                                            ),
                                                            Text(
                                                              makerRequestController
                                                                  .makerHomePageValue
                                                                  .value.requests!
                                                                  .incoming![index]
                                                                  .getseeker!
                                                                  .name
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .pink,
                                                                  fontSize: 15,
                                                                  fontWeight: FontWeight
                                                                      .bold),
                                                            ),
                                                            SizedBox(
                                                              height: Get.height *
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
                                                )),
                                          )
                                              : Container(
                                              child: Column(
                                                children: [
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        height:
                                                        Get.height * 0.04,
                                                      ),
                                                      Padding(
                                                        padding:
                                                        const EdgeInsets.only(
                                                          left:
                                                          20,
                                                        ),
                                                        child:
                                                        Text(
                                                          "Seeker &",
                                                          style:
                                                          TextStyle(color: Colors
                                                              .black),
                                                        ),
                                                      ),
                                                      Text(
                                                        "Maker",
                                                        style:
                                                        TextStyle(
                                                            color: Colors.pink),
                                                      ),
                                                      Text(
                                                        " Requested",
                                                        style:
                                                        TextStyle(
                                                            color: Colors.black),
                                                      )
                                                    ],
                                                  ),
                                                  Row(
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start,
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                    children: [
                                                      Padding(
                                                        padding: const EdgeInsets
                                                            .all(
                                                            8.0),
                                                        child:
                                                        Container(
                                                          width:
                                                          width * .29,
                                                          child:
                                                          Stack(
                                                            children: [
                                                              Positioned(
                                                                right: 15,
                                                                child: CircleAvatar(
                                                                  radius: 30.0,
                                                                  backgroundColor: Colors
                                                                      .transparent,
                                                                  backgroundImage: NetworkImage(
                                                                      'https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                                                                ),
                                                              ),
                                                              Container(
                                                                decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  border: Border
                                                                      .all(
                                                                      color: Colors
                                                                          .white,
                                                                      width: 2),
                                                                ),
                                                                child: CircleAvatar(
                                                                  backgroundImage: NetworkImage(
                                                                      'https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                                                                  radius: 30.0,
                                                                  backgroundColor: Colors
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
                                                            height: Get.height *
                                                                0.02,
                                                          ),
                                                          Text(
                                                            "hhh",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .pink,
                                                                fontSize: 20,
                                                                fontWeight: FontWeight
                                                                    .bold),
                                                          ),
                                                          SizedBox(
                                                            height: Get.height *
                                                                0.01,
                                                          ),
                                                          Text(
                                                            "mmnnhnn",
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
                                      // setState(() {
                                      //   requestype = "1";
                                      // });
                                      setState(() {
                                        requestid = null;
                                      });
                                      requestid =
                                          makerRequestController
                                              .makerHomePageValue
                                              .value
                                              .requests!
                                              .incoming![index]
                                              .id
                                              .toString();

                                      print(requestid);

                                      if (requestid != null) {
                                        print(requestid);
                                        Get.to(MakerSingleRequstPage(
                                            title:
                                            'Incoming Request'));
                                      }
                                      print("makerrequest");
                                    },
                                  );
                                }

                              },
                            )),
                        //   }
                        // }),
                        SizedBox(
                          height: height * 0.02,
                        ),

                        //********************** Outgoing Matches ************

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Outgoing Request",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleLarge,
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(OutgoingMakerRequest());
                                },
                                child: Text(
                                  'View All',
                                  style:
                                  Theme
                                      .of(context)
                                      .textTheme
                                      .bodySmall,
                                )),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),

                        // Obx(() {
                        //   switch (
                        //       makerRequestController.rxRequestStatus.value) {
                        //     case Status.LOADING:
                        //       return const Center(
                        //           child: CircularProgressIndicator());
                        //     case Status.ERROR:
                        //       if (makerRequestController.error.value ==
                        //           'No internet') {
                        //         return InterNetExceptionWidget(
                        //           onPress: () {},
                        //         );
                        //       } else {
                        //         return GeneralExceptionWidget(onPress: () {});
                        //       }
                        //     case Status.COMPLETED:
                        makerRequestController
                            .makerHomePageValue
                            .value
                            .requests!
                            .outgoing!.isEmpty||

                            makerRequestController
                                .makerHomePageValue
                                .value
                                .requests!
                                .outgoing ==
                                [] ||
                            makerRequestController
                                .makerHomePageValue
                                .value
                                .requests!
                                .outgoing!.length ==
                                0
                            ?
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
                            ):
                        Container(
                          width: width,
                          height: height * .18,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: AlwaysScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:  makerRequestController
                                .makerHomePageValue
                                .value
                                .requests!
                                .outgoing!.length,
                            itemBuilder: (context, index) {
                              String createdAtString = makerRequestController
                                  .makerHomePageValue
                                  .value
                                  .requests!
                                  .outgoing![index].createdAt.toString();
                              DateTime createdAt = DateTime.parse(createdAtString);
                              String formattedDate = DateFormat('d/MM/yyyy').format(createdAt);
                              return makerRequestController
                                  .makerHomePageValue
                                  .value
                                  .requests!
                                  .outgoing![index].getanotherseeker!=null&& makerRequestController
                                  .makerHomePageValue
                                  .value
                                  .requests!
                                  .outgoing![index].getseeker!=null ?InkWell(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color:
                                          AppColors.ratingcodeColor,
                                          borderRadius:
                                          BorderRadius.circular(
                                              15)),
                                      width: width * .65,
                                      child: makerRequestController
                                          .makerHomePageValue
                                          .value
                                          .requests!
                                          .outgoing![index]
                                          .getmaker ==
                                          null
                                          ? InkWell(
                                        child: Container(
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
                                                          top: 10,
                                                          bottom:
                                                          10),
                                                      child: Text(
                                                        "Maker ",
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
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
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
                                                            .21,
                                                        child: Stack(
                                                          children: [
                                                            makerRequestController
                                                                .makerHomePageValue
                                                                .value.requests!
                                                                .outgoing![index]
                                                                .getanotherseeker!
                                                                .imgPath !=
                                                                null
                                                                ? CircleAvatar(
                                                              backgroundImage: CachedNetworkImageProvider(
                                                                  makerRequestController
                                                                      .makerHomePageValue
                                                                      .value
                                                                      .requests!
                                                                      .outgoing![index]
                                                                      .getanotherseeker!
                                                                      .imgPath
                                                                      .toString()),
                                                              radius: 30,
                                                              backgroundColor: AppColors
                                                                  .white,
                                                            )
                                                                : CircleAvatar(
                                                              backgroundImage: NetworkImage(
                                                                  'https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                                                              radius: 30.0,
                                                              backgroundColor: Colors
                                                                  .transparent,
                                                            ),
                                                            Positioned(
                                                              left:
                                                              25,
                                                              child: makerRequestController
                                                                  .makerHomePageValue
                                                                  .value.requests!
                                                                  .outgoing![index]
                                                                  .getseeker!
                                                                  .imgPath !=
                                                                  null
                                                                  ? CircleAvatar(
                                                                backgroundImage: CachedNetworkImageProvider(
                                                                    makerRequestController
                                                                        .makerHomePageValue
                                                                        .value
                                                                        .requests!
                                                                        .outgoing![index]
                                                                        .getseeker!
                                                                        .imgPath
                                                                        .toString()),
                                                                radius: 30,
                                                                backgroundColor: AppColors
                                                                    .white,
                                                              )
                                                                  : CircleAvatar(
                                                                backgroundImage: NetworkImage(
                                                                    'https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                                                                radius: 30.0,
                                                                backgroundColor: Colors
                                                                    .transparent,
                                                              ),
                                                            ),
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
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                      children: [
                                                        SizedBox(
                                                          height:
                                                          Get.height *
                                                              0.02,
                                                        ),
                                                        Text(
                                                          "Maker Name",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .pink,
                                                              fontSize:
                                                              20,
                                                              fontWeight:
                                                              FontWeight.bold),

                                                        ),
                                                        SizedBox(
                                                          height:
                                                          Get.height *
                                                              0.01,
                                                        ),
                                                        Text(
                                                          "12/12/12",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black),
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
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                    const EdgeInsets
                                                        .all(8.0),
                                                    child: Container(
                                                      width:
                                                      width * .29,
                                                      child: Stack(
                                                        children: [
                                                          Positioned(
                                                            right: 25,
                                                            child:
                                                            CircleAvatar(
                                                              radius:
                                                              30.0,
                                                              backgroundColor:
                                                              Colors.transparent,
                                                              backgroundImage: CachedNetworkImageProvider(
                                                                  makerRequestController
                                                                      .makerHomePageValue
                                                                      .value
                                                                      .requests!
                                                                      .outgoing![index]
                                                                      .getseeker!
                                                                      .imgPath
                                                                      .toString()),
                                                            ),
                                                          ),
                                                          Container(
                                                            decoration:
                                                            BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              border: Border.all(
                                                                  color:
                                                                  Colors.white,
                                                                  width: 2),
                                                            ),
                                                            child:
                                                            CircleAvatar(
                                                              backgroundImage: CachedNetworkImageProvider(
                                                                  makerRequestController
                                                                      .makerHomePageValue
                                                                      .value
                                                                      .requests!
                                                                      .outgoing![index]
                                                                      .getanotherseeker!
                                                                      .imgPath
                                                                      .toString()),
                                                              radius:
                                                              30.0,
                                                              backgroundColor:
                                                              Colors.transparent,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                                            child: Text(
                                                              makerRequestController
                                                                  .makerHomePageValue
                                                                  .value
                                                                  .requests!
                                                                  .outgoing![
                                                              index]
                                                                  .getanotherseeker!
                                                                  .name
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .pink,
                                                                  fontSize:
                                                                  15,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ),
                                                          Container(
                                                            width: Get.width*0.3,
                                                            child: Text(
                                                              makerRequestController
                                                                  .makerHomePageValue
                                                                  .value
                                                                  .requests!
                                                                  .outgoing![
                                                              index]
                                                                  .getseeker!
                                                                  .name
                                                                  .toString(),
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .pink,
                                                                  fontSize:
                                                                  15,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                              overflow: TextOverflow.ellipsis,
                                                            ),
                                                          ),
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
                                  setState(() {
                                    requestid = null;
                                  });

                                  requestid = makerRequestController
                                      .makerHomePageValue
                                      .value
                                      .requests!
                                      .outgoing![index]
                                      .id
                                      .toString();
                                  print(requestid);

                                  if (requestid != null) {
                                    print(requestid);
                                    Get.to(MakerSingleRequstPage(
                                      title: 'Outgoing Request',
                                    ));
                                  }
                                  print("makerrequest");
                                },
                              ):SizedBox();
                            },
                          ),
                        ) ,

                      ]),
                ),
              ),
            ],
          );
        }
      }




          }))),
    );
    // }
  }

  List images = [
    "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
    "https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg"
  ];
}
