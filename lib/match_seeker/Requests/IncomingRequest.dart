import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../GlobalVariable/GlobalVariable.dart';
import '../../controllers/controller/IncomingRequestController/IncomingRequestController.dart';
import '../../controllers/incoming_request.dart';
import '../../data/response/status.dart';
import '../../res/components/general_exception.dart';
import '../../res/components/internet_exceptions_widget.dart';
import '../../utils/app_colors.dart';
import '../../widgets/my_button.dart';
import '../Chose_role_Type.dart';
import 'SeekeerIncominSingalRequestPage.dart';

class IncomingRequests extends StatefulWidget {
  const IncomingRequests({super.key});

  @override
  State<IncomingRequests> createState() => _IncomingRequestsState();
}

class _IncomingRequestsState extends State<IncomingRequests> {
  final RequestController requestController = Get.put(RequestController());

// IncomingRequestController Incontroller = Get.put(IncomingRequestController());

  final IncomingSeekerRequestController IncomingRequestControllerins =
      Get.put(IncomingSeekerRequestController());

  @override
  void initState() {
    IncomingRequestControllerins.seekerIncomingGoingRequest();
    // print(IncomingRequestControllerins.IncomingRequestvalue.value.requests!.byMaker![0].getmaker);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async{
        IncomingRequestControllerins.refreshApi();
      },
      child: RefreshIndicator(
        onRefresh: () async{
          IncomingRequestControllerins.refreshApi();
        },
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(top: 30, left: 40.0),
                child: Text(
                  "Incoming Request",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              backgroundColor: Colors.white,
              leading: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(Icons.arrow_back),
                ),
              ),
            ),
            body: SingleChildScrollView(child: Obx(() {
              final myProfileStatus =
                  IncomingRequestControllerins.rxRequestStatus.value;

              if (myProfileStatus == Status.ERROR) {
                if (IncomingRequestControllerins.rxRequestStatus.value ==
                    'No internet') {
                  return InterNetExceptionWidget(
                    onPress: () {
                      IncomingRequestControllerins.refreshApi();
                    },
                  );
                } else {
                  return GeneralExceptionWidget(onPress: () {
                    IncomingRequestControllerins.refreshApi();
                  });
                }
              } else if (myProfileStatus == Status.LOADING) {
                return  Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: Get.height *0.45,),
                    const Center(child: CircularProgressIndicator()),
                  ],
                );
              } else {

                  return Column(
                    children: [
                      SizedBox(height: Get.height * 0.05),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // SizedBox(width: Get.width*0.04,),
                          Container(
                            width: Get.width * 0.9,
                            height: Get.height * 0.065,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color.fromRGBO(242, 242, 242, 1)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 15.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        requestController.button_maker.value = true;
                                        requestController.button_seeker.value = false;


                                      },
                                      child: Container(
                                        width: Get.width * 0.35,
                                        height: Get.height * 0.04,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: requestController
                                                    .button_maker.value
                                                ? Color.fromRGBO(254, 0, 145, 1)
                                                : Color.fromRGBO(242, 242, 242, 1)),
                                        child: Center(
                                            child: Text(
                                          'By Maker',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              color: requestController
                                                      .button_maker.value
                                                  ? Colors.white
                                                  : Colors.black),
                                        )),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        requestController.button_maker.value =
                                            false;
                                        requestController.button_seeker.value =
                                            true;
                                      },
                                      child: Container(
                                        width: Get.width * 0.35,
                                        height: Get.height * 0.04,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: requestController
                                                    .button_seeker.value==true
                                                ? Color.fromRGBO(254, 0, 145, 1)
                                                : Color.fromRGBO(242, 242, 242, 1)),
                                        child: Center(
                                            child: Text(
                                          'By Seeker',
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w700,
                                              color: requestController
                                                      .button_seeker.value
                                                  ? Colors.white
                                                  : Colors.black),
                                        )),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      // IncomingRequestControllerins.IncomingRequestvalue
                      // //     .value.requests!.byMaker != null||
                      // IncomingRequestControllerins.IncomingRequestvalue.value
                      //                 .requests!.byMaker!.length !=
                      //             0 &&
                              (requestController.button_maker.value)
                          ? Row(
                              children: [
                                SizedBox(
                                  width: Get.width * 0.05,
                                ),
                                Text(
                                  'Search by Filter',
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: Get.width * 0.4,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _showDialogShort(context);
                                  },
                                  child: Container(
                                    height: Get.height * 0.050,
                                    width: Get.width * 0.12,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(242, 242, 242, 1),
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/icons/filter.png',
                                        // height: Get.height*0.08,
                                        // width: Get.width*0.06,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : SizedBox(),
                      // IncomingRequestControllerins.IncomingRequestvalue
                      // //     .value.requests!.bySeeker != null||
                      // IncomingRequestControllerins.IncomingRequestvalue.value
                      //                 .requests!.bySeeker!.length !=
                      //             0 &&
                              (requestController.button_maker.value != true)
                          ? Row(
                              children: [
                                SizedBox(
                                  width: Get.width * 0.05,
                                ),
                                Text(
                                  'Search by Filter',
                                  style: TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: Get.width * 0.4,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    _showDialogShort(context);
                                  },
                                  child: Container(
                                    height: Get.height * 0.050,
                                    width: Get.width * 0.12,
                                    decoration: BoxDecoration(
                                        color: Color.fromRGBO(242, 242, 242, 1),
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/icons/filter.png',
                                        // height: Get.height*0.08,
                                        // width: Get.width*0.06,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : SizedBox(),

                      SizedBox(
                        height: Get.height * 0.01,
                      ),
                      (requestController.button_maker.value)
                          ? Container(
                              // height: Get.height*0.6,
                              width: Get.width * 1,
                              child:
                              IncomingRequestControllerins
                                  .IncomingRequestvalue.value.message ==
              'No request found' ||IncomingRequestControllerins
                                              .IncomingRequestvalue
                                              .value
                                              .requests!
                                              .byMaker!.length ==
                                          0 ||
                                      IncomingRequestControllerins
                                              .IncomingRequestvalue
                                              .value
                                              .requests!
                                              .byMaker ==
                                          []
                                  ? Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: Get.height * 0.10,
                                        ),
                                        Container(
                                          height: Get.height * 0.2,
                                          width: Get.width * 0.8,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/recentConversationempty.png"))),
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.01,
                                        ),
                                        Center(
                                            child: Text(
                                          "Reference site about Lorem Ipsum\n   giving information on its origins",
                                          style: TextStyle(color: Colors.black),
                                        ))
                                      ],
                                    )
                                  : ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      // scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: IncomingRequestControllerins
                                          .IncomingRequestvalue
                                          .value
                                          .requests!
                                          .byMaker!
                                          .length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        if (IncomingRequestControllerins
                                                    .IncomingRequestvalue
                                                    .value
                                                    .requests!
                                                    .byMaker![index]
                                                    .getseeker !=
                                                [] ||
                                            IncomingRequestControllerins
                                                    .IncomingRequestvalue
                                                    .value
                                                    .requests!
                                                    .byMaker![index]
                                                    .getseeker !=
                                                null ||
                                            IncomingRequestControllerins
                                                    .IncomingRequestvalue
                                                    .value
                                                    .requests!
                                                    .byMaker![index]
                                                    .getseeker !=
                                                0 ||
                                            IncomingRequestControllerins
                                                    .IncomingRequestvalue
                                                    .value
                                                    .requests!
                                                    .byMaker![index]
                                                    .getmaker !=
                                                [] ||
                                            IncomingRequestControllerins
                                                    .IncomingRequestvalue
                                                    .value
                                                    .requests!
                                                    .byMaker![index]
                                                    .getmaker !=
                                                null ||
                                            IncomingRequestControllerins
                                                    .IncomingRequestvalue
                                                    .value
                                                    .requests!
                                                    .byMaker![index]
                                                    .getmaker !=
                                                0) {
                                          return Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Container(
                                              height: Get.height * 0.08,
                                              color: Color.fromRGBO(254, 0, 145, 1),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    child: Row(
                                                      children: [
                                                        Expanded(
                                                            flex: 2,
                                                            child: Row(
                                                          children: [
                                                            SizedBox(
                                                              width: Get.width * 0.03,
                                                            ),
                                                            Container(
                                                                height:
                                                                Get.height * 0.07,
                                                                width: Get.width * 0.13,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                        40)),
                                                                child: IncomingRequestControllerins
                                                                    .IncomingRequestvalue
                                                                    .value
                                                                    .requests!
                                                                    .byMaker![
                                                                index]
                                                                    .getseeker!
                                                                    .imgPath !=
                                                                    null
                                                                    ? CircleAvatar(
                                                                    radius: 22,
                                                                    backgroundImage: CachedNetworkImageProvider(IncomingRequestControllerins
                                                                        .IncomingRequestvalue
                                                                        .value
                                                                        .requests!
                                                                        .byMaker![
                                                                    index]
                                                                        .getseeker!
                                                                        .imgPath
                                                                        .toString()))
                                                                    : CircleAvatar(
                                                                  radius: 22,
                                                                  backgroundImage:
                                                                  NetworkImage(
                                                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU",
                                                                  ),
                                                                  backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                                )
                                                              // Incontroller.IncomingRequestvalue.value.requests!.byMaker[index].getSeeker!.imgPath.toString()
                                                            ),
                                                            SizedBox(
                                                              width: Get.width * 0.03,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              children: [

                                                                Container(
                                                                  width: Get.width * 0.15,
                                                                  child: Text(
                                                                    IncomingRequestControllerins
                                                                        .IncomingRequestvalue
                                                                        .value
                                                                        .requests!
                                                                        .byMaker![index]
                                                                        .getseeker!
                                                                        .name
                                                                        .toString(),
                                                                    style: TextStyle(
                                                                        color:
                                                                        Colors.white,
                                                                        fontSize: 12,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w600),
                                                                    overflow: TextOverflow.ellipsis,
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets.only(
                                                                      top: 2),
                                                                  child: Text(
                                                                    'Match Seeker',
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontSize: 10,
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .w300),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        )),

                                                       Expanded(
                                                         flex: 2,
                                                           child:  Padding(
                                                         padding:
                                                         const EdgeInsets.only(
                                                             top: 8.0),
                                                         child: Container(
                                                           width: Get.width * 0.5,
                                                           height:
                                                           Get.height * 0.065,
                                                           decoration: BoxDecoration(
                                                               color: Colors.white,
                                                               borderRadius: BorderRadius.only(
                                                                   topLeft: Radius
                                                                       .circular(
                                                                       10),
                                                                   bottomLeft: Radius
                                                                       .circular(
                                                                       10))),
                                                           child: Row(
                                                             children: [
                                                               SizedBox(
                                                                 width: Get.width *
                                                                     0.03,
                                                               ),
                                                               Container(
                                                                   height: Get.height *
                                                                       0.06,
                                                                   width:
                                                                   Get.width *
                                                                       0.1,
                                                                   decoration: BoxDecoration(
                                                                       borderRadius:
                                                                       BorderRadius.circular(
                                                                           40)),
                                                                   child: IncomingRequestControllerins
                                                                       .IncomingRequestvalue
                                                                       .value
                                                                       .requests!
                                                                       .byMaker![
                                                                   index]
                                                                       .getseeker!
                                                                       .imgPath !=
                                                                       null
                                                                       ? CircleAvatar(
                                                                       radius:
                                                                       22,
                                                                       backgroundImage: CachedNetworkImageProvider(IncomingRequestControllerins
                                                                           .IncomingRequestvalue
                                                                           .value
                                                                           .requests!
                                                                           .byMaker![index]
                                                                           .getmaker!
                                                                           .imgPath
                                                                           .toString()))
                                                                       : CircleAvatar(
                                                                     radius:
                                                                     22,
                                                                     backgroundImage:
                                                                     NetworkImage(
                                                                       "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU",
                                                                     ),
                                                                     backgroundColor:
                                                                     Colors.transparent,
                                                                   )),
                                                               SizedBox(
                                                                 width: Get.width *
                                                                     0.03,
                                                               ),
                                                               Column(
                                                                 crossAxisAlignment:
                                                                 CrossAxisAlignment
                                                                     .start,
                                                                 mainAxisAlignment:
                                                                 MainAxisAlignment
                                                                     .center,
                                                                 children: [
                                                                   Container(
                                                                     width: Get.width * 0.15,
                                                                     child: Text(
                                                                       IncomingRequestControllerins
                                                                           .IncomingRequestvalue
                                                                           .value
                                                                           .requests!
                                                                           .byMaker![
                                                                       index]
                                                                           .getmaker!
                                                                           .name
                                                                           .toString(),
                                                                       style: TextStyle(
                                                                           color: Colors
                                                                               .black,
                                                                           fontSize: 12,
                                                                           fontWeight:
                                                                           FontWeight
                                                                               .w600),
                                                                       overflow: TextOverflow.ellipsis,
                                                                     ),
                                                                   ),
                                                                   Padding(
                                                                     padding:
                                                                     EdgeInsets
                                                                         .only(
                                                                         top: 2),
                                                                     child: Container(
                                                                       child: Text(
                                                                         'Match Seeker',
                                                                         style: TextStyle(
                                                                             color: Colors
                                                                                 .black,
                                                                             fontSize:
                                                                             8,
                                                                             fontWeight:
                                                                             FontWeight.w300),
                                                                       ),
                                                                     ),
                                                                   )
                                                                 ],
                                                               ),
                                                               SizedBox(
                                                                 width: Get.width *
                                                                     0.1,
                                                               ),
                                                               GestureDetector(
                                                                 onTap: () {
                                                                   // _showDialogProfile(
                                                                   //     \context, index);
                                                                   setState(() {});

                                                                   requestid = IncomingRequestControllerins
                                                                       .IncomingRequestvalue
                                                                       .value
                                                                       .requests!
                                                                       .byMaker![
                                                                   index]
                                                                       .id
                                                                       .toString();

                                                                   if (requestid !=
                                                                       null) {
                                                                     print(
                                                                         requestid);
                                                                     Get.to(
                                                                         SeekerIncomingRequestSinglePage());
                                                                   }
                                                                 },
                                                                 child: Text(
                                                                   'View',
                                                                   style: TextStyle(
                                                                       decorationColor:
                                                                       Color.fromRGBO(
                                                                           254,
                                                                           0,
                                                                           145,
                                                                           1),
                                                                       decoration:
                                                                       TextDecoration
                                                                           .underline,
                                                                       fontSize: 9,
                                                                       fontWeight:
                                                                       FontWeight
                                                                           .w500,
                                                                       color: Color
                                                                           .fromRGBO(
                                                                           254,
                                                                           0,
                                                                           145,
                                                                           1)),
                                                                 ),
                                                               )
                                                             ],
                                                           ),
                                                         ),
                                                       ))
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }
                                      }),
                            )
                          : Container(
                              // height: Get.height*0.6,
                              width: Get.width * 1,
                              child: IncomingRequestControllerins
                                  .IncomingRequestvalue.value.message ==
                                  'No request found' || IncomingRequestControllerins
                                              .IncomingRequestvalue
                                              .value
                                              .requests!
                                              .bySeeker ==
                                          [] ||
                                      IncomingRequestControllerins
                                              .IncomingRequestvalue
                                              .value
                                              .requests!
                                              .bySeeker!
                                              .length ==
                                          0
                                  ? Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: Get.height * 0.15,
                                        ),
                                        Container(
                                          height: Get.height * 0.2,
                                          width: Get.width * 0.8,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/recentConversationempty.png"))),
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.01,
                                        ),
                                        Center(
                                            child: Text(
                                          "Reference site about Lorem Ipsum\n   giving information on its origins",
                                          style: TextStyle(color: Colors.black),
                                        ))
                                      ],
                                    )
                                  : ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: IncomingRequestControllerins
                                          .IncomingRequestvalue
                                          .value
                                          .requests!
                                          .bySeeker!
                                          .length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.only(top: 8.0),
                                          child: Container(
                                            height: Get.height * 0.08,
                                            color: Color.fromRGBO(254, 0, 145, 1),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: Get.height * 0.004,
                                                ),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      SizedBox(
                                                        width: Get.width * 0.03,
                                                      ),
                                                      Container(
                                                          height: Get.height * 0.07,
                                                          width: Get.width * 0.15,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          40)),
                                                          child: IncomingRequestControllerins
                                                                      .IncomingRequestvalue
                                                                      .value
                                                                      .requests!
                                                                      .bySeeker![
                                                                          index]
                                                                      .getseeker!
                                                                      .imgPath !=
                                                                  null
                                                              ? CircleAvatar(
                                                                  radius: 22,
                                                                  backgroundImage: CachedNetworkImageProvider(
                                                                      IncomingRequestControllerins
                                                                          .IncomingRequestvalue
                                                                          .value
                                                                          .requests!
                                                                          .bySeeker![
                                                                              index]
                                                                          .getseeker!
                                                                          .imgPath
                                                                          .toString()))
                                                              : CircleAvatar(
                                                                  radius: 22,
                                                                  backgroundImage:
                                                                      NetworkImage(
                                                                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU",
                                                                  ),
                                                                  backgroundColor:
                                                                      Colors
                                                                          .transparent,
                                                                )),
                                                      SizedBox(
                                                        width: Get.width * 0.03,
                                                      ),
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            width: Get.width * 0.15,
                                                            child: Text(
                                                              IncomingRequestControllerins
                                                                  .IncomingRequestvalue
                                                                  .value
                                                                  .requests!
                                                                  .bySeeker![index]
                                                                  .getseeker!
                                                                  .name
                                                                  .toString(),
                                                              overflow: TextOverflow.ellipsis,
                                                              style: TextStyle(

                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(top: 2),
                                                            child: Text(
                                                              'Match Seeker',
                                                              style: TextStyle(
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w300),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        width: Get.width * 0.5,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          // _showDialogProfile(
                                                          //     context, index);

                                                          requestid =
                                                              IncomingRequestControllerins
                                                                  .IncomingRequestvalue
                                                                  .value
                                                                  .requests!
                                                                  .bySeeker![index]
                                                                  .id
                                                                  .toString();

                                                          if (requestid != null) {
                                                            print(requestid);
                                                            Get.to(
                                                                SeekerIncomingRequestSinglePage());
                                                          }
                                                        },
                                                        child: Text(
                                                          'View',
                                                          style: TextStyle(
                                                              decorationColor:
                                                                  Colors.white,
                                                              decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                              fontSize: 9,
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              color: Colors.white),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                            ),
                    ],
                  );
                }
              }
            )),
          ),
        ),
      ),
    );
  }

  Future<void> _showDialogShort(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //  backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              height: Get.height * 0.5,
              width: Get.width * 0.8,
              child: Obx(
                () => Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(254, 0, 145, 1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Icon(
                              Icons.close,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    // SizedBox(height: Get.height*0.03,),
                    Text('Sort By',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        )),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Row(
                      children: [
                        Text('Location',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: Get.height * 0.05,
                          width: Get.width * 0.68,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            border: Border.all(width: 1, color: Colors.white),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: const Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Select Item',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: requestController.items
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                  .toList(),
                              value: requestController.selectedLocation.value,
                              onChanged: (String? value) {
                                requestController.setSelected(value!);
                              },
                              buttonStyleData: ButtonStyleData(
                                height: 50,
                                width: 160,
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  color: Colors.white,
                                ),
                                // elevation: 2,
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                ),
                                iconSize: 14,
                                iconEnabledColor: Colors.black,
                                iconDisabledColor: Colors.black,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: Get.height * 0.4,
                                width: Get.width * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  // color: Color.fromRGBO(53, 53, 53, 1),
                                ),
                                // offset: const Offset(-70, 0),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(40),
                                  thickness:
                                      MaterialStateProperty.all<double>(6),
                                  thumbVisibility:
                                      MaterialStateProperty.all<bool>(true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
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
                        Text('Radius',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            )),
                        SizedBox(
                          width: Get.width * 0.26,
                        ),
                        Text('Experiences',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: Get.height * 0.05,
                          width: Get.width * 0.31,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            border: Border.all(width: 1, color: Colors.white),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: const Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Select Item',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: requestController.items2
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                  .toList(),
                              value: requestController.selectedRadius.value,
                              onChanged: (String? value) {
                                // requestController.selectedLocation.value = value!;
                                requestController.setRadius(value!);
                              },
                              buttonStyleData: ButtonStyleData(
                                height: 50,
                                width: 160,
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  color: Colors.white,
                                ),
                                // elevation: 2,
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                ),
                                iconSize: 14,
                                iconEnabledColor: Colors.black,
                                iconDisabledColor: Colors.black,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: Get.height * 0.4,
                                width: Get.width * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  // color: Color.fromRGBO(53, 53, 53, 1),
                                ),
                                // offset: const Offset(-70, 0),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(40),
                                  thickness:
                                      MaterialStateProperty.all<double>(6),
                                  thumbVisibility:
                                      MaterialStateProperty.all<bool>(true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.05,
                        ),
                        Container(
                          height: Get.height * 0.05,
                          width: Get.width * 0.31,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            border: Border.all(width: 1, color: Colors.white),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: const Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Select Item',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: requestController.items3
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                  .toList(),
                              value: requestController.selectedExp.value,
                              onChanged: (String? value) {
                                // requestController.selectedLocation.value = value!;
                                requestController.setExp(value!);
                              },
                              buttonStyleData: ButtonStyleData(
                                height: 50,
                                width: 160,
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  color: Colors.white,
                                ),
                                // elevation: 2,
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                ),
                                iconSize: 14,
                                iconEnabledColor: Colors.black,
                                iconDisabledColor: Colors.black,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: Get.height * 0.4,
                                width: Get.width * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  // color: Color.fromRGBO(53, 53, 53, 1),
                                ),
                                // offset: const Offset(-70, 0),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(40),
                                  thickness:
                                      MaterialStateProperty.all<double>(6),
                                  thumbVisibility:
                                      MaterialStateProperty.all<bool>(true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
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
                        Text('Most like profile',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            )),
                        SizedBox(
                          width: Get.width * 0.12,
                        ),
                        Text('Confirmed Matches',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          height: Get.height * 0.05,
                          width: Get.width * 0.31,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            border: Border.all(width: 1, color: Colors.white),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: const Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Select Item',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: requestController.items4
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                  .toList(),
                              value: requestController.selectedPro.value,
                              onChanged: (String? value) {
                                // requestController.selectedLocation.value = value!;
                                requestController.setPro(value!);
                              },
                              buttonStyleData: ButtonStyleData(
                                height: 50,
                                width: 160,
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  color: Colors.white,
                                ),
                                // elevation: 2,
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                ),
                                iconSize: 14,
                                iconEnabledColor: Colors.black,
                                iconDisabledColor: Colors.black,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: Get.height * 0.4,
                                width: Get.width * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  // color: Color.fromRGBO(53, 53, 53, 1),
                                ),
                                // offset: const Offset(-70, 0),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(40),
                                  thickness:
                                      MaterialStateProperty.all<double>(6),
                                  thumbVisibility:
                                      MaterialStateProperty.all<bool>(true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: Get.width * 0.05,
                        ),
                        Container(
                          height: Get.height * 0.05,
                          width: Get.width * 0.31,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            border: Border.all(width: 1, color: Colors.white),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton2<String>(
                              isExpanded: true,
                              hint: const Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Select Item',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                              items: requestController.items5
                                  .map(
                                      (String item) => DropdownMenuItem<String>(
                                            value: item,
                                            child: Text(
                                              item,
                                              style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ))
                                  .toList(),
                              value: requestController.selectedMat.value,
                              onChanged: (String? value) {
                                // requestController.selectedLocation.value = value!;
                                requestController.setMat(value!);
                              },
                              buttonStyleData: ButtonStyleData(
                                height: 50,
                                width: 160,
                                padding:
                                    const EdgeInsets.only(left: 14, right: 14),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  color: Colors.white,
                                ),
                                // elevation: 2,
                              ),
                              iconStyleData: const IconStyleData(
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                ),
                                iconSize: 14,
                                iconEnabledColor: Colors.black,
                                iconDisabledColor: Colors.black,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                maxHeight: Get.height * 0.4,
                                width: Get.width * 0.4,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(14),
                                  // color: Color.fromRGBO(53, 53, 53, 1),
                                ),
                                // offset: const Offset(-70, 0),
                                scrollbarTheme: ScrollbarThemeData(
                                  radius: const Radius.circular(40),
                                  thickness:
                                      MaterialStateProperty.all<double>(6),
                                  thumbVisibility:
                                      MaterialStateProperty.all<bool>(true),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                height: 40,
                                padding: EdgeInsets.only(left: 14, right: 14),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: Get.height * 0.055,
                        width: Get.width * 0.4,
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(254, 0, 145, 1),
                            borderRadius: BorderRadius.circular(60)),
                        child: Center(
                          child: Text('Apply',
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        );
      },
    );
  }

  Future<void> _showDialogProfile(BuildContext context, int ind) {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //  backgroundColor: Colors.transparent,
          elevation: 0,
          content: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              height: Get.height * 0.55,
              width: Get.width * 0.8,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(254, 0, 145, 1),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Icon(
                            Icons.close,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Profile',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: Get.height * 0.04,
                  ),
                  CircleAvatar(
                    radius: 50,
                    child: CircleAvatar(
                        radius: 22,
                        backgroundImage: CachedNetworkImageProvider(
                            IncomingRequestControllerins.IncomingRequestvalue
                                .value.requests!.byMaker![ind].getmaker!.imgPath
                                .toString())),
                  ),

                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    IncomingRequestControllerins.IncomingRequestvalue.value
                        .requests!.byMaker![ind].getmaker!.name
                        .toString(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),

                  // SizedBox(height: Get.height*0.01,),
                  Text(
                    IncomingRequestControllerins.IncomingRequestvalue.value
                        .requests!.byMaker![ind].getmaker!.location
                        .toString(),
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),

                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Sex :',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: Get.width * 0.02,
                      ),
                      Text(
                        IncomingRequestControllerins.IncomingRequestvalue.value
                            .requests!.byMaker![ind].getmaker!.gender
                            .toString(),
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Experience :',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: Get.width * 0.02,
                      ),
                      Text(
                        IncomingRequestControllerins.IncomingRequestvalue.value
                            .requests!.byMaker![ind].getmaker!.experience
                            .toString(),
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Matches completed :',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: Get.width * 0.02,
                      ),
                      Text(
                        '50 Matches',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Successful Matches :',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: Get.width * 0.02,
                      ),
                      Text(
                        '40 Matches',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Liked Profile :',
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: Get.width * 0.02,
                      ),
                      Text(
                        '30 likes',
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: Get.height * 0.03,
                  ),
                  GestureDetector(
                    onTap: () {
                      // Get.to(() => IncomingRequestSinglePage());
                    },
                    child: Container(
                      height: Get.height * 0.05,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                          color: Color.fromRGBO(254, 0, 145, 1),
                          borderRadius: BorderRadius.circular(60)),
                      child: Center(
                        child: Text('Request',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.white)),
                      ),
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
// import 'package:cupid_match/controllers/controller/GetAllOcupationsController/GetAllOcupations.dart';
// import 'package:cupid_match/controllers/controller/IncomingRequestController/IncomingRequestController.dart';
// import 'package:cupid_match/controllers/controller/ViewSikerDetailsController/ViewSikerDetaolsController.dart';
// import 'package:cupid_match/controllers/sikerProfileController/sikershortprofilecontrller.dart';
// import 'package:cupid_match/data/response/status.dart';
// import 'package:cupid_match/match_maker/chat_screen.dart';
// import 'package:cupid_match/match_seeker/chat_screen.dart';
// import 'package:cupid_match/models/IncomingRequestModel/IncomingRequestModel.dart';
// import 'package:cupid_match/res/components/general_exception.dart';
// import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
// import 'package:cupid_match/utils/app_colors.dart';
// import 'package:cupid_match/widgets/my_button.dart';
// import 'package:cupid_match/widgets/seekershortprofile.dart';
// import 'package:cupid_match/widgets/shortprofilemaker.dart';
// import 'package:cupid_match/widgets/shortprofilepopup.dart';
// import 'package:flutter/material.dart';
//
// import 'package:get/get.dart';
// import 'package:dropdown_button2/dropdown_button2.dart';
//
//
// class IncomingRequests extends StatefulWidget {
//   const IncomingRequests({Key? key}) : super(key: key);
//
//   @override
//   State<IncomingRequests> createState() => _IncomingRequestsState();
// }
//
// class _IncomingRequestsState extends State<IncomingRequests> {
//
//   IncomingRequestController Incontroller = Get.put(IncomingRequestController());
//
// @override
//   void initState() {
//     requestid=null;
//     // TODO: implement initState
//     super.initState();
//   }
//
//   String? selectCityItems;
//   var CityItems = ["Jaipur", "Sikar"];
//
//   String? selectLocation;
//   var LocationItems = [
//     "Rajsthan",
//     "Haryana",
//   ];
//
//   String? selectRadius;
//   var radiusItems = [
//     "5Km",
//     "10Km",
//     "15Km",
//     "20Km",
//   ];
//
//   String? selectSearch;
//   var searchItems = [
//     "Rajasthan",
//     "Haryana",
//   ];
//
//   String? selectLike;
//   var likesItems = [
//     "100 Like",
//     "200 Like",
//   ];
//
//   String? confirmMatches;
//   var confirmItems = [
//     "10 Matches",
//     "20 Matches",
//   ];
//
//   var _formKey = GlobalKey<FormState>();
//   var isLoading = false;
//
//   void _submit() {
//     final isValid = _formKey.currentState!.validate();
//     if (!isValid) {
//       return;
//     }
//     _formKey.currentState!.save();
//   }
//
//   //Filter show dialog box
//   Future<void> _showDialog(BuildContext context) async {
//     await showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (BuildContext context) {
//         final height = MediaQuery.of(context).size.height;
//         final width = MediaQuery.of(context).size.width;
//         return AlertDialog(
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//           // title: Center(child: Text('Sort By')),
//           content: Form(
//             key: _formKey,
//             child: SingleChildScrollView(
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Align(
//                       alignment: Alignment.topRight,
//                       child: InkWell(
//                         child: Image.asset(
//                           "assets/images/remove.png",
//                           height: height * .03,
//                         ),
//                         onTap: () {
//                           Get.back();
//                         },
//                       )),
//                   Center(
//                       child: Text(
//                     'Sort By',
//                     style: Theme.of(context)
//                         .textTheme
//                         .titleSmall
//                         ?.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
//                   )),
//                   SizedBox(
//                     height: height * .05,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Flexible(
//                           child: Column(
//                         children: [
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "Select City",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodySmall
//                                   ?.copyWith(fontWeight: FontWeight.w600),
//                             ),
//                           ),
//                           SizedBox(
//                             height: height * .01,
//                           ),
//                           DropdownButtonFormField(
//                               value: selectCityItems,
//                               icon: const Icon(
//                                 Icons.keyboard_arrow_down,
//                                 color: Color(0xff000000),
//                                 size: 22,
//                               ),
//                               style: Theme.of(context).textTheme.bodyLarge,
//                               items: CityItems.map((String items) {
//                                 return DropdownMenuItem(
//                                   value: items,
//                                   child: Text(items),
//                                 );
//                               }).toList(),
//                               validator: (value) {
//                                 if (value == null) return "Select your city";
//                                 return null;
//                               },
//                               onChanged: (String? newValue) {
//                                 setState(() {
//                                   selectCityItems = newValue!;
//                                 });
//                               },
//                               // itemHeight: 20,
//                               decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.symmetric(
//                                     vertical: height * .01,
//                                     horizontal: width * .04),
//                                 hintText: "Select",
//                                 hintStyle: Theme.of(context)
//                                     .textTheme
//                                     .bodyLarge
//                                     ?.copyWith(
//                                         color: AppColors.subtitletextcolor,
//                                         fontSize: 12),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                   borderSide:
//                                       BorderSide(color: Colors.pinkAccent),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                   borderSide:
//                                       BorderSide(color: Color(0xffBABABA)),
//                                 ),
//                                 errorBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                   borderSide: BorderSide(color: Colors.red),
//                                 ),
//                                 disabledBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                   borderSide:
//                                       BorderSide(color: Color(0xffBABABA)),
//                                 ),
//                                 focusedErrorBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                   borderSide: BorderSide(color: Colors.pink),
//                                 ),
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30),
//                                     borderSide:
//                                         BorderSide(color: Color(0xffBABABA))),
//                               )),
//                         ],
//                       )),
//                       SizedBox(
//                         width: width * .02,
//                       ),
//                       Flexible(
//                           child: Column(
//                         children: [
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "Select State",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodySmall
//                                   ?.copyWith(fontWeight: FontWeight.w600),
//                             ),
//                           ),
//                           SizedBox(
//                             height: height * .01,
//                           ),
//                           DropdownButtonFormField(
//                               value: selectLocation,
//                               icon: const Icon(
//                                 Icons.keyboard_arrow_down,
//                                 color: Color(0xff000000),
//                                 size: 22,
//                               ),
//                               style: Theme.of(context).textTheme.bodyLarge,
//                               items: LocationItems.map((String items) {
//                                 return DropdownMenuItem(
//                                   value: items,
//                                   child: Text(items),
//                                 );
//                               }).toList(),
//                               validator: (value) {
//                                 if (value == null) return "Select your state";
//                                 return null;
//                               },
//                               onChanged: (String? newValue) {
//                                 setState(() {
//                                   selectLocation = newValue!;
//                                 });
//                               },
//                               decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.symmetric(
//                                     vertical: height * .01,
//                                     horizontal: width * .04),
//                                 hintText: "Select",
//                                 hintStyle: Theme.of(context)
//                                     .textTheme
//                                     .bodyLarge
//                                     ?.copyWith(
//                                         color: AppColors.subtitletextcolor,
//                                         fontSize: 12),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                   borderSide:
//                                       BorderSide(color: Colors.pinkAccent),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                   borderSide:
//                                       BorderSide(color: Color(0xffBABABA)),
//                                 ),
//                                 errorBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                   borderSide: BorderSide(color: Colors.red),
//                                 ),
//                                 disabledBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                   borderSide:
//                                       BorderSide(color: Color(0xffBABABA)),
//                                 ),
//                                 focusedErrorBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                   borderSide: BorderSide(color: Colors.pink),
//                                 ),
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30),
//                                     borderSide:
//                                         BorderSide(color: Color(0xffBABABA))),
//                               )),
//                         ],
//                       ))
//                     ],
//                   ),
//                   SizedBox(
//                     height: height * .03,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Flexible(
//                           child: Column(
//                         children: [
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "Radius",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodySmall
//                                   ?.copyWith(fontWeight: FontWeight.w600),
//                             ),
//                           ),
//                           SizedBox(
//                             height: height * .01,
//                           ),
//                           DropdownButtonFormField(
//                               value: selectRadius,
//                               icon: const Icon(
//                                 Icons.keyboard_arrow_down,
//                                 color: Color(0xff000000),
//                                 size: 22,
//                               ),
//                               style: Theme.of(context).textTheme.bodyLarge,
//                               items: radiusItems.map((String items) {
//                                 return DropdownMenuItem(
//                                   value: items,
//                                   child: Text(items),
//                                 );
//                               }).toList(),
//                               validator: (value) {
//                                 if (value == null) return "Select your radius";
//                                 return null;
//                               },
//                               onChanged: (String? newValue) {
//                                 setState(() {
//                                   selectRadius = newValue!;
//                                 });
//                               },
//                               // itemHeight: 20,
//                               decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.symmetric(
//                                     vertical: height * .01,
//                                     horizontal: width * .04),
//                                 hintText: "Select",
//                                 hintStyle: Theme.of(context)
//                                     .textTheme
//                                     .bodyLarge
//                                     ?.copyWith(
//                                         color: AppColors.subtitletextcolor,
//                                         fontSize: 12),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                   borderSide:
//                                       BorderSide(color: Colors.pinkAccent),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                   borderSide:
//                                       BorderSide(color: Color(0xffBABABA)),
//                                 ),
//                                 errorBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                   borderSide: BorderSide(color: Colors.red),
//                                 ),
//                                 disabledBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                   borderSide:
//                                       BorderSide(color: Color(0xffBABABA)),
//                                 ),
//                                 focusedErrorBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                   borderSide: BorderSide(color: Colors.pink),
//                                 ),
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30),
//                                     borderSide:
//                                         BorderSide(color: Color(0xffBABABA))),
//                               )),
//                         ],
//                       )),
//                       SizedBox(
//                         width: width * .02,
//                       ),
//                       Flexible(
//                           child: Column(
//                         children: [
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "Add Search Metrics",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodySmall
//                                   ?.copyWith(fontWeight: FontWeight.w600),
//                             ),
//                           ),
//                           SizedBox(
//                             height: height * .01,
//                           ),
//                           DropdownButtonFormField(
//                               value: selectLocation,
//                               icon: const Icon(
//                                 Icons.keyboard_arrow_down,
//                                 color: Color(0xff000000),
//                                 size: 22,
//                               ),
//                               style: Theme.of(context).textTheme.bodyLarge,
//                               items: LocationItems.map((String items) {
//                                 return DropdownMenuItem(
//                                   value: items,
//                                   child: Text(items),
//                                 );
//                               }).toList(),
//                               validator: (value) {
//                                 if (value == null)
//                                   return "Select your add search Metrics";
//                                 return null;
//                               },
//                               onChanged: (String? newValue) {
//                                 setState(() {
//                                   selectLocation = newValue!;
//                                 });
//                               },
//                               decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.symmetric(
//                                     vertical: height * .01,
//                                     horizontal: width * .04),
//                                 hintText: "Select",
//                                 hintStyle: Theme.of(context)
//                                     .textTheme
//                                     .bodyLarge
//                                     ?.copyWith(
//                                         color: AppColors.subtitletextcolor,
//                                         fontSize: 12),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                   borderSide:
//                                       BorderSide(color: Colors.pinkAccent),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                   borderSide:
//                                       BorderSide(color: Color(0xffBABABA)),
//                                 ),
//                                 errorBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                   borderSide: BorderSide(color: Colors.red),
//                                 ),
//                                 disabledBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                   borderSide:
//                                       BorderSide(color: Color(0xffBABABA)),
//                                 ),
//                                 focusedErrorBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                   borderSide: BorderSide(color: Colors.pink),
//                                 ),
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30),
//                                     borderSide:
//                                         BorderSide(color: Color(0xffBABABA))),
//                               )),
//                         ],
//                       ))
//                     ],
//                   ),
//                   SizedBox(
//                     height: height * .03,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Flexible(
//                           child: Column(
//                         children: [
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "Sort by most",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodySmall
//                                   ?.copyWith(fontWeight: FontWeight.w600),
//                             ),
//                           ),
//                           SizedBox(
//                             height: height * .01,
//                           ),
//                           DropdownButtonFormField(
//                               value: selectRadius,
//                               icon: const Icon(
//                                 Icons.keyboard_arrow_down,
//                                 color: Color(0xff000000),
//                                 size: 22,
//                               ),
//                               style: Theme.of(context).textTheme.bodyLarge,
//                               items: radiusItems.map((String items) {
//                                 return DropdownMenuItem(
//                                   value: items,
//                                   child: Text(items),
//                                 );
//                               }).toList(),
//                               validator: (value) {
//                                 if (value == null)
//                                   return "select your sort by matches";
//                                 return null;
//                               },
//                               onChanged: (String? newValue) {
//                                 setState(() {
//                                   selectRadius = newValue!;
//                                 });
//                               },
//                               // itemHeight: 20,
//                               decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.symmetric(
//                                     vertical: height * .01,
//                                     horizontal: width * .04),
//                                 hintText: "Select",
//                                 hintStyle: Theme.of(context)
//                                     .textTheme
//                                     .bodyLarge
//                                     ?.copyWith(
//                                         color: AppColors.subtitletextcolor,
//                                         fontSize: 12),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                   borderSide:
//                                       BorderSide(color: Colors.pinkAccent),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                   borderSide:
//                                       BorderSide(color: Color(0xffBABABA)),
//                                 ),
//                                 errorBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                   borderSide: BorderSide(color: Colors.red),
//                                 ),
//                                 disabledBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                   borderSide:
//                                       BorderSide(color: Color(0xffBABABA)),
//                                 ),
//                                 focusedErrorBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                   borderSide: BorderSide(color: Colors.pink),
//                                 ),
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30),
//                                     borderSide:
//                                         BorderSide(color: Color(0xffBABABA))),
//                               )),
//                         ],
//                       )),
//                       SizedBox(
//                         width: width * .02,
//                       ),
//                       Flexible(
//                           child: Column(
//                         children: [
//                           Align(
//                             alignment: Alignment.centerLeft,
//                             child: Text(
//                               "Most like profile",
//                               style: Theme.of(context)
//                                   .textTheme
//                                   .bodySmall
//                                   ?.copyWith(fontWeight: FontWeight.w600),
//                             ),
//                           ),
//                           SizedBox(
//                             height: height * .01,
//                           ),
//                           DropdownButtonFormField(
//                               value: selectLike,
//                               icon: const Icon(
//                                 Icons.keyboard_arrow_down,
//                                 color: Color(0xff000000),
//                                 size: 22,
//                               ),
//                               style: Theme.of(context).textTheme.bodyLarge,
//                               items: likesItems.map((String items) {
//                                 return DropdownMenuItem(
//                                   value: items,
//                                   child: Text(items),
//                                 );
//                               }).toList(),
//                               validator: (value) {
//                                 if (value == null)
//                                   return "Select your likes profile";
//                                 return null;
//                               },
//                               onChanged: (String? newValue) {
//                                 setState(() {
//                                   selectLike = newValue!;
//                                 });
//                               },
//                               decoration: InputDecoration(
//                                 contentPadding: EdgeInsets.symmetric(
//                                     vertical: height * .01,
//                                     horizontal: width * .04),
//                                 hintText: "Select",
//                                 hintStyle: Theme.of(context)
//                                     .textTheme
//                                     .bodyLarge
//                                     ?.copyWith(
//                                         color: AppColors.subtitletextcolor,
//                                         fontSize: 12),
//                                 focusedBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                   borderSide:
//                                       BorderSide(color: Colors.pinkAccent),
//                                 ),
//                                 enabledBorder: OutlineInputBorder(
//                                   borderRadius: BorderRadius.circular(30),
//                                   borderSide:
//                                       BorderSide(color: Color(0xffBABABA)),
//                                 ),
//                                 errorBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                   borderSide: BorderSide(color: Colors.red),
//                                 ),
//                                 disabledBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                   borderSide:
//                                       BorderSide(color: Color(0xffBABABA)),
//                                 ),
//                                 focusedErrorBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                   borderSide: BorderSide(color: Colors.pink),
//                                 ),
//                                 border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30),
//                                     borderSide:
//                                         BorderSide(color: Color(0xffBABABA))),
//                               )),
//                         ],
//                       ))
//                     ],
//                   ),
//                   SizedBox(
//                     height: height * .03,
//                   ),
//                   Container(
//                     width: width * .37,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Flexible(
//                             child: Column(
//                           children: [
//                             Align(
//                               alignment: Alignment.centerLeft,
//                               child: Text(
//                                 "Confirmed Matches",
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .bodySmall
//                                     ?.copyWith(fontWeight: FontWeight.w600),
//                               ),
//                             ),
//                             SizedBox(
//                               height: height * .01,
//                             ),
//                             DropdownButtonFormField(
//                                 value: confirmMatches,
//                                 icon: const Icon(
//                                   Icons.keyboard_arrow_down,
//                                   color: Color(0xff000000),
//                                   size: 22,
//                                 ),
//                                 style: Theme.of(context).textTheme.bodyLarge,
//                                 items: confirmItems.map((String items) {
//                                   return DropdownMenuItem(
//                                     value: items,
//                                     child: Text(items),
//                                   );
//                                 }).toList(),
//                                 validator: (value) {
//                                   if (value == null)
//                                     return "Select your confirm matches";
//                                   return null;
//                                 },
//                                 onChanged: (String? newValue) {
//                                   setState(() {
//                                     confirmMatches = newValue!;
//                                   });
//                                 },
//                                 // itemHeight: 20,
//                                 decoration: InputDecoration(
//                                   contentPadding: EdgeInsets.symmetric(
//                                       vertical: height * .01,
//                                       horizontal: width * .04),
//                                   hintText: "Select",
//                                   hintStyle: Theme.of(context)
//                                       .textTheme
//                                       .bodyLarge
//                                       ?.copyWith(
//                                           color: AppColors.subtitletextcolor,
//                                           fontSize: 12),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30),
//                                     borderSide:
//                                         BorderSide(color: Colors.pinkAccent),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(30),
//                                     borderSide:
//                                         BorderSide(color: Color(0xffBABABA)),
//                                   ),
//                                   errorBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(35.0)),
//                                     borderSide: BorderSide(color: Colors.red),
//                                   ),
//                                   disabledBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(35.0)),
//                                     borderSide:
//                                         BorderSide(color: Color(0xffBABABA)),
//                                   ),
//                                   focusedErrorBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(35.0)),
//                                     borderSide: BorderSide(color: Colors.pink),
//                                   ),
//                                   border: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30),
//                                       borderSide:
//                                           BorderSide(color: Color(0xffBABABA))),
//                                 )),
//                           ],
//                         )),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: height * .04,
//                   ),
//                   Center(
//                     child: MyButton(
//                       width: width * .4,
//                       title: "Apply",
//                       onTap: () {
//                         _submit();
//                         if (_formKey.currentState!.validate()) {
//                           _formKey.currentState!.save();
//                         }
//                       },
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   // MakerProfile show dialog box
//   Future<void> showmaker(BuildContext context) {
//     return showDialog(
//         context: context,
//         barrierDismissible: true,
//         builder: (BuildContext context) {
//           final height = MediaQuery.of(context).size.height;
//           final width = MediaQuery.of(context).size.width;
//           return  ShortProfileMaker();
//         });
//   }
//
//
// ///seeker
//
//   // MakerProfile show dialog box
//   Future<void> showseeker(BuildContext context) {
//
//     return showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           final height = MediaQuery.of(context).size.height;
//           final width = MediaQuery.of(context).size.width;
//           return shortprofilepopup();
//
//           }
//   );
//         }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           child: Icon(
//             Icons.arrow_back,
//             size: 27,
//             color: Color(0xff5A5A5A),
//           ),
//           onTap: () {
//             Get.back();
//           },
//         ),
//         title: Text(
//           "Incoming Requests",
//           style: Theme.of(context)
//               .textTheme
//               .titleMedium
//               ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
//         ),
//       ),
//       body: Obx(() {
//         return
//           SingleChildScrollView(
//           child: Column(
//             children: [
//            if(Incontroller.IncomingRequestvalue.value.status=="success" )   Padding(
//                 padding: EdgeInsets.symmetric(
//                     horizontal: width * .05, vertical: height * .03),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Search by Filter",
//                       style: Theme.of(context)
//                           .textTheme
//                           .titleSmall
//                           ?.copyWith(fontWeight: FontWeight.w600),
//                     ),
//                     InkWell(
//                       child: Image.asset(
//                         "assets/images/filter.png",
//                         height: height * .05,
//                       ),
//                       onTap: () {
//                         _showDialog(context);
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: height * .02,
//               ),
//
//
//
//         // Incontroller.IncomingRequestvalue.value.status=="success"   ?
//         //       ListView.builder(
//         //         shrinkWrap: true,
//         //         itemCount: Incontroller.IncomingRequestvalue.value.requests!.length,
//         //         physics: NeverScrollableScrollPhysics(),
//         //         itemBuilder: (context, index) {
//         //           return Padding(
//         //             padding: EdgeInsets.symmetric(vertical: height * .01),
//         //             child: Stack(
//         //               children: [
//         //                 Container(
//         //
//         //                   height: height * 0.11,
//         //                   decoration: BoxDecoration(color: Color(0xffFE0091)),
//         //                   child: Row(
//         //                     mainAxisAlignment: MainAxisAlignment.center,
//         //                     children: [
//         //                       Flexible(
//         //                         child: ListTile(
//         //                           leading: InkWell(
//         //                             child: CircleAvatar(
//         //                               radius: 24,
//         //                               backgroundColor: AppColors.white,
//         //                               child: CircleAvatar(
//         //                                   radius: 22,
//         //                                   backgroundImage: CachedNetworkImageProvider(Incontroller
//         //                                       .IncomingRequestvalue
//         //                                       .value
//         //                                       .requests![index]
//         //                                       .getSeeker!
//         //                                       .imgPath
//         //                                       .toString())),
//         //                             ),
//         //                             onTap: (){
//         //
//         //
//         //
//         //
//         //                               userIdsiker=Incontroller.IncomingRequestvalue.value.requests![index].getSeeker!.id.toString();
//         //
//         //
//         //                               print(userIdsiker);
//         //                               if(userIdsiker!=null){
//         //                                 showseeker(context);
//         //                               }
//         //                               // Get.to(ShortProfileSeeker());
//         //                             },
//         //                           ),
//         //                           horizontalTitleGap: 10,
//         //                           title: Text(
//         //                             Incontroller.IncomingRequestvalue.value
//         //                                 .requests![index].getSeeker!.name
//         //                                 .toString(),
//         //                             style: Theme.of(context)
//         //                                 .textTheme
//         //                                 .bodySmall
//         //                                 ?.copyWith(
//         //                                     fontWeight: FontWeight.w600,
//         //                                     color: AppColors.white),
//         //                           ),
//         //                           subtitle: Text(
//         //                             "Match Seeker",
//         //                             style: Theme.of(context)
//         //                                 .textTheme
//         //                                 .labelSmall
//         //                                 ?.copyWith(
//         //                                     fontWeight: FontWeight.w300,
//         //                                     color: AppColors.white),
//         //                           ),
//         //                         ),
//         //                       ),
//         //                       if (Incontroller.IncomingRequestvalue.value
//         //                               .requests![index].getMaker ==
//         //                           null)
//         //                         InkWell(
//         //                           child: Padding(
//         //                             padding: const EdgeInsets.only(right: 18.0),
//         //                             child: Text(
//         //                               "View",
//         //                               style: Theme.of(context)
//         //                                   .textTheme
//         //                                   .labelSmall
//         //                                   ?.copyWith(
//         //                                       fontSize: 9,
//         //                                       fontWeight: FontWeight.w500,
//         //                                       color: Colors.white,
//         //                                       decoration:
//         //                                           TextDecoration.underline),
//         //                             ),
//         //                           ),
//         //                           onTap: () {
//         //                      requestid=Incontroller.IncomingRequestvalue.value
//         //                               .requests![index].id.toString();
//         // setState(() {
//         //   requestype="1";
//         //   requestid;
//         //   print(Incontroller.IncomingRequestvalue.value
//         //                               .requests![index].id.toString());
//         // });
//         //
//         //                               if(requestid!=null){
//         //                                 print(requestid);
//         //     Get.to(ChatPage());
//         //                               }
//         //
//         //                           },
//         //                         ),
//         //                       if (Incontroller.IncomingRequestvalue.value
//         //                               .requests![index].getMaker !=
//         //                           null)
//         //                         Flexible(
//         //                           child: Container(
//         //                             height: height * 0.10,
//         //                             decoration: BoxDecoration(
//         //                                 color: AppColors.white,
//         //                                 borderRadius: BorderRadius.only(
//         //                                   topLeft: Radius.circular(11),
//         //                                   bottomLeft: Radius.circular(11),
//         //                                 )),
//         //                             child: ListTile(
//         //                               leading: CircleAvatar(
//         //                                 radius: 22,
//         //                                 child: InkWell(
//         //                                   child: CircleAvatar(
//         //                                       radius: 26,
//         //                                       backgroundImage: CachedNetworkImageProvider(
//         //                                           Incontroller
//         //                                               .IncomingRequestvalue
//         //                                               .value
//         //                                               .requests![index]
//         //                                               .getMaker!
//         //                                               .imgPath
//         //                                               .toString())),
//         //                                               onTap: (){
//         //
//         //                                                 Makerid=Incontroller.IncomingRequestvalue.value.requests![index].getMaker!.id.toString();
//         //                                               showmaker(context);
//         //                                               },
//         //                                 ),
//         //                               ),
//         //                               horizontalTitleGap: 10,
//         //                               title: Text(
//         //                                 Incontroller
//         //                                     .IncomingRequestvalue
//         //                                     .value
//         //                                     .requests![index].getMaker!.name.toString(),
//         //                                 style: Theme.of(context)
//         //                                     .textTheme
//         //                                     .bodySmall
//         //                                     ?.copyWith(
//         //                                         fontWeight: FontWeight.w600,
//         //                                         fontSize: 9),
//         //                               ),
//         //                               subtitle: Text(
//         //                                 "Match Maker",
//         //                                 style: Theme.of(context)
//         //                                     .textTheme
//         //                                     .bodySmall
//         //                                     ?.copyWith(
//         //                                         fontSize: 8,
//         //                                         fontWeight: FontWeight.w300,
//         //                                         color: Color(0xff777777)),
//         //                               ),
//         //                               trailing: InkWell(
//         //                                 child: Text(
//         //                                   "View",
//         //                                   style: Theme.of(context)
//         //                                       .textTheme
//         //                                       .labelSmall
//         //                                       ?.copyWith(
//         //                                           fontSize: 9,
//         //                                           fontWeight: FontWeight.w500,
//         //                                           color: Color(0xffFE0091),
//         //                                           decoration:
//         //                                               TextDecoration.underline),
//         //                                 ),
//         //                                onTap: () {
//         //                      requestid=Incontroller.IncomingRequestvalue.value
//         //                               .requests![index].id.toString();
//         // setState(() {
//         //   requestype="1";
//         //   requestid;
//         //   print(Incontroller.IncomingRequestvalue.value
//         //                               .requests![index].id.toString());
//         // });
//         //
//         //                               if(requestid!=null){
//         //                                 print(requestid);
//         //     Get.to(ChatPage());
//         //                               }}
//         //                               ),
//         //                             ),
//         //                           ),
//         //                         )
//         //                     ],
//         //                   ),
//         //                 ),
//         //               ],
//         //             ),
//         //           );
//         //         },
//         //       ): Column(
//         //
//         //         mainAxisAlignment: MainAxisAlignment.center,
//         //         crossAxisAlignment: CrossAxisAlignment.center,
//         //                         children: [
//         //                           SizedBox(height:Get.height*0.15,),
//         //                           Container(
//         //
//         //                                   height: Get.height*0.2,
//         //                                   width: Get.width*0.8,
//         //                                   decoration:BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/recentConversationempty.png"))),),
//         //
//         //                                   SizedBox(height: Get.height*0.01,),
//         //                                   Center(child: Text("Reference site about Lorem Ipsum\n   giving information on its origins",style: TextStyle(color: Colors.black),))
//         //                         ],
//         //                       ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
//
//
//
//
//   Future<void> showdilogapproved(BuildContext context) {
//     return showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           final height = MediaQuery.of(context).size.height;
//           final width = MediaQuery.of(context).size.width;
//           return AlertDialog(
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//             content: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Align(
//                     alignment: Alignment.topRight,
//                     child: InkWell(
//                       onTap: () {
//                         Get.back();
//                       },
//                       child: ClipRRect(
//                         borderRadius: BorderRadius.circular(20.0),
//                         child: Image.asset(
//                           'assets/images/remove.png',
//                           height: height * .03,
//                         ),
//                       ),
//                     ),
//                   ),
//
//                   SizedBox(
//                     height: height * 0.04,
//                   ),
//                   CircleAvatar(
//                     radius: 52,
//                     // backgroundColor: Colors.,
//                    child: Icon(Icons.check,size:70,weight:8.0,opticalSize: 30,),
//                   ),
//                   SizedBox(height: height * 0.04),
//                 Text("Congratulation!",style: TextStyle(color:Colors.black,fontWeight:FontWeight.bold,fontSize: 30,)),
//                   SizedBox(height: height * 0.04),
//                   Text("Your Request has been Acceped"),
//                   SizedBox(height: height * 0.01),
//
//                   Text("Successfully"),
//                   SizedBox(height: height * 0.04),
//
//                   MyButton(
//                     width: width * .5,
//                     title: "Back",
//                     onTap: () {},
//                   )
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }
