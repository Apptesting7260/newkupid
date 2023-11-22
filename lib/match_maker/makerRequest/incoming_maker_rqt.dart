import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../GlobalVariable/GlobalVariable.dart';
import '../../controllers/controller/IncomingMakerRequestController/incoming_maker_request_ controller.dart';
import '../../data/response/status.dart';
import '../../match_seeker/Requests/outgoingRequest.dart';
import '../../models/IncomingMakerRequestModel/incoming_maker_request_model.dart';
import '../../res/components/general_exception.dart';
import '../../res/components/internet_exceptions_widget.dart';
import '../createplanMonthley/FindNewMatches/FindNewMatches.dart';
import 'MakerSingleIncomingRequest.dart';

class IncomingMakerRequest extends StatefulWidget {
  const IncomingMakerRequest({super.key});

  @override
  State<IncomingMakerRequest> createState() => _IncomingMakerRequestState();
}

class _IncomingMakerRequestState extends State<IncomingMakerRequest> {
  final IncomingMakerRequestController requestMatchesController =
      Get.put(IncomingMakerRequestController());

  @override
  void initState() {
    requestMatchesController.makerListApi();
    // TODO: implement initState
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Padding(
            padding: const EdgeInsets.only(top: 30, left: 40.0),
            child: Text(
              "Request Matches",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(Icons.arrow_back)),
          ),
        ),
        body: Obx(() {
        final recentRequest=requestMatchesController.rxRequestStatus.value;
        if(recentRequest==Status.LOADING){
          return Center(
            child: CircularProgressIndicator(),
          );

        }

            return  SingleChildScrollView(
              child: Column(
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
                                      requestMatchesController
                                          .button_praticular.value = true;
                                      requestMatchesController
                                          .button_random.value = false;
                                    },
                                    child: Container(
                                      width: Get.width * 0.35,
                                      height: Get.height * 0.04,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: requestMatchesController
                                                  .button_praticular.value
                                              ? Color.fromRGBO(254, 0, 145, 1)
                                              : Color.fromRGBO(242, 242, 242, 1)),
                                      child: Center(
                                          child: Text(
                                        'Particular Profile',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color: requestMatchesController
                                                    .button_praticular.value
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
                                      requestMatchesController
                                          .button_praticular.value = false;
                                      requestMatchesController
                                          .button_random.value = true;
                                    },
                                    child: Container(
                                      width: Get.width * 0.35,
                                      height: Get.height * 0.04,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: requestMatchesController
                                                  .button_random.value
                                              ? Color.fromRGBO(254, 0, 145, 1)
                                              : Color.fromRGBO(242, 242, 242, 1)),
                                      child: Center(
                                          child: Text(
                                        'Random profile',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w700,
                                            color: requestMatchesController
                                                    .button_random.value
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
                        requestMatchesController.button_praticular.value
                        ? RefreshIndicator(
                          onRefresh: ()  async {
                            requestMatchesController.makerListApi();
                            print("object");
                          },
                          child: Container(
                              // height: Get.height*0.6,
                              width: Get.width * 1,
                              child:requestMatchesController.IncomingMakerValue.value.message!="No request found"


                                  ? Container(
                                    child:requestMatchesController
                                        .IncomingMakerValue
                                        .value
                                        .requests!
                .particularProfile!
                .length !=
          0? ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        shrinkWrap: true,
                                        itemCount: requestMatchesController
                                            .IncomingMakerValue
                                            .value
                                            .requests!
                                            .particularProfile!
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
                                                  Container(
                                                    child: Row(
                                                      children: [

                                                       Expanded(
                                                         flex: 2,
                                                           child: Row(children: [

                                                         SizedBox(
                                                           width: Get.width * 0.025,
                                                         ),
                                                         Container(
                                                             height: Get.height * 0.07,
                                                             width: Get.width * 0.13,
                                                             decoration: BoxDecoration(
                                                                 borderRadius:
                                                                 BorderRadius
                                                                     .circular(
                                                                     40)),
                                                             child: requestMatchesController
                                                                 .IncomingMakerValue
                                                                 .value
                                                                 .requests!
                                                                 .particularProfile![
                                                             index]
                                                                 .getseeker!
                                                                 .imgPath !=
                                                                 null
                                                                 ? CircleAvatar(
                                                                 radius: 22,
                                                                 backgroundImage: CachedNetworkImageProvider(
                                                                     requestMatchesController
                                                                         .IncomingMakerValue
                                                                         .value
                                                                         .requests!
                                                                         .particularProfile![
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
                                                           width: Get.width * 0.025,
                                                         ),
                                                         Column(

                                                           crossAxisAlignment:
                                                           CrossAxisAlignment
                                                               .start,
                                                           children: [
                                                             Container(
                                                               width: Get.width * 0.15,
                                                               child: Text(
                                                                 requestMatchesController
                                                                     .IncomingMakerValue
                                                                     .value
                                                                     .requests!
                                                                     .particularProfile![
                                                                 index]
                                                                     .getseeker!
                                                                     .name,
                                                                 style: TextStyle(
                                                                     color: Colors.white,
                                                                     fontSize: 12,
                                                                     fontWeight:
                                                                     FontWeight
                                                                         .w600),
                                                                 overflow: TextOverflow.ellipsis,

                                                               ),
                                                             ),
                                                             Text(
                                                               'Match Seeker',
                                                               style: TextStyle(
                                                                   color: Colors.white,
                                                                   fontSize: 10,
                                                                   fontWeight:
                                                                   FontWeight
                                                                       .w300),
                                                             ),
                                                           ],
                                                         ),
                                                       ],)),

                                                        Expanded(
                                                          flex: 2,
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.only(
                                                                    top: 8.0),
                                                            child: Container(
                                                              width: Get.width * 0.5,
                                                              height:
                                                                  Get.height * 0.065,
                                                              decoration: BoxDecoration(
                                                                  color: Colors.white,
                                                                  borderRadius:
                                                                      BorderRadius.only(
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
                                                                        0.025,
                                                                  ),
                                                                  Container(
                                                                      height:
                                                                          Get.height *
                                                                              0.06,
                                                                      width: Get.width *
                                                                          0.1,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(
                                                                                  40)),
                                                                      child: requestMatchesController
                                                                                  .IncomingMakerValue
                                                                                  .value
                                                                                  .requests!
                                                                                  .particularProfile![
                                                                                      index]
                                                                                  .getanotherseeker!
                                                                                  .imgPath !=
                                                                              null
                                                                          ? CircleAvatar(
                                                                              radius:
                                                                                  22,
                                                                              backgroundImage: CachedNetworkImageProvider(requestMatchesController
                                                                                  .IncomingMakerValue
                                                                                  .value
                                                                                  .requests!
                                                                                  .particularProfile![index]
                                                                                  .getanotherseeker!
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
                                                                                  Colors
                                                                                      .transparent,
                                                                            )),
                                                                  SizedBox(
                                                                    width: Get.width *
                                                                        0.025,
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
                                                                          requestMatchesController
                                                                              .IncomingMakerValue
                                                                              .value
                                                                              .requests!
                                                                              .particularProfile![
                                                                                  index]
                                                                              .getanotherseeker!
                                                                              .name,
                                                                          style: TextStyle(
                                                                              color: Colors
                                                                                  .black,
                                                                              fontSize: 9,
                                                                              fontWeight:
                                                                                  FontWeight
                                                                                      .w600),
                                                                          overflow: TextOverflow.ellipsis,
                                                                        ),
                                                                      ),
                                                                      Text(
                                                                        'Match Seeker',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize: 8,
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .w300),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        Get.width * 0.1,
                                                                  ),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      // _showDialogProfile(
                                                                      //     context);
                                                                      setState(() {
                                                                        requestid=null;
                                                                      });

                                                                      requestid = requestMatchesController
                                                                          .IncomingMakerValue
                                                                          .value
                                                                          .requests!
                                                                          .particularProfile![
                                                                      index]
                                                                          .id.toString();
                                                                      print(requestid);

                                                                      if (requestid != null) {
                                                                        print(requestid);
                                                                        Get.to(MakerSingleRequstPage(title: 'Incoming Request',));
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
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          );
                                        }) : Column(
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
                                    ),
                                  )
                                  : Column(
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
                                    ),
                            ),
                        ):
                        requestMatchesController.IncomingMakerValue.value.message=="No request found"?

                         Column(
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
                    ):
                        Container(
                            // height: Get.height*0.6,
                            width: Get.width * 1,
                            child: ListView.builder(
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                    itemCount: requestMatchesController
                                        .IncomingMakerValue
                                        .value
                                        .requests!
                                        .randomProfile!
                                        .length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                     // if(requestMatchesController.IncomingMakerValue.value
                                     //     .requests!
                                     //     .randomProfile![index].matchWith!=null||
                                     //     requestMatchesController.IncomingMakerValue.value
                                     //     .requests!
                                     //     .randomProfile![index].getanotherseeker!=null){

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
                                                               .circular(40)),
                                                       child: requestMatchesController
                                                           .IncomingMakerValue
                                                           .value
                                                           .requests!
                                                           .randomProfile![
                                                       index]
                                                           .getseeker!
                                                           .imgPath !=
                                                           null
                                                           ? CircleAvatar(
                                                           radius: 22,
                                                           backgroundImage: CachedNetworkImageProvider(
                                                               requestMatchesController
                                                                   .IncomingMakerValue
                                                                   .value
                                                                   .requests!
                                                                   .randomProfile![
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
                                                       ),
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
                                                           width: Get.width * 0.2,
                                                           child: Text(
                                                             requestMatchesController
                                                                 .IncomingMakerValue
                                                                 .value
                                                                 .requests!
                                                                 .randomProfile![
                                                             index]
                                                                 .getseeker!.name.toString(),
                                                             style: TextStyle(
                                                                 color: Colors.white,
                                                                 fontSize: 12,
                                                                 fontWeight:
                                                                 FontWeight
                                                                     .w600),
                                                             overflow: TextOverflow.ellipsis,
                                                           ),
                                                         ),
                                                         Text(
                                                           'Match Seeker',
                                                           style: TextStyle(
                                                               color: Colors.white,
                                                               fontSize: 10,
                                                               fontWeight:
                                                               FontWeight
                                                                   .w300),
                                                         ),
                                                       ],
                                                     ),
                                                     SizedBox(
                                                       width: Get.width * 0.5,
                                                     ),
                                                     GestureDetector(
                                                       onTap: () {

                                                         setState(() {
                                                           userIdsiker=null;
                                                         });
                                                             requestid=   requestMatchesController
                                                                 .IncomingMakerValue
                                                                 .value
                                                                 .requests!
                                                                 .randomProfile![
                                                             index].id.toString();
                                                         userIdsiker =   requestMatchesController
                                                             .IncomingMakerValue
                                                             .value
                                                             .requests!
                                                             .randomProfile![
                                                         index].matchFrom.toString()
                                                         ;
                                                         print(userIdsiker);

                                                         if (userIdsiker != null) {
                                                           print(userIdsiker);
                                                           Get.to(MakerSingleRequstPage(title: 'Incoming Request',));
                                                         }
                                                         // _showDialogProfile(

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
                ),
            );

          }
        ),
      ),
    );
  }

  // Future<void> _showDialogProfile(BuildContext context) {
  //   return showDialog<void>(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         //  backgroundColor: Colors.transparent,
  //         elevation: 0,
  //         content: Container(
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(12),
  //             ),
  //             height: Get.height * 0.55,
  //             width: Get.width * 0.8,
  //             child: Column(
  //               children: [
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   children: [
  //                     GestureDetector(
  //                       onTap: () => Get.back(),
  //                       child: Container(
  //                         decoration: BoxDecoration(
  //                           color: Color.fromRGBO(254, 0, 145, 1),
  //                           borderRadius: BorderRadius.circular(12),
  //                         ),
  //                         child: Icon(
  //                           Icons.close,
  //                           color: Colors.white,
  //                         ),
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //                 Text(
  //                   'Profile',
  //                   style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
  //                 ),
  //                 SizedBox(
  //                   height: Get.height * 0.04,
  //                 ),
  //                 CircleAvatar(
  //                   radius: 50,
  //                   child: Image.asset(
  //                     'assets/images/prof.png',
  //                     fit: BoxFit.contain,
  //                   ),
  //                 ),
  //
  //                 SizedBox(
  //                   height: Get.height * 0.02,
  //                 ),
  //                 Text(
  //                   'John Deo, 22',
  //                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
  //                 ),
  //
  //                 // SizedBox(height: Get.height*0.01,),
  //                 Text(
  //                   'Jaipur, Indian',
  //                   style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
  //                 ),
  //
  //                 SizedBox(
  //                   height: Get.height * 0.01,
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       'Sex :',
  //                       style: TextStyle(
  //                           fontSize: 12, fontWeight: FontWeight.w600),
  //                     ),
  //                     SizedBox(
  //                       width: Get.width * 0.02,
  //                     ),
  //                     Text(
  //                       'Male',
  //                       style: TextStyle(
  //                           fontSize: 12,
  //                           color: Colors.grey,
  //                           fontWeight: FontWeight.w400),
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: Get.height * 0.01,
  //                 ),
  //
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       'Experience :',
  //                       style: TextStyle(
  //                           fontSize: 12, fontWeight: FontWeight.w600),
  //                     ),
  //                     SizedBox(
  //                       width: Get.width * 0.02,
  //                     ),
  //                     Text(
  //                       '5 Years ',
  //                       style: TextStyle(
  //                           fontSize: 12,
  //                           color: Colors.grey,
  //                           fontWeight: FontWeight.w400),
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: Get.height * 0.01,
  //                 ),
  //
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       'Matches completed :',
  //                       style: TextStyle(
  //                           fontSize: 12, fontWeight: FontWeight.w600),
  //                     ),
  //                     SizedBox(
  //                       width: Get.width * 0.02,
  //                     ),
  //                     Text(
  //                       '50 Matches',
  //                       style: TextStyle(
  //                           fontSize: 12,
  //                           color: Colors.grey,
  //                           fontWeight: FontWeight.w400),
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: Get.height * 0.01,
  //                 ),
  //
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       'Successful Matches :',
  //                       style: TextStyle(
  //                           fontSize: 12, fontWeight: FontWeight.w600),
  //                     ),
  //                     SizedBox(
  //                       width: Get.width * 0.02,
  //                     ),
  //                     Text(
  //                       '40 Matches',
  //                       style: TextStyle(
  //                           fontSize: 12,
  //                           color: Colors.grey,
  //                           fontWeight: FontWeight.w400),
  //                     ),
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: Get.height * 0.01,
  //                 ),
  //
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Text(
  //                       'Liked Profile :',
  //                       style: TextStyle(
  //                           fontSize: 12, fontWeight: FontWeight.w600),
  //                     ),
  //                     SizedBox(
  //                       width: Get.width * 0.02,
  //                     ),
  //                     Text(
  //                       '30 likes',
  //                       style: TextStyle(
  //                           fontSize: 12,
  //                           color: Colors.grey,
  //                           fontWeight: FontWeight.w400),
  //                     ),
  //                   ],
  //                 ),
  //
  //                 SizedBox(
  //                   height: Get.height * 0.03,
  //                 ),
  //                 GestureDetector(
  //                   onTap: () {
  //                     // Get.to(() => IncomingRequestSinglePage());
  //                   },
  //                   child: Container(
  //                     height: Get.height * 0.05,
  //                     width: Get.width * 0.3,
  //                     decoration: BoxDecoration(
  //                         color: Color.fromRGBO(254, 0, 145, 1),
  //                         borderRadius: BorderRadius.circular(60)),
  //                     child: Center(
  //                       child: Text('Request',
  //                           style: TextStyle(
  //                               fontSize: 14,
  //                               fontWeight: FontWeight.w700,
  //                               color: Colors.white)),
  //                     ),
  //                   ),
  //                 )
  //               ],
  //             )),
  //       );
  //     },
  //   );
  // }
}

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
// import 'package:cupid_match/controllers/controller/GetAllOcupationsController/GetAllOcupations.dart';
// import 'package:cupid_match/controllers/controller/IncomingMakerRequestController/incoming_maker_request_%20controller.dart';
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
// class IncomingMakerRequest extends StatefulWidget {
//   const IncomingMakerRequest({Key? key}) : super(key: key);
//
//   @override
//   State<IncomingMakerRequest> createState() => _IncomingMakerRequestState();
// }
//
// class _IncomingMakerRequestState extends State<IncomingMakerRequest> {
//
//   IncomingMakerRequestController incomingMakerRequestController = Get.put(IncomingMakerRequestController());
//   int x = 5;
//   @override
//   void initState() {
//     incomingMakerRequestController.makerListApi();
//     requestid=null;
//     // TODO: implement initState
//     super.initState();
//     print(incomingMakerRequestController.IncomingMakerValue.value.requests);
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
//   String? selectSearch;
//   var searchItems = [
//     "Rajasthan",
//     "Haryana",
//   ];
//   String? selectLike;
//   var likesItems = [
//     "100 Like",
//     "200 Like",
//   ];
//   String? confirmMatches;
//   var confirmItems = [
//     "10 Matches",
//     "20 Matches",
//   ];
//   var _formKey = GlobalKey<FormState>();
//   var isLoading = false;
//   void _submit() {
//     final isValid = _formKey.currentState!.validate();
//     if (!isValid) {
//       return;
//     }
//     _formKey.currentState!.save();
//   }
//   Future<void> _showDialog(BuildContext context) async {
//     await showDialog(
//       barrierDismissible: false,
//       context: context,
//       builder: (BuildContext context) {
//         final height = MediaQuery.of(context).size.height;
//         final width = MediaQuery.of(context).size.width;
//         return AlertDialog(
//           shape:
//           RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
//                         'Sort By',
//                         style: Theme.of(context)
//                             .textTheme
//                             .titleSmall
//                             ?.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
//                       )),
//                   SizedBox(
//                     height: height * .05,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Flexible(
//                           child: Column(
//                             children: [
//                               Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text(
//                                   "Select City",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodySmall
//                                       ?.copyWith(fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: height * .01,
//                               ),
//                               DropdownButtonFormField(
//                                   value: selectCityItems,
//                                   icon: const Icon(
//                                     Icons.keyboard_arrow_down,
//                                     color: Color(0xff000000),
//                                     size: 22,
//                                   ),
//                                   style: Theme.of(context).textTheme.bodyLarge,
//                                   items: CityItems.map((String items) {
//                                     return DropdownMenuItem(
//                                       value: items,
//                                       child: Text(items),
//                                     );
//                                   }).toList(),
//                                   validator: (value) {
//                                     if (value == null) return "Select your city";
//                                     return null;
//                                   },
//                                   onChanged: (String? newValue) {
//                                     setState(() {
//                                       selectCityItems = newValue!;
//                                     });
//                                   },
//                                   // itemHeight: 20,
//                                   decoration: InputDecoration(
//                                     contentPadding: EdgeInsets.symmetric(
//                                         vertical: height * .01,
//                                         horizontal: width * .04),
//                                     hintText: "Select",
//                                     hintStyle: Theme.of(context)
//                                         .textTheme
//                                         .bodyLarge
//                                         ?.copyWith(
//                                         color: AppColors.subtitletextcolor,
//                                         fontSize: 12),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30),
//                                       borderSide:
//                                       BorderSide(color: Colors.pinkAccent),
//                                     ),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30),
//                                       borderSide:
//                                       BorderSide(color: Color(0xffBABABA)),
//                                     ),
//                                     errorBorder: OutlineInputBorder(
//                                       borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                       borderSide: BorderSide(color: Colors.red),
//                                     ),
//                                     disabledBorder: OutlineInputBorder(
//                                       borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                       borderSide:
//                                       BorderSide(color: Color(0xffBABABA)),
//                                     ),
//                                     focusedErrorBorder: OutlineInputBorder(
//                                       borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                       borderSide: BorderSide(color: Colors.pink),
//                                     ),
//                                     border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(30),
//                                         borderSide:
//                                         BorderSide(color: Color(0xffBABABA))),
//                                   )),
//                             ],
//                           )),
//                       SizedBox(
//                         width: width * .02,
//                       ),
//                       Flexible(
//                           child: Column(
//                             children: [
//                               Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text(
//                                   "Select State",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodySmall
//                                       ?.copyWith(fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: height * .01,
//                               ),
//                               DropdownButtonFormField(
//                                   value: selectLocation,
//                                   icon: const Icon(
//                                     Icons.keyboard_arrow_down,
//                                     color: Color(0xff000000),
//                                     size: 22,
//                                   ),
//                                   style: Theme.of(context).textTheme.bodyLarge,
//                                   items: LocationItems.map((String items) {
//                                     return DropdownMenuItem(
//                                       value: items,
//                                       child: Text(items),
//                                     );
//                                   }).toList(),
//                                   validator: (value) {
//                                     if (value == null) return "Select your state";
//                                     return null;
//                                   },
//                                   onChanged: (String? newValue) {
//                                     setState(() {
//                                       selectLocation = newValue!;
//                                     });
//                                   },
//                                   decoration: InputDecoration(
//                                     contentPadding: EdgeInsets.symmetric(
//                                         vertical: height * .01,
//                                         horizontal: width * .04),
//                                     hintText: "Select",
//                                     hintStyle: Theme.of(context)
//                                         .textTheme
//                                         .bodyLarge
//                                         ?.copyWith(
//                                         color: AppColors.subtitletextcolor,
//                                         fontSize: 12),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30),
//                                       borderSide:
//                                       BorderSide(color: Colors.pinkAccent),
//                                     ),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30),
//                                       borderSide:
//                                       BorderSide(color: Color(0xffBABABA)),
//                                     ),
//                                     errorBorder: OutlineInputBorder(
//                                       borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                       borderSide: BorderSide(color: Colors.red),
//                                     ),
//                                     disabledBorder: OutlineInputBorder(
//                                       borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                       borderSide:
//                                       BorderSide(color: Color(0xffBABABA)),
//                                     ),
//                                     focusedErrorBorder: OutlineInputBorder(
//                                       borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                       borderSide: BorderSide(color: Colors.pink),
//                                     ),
//                                     border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(30),
//                                         borderSide:
//                                         BorderSide(color: Color(0xffBABABA))),
//                                   )),
//                             ],
//                           ))
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
//                             children: [
//                               Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text(
//                                   "Radius",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodySmall
//                                       ?.copyWith(fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: height * .01,
//                               ),
//                               DropdownButtonFormField(
//                                   value: selectRadius,
//                                   icon: const Icon(
//                                     Icons.keyboard_arrow_down,
//                                     color: Color(0xff000000),
//                                     size: 22,
//                                   ),
//                                   style: Theme.of(context).textTheme.bodyLarge,
//                                   items: radiusItems.map((String items) {
//                                     return DropdownMenuItem(
//                                       value: items,
//                                       child: Text(items),
//                                     );
//                                   }).toList(),
//                                   validator: (value) {
//                                     if (value == null) return "Select your radius";
//                                     return null;
//                                   },
//                                   onChanged: (String? newValue) {
//                                     setState(() {
//                                       selectRadius = newValue!;
//                                     });
//                                   },
//                                   // itemHeight: 20,
//                                   decoration: InputDecoration(
//                                     contentPadding: EdgeInsets.symmetric(
//                                         vertical: height * .01,
//                                         horizontal: width * .04),
//                                     hintText: "Select",
//                                     hintStyle: Theme.of(context)
//                                         .textTheme
//                                         .bodyLarge
//                                         ?.copyWith(
//                                         color: AppColors.subtitletextcolor,
//                                         fontSize: 12),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30),
//                                       borderSide:
//                                       BorderSide(color: Colors.pinkAccent),
//                                     ),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30),
//                                       borderSide:
//                                       BorderSide(color: Color(0xffBABABA)),
//                                     ),
//                                     errorBorder: OutlineInputBorder(
//                                       borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                       borderSide: BorderSide(color: Colors.red),
//                                     ),
//                                     disabledBorder: OutlineInputBorder(
//                                       borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                       borderSide:
//                                       BorderSide(color: Color(0xffBABABA)),
//                                     ),
//                                     focusedErrorBorder: OutlineInputBorder(
//                                       borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                       borderSide: BorderSide(color: Colors.pink),
//                                     ),
//                                     border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(30),
//                                         borderSide:
//                                         BorderSide(color: Color(0xffBABABA))),
//                                   )),
//                             ],
//                           )),
//                       SizedBox(
//                         width: width * .02,
//                       ),
//                       Flexible(
//                           child: Column(
//                             children: [
//                               Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text(
//                                   "Add Search Metrics",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodySmall
//                                       ?.copyWith(fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: height * .01,
//                               ),
//                               DropdownButtonFormField(
//                                   value: selectLocation,
//                                   icon: const Icon(
//                                     Icons.keyboard_arrow_down,
//                                     color: Color(0xff000000),
//                                     size: 22,
//                                   ),
//                                   style: Theme.of(context).textTheme.bodyLarge,
//                                   items: LocationItems.map((String items) {
//                                     return DropdownMenuItem(
//                                       value: items,
//                                       child: Text(items),
//                                     );
//                                   }).toList(),
//                                   validator: (value) {
//                                     if (value == null)
//                                       return "Select your add search Metrics";
//                                     return null;
//                                   },
//                                   onChanged: (String? newValue) {
//                                     setState(() {
//                                       selectLocation = newValue!;
//                                     });
//                                   },
//                                   decoration: InputDecoration(
//                                     contentPadding: EdgeInsets.symmetric(
//                                         vertical: height * .01,
//                                         horizontal: width * .04),
//                                     hintText: "Select",
//                                     hintStyle: Theme.of(context)
//                                         .textTheme
//                                         .bodyLarge
//                                         ?.copyWith(
//                                         color: AppColors.subtitletextcolor,
//                                         fontSize: 12),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30),
//                                       borderSide:
//                                       BorderSide(color: Colors.pinkAccent),
//                                     ),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30),
//                                       borderSide:
//                                       BorderSide(color: Color(0xffBABABA)),
//                                     ),
//                                     errorBorder: OutlineInputBorder(
//                                       borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                       borderSide: BorderSide(color: Colors.red),
//                                     ),
//                                     disabledBorder: OutlineInputBorder(
//                                       borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                       borderSide:
//                                       BorderSide(color: Color(0xffBABABA)),
//                                     ),
//                                     focusedErrorBorder: OutlineInputBorder(
//                                       borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                       borderSide: BorderSide(color: Colors.pink),
//                                     ),
//                                     border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(30),
//                                         borderSide:
//                                         BorderSide(color: Color(0xffBABABA))),
//                                   )),
//                             ],
//                           ))
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
//                             children: [
//                               Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text(
//                                   "Sort by most",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodySmall
//                                       ?.copyWith(fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: height * .01,
//                               ),
//                               DropdownButtonFormField(
//                                   value: selectRadius,
//                                   icon: const Icon(
//                                     Icons.keyboard_arrow_down,
//                                     color: Color(0xff000000),
//                                     size: 22,
//                                   ),
//                                   style: Theme.of(context).textTheme.bodyLarge,
//                                   items: radiusItems.map((String items) {
//                                     return DropdownMenuItem(
//                                       value: items,
//                                       child: Text(items),
//                                     );
//                                   }).toList(),
//                                   validator: (value) {
//                                     if (value == null)
//                                       return "select your sort by matches";
//                                     return null;
//                                   },
//                                   onChanged: (String? newValue) {
//                                     setState(() {
//                                       selectRadius = newValue!;
//                                     });
//                                   },
//                                   // itemHeight: 20,
//                                   decoration: InputDecoration(
//                                     contentPadding: EdgeInsets.symmetric(
//                                         vertical: height * .01,
//                                         horizontal: width * .04),
//                                     hintText: "Select",
//                                     hintStyle: Theme.of(context)
//                                         .textTheme
//                                         .bodyLarge
//                                         ?.copyWith(
//                                         color: AppColors.subtitletextcolor,
//                                         fontSize: 12),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30),
//                                       borderSide:
//                                       BorderSide(color: Colors.pinkAccent),
//                                     ),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30),
//                                       borderSide:
//                                       BorderSide(color: Color(0xffBABABA)),
//                                     ),
//                                     errorBorder: OutlineInputBorder(
//                                       borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                       borderSide: BorderSide(color: Colors.red),
//                                     ),
//                                     disabledBorder: OutlineInputBorder(
//                                       borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                       borderSide:
//                                       BorderSide(color: Color(0xffBABABA)),
//                                     ),
//                                     focusedErrorBorder: OutlineInputBorder(
//                                       borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                       borderSide: BorderSide(color: Colors.pink),
//                                     ),
//                                     border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(30),
//                                         borderSide:
//                                         BorderSide(color: Color(0xffBABABA))),
//                                   )),
//                             ],
//                           )),
//                       SizedBox(
//                         width: width * .02,
//                       ),
//                       Flexible(
//                           child: Column(
//                             children: [
//                               Align(
//                                 alignment: Alignment.centerLeft,
//                                 child: Text(
//                                   "Most like profile",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodySmall
//                                       ?.copyWith(fontWeight: FontWeight.w600),
//                                 ),
//                               ),
//                               SizedBox(
//                                 height: height * .01,
//                               ),
//                               DropdownButtonFormField(
//                                   value: selectLike,
//                                   icon: const Icon(
//                                     Icons.keyboard_arrow_down,
//                                     color: Color(0xff000000),
//                                     size: 22,
//                                   ),
//                                   style: Theme.of(context).textTheme.bodyLarge,
//                                   items: likesItems.map((String items) {
//                                     return DropdownMenuItem(
//                                       value: items,
//                                       child: Text(items),
//                                     );
//                                   }).toList(),
//                                   validator: (value) {
//                                     if (value == null)
//                                       return "Select your likes profile";
//                                     return null;
//                                   },
//                                   onChanged: (String? newValue) {
//                                     setState(() {
//                                       selectLike = newValue!;
//                                     });
//                                   },
//                                   decoration: InputDecoration(
//                                     contentPadding: EdgeInsets.symmetric(
//                                         vertical: height * .01,
//                                         horizontal: width * .04),
//                                     hintText: "Select",
//                                     hintStyle: Theme.of(context)
//                                         .textTheme
//                                         .bodyLarge
//                                         ?.copyWith(
//                                         color: AppColors.subtitletextcolor,
//                                         fontSize: 12),
//                                     focusedBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30),
//                                       borderSide:
//                                       BorderSide(color: Colors.pinkAccent),
//                                     ),
//                                     enabledBorder: OutlineInputBorder(
//                                       borderRadius: BorderRadius.circular(30),
//                                       borderSide:
//                                       BorderSide(color: Color(0xffBABABA)),
//                                     ),
//                                     errorBorder: OutlineInputBorder(
//                                       borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                       borderSide: BorderSide(color: Colors.red),
//                                     ),
//                                     disabledBorder: OutlineInputBorder(
//                                       borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                       borderSide:
//                                       BorderSide(color: Color(0xffBABABA)),
//                                     ),
//                                     focusedErrorBorder: OutlineInputBorder(
//                                       borderRadius:
//                                       BorderRadius.all(Radius.circular(35.0)),
//                                       borderSide: BorderSide(color: Colors.pink),
//                                     ),
//                                     border: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(30),
//                                         borderSide:
//                                         BorderSide(color: Color(0xffBABABA))),
//                                   )),
//                             ],
//                           ))
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
//                               children: [
//                                 Align(
//                                   alignment: Alignment.centerLeft,
//                                   child: Text(
//                                     "Confirmed Matches",
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodySmall
//                                         ?.copyWith(fontWeight: FontWeight.w600),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   height: height * .01,
//                                 ),
//                                 DropdownButtonFormField(
//                                     value: confirmMatches,
//                                     icon: const Icon(
//                                       Icons.keyboard_arrow_down,
//                                       color: Color(0xff000000),
//                                       size: 22,
//                                     ),
//                                     style: Theme.of(context).textTheme.bodyLarge,
//                                     items: confirmItems.map((String items) {
//                                       return DropdownMenuItem(
//                                         value: items,
//                                         child: Text(items),
//                                       );
//                                     }).toList(),
//                                     validator: (value) {
//                                       if (value == null)
//                                         return "Select your confirm matches";
//                                       return null;
//                                     },
//                                     onChanged: (String? newValue) {
//                                       setState(() {
//                                         confirmMatches = newValue!;
//                                       });
//                                     },
//                                     // itemHeight: 20,
//                                     decoration: InputDecoration(
//                                       contentPadding: EdgeInsets.symmetric(
//                                           vertical: height * .01,
//                                           horizontal: width * .04),
//                                       hintText: "Select",
//                                       hintStyle: Theme.of(context)
//                                           .textTheme
//                                           .bodyLarge
//                                           ?.copyWith(
//                                           color: AppColors.subtitletextcolor,
//                                           fontSize: 12),
//                                       focusedBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(30),
//                                         borderSide:
//                                         BorderSide(color: Colors.pinkAccent),
//                                       ),
//                                       enabledBorder: OutlineInputBorder(
//                                         borderRadius: BorderRadius.circular(30),
//                                         borderSide:
//                                         BorderSide(color: Color(0xffBABABA)),
//                                       ),
//                                       errorBorder: OutlineInputBorder(
//                                         borderRadius:
//                                         BorderRadius.all(Radius.circular(35.0)),
//                                         borderSide: BorderSide(color: Colors.red),
//                                       ),
//                                       disabledBorder: OutlineInputBorder(
//                                         borderRadius:
//                                         BorderRadius.all(Radius.circular(35.0)),
//                                         borderSide:
//                                         BorderSide(color: Color(0xffBABABA)),
//                                       ),
//                                       focusedErrorBorder: OutlineInputBorder(
//                                         borderRadius:
//                                         BorderRadius.all(Radius.circular(35.0)),
//                                         borderSide: BorderSide(color: Colors.pink),
//                                       ),
//                                       border: OutlineInputBorder(
//                                           borderRadius: BorderRadius.circular(30),
//                                           borderSide:
//                                           BorderSide(color: Color(0xffBABABA))),
//                                     )),
//                               ],
//                             )),
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
//         }
//     );
//   }
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
//       body:
//       SingleChildScrollView(
//         child: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.symmetric(
//                   horizontal: width * .05, vertical: height * .03),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Search by Filter",
//                     style: Theme.of(context)
//                         .textTheme
//                         .titleSmall
//                         ?.copyWith(fontWeight: FontWeight.w600),
//                   ),
//                   InkWell(
//                     child: Image.asset(
//                       "assets/images/filter.png",
//                       height: height * .05,
//                     ),
//                     onTap: () {
//                       _showDialog(context);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: height * .02,
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: incomingMakerRequestController.IncomingMakerValue.value.requests!.length,
//               physics: NeverScrollableScrollPhysics(),
//               itemBuilder: (context, index) {
//                 return Padding(
//                   padding: EdgeInsets.symmetric(vertical: height * .01),
//                   child: Stack(
//                     children: [
//                       Container(
//
//                         height: height * 0.11,
//                         decoration: BoxDecoration(color: Color(0xffFE0091)),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Flexible(
//                               child: ListTile(
//                                 leading: InkWell(
//                                   child: CircleAvatar(
//                                     radius: 24,
//                                     backgroundColor: AppColors.white,
//                                     child: CircleAvatar(
//                                         radius: 22,
//                                         backgroundImage: CachedNetworkImageProvider(incomingMakerRequestController
//                                             .IncomingMakerValue
//                                             .value
//                                             .requests![index]
//                                             .getmaker!
//                                             .imgPath
//                                             .toString())),
//                                   ),
//                                   onTap: (){
//
//
//
//
//                                     userIdsiker=incomingMakerRequestController.IncomingMakerValue.value.requests![index].getmaker!.id.toString();
//
//
//                                     print(userIdsiker);
//                                     if(userIdsiker!=null){
//                                       showseeker(context);
//                                     }
//                                     // Get.to(ShortProfileSeeker());
//                                   },
//                                 ),
//                                 horizontalTitleGap: 10,
//                                 title: Text(
//                                   incomingMakerRequestController.IncomingMakerValue.value
//                                       .requests![index].getmaker!.name
//                                       .toString(),
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .bodySmall
//                                       ?.copyWith(
//                                       fontWeight: FontWeight.w600,
//                                       color: AppColors.white),
//                                 ),
//                                 subtitle: Text(
//                                   "Match Maker",
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .labelSmall
//                                       ?.copyWith(
//                                       fontWeight: FontWeight.w300,
//                                       color: AppColors.white),
//                                 ),
//                               ),
//                             ),
//                             if ( incomingMakerRequestController.IncomingMakerValue.value!=null)
//                               InkWell(
//                                 child: Padding(
//                                   padding: const EdgeInsets.only(right: 18.0),
//                                   child: Text(
//                                     "View",
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .labelSmall
//                                         ?.copyWith(
//                                         fontSize: 9,
//                                         fontWeight: FontWeight.w500,
//                                         color: Colors.white,
//                                         decoration:
//                                         TextDecoration.underline),
//                                   ),
//                                 ),
//                                 onTap: () {
//                                   requestid=incomingMakerRequestController.IncomingMakerValue.value
//                                       .requests![index].id.toString();
//                                   setState(() {
//                                     requestype="1";
//                                     requestid;
//                                     print(incomingMakerRequestController.IncomingMakerValue.value
//                                         .requests![index].id.toString());
//                                   });
//
//                                   if( incomingMakerRequestController.IncomingMakerValue.value!=null){
//                                     print(requestid);
//                                     Get.to(ChatPage());
//                                   }
//
//                                 },
//                               ),
//                             if (incomingMakerRequestController.IncomingMakerValue.value !=
//                                 null)
//                               Flexible(
//                                 child: Container(
//                                   height: height * 0.10,
//                                   decoration: BoxDecoration(
//                                       color: AppColors.white,
//                                       borderRadius: BorderRadius.only(
//                                         topLeft: Radius.circular(11),
//                                         bottomLeft: Radius.circular(11),
//                                       )),
//                                   child: ListTile(
//                                     leading: CircleAvatar(
//                                       radius: 22,
//                                       child: InkWell(
//                                         child: CircleAvatar(
//                                             radius: 26,
//                                             backgroundImage: CachedNetworkImageProvider(incomingMakerRequestController
//                                                 .IncomingMakerValue
//                                                 .value
//                                                 .requests![index]
//                                                 .getseeker!
//                                                 .imgPath
//                                                 .toString())),
//                                         onTap: (){
//
//                                           // Makerid=Incontroller.IncomingRequestvalue.value.requests![index].getMaker!.id.toString();
//                                           showmaker(context);
//                                         },
//                                       ),
//                                     ),
//                                     horizontalTitleGap: 10,
//                                     title: Text(
//                                       incomingMakerRequestController.IncomingMakerValue.value
//                                           .requests![index].getseeker!.name
//                                           .toString(),
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodySmall
//                                           ?.copyWith(
//                                           fontWeight: FontWeight.w600,
//                                           fontSize: 9),
//                                     ),
//                                     subtitle: Text(
//                                       "Match Maker",
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .bodySmall
//                                           ?.copyWith(
//                                           fontSize: 8,
//                                           fontWeight: FontWeight.w300,
//                                           color: Color(0xff777777)),
//                                     ),
//                                     trailing: InkWell(
//                                         child: Text(
//                                           "View",
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .labelSmall
//                                               ?.copyWith(
//                                               fontSize: 9,
//                                               fontWeight: FontWeight.w500,
//                                               color: Color(0xffFE0091),
//                                               decoration:
//                                               TextDecoration.underline),
//                                         ),
//                                         onTap: () {
//                                           // requestid=Incontroller.IncomingRequestvalue.value
//                                           //     .requests![index].id.toString();
//                                           // setState(() {
//                                           //   requestype="1";
//                                           //   requestid;
//                                           //   print(Incontroller.IncomingRequestvalue.value
//                                           //       .requests![index].id.toString());
//                                           // });
//
//                                           if(x!=null){
//                                             print(requestid);
//                                             Get.to(ChatPage());
//                                           }}
//                                     ),
//                                   ),
//                                 ),
//                               )
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ],
//         ),
//       )
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
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
//                     child: Icon(Icons.check,size:70,weight:8.0,opticalSize: 30,),
//                   ),
//                   SizedBox(height: height * 0.04),
//                   Text("Congratulation!",style: TextStyle(color:Colors.black,fontWeight:FontWeight.bold,fontSize: 30,)),
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
