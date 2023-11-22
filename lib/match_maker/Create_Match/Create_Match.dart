import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/controller/DoMatchesController/DoMachesController.dart';
import 'package:cupid_match/controllers/controller/ProfileScrollController.dart/ProfileScrollController.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/match_maker/ViewSikerProfileDetailtoMatch.dart';
import 'package:cupid_match/match_maker/chat_screen.dart';
import 'package:cupid_match/match_seeker/chat_screen.dart';
import 'package:cupid_match/res/components/general_exception.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/MakerDrawer.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';



class MatchScreen extends StatefulWidget {
  @override
  _MatchScreenState createState() => _MatchScreenState();
}

class _MatchScreenState extends State<MatchScreen> {
  bool isloading = false;
  final DoMatchesControllerinstance = Get.put(DoMatchesController());
  final ProfileScrollControllerinstance = Get.put(ProfileScrollController());
  PageController _controller1 = PageController(viewportFraction: 0.6);
  PageController _controller2 = PageController(viewportFraction: 0.6);
  int _topItem1 = 0;
  int _topItem2 = 0;

  @override
  void initState() {
    ProfileScrollControllerinstance.ProfileScrollApiHit();
    setState(() {
      isloading = false;
      print(isloading);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double topPosition = MediaQuery.of(context).size.height * 0.18;

    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              leading: InkWell(
                child: Icon(Icons.arrow_back),
                onTap: () {
                  Get.back();
                },
              ),
              title: Text(
                "Create Match",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              actions: [
                Builder(
                  builder: (context) {
                    return GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openEndDrawer();
                          MaterialLocalizations.of(context)
                              .openAppDrawerTooltip;
                        },
                        child: Image.asset("assets/icons/menu.png"));
                  },
                )
              ],
            ),
            endDrawer: Drawer(child: MakerDrawer()),
            body: Obx(() {
              switch (ProfileScrollControllerinstance.rxRequestStatus.value) {
                case Status.LOADING:
                  return const Center(child: CircularProgressIndicator());
                case Status.ERROR:
                  if (ProfileScrollControllerinstance.error.value ==
                      'No internet') {
                    return InterNetExceptionWidget(
                      onPress: () {},
                    );
                  } else {
                    return GeneralExceptionWidget(onPress: () {});
                  }
                case Status.COMPLETED:
                  return Stack(
                    children: [
                      Container(
                        color: Colors.white,
                        child: Row(
                          children: <Widget>[
                            buildPageView2(_controller1, _topItem1, 0, (value) {
                              setState(() {
                                _topItem1 = value;
                              });
                            }),
                            buildPageView(_controller2, _topItem2, 1, (value) {
                              setState(() {
                                _topItem2 = value;
                              });
                            }),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        left: 0,
                        right: 0,
                        height: topPosition,
                        child: Container(
                          height: topPosition,
                          width: MediaQuery.of(context).size.width,
                          padding: EdgeInsets.only(
                            left: 10,
                            right: 10,
                            top: 10,
                          ),
                          alignment: Alignment.center,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20)),
                              height: topPosition,
                              width: MediaQuery.of(context).size.width - 20,
                              // padding: EdgeInsets.all(20),
                              alignment: Alignment.center,
                              child: Image.asset(
                                'assets/images/banner.png',
                                fit: BoxFit.cover,
                              )),
                          color: Colors.white,
                        ),
                      ),
                      Positioned(
                        top: topPosition +
                            MediaQuery.of(context).size.height * 0.07,
                        left: 0,
                        right: 0,
                        child: Center(
                            child: isloading == false
                                ? Container(
                                    decoration: BoxDecoration(),
                                    height: MediaQuery.of(context).size.width *
                                        0.29,
                                    width: MediaQuery.of(context).size.width *
                                        0.29,
                                    child: FloatingActionButton(
                                      onPressed: () async {
                                        final SharedPreferences prefs =
                                        await SharedPreferences
                                            .getInstance();
                                        setState(() {
                                          isloading = true;
                                        });
                                        Timer(Duration(seconds: 1), () {

                                        setState(() {
                                          name1=null;
                                          name2=null;
                                          name1="";
                                          im2="";
                                          im2=null;
                                          img1=null;
                                          img1="";
                                          images.clear();

                                          name2="";

                                        });
                                        print('item 1st ->  ' + '$_topItem1');
                                        match_fromid =
                                            ProfileScrollControllerinstance
                                                .ProfileScrollList
                                                .value
                                                .allseekers!
                                                .Mal![_topItem1]
                                                .id
                                                .toString();
                                        print(ProfileScrollControllerinstance
                                            .ProfileScrollList
                                            .value
                                            .allseekers!
                                            .Mal![_topItem1]
                                            .name
                                            .toString());
                                        name1 = ProfileScrollControllerinstance
                                            .ProfileScrollList
                                            .value
                                            .allseekers!
                                            .Mal![_topItem1]
                                            .name
                                            .toString();
                                        match_withid =
                                            ProfileScrollControllerinstance
                                                .ProfileScrollList
                                                .value
                                                .allseekers!
                                                .Femal![_topItem2]
                                                .id
                                                .toString();
                                        print('item 2nd ->  ' + '$_topItem2');
                                        print(ProfileScrollControllerinstance
                                            .ProfileScrollList
                                            .value
                                            .allseekers!
                                            .Femal![_topItem2]
                                            .name
                                            .toString());
                                        name2 = ProfileScrollControllerinstance
                                            .ProfileScrollList
                                            .value
                                            .allseekers!
                                            .Femal![_topItem2]
                                            .name
                                            .toString();
                                        im2 = ProfileScrollControllerinstance
                                            .ProfileScrollList
                                            .value
                                            .allseekers!
                                            .Femal![_topItem2]
                                            .imgPath
                                            .toString();
                                        Makerid = prefs.getString('Tokernid');
                                        Matchtype = "0";
                                        DoMatchesControllerinstance
                                            .DoMatchesApiHit();

                                        img1 = ProfileScrollControllerinstance
                                            .ProfileScrollList
                                            .value
                                            .allseekers!
                                            .Mal![_topItem1]
                                            .imgPath
                                            .toString();
                                        images.addAll([img1,im2]);
                                        Timer(Duration(seconds: 2), (){
                                          if (DoMatchesControllerinstance
                                                  .DoMatches.value.status.toString() ==
                                              "success") {
                                            ShowDialog(context);
                                            setState(() {
                                              name1;
                                              name2;
                                              images;
                                              isloading = false;
                                            });
                                          }});
                                        });
                                      },
                                      child: Container(
                                        alignment: Alignment.center,
                                        child: Center(
                                            child: Image.asset(
                                                "assets/images/Group 238.png",
                                                height: 70)),
                                      ),
                                      backgroundColor: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          MediaQuery.of(context).size.width *
                                              0.3,
                                        ),
                                        side: BorderSide(
                                          color: Colors.pink.shade400,
                                          width: 4,
                                        ),
                                      ),
                                    ),
                                  )
                                : Container(
                              decoration: BoxDecoration(),
                              height: MediaQuery.of(context).size.width *
                                  0.29,
                              width: MediaQuery.of(context).size.width *
                                  0.29,
                              child: FloatingActionButton(


                                onPressed: (){},
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                ),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    MediaQuery.of(context).size.width *
                                        0.3,
                                  ),
                                  side: BorderSide(
                                    color: Colors.pink.shade400,
                                    width: 4,
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ],
                  );
              }
            })));
  }

  Expanded buildPageView(PageController controller, int currentPage, int idx,
      Function(int) updateState) {
    return Expanded(
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollEndNotification) {
            updateState(controller.page!.round());
          }
          return true;
        },
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          controller: controller,
          itemCount: ProfileScrollControllerinstance
              .ProfileScrollList.value.allseekers!.Femal!.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(
                  color:
                      index == currentPage ? Colors.pink.shade400 : Colors.grey,
                  width: index == currentPage ? 1.5 : .6,
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.5,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: Get.height * 0.25,
                              width: Get.width * 0.3,
                              child: CachedNetworkImage(
                                imageUrl: ProfileScrollControllerinstance
                                    .ProfileScrollList
                                    .value
                                    .allseekers!
                                    .Femal![index]
                                    .imgPath
                                    .toString(),
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                // Placeholder widget while loading
                                errorWidget: (context, url, error) => Icon(Icons
                                    .error), // Error widget if loading fails
                              ),

                              //     Image.network(
                              //  ProfileScrollControllerinstance.ProfileScrollList.value.allseekers!.femaleList![index].imgPath.toString(),
                              //       fit: BoxFit.cover,
                              //     ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                ProfileScrollControllerinstance
                                    .ProfileScrollList
                                    .value
                                    .allseekers!
                                    .Femal![index]
                                    .name
                                    .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: Get.height * 0.001,
                              ),
                              Text(
                                ProfileScrollControllerinstance
                                    .ProfileScrollList
                                    .value
                                    .allseekers!
                                    .Femal![index]
                                    .occupation
                                    .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: Get.height * 0.001,
                              ),
                              Text(
                                ProfileScrollControllerinstance
                                    .ProfileScrollList
                                    .value
                                    .allseekers!
                                    .Femal![index]
                                    .address
                                    .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w400, fontSize: 10),
                              ),
                              SizedBox(
                                height: Get.height * 0.001,
                              ),
                              Text(
                                "Interest",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: Get.height * 0.001,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Travelling",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.01,
                                  ),
                                  Text(
                                    "Books",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Get.height * 0.001,
                              ),
                              Wrap(
                                direction: Axis.horizontal,
                                children: [
                                  iconText(
                                    'assets/images/religion_icon.png',
                                    ProfileScrollControllerinstance
                                        .ProfileScrollList
                                        .value
                                        .allseekers!
                                        .Femal![index]
                                        .religion
                                        .toString(),
                                  ),
                                  iconText(
                                    'assets/images/height_icon.png',
                                    ProfileScrollControllerinstance
                                        .ProfileScrollList
                                        .value
                                        .allseekers!
                                        .Femal![index]
                                        .height
                                        .toString(),
                                  ),
                                  iconText(
                                    'assets/images/salary_icon.png',
                                    ProfileScrollControllerinstance
                                        .ProfileScrollList
                                        .value
                                        .allseekers!
                                        .Femal![index]
                                        .salary
                                        .toString(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: GestureDetector(
                        onTap: () {
                          userIdsiker = ProfileScrollControllerinstance
                              .ProfileScrollList
                              .value
                              .allseekers!
                              .Femal![index]
                              .id
                              .toString();

                          if (userIdsiker != null) {
                            saveuserid();
                          }

                          print(userIdsiker);
                          Get.to(SikerProfilePage());
                        },
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.pink.shade400, width: 1)),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 12,
                            color: Colors.pink.shade400,
                          ),
                        )),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Expanded buildPageView2(PageController controller, int currentPage, int idx,
      Function(int) updateState) {
    return Expanded(
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollEndNotification) {
            updateState(controller.page!.round());
          }
          return true;
        },
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          controller: controller,
          itemCount: ProfileScrollControllerinstance
              .ProfileScrollList.value.allseekers!.Mal!.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                border: Border.all(
                  color:
                      index == currentPage ? Colors.pink.shade400 : Colors.grey,
                  width: index == currentPage ? 1.5 : .6,
                ),
              ),
              height: MediaQuery.of(context).size.height * 0.5,
              child: Stack(
                children: [
                  Container(
                    padding: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              height: Get.height * 0.25,
                              width: Get.width * 0.3,
                              child: CachedNetworkImage(
                                imageUrl: ProfileScrollControllerinstance
                                    .ProfileScrollList
                                    .value
                                    .allseekers!
                                    .Mal![index]
                                    .imgPath
                                    .toString(),
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                // Placeholder widget while loading
                                errorWidget: (context, url, error) => Icon(Icons
                                    .error), // Error widget if loading fails
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                ProfileScrollControllerinstance
                                    .ProfileScrollList
                                    .value
                                    .allseekers!
                                    .Mal![index]
                                    .name
                                    .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 19,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: Get.height * 0.001,
                              ),
                              Text(
                                "Fashion Designer",
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: 12,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: Get.height * 0.001,
                              ),
                              Text(
                                ProfileScrollControllerinstance
                                    .ProfileScrollList
                                    .value
                                    .allseekers!
                                    .Mal![index]
                                    .address
                                    .toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: Get.height * 0.001,
                              ),
                              Text(
                                "Interest",
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                    color: Colors.black),
                              ),
                              SizedBox(
                                height: Get.height * 0.001,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    "Travelling",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: Get.width * 0.01,
                                  ),
                                  Text(
                                    "Books",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        color: Colors.black),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Get.height * 0.001,
                              ),
                              Wrap(
                                direction: Axis.horizontal,
                                children: [
                                  iconText(
                                    'assets/images/religion_icon.png',
                                    ProfileScrollControllerinstance
                                        .ProfileScrollList
                                        .value
                                        .allseekers!
                                        .Mal![index]
                                        .religion
                                        .toString(),
                                  ),
                                  iconText(
                                    'assets/images/height_icon.png',
                                    ProfileScrollControllerinstance
                                        .ProfileScrollList
                                        .value
                                        .allseekers!
                                        .Mal![index]
                                        .height
                                        .toString(),
                                  ),
                                  iconText(
                                    'assets/images/salary_icon.png',
                                    ProfileScrollControllerinstance
                                        .ProfileScrollList
                                        .value
                                        .allseekers!
                                        .Mal![index]
                                        .salary
                                        .toString(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 10,
                    child: GestureDetector(
                        onTap: () {
                          userIdsiker = ProfileScrollControllerinstance
                              .ProfileScrollList
                              .value
                              .allseekers!
                              .Mal![index]
                              .id
                              .toString();

                          if (userIdsiker != null) {
                            saveuserid();
                          }

                          print(userIdsiker);
                          Get.to(SikerProfilePage());
                        },
                        child: Container(
                          padding: EdgeInsets.all(3),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                  color: Colors.pink.shade400, width: 1)),
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 12,
                            color: Colors.pink.shade400,
                          ),
                        )),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  saveuserid() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('Tokernid', userIdsiker!);
    prefs.getString(
      'Tokernid',
    );
  }
}

ShowDialog(BuildContext context) {
  final DoMatchesControllerinstance = Get.put(DoMatchesController());

  showDialog(
    barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xffFFFFFF),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(22)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset(
                      "assets/icons/cancel.png",
                      height: MediaQuery.of(context).size.height * .03,
                    )),
              ),
              Image.asset(
                'assets/maker/heart.png',
                height: MediaQuery.of(context).size.height * .1,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              // if (DoMatchesControllerinstance.DoMatches.value.msg.toString() ==
              //     "Match request sent Successfully")
              //   Text(
              //     "Congratulations it's a",
              //     style: Theme.of(context).textTheme.titleSmall,
              //   ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * .01,
              // ),
              // if (DoMatchesControllerinstance.DoMatches.value.msg.toString() ==
              //     "Match request sent Successfully")
              //   Text(
              //     "Match!",
              //     style: Theme.of(context)
              //         .textTheme
              //         .titleSmall
              //         ?.copyWith(color: Color(0xffFE0091)),
              //   ),
              // if (DoMatchesControllerinstance.DoMatches.value.msg.toString() ==
              //     "Already Matched")
              //   Text(
              //     DoMatchesControllerinstance.DoMatches.value.msg.toString(),
              //     style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Color(0xffFE0091)),
              //   ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * .08,
                child: ListView.builder(
                  // scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.all(8),
                      child: ListTile(
                        contentPadding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.25),
                        leading: Container(
                          width: MediaQuery.of(context).size.width * .15,
                          height: MediaQuery.of(context).size.height * .09,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            reverse: true,
                            itemCount:  images.length,
                            itemBuilder: (context, index) {
                              return Align(
                                alignment: Alignment.center,
                                widthFactor: 0.4,
                                child: CircleAvatar(
                                  radius: 32,
                                  backgroundColor: AppColors.white,
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundImage:
                                        CachedNetworkImageProvider(images[index]),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
              Text(
                name1.toString() + " and " + name2.toString(),
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      color: Color(0xff000CAA),fontWeight: FontWeight.w300
                    ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .01,
              ),
        Text(
        (DoMatchesControllerinstance.DoMatches.value.msg.toString()) ,
        style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Color(0xffFE0091)),
          textAlign: TextAlign.center,

        ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              MyButton(
                height: MediaQuery.of(context).size.height * .05,
                width: MediaQuery.of(context).size.width * .63,
                title: 'Back',
                onTap: () {
                  Get.back();
                  // Get.to(ChatPage());
                },
              )
            ],
          ),
        );
      });
}
// Widget profileCard(int index) {
//   return Container(
//     padding: EdgeInsets.all(15),
//     child: Column(
//       children: [
//         Container(
//           margin: EdgeInsets.only(bottom: 10),
//           // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
//           child: ClipRRect(
//             borderRadius: BorderRadius.circular(20),
//             child: Container(
//               height: Get.height*0.25,
//               width: Get.width*0.3,
//               child: Image.asset(
//                 index == 0 ? 'assets/images/guy.png' : 'assets/images/girl.png',
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment.centerLeft,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               Text(
//                 index == 0 ? 'Jake, 22' : 'Skyler, 20',
//                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19,color:Colors.black),
//               ),
//               SizedBox(
//                  height: Get.height*0.001,
//               ),
//               Text(
//                 "Fashion Designer",
//                 style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12,color:Colors.black),
//               ),
//               SizedBox(
//                 height: Get.height*0.001,
//               ),
//               Text(
//                 "Jaipur, India",
//                 style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10),
//               ),
//               SizedBox(
//                   height: Get.height*0.001,
//               ),
//               Text(
//                 "Interest",
//                 style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13,color:Colors.black),
//               ),
//               SizedBox(
//                height: Get.height*0.001,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text(
//                     "Travelling",
//                     style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10,color:Colors.black),
//                   ),
//                   SizedBox(
//                     width: Get.width*0.01,
//                   ),
//                   Text(
//                     "Books",
//                     style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10,color:Colors.black),
//                   ),
//                 ],
//               ),
//               SizedBox(
//                  height: Get.height*0.001,
//               ),
//               Wrap(
//                 direction: Axis.horizontal,
//                 children: [
//                   iconText('assets/images/religion_icon.png', "Hindu"),
//                   iconText('assets/images/height_icon.png', "6 Feet, 2.8"),
//                   iconText('assets/images/salary_icon.png', "25k Monthly"),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }

Widget iconText(String img, String text) {
  return Container(
    // margin: EdgeInsets.all(5),
    padding: EdgeInsets.all(5),
    height: Get.height * 0.03,
    decoration: BoxDecoration(
      border: Border.all(
        color: Colors.black,
        width: .5,
      ),
      borderRadius: BorderRadius.circular(50),
    ),
    // padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    child: Row(
      mainAxisSize:
          MainAxisSize.min, // makes the row width to be according to children
      children: [
        Image.asset(img),
        SizedBox(width: 5.0), // space between image and text
        Text(
          text,
          style: TextStyle(fontSize: 10, color: Colors.black),
        ), // text
      ],
    ),
  );
}
