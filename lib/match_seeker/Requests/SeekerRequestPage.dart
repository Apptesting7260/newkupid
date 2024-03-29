import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/match_seeker/chat_screen.dart';
import 'package:cupid_match/widgets/seekershortprofile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controllers/SeekerMyProfileDetailsController/SeekerMyProfileController.dart';
import '../../controllers/controller/RequestDetailsController/RequestDetailsController.dart';
import '../../data/response/status.dart';
import '../../res/components/general_exception.dart';
import '../../res/components/internet_exceptions_widget.dart';
import '../viewMakerProfileinseeker/ViewMakerProfile.dart';

var myId;

class SeekerOutGoingRequestSinglePage extends StatefulWidget {
  const SeekerOutGoingRequestSinglePage({super.key});

  @override
  State<SeekerOutGoingRequestSinglePage> createState() =>
      _SeekerOutGoingRequestSinglePageState();
}

final ViewRequestDetailsController seekerOutgoingRequestSinglePageController =
    Get.put(ViewRequestDetailsController());
final SeekerMyProfileDetailsController seekerMyProfileController =
    Get.put(SeekerMyProfileDetailsController());
final FirebaseFirestore firestore = FirebaseFirestore.instance;

class _SeekerOutGoingRequestSinglePageState
    extends State<SeekerOutGoingRequestSinglePage> {
  @override
  void initState() {
    super.initState();
    myId;
    seekerOutgoingRequestSinglePageController.ViewRequestDetailsApiHit();
    seekerMyProfileController.SeekerMyProfileDetailsApiHit();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        seekerOutgoingRequestSinglePageController.ViewRequestDetailsApiHit();
        seekerMyProfileController.SeekerMyProfileDetailsApiHit();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          bottomOpacity: 0.0,
          elevation: 0.0,
          title: Padding(
            padding: const EdgeInsets.only(top: 30, left: 40.0),
            child: Text(
              "Outgoing  Requests",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w600),
            ),
          ),
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: InkWell(
              child: Icon(
                Icons.arrow_back,
                color: Color.fromRGBO(90, 90, 90, 1),
              ),
              onTap: () {
                Get.back();
              },
            ),
          ),
        ),
        body: Obx(() {
          switch (
              seekerOutgoingRequestSinglePageController.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(
                  child: CircularProgressIndicator(color: Colors.pink));
            case Status.ERROR:
            // if (seekerOutgoingRequestSinglePageController.error.value ==
            //     'No internet') {
            //   return InterNetExceptionWidget(onPress: () {
            //     // seekerOutgoingRequestSinglePageController.refreshApi();
            //   },);
            // } else {
            //   return GeneralExceptionWidget(onPress: () {
            //     // seekerOutgoingRequestSinglePageController.refreshApi();
            //   });
            // }
            case Status.COMPLETED:
              var myUserUrl;
              myId = seekerMyProfileController
                  .SeekerMyProfileDetail.value!.ProfileDetail!.id
                  .toString();
              if (seekerOutgoingRequestSinglePageController
                      .ViewProfileDetail.value.data!.matchWith
                      .toString() ==
                  "null") {
              } else {
                myUserUrl = seekerOutgoingRequestSinglePageController
                            .ViewProfileDetail.value.data!.getseeker!.id
                            .toString() ==
                        myId
                    ? seekerOutgoingRequestSinglePageController
                        .ViewProfileDetail.value.data!.getanotherseeker!
                    : seekerOutgoingRequestSinglePageController
                        .ViewProfileDetail.value.data!.getseeker!;
              }

              final requestStatus;
              (seekerOutgoingRequestSinglePageController
                          .ViewProfileDetail.value.data!.matchWith ==
                      myId)
                  ? requestStatus = seekerOutgoingRequestSinglePageController
                      .ViewProfileDetail.value.data!.matchWithStatus
                  : requestStatus = seekerOutgoingRequestSinglePageController
                      .ViewProfileDetail.value.data!.matchFromStatus;
              return Column(children: [
                SizedBox(
                  height: Get.height * 0.03,
                ),
                (seekerOutgoingRequestSinglePageController
                            .ViewProfileDetail.value.data!.matchType !=
                        1)
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: Get.height * 0.09,
                                width: Get.width * 0.9,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(245, 244, 244, 1)),
                                child: Row(
                                  children: [
                                    Container(
                                      width: Get.width * 0.01,
                                      color: Color.fromRGBO(254, 0, 145, 1),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.04,
                                    ),
                                    Container(
                                      width: Get.width * 0.18,
                                      height: Get.height * 0.067,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            seekerOutgoingRequestSinglePageController
                                                .ViewProfileDetail
                                                .value
                                                .data!
                                                .getmaker!
                                                .imgPath
                                                .toString(),
                                        imageBuilder:
                                            (context, imageProvider) =>
                                                Container(
                                          width: Get.width * 0.18,
                                          height: Get.height * 0.067,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                                image: imageProvider,
                                                fit: BoxFit.contain),
                                          ),
                                        ),
                                        placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.03,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(height: Get.height * 0.01),
                                        Container(
                                            height: Get.height * 0.018,
                                            width: Get.width * 0.18,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(90)),
                                            child: Center(
                                                child: Text(
                                              'Match Maker',
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      254, 0, 145, 1),
                                                  fontSize: 8,
                                                  fontWeight: FontWeight.w400),
                                            ))),
                                        SizedBox(
                                          height: Get.height * 0.006,
                                        ),
                                        Text(
                                          seekerOutgoingRequestSinglePageController
                                              .ViewProfileDetail
                                              .value
                                              .data!
                                              .getmaker!
                                              .name
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w700),
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.003,
                                        ),
                                        Container(
                                            width: Get.width * 0.5,
                                            child: Text(
                                              seekerOutgoingRequestSinglePageController
                                                  .ViewProfileDetail
                                                  .value
                                                  .data!
                                                  .getmaker!
                                                  .aboutMaker
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 7,
                                                  fontWeight: FontWeight.w300),
                                              softWrap: true,
                                              overflow: TextOverflow.ellipsis,
                                            ))
                                      ],
                                    ),
                                    SizedBox(
                                      width: Get.width * 0.03,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Makerid =
                                            seekerOutgoingRequestSinglePageController
                                                .ViewProfileDetail
                                                .value
                                                .data!
                                                .makerId
                                                .toString();
                                        setState(() {
                                          Makerid;
                                          print(Makerid);
                                        });
                                        Get.to(ViewMakerProfileInSeeker());
                                      },
                                      child: Container(
                                        height: Get.height * 0.05,
                                        width: Get.width * 0.05,
                                        child: Image.asset(
                                          'assets/icons/NextButton.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.05,
                          ),
                        ],
                      )
                    : Container(),

