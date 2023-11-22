import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/controller/OutgoingRequestController/OutgoingRequestController.dart';
import 'package:cupid_match/match_seeker/chat_screen.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:cupid_match/widgets/seekershortprofile.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../controllers/SeekerOutGoingController.dart';
import '../../data/response/status.dart';
import '../../models/SeekerRequestModel.dart';
import '../../res/components/general_exception.dart';
import '../../res/components/internet_exceptions_widget.dart';
import 'SeekerRequestPage.dart';

class OutGoingRequest extends StatefulWidget {
  const OutGoingRequest({super.key});

  @override
  State<OutGoingRequest> createState() => _OutGoingRequestState();
}

final SeekrOutgoingRequestController seekrOutgoingRequestController =
    Get.put(SeekrOutgoingRequestController());

class _OutGoingRequestState extends State<OutGoingRequest> {
  @override
  void initState() {
    seekrOutgoingRequestController.seekerOutGoingRequest();
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()async {
        seekrOutgoingRequestController.seekerOutGoingRequest();
      },
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            bottomOpacity: 0.0,
            elevation: 0.0,
            title: Padding(
              padding: const EdgeInsets.only(top: 30, left: 40.0),
              child: Text(
                "Request to be Matched",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: IconButton(onPressed: () => Navigator.pop(context), icon: Icon( Icons.arrow_back,
                color: Color.fromRGBO(90, 90, 90, 1),)),
            ),
          ),
          body:SingleChildScrollView(
            child:  Obx(() {
              switch (seekrOutgoingRequestController.rxRequestStatus.value) {
                case Status.LOADING:
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: Get.height *0.45,),
                      const Center(child: CircularProgressIndicator()),
                    ],
                  );
                case Status.ERROR:
                  if (seekrOutgoingRequestController.error.value == 'No internet') {
                    return InterNetExceptionWidget(
                      onPress: () {
                        seekrOutgoingRequestController.refreshApi();
                      },
                    );
                  } else {
                    return GeneralExceptionWidget(onPress: () {
                      seekrOutgoingRequestController.refreshApi();
                    });
                  }
                case Status.COMPLETED:
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
                                        seekrOutgoingRequestController
                                            .button_maker.value = true;
                                        seekrOutgoingRequestController
                                            .button_seeker.value = false;
                                      },
                                      child: Container(
                                        width: Get.width * 0.35,
                                        height: Get.height * 0.04,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: seekrOutgoingRequestController
                                                .button_maker.value
                                                ? Color.fromRGBO(254, 0, 145, 1)
                                                : Color.fromRGBO(242, 242, 242, 1)),
                                        child: Center(
                                            child: Text(
                                              'To Maker',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                  color: seekrOutgoingRequestController
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
                                        seekrOutgoingRequestController
                                            .button_maker.value = false;
                                        seekrOutgoingRequestController
                                            .button_seeker.value = true;
                                      },
                                      child: Container(
                                        width: Get.width * 0.35,
                                        height: Get.height * 0.04,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: seekrOutgoingRequestController
                                                .button_seeker.value
                                                ? Color.fromRGBO(254, 0, 145, 1)
                                                : Color.fromRGBO(242, 242, 242, 1)),
                                        child: Center(
                                            child: Text(
                                              'To Seeker',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700,
                                                  color: seekrOutgoingRequestController
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
                      seekrOutgoingRequestController.OutgoingRequestvalue.value
                          .requests!.toMaker !=
                          [] &&
                          (seekrOutgoingRequestController.button_maker.value)
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
                      seekrOutgoingRequestController.OutgoingRequestvalue.value
                          .requests!.toSeeker !=
                          [] &&
                          (seekrOutgoingRequestController.button_maker.value !=
                              true)
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
                      (seekrOutgoingRequestController.button_maker.value)
                          ? Container(
                        // height: Get.height*0.6,
                        width: Get.width * 1,
                        child:seekrOutgoingRequestController
                            .OutgoingRequestvalue.value.message ==
                        'No request found'|| seekrOutgoingRequestController
                            .OutgoingRequestvalue
                            .value
                            .requests!
                            .toMaker!.length ==0
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
                            :ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                            // scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: seekrOutgoingRequestController
                                .OutgoingRequestvalue
                                .value
                                .requests!
                                .toMaker!
                                .length,
                            itemBuilder:
                                (BuildContext context, int index) {
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
                                                 child:Row(
                                               children: [
                                                 SizedBox(
                                                   width: Get.width * 0.03,
                                                 ),
                                                 seekrOutgoingRequestController
                                                     .OutgoingRequestvalue
                                                     .value
                                                     .requests!
                                                     .toMaker![
                                                 index]
                                                     .getmaker !=null?
                                                 Container(
                                                     height:
                                                     Get.height * 0.07,
                                                     width: Get.width * 0.13,
                                                     decoration: BoxDecoration(
                                                         borderRadius:
                                                         BorderRadius
                                                             .circular(
                                                             40)),
                                                     child: seekrOutgoingRequestController
                                                         .OutgoingRequestvalue
                                                         .value
                                                         .requests!
                                                         .toMaker![
                                                     index]
                                                         .getmaker
                                                         ?.imgPath !=
                                                         null
                                                         ? CircleAvatar(
                                                         radius: 22,
                                                         backgroundImage: CachedNetworkImageProvider(seekrOutgoingRequestController
                                                             .OutgoingRequestvalue
                                                             .value
                                                             .requests!
                                                             .toMaker![
                                                         index]
                                                             .getmaker!
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
                                                 ):SizedBox(),
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
                                                         seekrOutgoingRequestController
                                                             .OutgoingRequestvalue
                                                             .value
                                                             .requests!
                                                             .toMaker![index]
                                                             .getmaker!
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
                                               child: Row(

                                             children: [
                                               Row(
                                                 children: [
                                                   seekrOutgoingRequestController
                                                       .OutgoingRequestvalue
                                                       .value
                                                       .requests!
                                                       .toMaker![
                                                   index]
                                                       .outgoingReqGetseeker !=null?  Padding(
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
                                                                 0.02,
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
                                                               child: seekrOutgoingRequestController
                                                                   .OutgoingRequestvalue
                                                                   .value
                                                                   .requests!
                                                                   .toMaker![
                                                               index]
                                                                   .outgoingReqGetseeker!
                                                                   .imgPath !=
                                                                   null
                                                                   ? CircleAvatar(
                                                                   radius:
                                                                   22,
                                                                   backgroundImage: CachedNetworkImageProvider(seekrOutgoingRequestController
                                                                       .OutgoingRequestvalue
                                                                       .value
                                                                       .requests!
                                                                       .toMaker![index]
                                                                       .outgoingReqGetseeker!
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
                                                                   seekrOutgoingRequestController
                                                                       .OutgoingRequestvalue
                                                                       .value
                                                                       .requests!
                                                                       .toMaker![
                                                                   index]
                                                                       .outgoingReqGetseeker!
                                                                       .name
                                                                       .toString(),
                                                                   style: TextStyle(
                                                                       color: Colors
                                                                           .black,
                                                                       fontSize:
                                                                       9,
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
                                                               //     context);
                                                               requestid=null;


                                                               requestid= seekrOutgoingRequestController
                                                                   .OutgoingRequestvalue
                                                                   .value
                                                                   .requests!
                                                                   .toMaker![index].id.toString();
                                                               setState(() {

                                                               });
                                                               print(requestid);
                                                               if(requestid!=null){
                                                                 Get.to(SeekerOutGoingRequestSinglePage());
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
                                                   ):

                                                   Row(

                                                     children: [
                                                       SizedBox(
                                                         width: Get.width * 0.4,
                                                       ),
                                                       GestureDetector(
                                                         onTap: () {
                                                           // _showDialogProfile(
                                                           //     context);
                                                           requestid=null;

                                                           requestid= seekrOutgoingRequestController
                                                               .OutgoingRequestvalue
                                                               .value
                                                               .requests!
                                                               .toMaker![index].id.toString();
                                                           setState(() {

                                                           });
                                                           print(requestid);
                                                           Get.to(SeekerOutGoingRequestSinglePage());
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
                                                       ),
                                                     ],
                                                   )
                                                 ],
                                               )
                                             ],
                                           ))

                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                            })
                            ,
                      )
                          : Container(
                        // height: Get.height*0.6,
                        width: Get.width * 1,
                        child:seekrOutgoingRequestController
                            .OutgoingRequestvalue.value.message ==
                            'No request found'|| seekrOutgoingRequestController
                            .OutgoingRequestvalue
                            .value
                            .requests!
                            .toSeeker ==
                            []||seekrOutgoingRequestController
                  .OutgoingRequestvalue
                  .value
                  .requests!
                  .toSeeker!.length ==0
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
                                   physics: const NeverScrollableScrollPhysics(),
                            // scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            itemCount: seekrOutgoingRequestController
                                .OutgoingRequestvalue
                                .value
                                .requests!
                                .toSeeker!
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
                                            //                                  Container(
                                            //                                   // height: Get.height * 0.07,
                                            //                                   // width: Get.width * 0.15,
                                            //                                   child: CircleAvatar(
                                            //   backgroundImage: NetworkImage(
                                            //      seekrOutgoingRequestController.seekerOutgoingRequestList.value.requests!.toSeeker![index].outgoingReqGetseeker!.imgPath.toString(),),
                                            //   radius: 30,
                                            // ),
                                            //                                 ),

                                            Padding(
                                              padding:
                                              const EdgeInsets.only(
                                                  top: 3.0),
                                              child: Container(
                                                width:Get.width*0.1,
                                                height:Get.height*0.06,
                                                child: CachedNetworkImage(
                                                  imageUrl: seekrOutgoingRequestController
                                                      .OutgoingRequestvalue
                                                      .value
                                                      .requests!
                                                      .toSeeker![index]
                                                      .outgoingReqGetseeker!
                                                      .imgPath
                                                      .toString(),
                                                  imageBuilder: (context,
                                                      imageProvider) =>
                                                      Container(
                                                        width: Get.width*0.06,
                                                        height: Get.height*0.1,
                                                        decoration:
                                                        BoxDecoration(
                                                          shape:
                                                          BoxShape.circle,
                                                          image: DecorationImage(
                                                              image:
                                                              imageProvider,
                                                              fit: BoxFit
                                                                  .cover),
                                                        ),
                                                      ),
                                                  placeholder: (context,
                                                      url) =>
                                                      CircularProgressIndicator(
                                                        color: Colors.grey,
                                                      ),
                                                  errorWidget: (context,
                                                      url, error) =>
                                                      Icon(Icons.error),
                                                ),
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
                                                  width: Get.width * 0.15,
                                                  child: Text(
                                                    seekrOutgoingRequestController
                                                        .OutgoingRequestvalue
                                                        .value
                                                        .requests!
                                                        .toSeeker![index]
                                                        .outgoingReqGetseeker!
                                                        .name
                                                        .toString(),
                                                    overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 12,
                                                        fontWeight:
                                                        FontWeight
                                                            .w600),
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
                                              width: Get.width * 0.55,
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                // _showDialogProfile(
                                                //     context);
                                                requestid=null;

                                                requestid= seekrOutgoingRequestController
                                                    .OutgoingRequestvalue
                                                    .value
                                                    .requests!
                                                    .toSeeker![index].id.toString();
                                                setState(() {

                                                });
                                                print(requestid);
                                                Get.to(SeekerOutGoingRequestSinglePage());
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
            }),
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
                              items: seekrOutgoingRequestController.items
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
                              value: seekrOutgoingRequestController
                                  .selectedLocation.value,
                              onChanged: (String? value) {
                                seekrOutgoingRequestController
                                    .setSelected(value!);
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
                              items: seekrOutgoingRequestController.items2
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
                              value: seekrOutgoingRequestController
                                  .selectedRadius.value,
                              onChanged: (String? value) {
                                // requestController.selectedLocation.value = value!;
                                seekrOutgoingRequestController
                                    .setRadius(value!);
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
                              items: seekrOutgoingRequestController.items3
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
                              value: seekrOutgoingRequestController
                                  .selectedExp.value,
                              onChanged: (String? value) {
                                // requestController.selectedLocation.value = value!;
                                seekrOutgoingRequestController.setExp(value!);
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
                              items: seekrOutgoingRequestController.items4
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
                              value: seekrOutgoingRequestController
                                  .selectedPro.value,
                              onChanged: (String? value) {
                                // requestController.selectedLocation.value = value!;
                                seekrOutgoingRequestController.setPro(value!);
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
                              items: seekrOutgoingRequestController.items5
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
                              value: seekrOutgoingRequestController
                                  .selectedMat.value,
                              onChanged: (String? value) {
                                // requestController.selectedLocation.value = value!;
                                seekrOutgoingRequestController.setMat(value!);
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

  Future<void> _showDialogProfile(BuildContext context) {
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
                    child: Image.asset(
                      'assets/images/prof.png',
                      fit: BoxFit.contain,
                    ),
                  ),

                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  Text(
                    'John Deo, 22',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),

                  // SizedBox(height: Get.height*0.01,),
                  Text(
                    'Jaipur, Indian',
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
                        'Male',
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
                        '5 Years ',
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
                    onTap: () {},
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

//
// class OutGoingRequest extends StatefulWidget {
//   const OutGoingRequest({Key? key}) : super(key: key);
//
//   @override
//   State<OutGoingRequest> createState() => _OutGoingRequestState();
// }
//
// class _OutGoingRequestState extends State<OutGoingRequest> {
//   OutgoinRequestController controller = Get.put(OutgoinRequestController());
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
//   Future<void> showOptionsDialog(BuildContext context) {
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
//                   Text(
//                     "Profile",
//                     style: Theme.of(context)
//                         .textTheme
//                         .titleSmall
//                         ?.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
//                   ),
//                   SizedBox(
//                     height: height * 0.04,
//                   ),
//                   CircleAvatar(
//                     radius: 52,
//                     backgroundImage: NetworkImage(
//                         "https://images.unsplash.com/flagged/photo-1553642618-de0381320ff3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cHJvZmVzc2lvbmFsJTIwbWFufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
//                   ),
//                   SizedBox(height: height * 0.04),
//                   Text(
//                     "John Deo,22",
//                     style: Theme.of(context)
//                         .textTheme
//                         .titleLarge
//                         ?.copyWith(fontWeight: FontWeight.w600),
//                   ),
//                   SizedBox(height: height * 0.01),
//                   Text(
//                     "Jaipur, Indian",
//                     style: Theme.of(context).textTheme.labelLarge?.copyWith(
//                         fontWeight: FontWeight.w400, color: Color(0xff777777)),
//                   ),
//                   SizedBox(
//                     height: height * 0.03,
//                   ),
//                   RichText(
//                       text: TextSpan(children: [
//                     TextSpan(
//                         text: "Sex",
//                         style: Theme.of(context)
//                             .textTheme
//                             .bodySmall
//                             ?.copyWith(fontWeight: FontWeight.w600)),
//                     TextSpan(
//                         text: " Male",
//                         style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                             fontWeight: FontWeight.w400,
//                             color: Color(0xff777777)))
//                   ])),
//                   SizedBox(
//                     height: height * 0.02,
//                   ),
//                   RichText(
//                       text: TextSpan(children: [
//                     TextSpan(
//                         text: "Experience:",
//                         style: Theme.of(context)
//                             .textTheme
//                             .bodySmall
//                             ?.copyWith(fontWeight: FontWeight.w600)),
//                     TextSpan(
//                         text: " 5 Years",
//                         style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                             fontWeight: FontWeight.w400,
//                             color: Color(0xff777777)))
//                   ])),
//                   SizedBox(
//                     height: height * 0.02,
//                   ),
//                   RichText(
//                       text: TextSpan(children: [
//                     TextSpan(
//                         text: "Matches completed:",
//                         style: Theme.of(context)
//                             .textTheme
//                             .bodySmall
//                             ?.copyWith(fontWeight: FontWeight.w600)),
//                     TextSpan(
//                         text: " 50 Matches",
//                         style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                             fontWeight: FontWeight.w400,
//                             color: Color(0xff777777)))
//                   ])),
//                   SizedBox(
//                     height: height * 0.02,
//                   ),
//                   RichText(
//                       text: TextSpan(children: [
//                     TextSpan(
//                         text: "Successful Matches:",
//                         style: Theme.of(context)
//                             .textTheme
//                             .bodySmall
//                             ?.copyWith(fontWeight: FontWeight.w600)),
//                     TextSpan(
//                         text: " 40 Matches",
//                         style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                             fontWeight: FontWeight.w400,
//                             color: Color(0xff777777)))
//                   ])),
//                   SizedBox(
//                     height: height * 0.02,
//                   ),
//                   RichText(
//                       text: TextSpan(children: [
//                     TextSpan(
//                         text: "Liked Profile:",
//                         style: Theme.of(context)
//                             .textTheme
//                             .bodySmall
//                             ?.copyWith(fontWeight: FontWeight.w600)),
//                     TextSpan(
//                         text: " 30 likes",
//                         style: Theme.of(context).textTheme.bodySmall?.copyWith(
//                             fontWeight: FontWeight.w400,
//                             color: Color(0xff777777)))
//                   ])),
//                   SizedBox(height: height * 0.04),
//                   MyButton(
//                     width: width * .5,
//                     title: "Request",
//                     onTap: () {},
//                   )
//                 ],
//               ),
//             ),
//           );
//         });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//               onPressed: () {
//                 Get.back();
//               },
//               icon: Icon(
//                 Icons.arrow_back,
//                 size: 27,
//                 color: Color(0xff5A5A5A),
//               )),
//           title: Text(
//             "Outgoing Requests",
//             style: Theme.of(context)
//                 .textTheme
//                 .titleMedium
//                 ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Padding(
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
//               ListView.builder(
//                 shrinkWrap: true,
//                 itemCount:
//                     controller.OutgoingRequestvalue.value.requests!.length,
//                 physics: NeverScrollableScrollPhysics(),
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: EdgeInsets.symmetric(vertical: height * .01),
//                     child: Stack(
//                       children: [
//                         Container(
//                           height: height * 0.11,
//                           decoration: BoxDecoration(color: Color(0xffFE0091)),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Flexible(
//                                 child: ListTile(
//                                   leading: InkWell(
//                                     child: CircleAvatar(
//                                       radius: 24,
//                                       backgroundColor: AppColors.white,
//                                       child: CircleAvatar(
//                                           radius: 22,
//                                           backgroundImage:
//                                               CachedNetworkImageProvider(
//                                                 controller
//                                                       .OutgoingRequestvalue
//                                                       .value
//                                                       .requests![index]
//                                                       .outgoing_req_getseeker==null?"https://static.vecteezy.com/system/resources/previews/020/765/399/non_2x/default-profile-account-unknown-icon-black-silhouette-free-vector.jpg":  controller
//                                                       .OutgoingRequestvalue
//                                                       .value
//                                                       .requests![index]
//                                                       .outgoing_req_getseeker!
//                                                       .imgPath
//                                                       .toString())),
//                                     ),
//                                     onTap: () {
//                                       // Get.to(ShortProfileSeeker());
//                                     },
//                                   ),
//                                   horizontalTitleGap: 10,
//                                   title: Text(
//                                     controller
//                                         .OutgoingRequestvalue
//                                         .value
//                                         .requests![0]
//                                         .outgoing_req_getseeker!
//                                         .name
//                                         .toString(),
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodySmall
//                                         ?.copyWith(
//                                             fontWeight: FontWeight.w600,
//                                             color: AppColors.white),
//                                   ),
//                                   subtitle: Text(
//                                     "Match Seeker",
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .labelSmall
//                                         ?.copyWith(
//                                             fontWeight: FontWeight.w300,
//                                             color: AppColors.white),
//                                   ),
//                                 ),
//                               ),
//                               if (controller.OutgoingRequestvalue.value
//                                       .requests![index].getMaker ==
//                                   null)
//                                 InkWell(
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(right: 18.0),
//                                     child: Text(
//                                       "View",
//                                       style: Theme.of(context)
//                                           .textTheme
//                                           .labelSmall
//                                           ?.copyWith(
//                                               fontSize: 9,
//                                               fontWeight: FontWeight.w500,
//                                               color: Colors.white,
//                                               decoration:
//                                                   TextDecoration.underline),
//                                     ),
//                                   ),
//                                   onTap: () {
//                                     setState(() {
//                                       requestype = "2";
//                                     });
//                                     requestid = controller.OutgoingRequestvalue
//                                         .value.requests![index].id
//                                         .toString();
//
//                                     if (requestid != null) {
//                                       print(requestid);
//                                       Get.to(ChatPage());
//                                     }
//                                   },
//                                 ),
//                               if (controller.OutgoingRequestvalue.value
//                                       .requests![index].getMaker !=
//                                   null)
//                                 Flexible(
//                                   child: Container(
//                                     height: height * 0.10,
//                                     decoration: BoxDecoration(
//                                         color: AppColors.white,
//                                         borderRadius: BorderRadius.only(
//                                           topLeft: Radius.circular(11),
//                                           bottomLeft: Radius.circular(11),
//                                         )),
//                                     child: ListTile(
//                                       leading: CircleAvatar(
//                                         radius: 22,
//                                         child: CircleAvatar(
//                                           radius: 26,
//                                           backgroundImage: NetworkImage(
//                                               "https://images.unsplash.com/flagged/photo-1553642618-de0381320ff3?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cHJvZmVzc2lvbmFsJTIwbWFufGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
//                                         ),
//                                       ),
//                                       horizontalTitleGap: 10,
//                                       title: Text(
//                                         "Elelyn",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodySmall
//                                             ?.copyWith(
//                                                 fontWeight: FontWeight.w600,
//                                                 fontSize: 9),
//                                       ),
//                                       subtitle: Text(
//                                         "Match Maker",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodySmall
//                                             ?.copyWith(
//                                                 fontSize: 8,
//                                                 fontWeight: FontWeight.w300,
//                                                 color: Color(0xff777777)),
//                                       ),
//                                       trailing: InkWell(
//                                         child: Text(
//                                           "View",
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .labelSmall
//                                               ?.copyWith(
//                                                   fontSize: 9,
//                                                   fontWeight: FontWeight.w500,
//                                                   color: Color(0xffFE0091),
//                                                   decoration:
//                                                       TextDecoration.underline),
//                                         ),
//                                         onTap: () {
//                                           showOptionsDialog(context);
//                                         },
//                                       ),
//                                     ),
//                                   ),
//                                 )
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ));
//   }
// }
