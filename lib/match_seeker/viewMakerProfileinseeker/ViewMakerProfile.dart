import 'package:cupid_match/controllers/controller/ViewMakerProfileDetailsController/ViewMakerProfileDetailscontroller.dart';
import 'package:cupid_match/controllers/controller/ViewProfileDetailsController/ViewProfileDetailsController.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/res/components/general_exception.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/MakerDrawer.dart';
import 'package:cupid_match/widgets/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../GlobalVariable/GlobalVariable.dart';
import '../../controllers/controller/LikeListController/LikeController.dart';

class ViewMakerProfileInSeeker extends StatefulWidget {
  const ViewMakerProfileInSeeker({Key? key}) : super(key: key);

  @override
  State<ViewMakerProfileInSeeker> createState() =>
      _ViewMakerProfileInSeekerState();
}

class _ViewMakerProfileInSeekerState extends State<ViewMakerProfileInSeeker> {
  final ViewMakerProfileDetailsControllerinstance =
      Get.put(ViewMakerProfileDetailsController());
  var ListItem = [
    {"Name": "Matches Made", "Age": "26", "Image": "assets/maker/img_2.png"},
    {
      "Name": "Matches Sucessfull",
      "Age": "26",
      "Image": "assets/maker/img_3.png"
    },
    {
      "Name": "Matches Declined",
      "Age": "26",
      "Image": "assets/maker/img_4.png"
    },
    {
      "Name": "Matches Completed",
      "Age": "26",
      "Image": "assets/maker/img_5.png"
    },
    {
      "Name": "Maker Experience:",
      "Age": "26",
      "Image": "assets/maker/img_6.png"
    },
    {"Name": "Liked Profile", "Age": "26", "Image": "assets/maker/img_7.png"},
  ];

  bool _isPlaying = false;
  LikeController likeController = Get.put(LikeController());