// *******************

                Row(
                  children: [
                    SizedBox(
                      width: Get.width * 0.03,
                    ),

                    Container(
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(244, 244, 244, 1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 1, color: Color.fromRGBO(254, 0, 145, 1))),
                      height: Get.height * 0.5,
                      width: Get.width * 0.45,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: Get.height * 0.015,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: Get.width * 0.02,
                              ),
                              // Container(
                              //   height: Get.height * 0.25,
                              //   width: Get.width * 0.4,
                              //   decoration: BoxDecoration(
                              //       borderRadius:
                              //           BorderRadius.circular(10)),
                              //   child: ClipRRect(
                              //     borderRadius:
                              //         BorderRadius.circular(20),
                              //     child: Image.asset(
                              //       'assets/images/image.png',
                              //       fit: BoxFit.fill,
                              //     ),
                              //   ),
                              // ),

                              InkWell(
                                //             onTap: (){
                                // userIdsiker=   seekerMyProfileController
                                //                 .SeekerMyProfileDetail.value
                                //                 .ProfileDetail!.id.toString();
                                //   print('object');
                                //           Get.to(ShortProfileSeeker());
                                // },
                                child: Container(
                                  height: Get.height * 0.25,
                                  width: Get.width * 0.4,
                                  child: CachedNetworkImage(
                                    imageUrl: seekerMyProfileController
                                        .SeekerMyProfileDetail
                                        .value
                                        .ProfileDetail!
                                        .imgPath
                                        .toString(),
                                    imageBuilder: (context, imageProvider) =>
                                        Container(
                                      height: Get.height * 0.25,
                                      width: Get.width * 0.4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        image: DecorationImage(
                                            image: imageProvider,
                                            fit: BoxFit.fill),
                                      ),
                                    ),
                                    placeholder: (context, url) => Center(
                                      child: CircularProgressIndicator(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.03,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: Get.width * 0.04,
                              ),
                              Text(
                                seekerMyProfileController.SeekerMyProfileDetail
                                    .value!.ProfileDetail!.name
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.005,
                          ),
                          // Row(
                          //   children: [
                          //     SizedBox(
                          //       width: Get.width * 0.04,
                          //     ),
                          //     Text(
                          //       seekerMyProfileController
                          //           .SeekerMyProfileDetail.value
                          //           .ProfileDetail!.occupationName.toString(),
                          //       style: TextStyle(
                          //           color: Colors.black,
                          //           fontSize: 8,
                          //           fontWeight: FontWeight.w400),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(
                            height: Get.height * 0.005,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: Get.width * 0.04,
                              ),
                              Container(
                                width: Get.width * 0.3,
                                child: Text(
                                  seekerMyProfileController
                                      .SeekerMyProfileDetail
                                      .value
                                      .ProfileDetail!
                                      .address
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400),
                                  softWrap: true,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.015,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: Get.width * 0.04,
                              ),
                              Text(
                                'Interest',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 8,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.005,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: Get.width * 0.04,
                              ),
                              (seekerMyProfileController
                                          .SeekerMyProfileDetail
                                          .value
                                          .ProfileDetail!
                                          .details!
                                          .interestName !=
                                      [])
                                  ? Row(
                                      children: [
                                        for (var i = 0;
                                            seekerMyProfileController
                                                    .SeekerMyProfileDetail
                                                    .value
                                                    .ProfileDetail!
                                                    .details!
                                                    .interestName!
                                                    .length >
                                                i;
                                            i++)
                                          Container(
                                            width: Get.width * 0.08,
                                            child: Text(
                                              seekerMyProfileController
                                                      .SeekerMyProfileDetail
                                                      .value
                                                      .ProfileDetail!
                                                      .details!
                                                      .interestName![i]
                                                      .title
                                                      .toString() +
                                                  " ",
                                              style: TextStyle(
                                                  fontSize: 6,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w400),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                      ],
                                    )
                                  : Container(),
                            ],
                          ),

                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: Get.width * 0.02,
                              ),
                              (seekerMyProfileController.SeekerMyProfileDetail
                                              .value.ProfileDetail!.religion ==
                                          null ||
                                      seekerMyProfileController
                                              .SeekerMyProfileDetail
                                              .value
                                              .ProfileDetail!
                                              .religion ==
                                          '')
                                  ? Container()
                                  : Container(
                                      height: Get.height * 0.03,
                                      width: Get.width * 0.19,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(244, 244, 244, 1),
                                        border: Border.all(width: 1),
                                        borderRadius: BorderRadius.circular(60),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: Get.width * 0.005,
                                          ),
                                          Container(
                                            height: Get.height * 0.015,
                                            width: Get.width * 0.08,
                                            child: Image.asset(
                                              'assets/icons/religon.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.0001,
                                          ),
                                          Text(
                                            seekerMyProfileController
                                                .SeekerMyProfileDetail
                                                .value
                                                .ProfileDetail!
                                                .religion
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 6,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      )),
                              SizedBox(
                                width: Get.width * 0.02,
                              ),
                              (seekerMyProfileController.SeekerMyProfileDetail
                                              .value.ProfileDetail!.height ==
                                          null ||
                                      seekerMyProfileController
                                              .SeekerMyProfileDetail
                                              .value
                                              .ProfileDetail!
                                              .height ==
                                          '')
                                  ? Container()
                                  : Container(
                                      height: Get.height * 0.03,
                                      width: Get.width * 0.19,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(244, 244, 244, 1),
                                        border: Border.all(width: 1),
                                        borderRadius: BorderRadius.circular(60),
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: Get.width * 0.005,
                                          ),
                                          Container(
                                            height: Get.height * 0.015,
                                            width: Get.width * 0.08,
                                            child: Image.asset(
                                              'assets/icons/height.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          SizedBox(
                                            width: Get.width * 0.0001,
                                          ),
                                          Text(
                                            seekerMyProfileController
                                                .SeekerMyProfileDetail
                                                .value
                                                .ProfileDetail!
                                                .height
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 6,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      )),
                            ],
                          ),
                          SizedBox(
                            height: Get.height * 0.01,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: Get.width * 0.02,
                              ),
                              (seekerMyProfileController.SeekerMyProfileDetail
                                              .value.ProfileDetail!.salary ==
                                          null ||
                                      seekerMyProfileController
                                              .SeekerMyProfileDetail
                                              .value
                                              .ProfileDetail!
                                              .salary ==
                                          '')
                                  ? Container(
                                      child: SizedBox(
                                        width: Get.width * 0.18,
                                      ),
                                    )
                                  : Container(
                                      height: Get.height * 0.03,
                                      width: Get.width * 0.19,
                                      decoration: BoxDecoration(
                                        color: Color.fromRGBO(244, 244, 244, 1),
                                        border: Border.all(width: 1),
                                        borderRadius: BorderRadius.circular(60),
                                      ),
                                      child: Row(
                                        children: [
                                          // SizedBox(width: Get.width*0.005,),
                                          Container(
                                            height: Get.height * 0.015,
                                            width: Get.width * 0.08,
                                            child: Image.asset(
                                              'assets/icons/money.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          // SizedBox(width: Get.width*0.002,),
                                          Text(
                                            seekerMyProfileController
                                                    .SeekerMyProfileDetail
                                                    .value
                                                    .ProfileDetail!
                                                    .salary
                                                    .toString() +
                                                ' LPA',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 6,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      )),
                            ],
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      width: Get.width * 0.04,
                    ),

                    //    // ******************
                    myUserUrl == null
                        ? Container(
                            child: Center(
                                child: Text(
                              "Match is Pending",
                              style: TextStyle(color: Colors.black),
                            )),
                          )
                        : InkWell(
                            onTap: () {
                              userIdsiker = myUserUrl.id.toString();
                              print('object');
                              Get.to(ShortProfileSeeker());
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(244, 244, 244, 1),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      width: 1,
                                      color: Color.fromRGBO(254, 0, 145, 1))),
                              height: Get.height * 0.5,
                              width: Get.width * 0.45,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: Get.height * 0.015,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.02,
                                      ),
                                      // Container(
                                      //   height: Get.height * 0.25,
                                      //   width: Get.width * 0.4,
                                      //   decoration: BoxDecoration(
                                      //       borderRadius:
                                      //           BorderRadius.circular(10)),
                                      //   child: ClipRRect(
                                      //     borderRadius:
                                      //         BorderRadius.circular(20),
                                      //     child: Image.asset(
                                      //       'assets/images/image.png',
                                      //       fit: BoxFit.fill,
                                      //     ),
                                      //   ),
                                      // ),

                                      Container(
                                        height: Get.height * 0.25,
                                        width: Get.width * 0.4,
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              myUserUrl.imgPath.toString(),
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            height: Get.height * 0.25,
                                            width: Get.width * 0.4,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              image: DecorationImage(
                                                  image: imageProvider,
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                          placeholder: (context, url) => Center(
                                            child: CircularProgressIndicator(
                                              color: Colors.grey,
                                            ),
                                          ),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.03,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.04,
                                      ),
                                      Text(
                                        myUserUrl.name.toString(),
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.005,
                                  ),
                                  // Row(
                                  //   children: [
                                  //     SizedBox(
                                  //       width: Get.width * 0.04,
                                  //     ),
                                  //     Text(
                                  //       myUserUrl.occupationName.toString(),
                                  //       style: TextStyle(
                                  //           color: Colors.black,
                                  //
                                  //           fontSize: 8,
                                  //           fontWeight: FontWeight.w400),
                                  //     ),
                                  //   ],
                                  // ),
                                  SizedBox(
                                    height: Get.height * 0.005,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.04,
                                      ),
                                      Container(
                                        width: Get.width * 0.4,
                                        child: Text(
                                          myUserUrl.address.toString(),
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400),
                                          softWrap: true,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.015,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.04,
                                      ),
                                      Text(
                                        'Interest',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 8,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.005,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.04,
                                      ),
                                      (myUserUrl.details!.interestName != null)
                                          ? Row(
                                              children: [
                                                for (var i = 0;
                                                    myUserUrl
                                                            .details!
                                                            .interestName!
                                                            .length >
                                                        i;
                                                    i++)
                                                  Container(
                                                    width: Get.width * 0.07,
                                                    child: Text(
                                                      myUserUrl
                                                              .details!
                                                              .interestName![i]
                                                              .title
                                                              .toString() +
                                                          " ",
                                                      style: TextStyle(
                                                          fontSize: 6,
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                              ],
                                            )
                                          : Container(),
                                    ],
                                  ),

                                  SizedBox(
                                    height: Get.height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.02,
                                      ),
                                      (myUserUrl.religion == null ||
                                              myUserUrl.religion == '')
                                          ? Container()
                                          : Container(
                                              height: Get.height * 0.03,
                                              width: Get.width * 0.19,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    244, 244, 244, 1),
                                                border: Border.all(width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(60),
                                              ),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: Get.width * 0.005,
                                                  ),
                                                  Container(
                                                    height: Get.height * 0.015,
                                                    width: Get.width * 0.08,
                                                    child: Image.asset(
                                                      'assets/icons/religon.png',
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: Get.width * 0.0001,
                                                  ),
                                                  Text(
                                                    myUserUrl.religion
                                                        .toString(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 6,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              )),
                                      SizedBox(
                                        width: Get.width * 0.02,
                                      ),
                                      (myUserUrl.height == null ||
                                              myUserUrl.height == '')
                                          ? Container()
                                          : Container(
                                              height: Get.height * 0.03,
                                              width: Get.width * 0.19,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    244, 244, 244, 1),
                                                border: Border.all(width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(60),
                                              ),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: Get.width * 0.005,
                                                  ),
                                                  Container(
                                                    height: Get.height * 0.015,
                                                    width: Get.width * 0.08,
                                                    child: Image.asset(
                                                      'assets/icons/height.png',
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: Get.width * 0.0001,
                                                  ),
                                                  Text(
                                                    myUserUrl.height.toString(),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 6,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              )),
                                    ],
                                  ),
                                  SizedBox(
                                    height: Get.height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: Get.width * 0.02,
                                      ),
                                      (myUserUrl.salary == null ||
                                              myUserUrl.salary == '')
                                          ? Container(
                                              child: SizedBox(
                                                width: Get.width * 0.18,
                                              ),
                                            )
                                          : Container(
                                              height: Get.height * 0.03,
                                              width: Get.width * 0.19,
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                    244, 244, 244, 1),
                                                border: Border.all(width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(60),
                                              ),
                                              child: Row(
                                                children: [
                                                  // SizedBox(width: Get.width*0.005,),
                                                  Container(
                                                    height: Get.height * 0.015,
                                                    width: Get.width * 0.08,
                                                    child: Image.asset(
                                                      'assets/icons/money.png',
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                  // SizedBox(width: Get.width*0.002,),
                                                  Text(
                                                    myUserUrl.salary
                                                            .toString() +
                                                        ' LPA',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 6,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              )),
                                      SizedBox(
                                        width: Get.width * 0.15,
                                      ),
                                      Container(
                                        height: Get.height * 0.05,
                                        width: Get.width * 0.05,
                                        child: Image.asset(
                                          'assets/icons/NextButton.png',
                                          fit: BoxFit.contain,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                    // //******************************* */
                  ],
                ),
                SizedBox(
                  height: Get.height * 0.03,
                ),
                (seekerOutgoingRequestSinglePageController
                            .ViewProfileDetail.value.data!.roomid !=
                        null)
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              roomid = seekerOutgoingRequestSinglePageController
                                  .ViewProfileDetail.value.data!.roomid
                                  .toString();
                              chatname = myUserUrl.name.toString();
                              chatimage = myUserUrl.imgPath.toString();

// if(roomid!=null){
//   print(roomid);
//   Get.to(ChatPage());
// }

                              getMessagesStream1();
                            },
                            child: Container(
                              height: Get.height * 0.05,
                              width: Get.width * 0.4,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(254, 0, 145, 1),
                                  borderRadius: BorderRadius.circular(60)),
                              child: Center(
                                child: Text('Chat Now',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white)),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(
                          //   width: Get.width * 0.53,
                          // ),
                          GestureDetector(
                            onTap: () {},
                            child: Container(
                              height: Get.height * 0.05,
                              width: Get.width * 0.4,
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(254, 0, 145, 1),
                                  borderRadius: BorderRadius.circular(60)),
                              child: Center(
                                child: Text(
                                    seekerOutgoingRequestSinglePageController
                                                .ViewProfileDetail
                                                .value
                                                .data!
                                                .matchWithStatus ==
                                            "rejected"
                                        ? "Rejected"
                                        : 'Requested',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white)),
                              ),
                            ),
                          ),
                          // SizedBox(
                          //   width: Get.width * 0.03,
                          // ),
                          // GestureDetector(
                          //   onTap: () {},
                          //   child: Container(
                          //     height: Get.height * 0.038,
                          //     width: Get.width * 0.2,
                          //     decoration: BoxDecoration(
                          //         color: Colors.white,
                          //         border: Border.all(
                          //             color: Color.fromRGBO(0, 12, 170, 1),
                          //             width: 1),
                          //         borderRadius: BorderRadius.circular(60)),
                          //     child: Center(
                          //       child: Text('Declined',
                          //           style: TextStyle(
                          //               fontSize: 8,
                          //               fontWeight: FontWeight.w700,
                          //               color: Color.fromRGBO(0, 12, 170, 1))),
                          //     ),
                          //   ),
                          // )
                        ],
                      )
              ]);
          }
        }),
      ),
    );
  }

  getMessagesStream1() async {
    print("an vb ");
    var data = await firestore
        .collection("s" +
            seekerMyProfileController
                .SeekerMyProfileDetail.value!.ProfileDetail!.id
                .toString())
        .doc(seekerOutgoingRequestSinglePageController
            .ViewProfileDetail.value.data!.roomid
            .toString())
        .get();
    var roomdetails = data.data() as Map<String, dynamic>;

    print(roomdetails);
    roomid = roomdetails["roomid"];
    // userIdsiker=roomdetails["Requestid"];
    // makeridchat=roomdetails["maker_id"];
    // seeker1=roomdetails['seeker_id1'];
    // seeker2=roomdetails['seeker_id2'];
    // chatname=roomdetails['roomname'];
    // chatimage1=roomdetails['seeker_inage1'];
    // chatimage=roomdetails['seeker_inage2'];
    // makeridchatimage=roomdetails['maker_image'];

    //  myid=seekerMyProfileController.SeekerMyProfileDetail.value.ProfileDetail!.id.toString();
    requestid = roomdetails["Requestid"];
    // seeker1=data['seeker_id1'];
    // seeker2=data['seeker_id2'];
    chatname = roomdetails['roomname'];
    chatimage1 = roomdetails['seeker_inage1'];

    if (seekerOutgoingRequestSinglePageController
            .ViewProfileDetail.value.data!.getmaker !=
        null) {
      Makeridchat = roomdetails['maker_id'];
      chatimage = roomdetails['maker_image'];
    }
    anotherchatuser = seekerMyProfileController
                .SeekerMyProfileDetail.value.ProfileDetail!.id
                .toString() ==
            data["seeker_id1"]
        ? data["seeker_id2"]
        : data["seeker_id1"];
    anotherCollecatinName = seekerMyProfileController
                .SeekerMyProfileDetail.value.ProfileDetail!.id
                .toString() ==
            data["seeker_id1"]
        ? data["seeker_id2"]
        : data["seeker_id1"];

    setState(() {});
    Get.to(ChatPage());
  }
}
