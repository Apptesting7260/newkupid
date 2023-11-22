import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/controllers/controller/ViewMakerProfileDetailsController/ViewMakerProfileDetailscontroller.dart';
import 'package:cupid_match/controllers/controller/ViewProfileDetailsController/ViewProfileDetailsController.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/res/components/general_exception.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/MakerDrawer.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../controllers/MakerGetMyProfileDetails/MakerGetProfileDetailsController.dart';
import '../models/ViewMakerProfileDetailsModel/ViewMakerProfileDetailsModel.dart';

class ViewProfileDetailsMaker extends StatefulWidget {
  const ViewProfileDetailsMaker({Key? key}) : super(key: key);

  @override
  State<ViewProfileDetailsMaker> createState() =>
      _ViewProfileDetailsMakerState();
}

class _ViewProfileDetailsMakerState extends State<ViewProfileDetailsMaker> {
  final ViewMakerProfileDetailsControllerinstance =
      Get.put(ViewMakerMyProfileDetailsController());
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
  late VideoPlayerController _controller;

  bool _isPlaying = false;

  @override
  void initState() {
    // TODO: implement initState
    ViewMakerProfileDetailsControllerinstance.ViewMakerProfileDetailsApiHit();
    _controller = VideoPlayerController.network(
        'https://urlsdemo.xyz/kupid/public/admin-assets/img/maker/maker_video/1691755852.mp4') // Replace with the actual video URL
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
              )
            ],
          ),
          endDrawer: Drawer(child: MakerDrawer()),
          body: Obx(() {
            switch (ViewMakerProfileDetailsControllerinstance
                .rxRequestStatus.value) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
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
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Column(
                        // physics: NeverScrollableScrollPhysics(),
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: height * 0.1,
                            width: width,
                            color: Color(0xffF3F3F3),
                          ),
                          SizedBox(
                            height: height * 0.09,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                ViewMakerProfileDetailsControllerinstance
                                    .ViewProfileDetail.value!.requests!.name
                                    .toString(),
                                style:
                                    Theme.of(context).textTheme.displayMedium,
                              )),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Container(
                                  width: Get.width * 1,
                                  child: Center(
                                      child: Text(
                                          ViewMakerProfileDetailsControllerinstance
                                              .ViewProfileDetail
                                              .value!
                                              .requests!
                                              .location
                                              .toString(),
                                          textAlign: TextAlign.center,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium
                                              ?.copyWith(
                                                  color: Color(0xff777777)),)))),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                  ViewMakerProfileDetailsControllerinstance
                                      .ViewProfileDetail.value!.requests!.gender
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
                                  .ViewProfileDetail.value!.requests!.email
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
                                  .ViewProfileDetail.value!.requests!.phone
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

                          //              Center(
                          //                         child: Image.asset("assets/images/vedio.png"),
                          //                       ),
                          // //   Stack(
                          //   children: [
                          //     GestureDetector(
                          //       onTap: () {
                          //         if (_controller.value.isInitialized) {
                          //           setState(() {
                          //             _isPlaying = !_isPlaying;
                          //             if (_isPlaying) {
                          //               _controller.play();
                          //             } else {
                          //               _controller.pause();
                          //             }
                          //           });
                          //         }
                          //       },
                          //       child: Center(
                          //         child: Container(
                          //           width: 200,
                          //           height: 200,
                          //           color: Colors.black,
                          //           child: Stack(
                          //             children: [
                          //               Center(
                          //                 child: AspectRatio(
                          //                   aspectRatio: _controller.value.aspectRatio,
                          //                   child: VideoPlayer(_controller),
                          //                 ),
                          //               ),
                          //               Center(
                          //                 child: AnimatedOpacity(
                          //                   opacity: _isPlaying ? 0.0 : 1.0,
                          //                   duration: Duration(milliseconds: 200),
                          //                   child: Icon(
                          //                     Icons.play_arrow,
                          //                     size: 60,
                          //                     color: Colors.pink,
                          //                   ),
                          //                 ),
                          //               ),
                          //               Center(
                          //                 child: AnimatedOpacity(
                          //                   opacity: _isPlaying ? 1.0 : 0.0,
                          //                   duration: Duration(milliseconds: 200),
                          //                   child: Icon(
                          //                     Icons.pause,
                          //                     size: 60,
                          //                     color: Colors.pink,
                          //                   ),
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //     Positioned(
                          //       bottom: 0,
                          //       left: 0,
                          //       right: 0,
                          //       child: VideoProgressIndicator(
                          //         _controller,
                          //         allowScrubbing: true,
                          //         padding: EdgeInsets.all(8),
                          //         colors: VideoProgressColors(
                          //           playedColor: Colors.red,
                          //           bufferedColor: Colors.grey,
                          //           backgroundColor: Colors.black,
                          //         ),
                          //       ),
                          //     ),
                          //     Positioned(
                          //       bottom: 15,
                          //       right: 10,
                          //       child: Text(
                          //         _getVideoDuration(),
                          //         style: TextStyle(color: Colors.pink),
                          //       ),
                          //     ),
                          //   ],
                          // ),

                          SizedBox(
                            height: height * .02,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.04),
                            child: GridView.builder(
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: ListItem.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 4,
                                  crossAxisSpacing: 4,
                                ),
                                itemBuilder: (BuildContext, index) {
                                  return Card(

                                    elevation: 2,
                                    shadowColor: Color(0xff0000001),
                                    color: Color(0xffF3F3F3),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: Get.height * 0.005,
                                        ),
                                        CircleAvatar(
                                          backgroundColor: Color(0xff0000001A),
                                          radius: 17,
                                          child: CircleAvatar(
                                            backgroundImage: AssetImage(
                                                ListItem[index]['Image'] ??
                                                    'assets/maker/img_2.png'),
                                            //backgroundImage: NetworkImage(ListItem[index]['Image'] ??"https://images.unsplash.com/photo-1685118148066-da2c5c61e291?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw1fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60"),
                                            radius: 23,
                                          ),

                                        ),
                                        SizedBox(
                                          height: height * 0.005,
                                        ),
                                        Text(
                                          ListItem[index]['Name'] ?? "Name",
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
                                              .value!
                                              .requests!
                                              .status
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                          ),
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
                                  .ViewProfileDetail.value!.requests!.aboutMaker
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
                                  .value!
                                  .requests!
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
                                  .value!
                                  .requests!
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
                        ],
                      ),
                      Positioned(
                        left: 150,
                        top: height * 0.03,
                        child: Container(
                          height: height * 0.14,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: GestureDetector(
                            child: CircleAvatar(
                              radius: 50,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: NetworkImage(
                                  ViewMakerProfileDetailsControllerinstance
                                      .ViewProfileDetail
                                      .value!
                                      .requests!
                                      .imgPath
                                      .toString(),
                                ),
                              ),
                            ),
                            onTap: () {
                              showImageViewer(
                                  context,
                                  CachedNetworkImageProvider(
                                      ViewMakerProfileDetailsControllerinstance
                                          .ViewProfileDetail
                                          .value!
                                          .requests!
                                          .imgPath
                                          .toString()),
                                  swipeDismissible: true,
                                  doubleTapZoomable: true);
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
            }
          })),
    );
  }

  String _getVideoDuration() {
    final duration = _controller.value.duration;
    final position = _controller.value.position;

    final formattedDuration =
        "${position.inMinutes.remainder(60)}:${position.inSeconds.remainder(60).toString().padLeft(2, '0')} / ${duration.inMinutes.remainder(60)}:${duration.inSeconds.remainder(60).toString().padLeft(2, '0')}";

    return formattedDuration;
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
