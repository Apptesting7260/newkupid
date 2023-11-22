import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/SeekerMyProfileDetailsController/SeekerMyProfileController.dart';
import '../../controllers/controller/SeekerProfileController/SeekerProfileController.dart';
import '../../controllers/controller/ViewSikerDetailsController/ViewSikerDetaolsController.dart';
import '../../data/response/status.dart';
import '../../res/components/internet_exceptions_widget.dart';



class SingalRecentMatches extends StatefulWidget {
  const SingalRecentMatches({super.key});

  @override
  State<SingalRecentMatches> createState() => _SingalRecentMatchesState();
}
final ViewSikerProfileDetailsController seekerUserProfileController =
Get.put(ViewSikerProfileDetailsController());

final SeekerMyProfileDetailsController seekerMyProfileController =
Get.put(SeekerMyProfileDetailsController());
class _SingalRecentMatchesState extends State<SingalRecentMatches> {


  @override
  void initState() {
    seekerUserProfileController.ViewSikerProfileDetailsApiHit();
    seekerMyProfileController.SeekerMyProfileDetailsApiHit();
    super.initState();



  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async{
        seekerUserProfileController.ViewSikerProfileDetailsApiHit();
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
              "Recent Matches",
              style: TextStyle(fontSize: 18,color: Colors.black, fontWeight: FontWeight.w600),
            ),
          ),
          backgroundColor: Colors.white,
          leading: Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back,color: Color.fromRGBO(90, 90, 90, 1))),
          ),
        ),
        body: Obx((){
          switch(seekerUserProfileController.rxRequestStatus.value){
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              // if(seekerUserProfileController.error.value =='No internet'){
              //   return InterNetExceptionWidget(onPress: () {
              //     seekerUserProfileController.refreshApi();
              //   },);
              // }else {
              //   return GeneralExceptionWidget(onPress: (){
              //     seekerUserProfileController.refreshApi();
              //   });
              // }
            case Status.COMPLETED:

              return Column(
                  children: [
                    SizedBox(
                      height: Get.height * 0.04,
                    ),

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
                                      seekerMyProfileController.SeekerMyProfileDetail.value.ProfileDetail!.imgPath.toString(),
                                      imageBuilder: (context,
                                          imageProvider) =>
                                          Container(
                                            height: Get.height * 0.25,
                                            width: Get.width * 0.4,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(20),
                                              image: DecorationImage(
                                                  image:
                                                  imageProvider,
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                      placeholder:
                                          (context, url) =>
                                          Center(
                                            child:
                                            CircularProgressIndicator(
                                              color: Colors.grey,
                                            ),
                                          ),
                                      errorWidget:
                                          (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Get.height * 0.02,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.034,
                                  ),
                                  Text(
                                    seekerMyProfileController.SeekerMyProfileDetail.value.ProfileDetail!.name.toString(),
                                    style: TextStyle(
                                      color: Colors.black,
                                        fontSize: 16,
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
                              //       width: Get.width * 0.034,
                              //     ),
                              //     Text(
                              //       seekerMyProfileController.SeekerMyProfileDetail.value.ProfileDetail!.occupationName.toString(),
                              //       style: TextStyle(
                              //           color: Colors.black,
                              //           fontSize: 12,
                              //           fontWeight: FontWeight.w400),
                              //       softWrap: true, // Allows text to wrap to the next line
                              //       maxLines: 2,    // Set the maximum number of lines
                              //       overflow: TextOverflow.ellipsis, // Sp
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: Get.height * 0.005,
                              // ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.04,
                                  ),
                                 Container(
                                   width: Get.width * 0.3,
                                   child:  Text(
                                     seekerMyProfileController.SeekerMyProfileDetail.value.ProfileDetail!.address.toString(),
                                     style: TextStyle(
                                         color: Colors.black,
                                         fontSize: 10,
                                         fontWeight: FontWeight.w400),
                                     softWrap: true, // Allows text to wrap to the next line
                                // Set the maximum number of lines
                                     overflow: TextOverflow.ellipsis,
                                   ),
                                 )
                                ],
                              ),
                              SizedBox(
                                height: Get.height * 0.01,
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
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Get.height * 0.005,
                              ),
                    // if(seekerMyProfileController.SeekerMyProfileDetail.value.ProfileDetail!.details!.interestName!=[]||seekerMyProfileController.SeekerMyProfileDetail.value.ProfileDetail!.details!.interestName!.length!=0)          Row(
                    //             children: [
                    //               SizedBox(
                    //                 width: Get.width * 0.04,
                    //               ),



                    //               (seekerMyProfileController.SeekerMyProfileDetail.value.ProfileDetail!.details!.interestName![0].title!=null )? Row(children: [
                    //                 for (var i = 0; seekerMyProfileController.SeekerMyProfileDetail.value.ProfileDetail!.details!.interestName!.length > i; i++)
                    //                   Text(
                    //                     seekerMyProfileController.SeekerMyProfileDetail.value.ProfileDetail!.details!.interestName![i].title.toString()+" ",
                    //                     style: TextStyle(

                    //                         fontSize: 10,
                    //                         color: Colors.black,
                    //                         fontWeight:
                    //                         FontWeight.w400),
                    //                   ),

                    //               ],):Container(),

                    //             ],
                    //           ),


                              SizedBox(
                                height: Get.height * 0.01,
                              ),
                              Row(
                                children: [

                                  SizedBox(
                                    width: Get.width * 0.02,
                                  ),
                                  (seekerMyProfileController.SeekerMyProfileDetail.value.ProfileDetail!.religion==null || seekerMyProfileController.SeekerMyProfileDetail.value.ProfileDetail!.religion=='')?Container():Container(
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
                                            width: Get.width * 0.001,
                                          ),
                                          Container(
                                            height: Get.height * 0.015,
                                            width: Get.width * 0.07,
                                            child: Image.asset(
                                              'assets/icons/religon.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),

                                          Container(
                                            width: Get.width * 0.09,
                                            child: Text(
                                              seekerMyProfileController.SeekerMyProfileDetail.value.ProfileDetail!.religion.toString(),
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10,
                                                  fontWeight:
                                                  FontWeight.w400),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      )),
                                  SizedBox(
                                    width: Get.width * 0.02,
                                  ),
                                  (seekerMyProfileController.SeekerMyProfileDetail.value.ProfileDetail!.height==null || seekerMyProfileController.SeekerMyProfileDetail.value.ProfileDetail!.height=='')?Container():Container(
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
                                            seekerMyProfileController.SeekerMyProfileDetail.value.ProfileDetail!.height.toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
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
                                  (seekerMyProfileController.SeekerMyProfileDetail.value.ProfileDetail!.salary==null || seekerMyProfileController.SeekerMyProfileDetail.value.ProfileDetail!.salary=='')?Container(
                                    child: SizedBox(width: Get.width*0.18,),
                                  ): Container(
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
                                              "assets/icons/money.png",
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                          // SizedBox(width: Get.width*0.002,),
                                          Text(
                                            seekerMyProfileController.SeekerMyProfileDetail.value.ProfileDetail!.salary.toString(),
                                            style: TextStyle(
                                              color: Colors.black,
                                                fontSize: 10,
                                                fontWeight:
                                                FontWeight.w400),
                                          ),
                                        ],
                                      )),
                                  SizedBox(
                                    width: Get.width * 0.15,
                                  ),
                                  // Container(
                                  //     height: Get.height * 0.05,
                                  //     width: Get.width * 0.05,
                                  //     child: CircleAvatar(
                                  //       radius: 200,
                                  //       child:  CircleAvatar(
                                  //
                                  //         radius: 140,
                                  //         child: Icon(Icons.navigate_next_outlined,color: Colors.white),
                                  //         backgroundColor: Colors.white12,
                                  //       ),
                                  //     )
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        SizedBox(width: Get.width*0.04,),

                        //    // ******************
                        Container(
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


                                  Container(
                                    height: Get.height * 0.25,
                                    width: Get.width * 0.4,
                                    child: CachedNetworkImage(
                                      imageUrl:
                                      seekerUserProfileController.ViewProfileDetail.value.profileDetails![0].imgPath.toString() ,
                                      imageBuilder: (context,
                                          imageProvider) =>
                                          Container(
                                            height: Get.height * 0.25,
                                            width: Get.width * 0.4,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(20),
                                              image: DecorationImage(
                                                  image:
                                                  imageProvider,
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                      placeholder:
                                          (context, url) =>
                                          Center(
                                            child:
                                            CircularProgressIndicator(
                                              color: Colors.grey,
                                            ),
                                          ),
                                      errorWidget:
                                          (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
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
                                    seekerUserProfileController.ViewProfileDetail.value.profileDetails![0].name.toString(),
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
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
                              //       seekerUserProfileController.ViewProfileDetail.value.profileDetails![0].occupationName,
                              //       style: TextStyle(
                              //         color: Colors.black,
                              //         fontSize: 12,
                              //       ),
                              //       softWrap: true, // Allows text to wrap to the next line
                              //       maxLines: 2,    // Set the maximum number of lines
                              //       overflow: TextOverflow.ellipsis, // Sp
                              //     ),
                              //   ],
                              // ),
                              // SizedBox(
                              //   height: Get.height * 0.005,
                              // ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.04,
                                  ),
                             Container(
                               width: Get.width*0.3,
                               child:      Text(
                                 seekerUserProfileController.ViewProfileDetail.value.profileDetails![0].address.toString(),
                                 style: TextStyle(
                                     color: Colors.black,
                                     fontSize: 10,
                                     fontWeight: FontWeight.w400),
                                 softWrap: true, // Allows text to wrap to the next line// Set the maximum number of lines
                                 overflow: TextOverflow.ellipsis, // Sp
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
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: Get.height * 0.003,
                              ),
                              // Row(
                              //   children: [
                              //     SizedBox(
                              //       width: Get.width * 0.04,
                              //     ),
                              //     (seekerUserProfileController.ViewProfileDetail.value.profileDetails![0].details!.interestName!=null )? Row(children: [
                              //       for (var i = 0; seekerUserProfileController.ViewProfileDetail.value.profileDetails![0].details!.interestName!.length > i; i++)
                              //         Text(
                              //           seekerUserProfileController.ViewProfileDetail.value.profileDetails![0].details!.interestName![i]" ",
                              //           style: TextStyle(
                              //               fontSize: 10,
                              //               color: Colors.black,
                              //               fontWeight:
                              //               FontWeight.w400),
                              //         ),
                              //
                              //     ],):Container(),
                              //
                              //   ],
                              // ),


                              SizedBox(
                                height: Get.height * 0.01,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: Get.width * 0.02,
                                  ),
                                  (seekerUserProfileController.ViewProfileDetail.value.profileDetails![0]. religion==null || seekerUserProfileController.ViewProfileDetail.value.profileDetails![0]. religion=='')?Container():Container(
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
                                            width: Get.width * 0.002,
                                          ),
                                          Expanded(child: Row(
                                            children: [
                                              Container(
                                                height: Get.height * 0.015,
                                                width: Get.width * 0.07,
                                                child: Image.asset(
                                                  'assets/icons/religon.png',
                                                  fit: BoxFit.contain,
                                                ),
                                              ),

                                              Container(
                                                width: Get.width * 0.09,
                                                child: Text(
                                                  seekerUserProfileController.ViewProfileDetail.value.profileDetails![0].religion.toString(),
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10,
                                                      fontWeight:
                                                      FontWeight.w400),
                                                    overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ))
                                        ],
                                      )),
                                  SizedBox(
                                    width: Get.width * 0.02,
                                  ),
                                  (seekerUserProfileController.ViewProfileDetail.value.profileDetails![0]. height==null || seekerUserProfileController.ViewProfileDetail.value.profileDetails![0]. height=='')?Container():Container(
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
                                            width: Get.width * 0.07,
                                            child: Image.asset(
                                              'assets/icons/height.png',
                                              fit: BoxFit.contain,
                                            ),
                                          ),

                                          Text(
                                            seekerUserProfileController.ViewProfileDetail.value.profileDetails![0].height.toString(),
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black,
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
                                  (seekerUserProfileController.ViewProfileDetail.value.profileDetails![0]. salary==null || seekerUserProfileController.ViewProfileDetail.value.profileDetails![0]. salary=='')?Container(
                                    child: SizedBox(width: Get.width*0.18,),
                                  ): Container(
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
                                            seekerUserProfileController.ViewProfileDetail.value.profileDetails![0].salary.toString(),
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 10,
                                                fontWeight:
                                                FontWeight.w400),
                                          ),
                                        ],
                                      )),
                                  SizedBox(
                                    width: Get.width * 0.15,
                                  ),
                                  // Container(
                                  //     height: Get.height * 0.05,
                                  //     width: Get.width * 0.05,
                                  //     child: CircleAvatar(
                                  //       radius: 200,
                                  //       child:  CircleAvatar(
                                  //
                                  //         radius: 140,
                                  //         child: Icon(Icons.navigate_next_outlined,color: Colors.white),
                                  //         backgroundColor: Colors.white12,
                                  //       ),
                                  //     )
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        // //******************************* */

                      ],),
                  ]
              );
          }
        }),
      ),
    );
  }
}