  @override
  void initState() {
    // TODO: implement initState
    ViewMakerProfileDetailsControllerinstance.ViewMakerProfileDetailsApiHit();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      onRefresh: () async {
        ViewMakerProfileDetailsControllerinstance
            .ViewMakerProfileDetailsApiHit();
      },
      child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Text(
              "Profile",
              style: Theme.of(context).textTheme.titleLarge,
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
              SizedBox(
                width: Get.width * 0.02,
              )
            ],
          ),
          endDrawer: Drawer(child: MyDrawer()),
          body: Obx(() {
            switch (ViewMakerProfileDetailsControllerinstance
                .rxRequestStatus.value) {
              case Status.LOADING:
                return const Center(
                    child: CircularProgressIndicator(
                  color: Colors.pinkAccent,
                ));
              case Status.ERROR:
                if (ViewMakerProfileDetailsControllerinstance.error.value ==
                    'No internet') {
                  return InterNetExceptionWidget(
                    onPress: () {},
                  );
                } else {
                  return GeneralExceptionWidget(onPress: () {});
                }
              case Status.COMPLETED:
                return SingleChildScrollView(
                  child: Column(
                    // physics: NeverScrollableScrollPhysics(),

                    children: [
                      Stack(
                        children: [
                          Container(
                            height: height * 0.22,
                            width: width,
                            color: Colors.white,
                          ),
                          Container(
                            height: height * 0.1,
                            width: width,
                            color: Color(0xffF3F3F3),
                          ),
                          Positioned(
                            left: 115,
                            top: height * 0.03,
                            child: Container(
                              height: height * 0.18,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                radius: 50,
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundImage: NetworkImage(
                                    ViewMakerProfileDetailsControllerinstance
                                        .ViewProfileDetail
                                        .value
                                        .ProfileDetail!
                                        .imgPath
                                        .toString(),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 12,
                            left: Get.width * 0.42,
                            child: Container(
                              child: ViewMakerProfileDetailsControllerinstance
                                          .ViewProfileDetail
                                          .value
                                          .ProfileDetail!
                                          .lodding
                                          .value ==
                                      true
                                  ? CircleAvatar(
                                      radius: 20,
                                      backgroundColor: Colors.white,
                                      child: CupertinoActivityIndicator(
                                        color: Colors.pinkAccent,
                                      ),
                                    )
                                  : ViewMakerProfileDetailsControllerinstance
                                              .ViewProfileDetail
                                              .value
                                              .ProfileDetail!
                                              .likeStatus !=
                                          1
                                      ? GestureDetector(
                                          onTap: () {
                                            print("objectkjjh");
                                            profileLike = '1';
                                            like_type = '2';
                                            LikeTo =
                                                ViewMakerProfileDetailsControllerinstance
                                                    .ViewProfileDetail
                                                    .value
                                                    .ProfileDetail!
                                                    .id
                                                    .toString();

                                            ViewMakerProfileDetailsControllerinstance
                                                .ViewProfileDetail
                                                .value
                                                .ProfileDetail!
                                                .lodding
                                                .value = true;
                                            likeController
                                                .SeekerToMakerLikeApiHit();
                                            print("object");
                                          },
                                          child: CircleAvatar(
                                            backgroundColor: Colors.pinkAccent,
                                            radius: 20,
                                            child: Icon(
                                              Icons.favorite_sharp,
                                              color: Colors.white,
                                              size: 20,
                                            ),
                                          ),
                                        )
                                      : GestureDetector(
                                          onTap: () async {
                                            print("object");
                                            profileLike = '0';
                                            like_type = '2';
                                            LikeTo =
                                                ViewMakerProfileDetailsControllerinstance
                                                    .ViewProfileDetail
                                                    .value
                                                    .ProfileDetail!
                                                    .id
                                                    .toString();

                                            ViewMakerProfileDetailsControllerinstance
                                                .ViewProfileDetail
                                                .value
                                                .ProfileDetail!
                                                .lodding
                                                .value = true;
                                            likeController
                                                .SeekerToMakerLikeApiHit();
                                            print("object");
                                          },
                                          child: CircleAvatar(
                                            backgroundColor: Colors.white,
                                            radius: 20,
                                            child: Icon(
                                              Icons.favorite_sharp,
                                              color: Colors.pink,
                                              size: 20,
                                            ),
                                          ),
                                        ),
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5, right: 5),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  ViewMakerProfileDetailsControllerinstance
                                      .ViewProfileDetail
                                      .value
                                      .ProfileDetail!
                                      .name
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  style:
                                      Theme.of(context).textTheme.displayMedium,
                                )),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                  ViewMakerProfileDetailsControllerinstance
                                      .ViewProfileDetail
                                      .value
                                      .ProfileDetail!
                                      .location
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: Color(0xff777777)))),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                  ViewMakerProfileDetailsControllerinstance
                                      .ViewProfileDetail
                                      .value
                                      .ProfileDetail!
                                      .gender
                                      .toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(color: Color(0xff777777)))),
                          SizedBox(
                            height: height * 0.1,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
                            child: Text(
                              "Email",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.04,
                                vertical: height * 0.02),
                            child: Text(
                              ViewMakerProfileDetailsControllerinstance
                                  .ViewProfileDetail.value.ProfileDetail!.email
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color: AppColors.subtitletextcolor),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: width * 0.04,
                            ),
                            child: Text(
                              "Phone Number",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.04,
                                vertical: height * 0.02),
                            child: Text(
                              ViewMakerProfileDetailsControllerinstance
                                  .ViewProfileDetail.value.ProfileDetail!.phone
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color: AppColors.subtitletextcolor),
                            ),
                          ),
                          SizedBox(
                            height: height * .02,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: width * .22,
                                child: Card(
                                  elevation: 2,
                                  shadowColor: Color(0xff0000001),
                                  color: Color(0xffF3F3F3),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Color(0xff0000001A),
                                        radius: 17,
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              ListItem[0]['Image'] ??
                                                  'assets/maker/img_2.png'),
                                          //backgroundImage: NetworkImage(ListItem[index]['Image'] ??"https://images.unsplash.com/photo-1685118148066-da2c5c61e291?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60"),
                                          radius: 23,
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Text(
                                        ListItem[0]['Name'] ?? "Name",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                color: Color(0xff777777),
                                                fontSize: 4),
                                      ),
                                      Text(
                                        ViewMakerProfileDetailsControllerinstance
                                            .ViewProfileDetail
                                            .value
                                            .ProfileDetail!
                                            .matchMade
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: width * .22,
                                child: Card(
                                  elevation: 2,
                                  shadowColor: Color(0xff0000001),
                                  color: Color(0xffF3F3F3),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Color(0xff0000001A),
                                        radius: 17,
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              ListItem[1]['Image'] ??
                                                  'assets/maker/img_2.png'),
                                          //backgroundImage: NetworkImage(ListItem[index]['Image'] ??"https://images.unsplash.com/photo-1685118148066-da2c5c61e291?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60"),
                                          radius: 23,
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Text(
                                        ListItem[1]['Name'] ?? "Name",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                color: Color(0xff777777),
                                                fontSize: 4),
                                      ),
                                      Text(
                                        ViewMakerProfileDetailsControllerinstance
                                            .ViewProfileDetail
                                            .value
                                            .ProfileDetail!
                                            .matchsSuccessfull
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: width * .22,
                                child: Card(
                                  elevation: 2,
                                  shadowColor: Color(0xff0000001),
                                  color: Color(0xffF3F3F3),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Color(0xff0000001A),
                                        radius: 17,
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              ListItem[2]['Image'] ??
                                                  'assets/maker/img_2.png'),
                                          //backgroundImage: NetworkImage(ListItem[index]['Image'] ??"https://images.unsplash.com/photo-1685118148066-da2c5c61e291?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60"),
                                          radius: 23,
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Text(
                                        ListItem[2]['Name'] ?? "Name",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                color: Color(0xff777777),
                                                fontSize: 4),
                                      ),
                                      Text(
                                        ViewMakerProfileDetailsControllerinstance
                                            .ViewProfileDetail
                                            .value
                                            .ProfileDetail!
                                            .matchsDeclined
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: width * .22,
                                child: Card(
                                  elevation: 2,
                                  shadowColor: Color(0xff0000001),
                                  color: Color(0xffF3F3F3),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Color(0xff0000001A),
                                        radius: 17,
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              ListItem[3]['Image'] ??
                                                  'assets/maker/img_2.png'),
                                          //backgroundImage: NetworkImage(ListItem[index]['Image'] ??"https://images.unsplash.com/photo-1685118148066-da2c5c61e291?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60"),
                                          radius: 23,
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Text(
                                        ListItem[3]['Name'] ?? "Name",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                color: Color(0xff777777),
                                                fontSize: 4),
                                      ),
                                      Text(
                                        ViewMakerProfileDetailsControllerinstance
                                            .ViewProfileDetail
                                            .value
                                            .ProfileDetail!
                                            .matchsCompleted
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: width * .22,
                                child: Card(
                                  elevation: 2,
                                  shadowColor: Color(0xff0000001),
                                  color: Color(0xffF3F3F3),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Color(0xff0000001A),
                                        radius: 17,
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              ListItem[4]['Image'] ??
                                                  'assets/maker/img_2.png'),
                                          //backgroundImage: NetworkImage(ListItem[index]['Image'] ??"https://images.unsplash.com/photo-1685118148066-da2c5c61e291?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60"),
                                          radius: 23,
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Text(
                                        ListItem[4]['Name'] ?? "Name",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                color: Color(0xff777777),
                                                fontSize: 4),
                                      ),
                                      Text(
                                        ViewMakerProfileDetailsControllerinstance
                                            .ViewProfileDetail
                                            .value
                                            .ProfileDetail!
                                            .makerExperience
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: width * .22,
                                child: Card(
                                  elevation: 2,
                                  shadowColor: Color(0xff0000001),
                                  color: Color(0xffF3F3F3),
                                  child: Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundColor: Color(0xff0000001A),
                                        radius: 17,
                                        child: CircleAvatar(
                                          backgroundImage: AssetImage(
                                              ListItem[5]['Image'] ??
                                                  'assets/maker/img_2.png'),
                                          //backgroundImage: NetworkImage(ListItem[index]['Image'] ??"https://images.unsplash.com/photo-1685118148066-da2c5c61e291?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60"),
                                          radius: 23,
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Text(
                                        ListItem[5]['Name'] ?? "Name",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                color: Color(0xff777777),
                                                fontSize: 4),
                                      ),
                                      Text(
                                        ViewMakerProfileDetailsControllerinstance
                                            .ViewProfileDetail
                                            .value
                                            .ProfileDetail!
                                            .likedProfile
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: width * .22,
                                // child: Card(
                                //   elevation: 2,
                                //   shadowColor: Color(0xff0000001),
                                //   color: Color(0xffF3F3F3),
                                //   child: Column(
                                //     children: [
                                //       CircleAvatar(
                                //         backgroundColor: Color(0xff0000001A),
                                //         radius: 17,
                                //         child: CircleAvatar(
                                //           backgroundImage: AssetImage(
                                //               ListItem[2]['Image'] ??
                                //                   'assets/maker/img_2.png'),
                                //           //backgroundImage: NetworkImage(ListItem[index]['Image'] ??"https://images.unsplash.com/photo-1685118148066-da2c5c61e291?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60"),
                                //           radius: 23,
                                //         ),
                                //       ),
                                //       SizedBox(
                                //         height: height * 0.01,
                                //       ),
                                //       Text(
                                //         ListItem[2]['Name'] ?? "Name",
                                //         style: Theme
                                //             .of(context)
                                //             .textTheme
                                //             .labelSmall
                                //             ?.copyWith(
                                //             color: Color(0xff777777),
                                //             fontSize: 4),
                                //       ),
                                //       Text(
                                //         ViewMakerProfileDetailsControllerinstance
                                //             .ViewProfileDetail
                                //             .value
                                //             .ProfileDetail!
                                //             .matchsDeclined
                                //             .toString(),
                                //         style: Theme
                                //             .of(context)
                                //             .textTheme
                                //             .titleLarge,
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ),
                              Container(
                                width: width * .22,
                                // child: Card(
                                //   elevation: 2,
                                //   shadowColor: Color(0xff0000001),
                                //   color: Color(0xffF3F3F3),
                                //   child: Column(
                                //     children: [
                                //       CircleAvatar(
                                //         backgroundColor: Color(0xff0000001A),
                                //         radius: 17,
                                //         child: CircleAvatar(
                                //           backgroundImage: AssetImage(
                                //               ListItem[3]['Image'] ??
                                //                   'assets/maker/img_2.png'),
                                //           //backgroundImage: NetworkImage(ListItem[index]['Image'] ??"https://images.unsplash.com/photo-1685118148066-da2c5c61e291?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60"),
                                //           radius: 23,
                                //         ),
                                //       ),
                                //       SizedBox(
                                //         height: height * 0.01,
                                //       ),
                                //       Text(
                                //         ListItem[3]['Name'] ?? "Name",
                                //         style: Theme
                                //             .of(context)
                                //             .textTheme
                                //             .labelSmall
                                //             ?.copyWith(
                                //             color: Color(0xff777777),
                                //             fontSize: 4),
                                //       ),
                                //       Text(
                                //         ViewMakerProfileDetailsControllerinstance
                                //             .ViewProfileDetail
                                //             .value
                                //             .ProfileDetail!
                                //             .matchsCompleted
                                //             .toString(),
                                //         style: Theme
                                //             .of(context)
                                //             .textTheme
                                //             .titleLarge,
                                //       ),
                                //     ],
                                //   ),
                                // ),
                              ),
                            ],
                          ),
                          // Padding(
                          //   padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                          //   child: GridView.builder(
                          //       scrollDirection: Axis.vertical,
                          //       physics: NeverScrollableScrollPhysics(),
                          //       shrinkWrap: true,
                          //       itemCount: ListItem.length,
                          //       gridDelegate:
                          //           SliverGridDelegateWithFixedCrossAxisCount(
                          //         crossAxisCount: 4,
                          //         mainAxisSpacing: 4,
                          //         crossAxisSpacing: 4,
                          //       ),
                          //       itemBuilder: (BuildContext, index) {
                          //         return Card(
                          //           elevation: 2,
                          //           shadowColor: Color(0xff0000001),
                          //           color: Color(0xffF3F3F3),
                          //           child: Column(
                          //             children: [
                          //               CircleAvatar(
                          //                 backgroundColor: Color(0xff0000001A),
                          //                 radius: 17,
                          //                 child: CircleAvatar(
                          //                   backgroundImage: AssetImage(
                          //                       ListItem[index]['Image'] ??
                          //                           'assets/maker/img_2.png'),
                          //                   //backgroundImage: NetworkImage(ListItem[index]['Image'] ??"https://images.unsplash.com/photo-1685118148066-da2c5c61e291?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60"),
                          //                   radius: 23,
                          //                 ),
                          //               ),
                          //               SizedBox(
                          //                 height: height * 0.01,
                          //               ),
                          //               Text(
                          //                 ListItem[index]['Name'] ?? "Name",
                          //                 style: Theme.of(context)
                          //                     .textTheme
                          //                     .labelSmall
                          //                     ?.copyWith(
                          //                         color: Color(0xff777777),
                          //                         fontSize: 4),
                          //               ),
                          //               Text(
                          //                 ViewMakerProfileDetailsControllerinstance
                          //                     .ViewProfileDetail
                          //                     .value
                          //                     .ProfileDetail!
                          //                     .matchMade
                          //                     .toString(),
                          //                 style: Theme.of(context)
                          //                     .textTheme
                          //                     .titleLarge,
                          //               ),
                          //             ],
                          //           ),
                          //         );
                          //       }),
                          // ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
                            child: Text(
                              "About the Match Maker",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.04,
                                vertical: height * 0.01),
                            child: Text(
                              ViewMakerProfileDetailsControllerinstance
                                  .ViewProfileDetail
                                  .value
                                  .ProfileDetail!
                                  .aboutMaker
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(
                                      color: AppColors.subtitletextcolor),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
                            child: Text(
                              "What do you expect from your match seekers",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.04,
                                vertical: height * 0.01),
                            child: Text(
                              ViewMakerProfileDetailsControllerinstance
                                  .ViewProfileDetail
                                  .value
                                  .ProfileDetail!
                                  .expectation
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                    color: AppColors.subtitletextcolor,
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.04,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
                            child: Text(
                              "Match Maker Heading that they want everyone to see:",
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.04,
                                vertical: height * 0.01),
                            child: Text(
                              ViewMakerProfileDetailsControllerinstance
                                  .ViewProfileDetail
                                  .value
                                  .ProfileDetail!
                                  .headingOfMaker
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(
                                      color: AppColors.subtitletextcolor),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.1,
                          ),
                        ]),
                      )
                    ],
                  ),
                );
            }
          })),
    );
  }
}

class DomatchesModel {
  DomatchesModel({
    this.status,
    this.msg,
  });

  String? status;
  String? msg;

  DomatchesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    return _data;
  }
}
