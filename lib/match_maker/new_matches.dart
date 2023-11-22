import 'package:cupid_match/match_maker/chatScreenaMaker.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

import '../../widgets/my_button.dart';

class CreateNewMatchesScreen extends StatefulWidget {
  CreateNewMatchesScreen({Key? key}) : super(key: key);

  @override
  _CreateNewMatchesScreenState createState() => _CreateNewMatchesScreenState();
}

class _CreateNewMatchesScreenState extends State<CreateNewMatchesScreen> {
  List images = [
    "https://images.unsplash.com/photo-1687076613219-fb4b3d94e75a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDh8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
    "https://images.unsplash.com/photo-1687076613219-fb4b3d94e75a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMDl8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
  ];

  ShowDialog(BuildContext context) {
    showDialog(
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
                Text(
                  "Congratulations it's a",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .01,
                ),
                Text(
                  "Match!",
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall
                      ?.copyWith(color: Color(0xffFE0091)),
                ),
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
                            width: MediaQuery.of(context).size.width * .09,
                            height: MediaQuery.of(context).size.height * .07,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              reverse: true,
                              itemCount: images.length >= 3 ? 3 : images.length,
                              itemBuilder: (context, index) {
                                return Align(
                                  alignment: Alignment.center,
                                  widthFactor: 0.4,
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: AppColors.white,
                                    child: CircleAvatar(
                                      radius: 14,
                                      backgroundImage:
                                          NetworkImage(images[index]),
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
                  "Name and Name, 22",
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Color(0xff000CAA),
                      ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .04,
                ),
                MyButton(
                  height: MediaQuery.of(context).size.height * .05,
                  width: MediaQuery.of(context).size.width * .63,
                  title: 'Leave a note for both',
                  onTap: () {
                    Get.to(());
                  },
                )
              ],
            ),
          );
        });
  }

  // ShowDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) {
  //       return Container(
  //         child: Column(
  //           children: [
  //             AlertDialog(
  //               shape: RoundedRectangleBorder(
  //                   borderRadius: BorderRadius.circular(22)),
  //               backgroundColor: Color(0xffFFFFFF),
  //               content: Column(
  //                 mainAxisSize: MainAxisSize.min,
  //                 children: [
  //                   Align(
  //                     alignment: Alignment.topRight,
  //                     child: GestureDetector(
  //                         onTap: () {
  //                           Get.back();
  //                         },
  //                         child: Image.asset(
  //                           "assets/images/Group 115 (2).png",
  //                           height: MediaQuery.of(context).size.height * .03,
  //                         )),
  //                   ),
  //                   Image.asset(
  //                     'assets/images/Mask group (13).png',
  //                     height: MediaQuery.of(context).size.height * .1,
  //                   ),
  //                   SizedBox(
  //                     height: MediaQuery.of(context).size.height * .02,
  //                   ),
  //                   Text(
  //                     "Congratulations it's a",
  //                     style: Theme.of(context).textTheme.titleSmall,
  //                   ),
  //                   SizedBox(
  //                     height: MediaQuery.of(context).size.height * .01,
  //                   ),
  //                   Text(
  //                     "Match!",
  //                     style: Theme.of(context)
  //                         .textTheme
  //                         .titleSmall
  //                         ?.copyWith(color: Color(0xffFE0091)),
  //                   ),
  //                   Container(
  //                     width: MediaQuery.of(context).size.width,
  //                     height: MediaQuery.of(context).size.height * .08,
  //                     child: ListView.builder(
  //                       // scrollDirection: Axis.horizontal,
  //                       shrinkWrap: true,
  //                       physics: NeverScrollableScrollPhysics(),
  //                       itemCount: 1,
  //                       itemBuilder: (context, index) {
  //                         return Padding(
  //                           padding: EdgeInsets.all(8),
  //                           child: ListTile(
  //                             contentPadding: EdgeInsets.symmetric(
  //                                 horizontal:
  //                                     MediaQuery.of(context).size.width * 0.25),
  //                             leading: Container(
  //                               width: MediaQuery.of(context).size.width * .09,
  //                               height:
  //                                   MediaQuery.of(context).size.height * .07,
  //                               child: ListView.builder(
  //                                 scrollDirection: Axis.horizontal,
  //                                 shrinkWrap: true,
  //                                 reverse: true,
  //                                 itemCount:
  //                                     images.length >= 3 ? 3 : images.length,
  //                                 itemBuilder: (context, index) {
  //                                   return Align(
  //                                     alignment: Alignment.center,
  //                                     widthFactor: 0.4,
  //                                     child: CircleAvatar(
  //                                       radius: 16,
  //                                       backgroundColor: AppColors.white,
  //                                       child: CircleAvatar(
  //                                         radius: 14,
  //                                         backgroundImage:
  //                                             NetworkImage(images[index]),
  //                                       ),
  //                                     ),
  //                                   );
  //                                 },
  //                               ),
  //                             ),
  //                           ),
  //                         );
  //                       },
  //                     ),
  //                   ),
  //                   SizedBox(
  //                     height: MediaQuery.of(context).size.height * .01,
  //                   ),
  //                   Text(
  //                     "Name and Name, 22",
  //                     style: Theme.of(context).textTheme.titleSmall?.copyWith(
  //                           color: Color(0xff000CAA),
  //                         ),
  //                   ),
  //                   SizedBox(
  //                     height: MediaQuery.of(context).size.height * .04,
  //                   ),
  //                   MyButton(
  //                     width: MediaQuery.of(context).size.width * .6,
  //                     title: 'Leave a note for both',
  //                     onTap: () {
  //                       Get.to(Message());
  //                     },
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'Home',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        // actions: [
        //   GestureDetector(
        //       onTap: () {
        //         Scaffold.of(context).openEndDrawer();
        //         MaterialLocalizations.of(context).openAppDrawerTooltip;
        //       }, child: Image.asset("assets/icons/menu.png")),
        // ],
        automaticallyImplyLeading: false,
      ),
      // body: ListView(
      //   children: [
      //     Image.asset("assets/images/Group 79.png"),
      //     Stack(
      //       children: [
      //         GridView.builder(
      //             shrinkWrap: true,
      //             itemCount: 6,
      //             physics: NeverScrollableScrollPhysics(),
      //             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 2,childAspectRatio: .4,),
      //             itemBuilder: (BuildContext, context) {
      //               return Swiper(
      //                 viewportFraction: 0.8,
      //                 scale: 0.9,
      //                 itemCount: 10,
      //                 itemWidth: 350,
      //                 itemHeight: 500,
      //                 layout: SwiperLayout.TINDER,
      //                 itemBuilder: (context,index) {
      //                   return Card(
      //                     color: AppColors.ratingcodeColor,
      //                     shape: RoundedRectangleBorder(
      //                       borderRadius: BorderRadius.circular(15),
      //                     ),
      //                     child: Column(
      //                       crossAxisAlignment: CrossAxisAlignment.start,
      //                       children: [
      //                         Center(
      //                           child: Padding(
      //                             padding: EdgeInsets.symmetric(vertical: height*0.02),
      //                             child: Container(
      //                               height: height*.2,
      //                               width: width*.4,
      //                               decoration: BoxDecoration(
      //                                   borderRadius: BorderRadius.circular(20),
      //                                   image: DecorationImage(image: NetworkImage("https://images.unsplash.com/photo-1586907835000-f692bbd4c9e0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGdpcmxzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),fit: BoxFit.cover)
      //                               ),
      //                             ),
      //                           ),
      //                         ),
      //                         Padding(
      //                           padding: EdgeInsets.symmetric(horizontal: width*0.02),
      //                           child: Column(
      //                             crossAxisAlignment: CrossAxisAlignment.start,
      //                             children: [
      //                               Text("Name, 22",style: Theme.of(context).textTheme.titleLarge,),
      //                               SizedBox(height: height*.01,),
      //                               Text("Fashion Designer",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 14),),
      //                               SizedBox(height: height*.01,),
      //                               Text("Address",style: Theme.of(context).textTheme.bodySmall,),
      //                               SizedBox(height: height*.04,),
      //                               Text("Interest",style: Theme.of(context).textTheme.titleSmall,),
      //                               SizedBox(height: height*.01,),
      //                               Row(
      //                                 crossAxisAlignment: CrossAxisAlignment.start,
      //                                 children: [
      //                                   Expanded(child: Text("Travelling",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.subtitletextcolor,fontSize: 14),)),
      //                                   SizedBox(width: width*.01,),
      //                                   Expanded(child: Text("Books",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: AppColors.subtitletextcolor,fontSize: 14),)),
      //                                 ],
      //                               ),
      //                               SizedBox(height: height*.02,),
      //                               Row(
      //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                                 children: [
      //                                   OutlinedButton.icon(
      //                                     onPressed: () {},
      //                                     style: OutlinedButton.styleFrom(
      //                                         fixedSize: Size(75, 40),
      //                                         shape: RoundedRectangleBorder(
      //                                             borderRadius: BorderRadius.circular(26),
      //                                             side: BorderSide(color: Color(0xff333333))
      //                                         )
      //                                     ),
      //                                     icon: Image.asset("assets/images/om.png",height: height*.01,),
      //                                     label:  Text('Hindu',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xff000000), fontSize: 7,fontWeight: FontWeight.w400)),
      //                                   ),
      //                                   OutlinedButton.icon(
      //                                     onPressed: () {},
      //                                     style: OutlinedButton.styleFrom(
      //                                         fixedSize: Size(75, 40),
      //                                         shape: RoundedRectangleBorder(
      //                                             borderRadius: BorderRadius.circular(26),
      //                                             side: BorderSide(color: Color(0xff333333))
      //                                         )
      //                                     ),
      //                                     icon: Image.asset("assets/images/4013342 1 (2).png",height: height*.01,),
      //                                     label:  Text('Feet',style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xff000000),fontSize: 8,fontWeight: FontWeight.w400)),
      //                                   ),
      //                                 ],
      //                               ),
      //                               SizedBox(height: height*.01,),
      //                               Row(
      //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                                 children: [
      //                                   OutlinedButton.icon(onPressed: () {},
      //                                       style: OutlinedButton.styleFrom(
      //                                           fixedSize: Size(125, 39),
      //                                           shape: RoundedRectangleBorder(
      //                                               borderRadius: BorderRadius.circular(26),
      //                                               side: BorderSide(color: Color(0xff333333))
      //                                           )
      //                                       ),
      //                                       icon:Image.asset("assets/images/Money.png",height: height*.02,),
      //                                       label: Text("50K Monthly",style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xff000000),fontSize: 8,fontWeight: FontWeight.w400),)),
      //                                   Image.asset('assets/images/Mask group (11).png',height: height*.03,),
      //                                 ],
      //                               )
      //                             ],
      //                           ),
      //                         ),
      //                       ],
      //                     ),
      //                   );
      //                 },
      //               );
      //             }),
      //         Positioned(
      //           top: 90,
      //             left: 143,
      //             child: GestureDetector(
      //               onTap: () {
      //                   ShowDialog(context);
      //               },
      //                 child: Image.asset('assets/images/Group 106.png',height: height*0.13,)))
      //       ],
      //     ),
      //   ],
      // )
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset("assets/maker/Group 79.png"),
              SizedBox(
                height: height * .04,
              ),
              Stack(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        height: height * 1,
                        width: width * .48,
                        child: ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: height * .65,
                                  decoration: BoxDecoration(
                                      color: Color(0xffF4F4F4),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: height * .02),
                                          child: Container(
                                            height: height * .2,
                                            width: width * .35,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        "https://images.unsplash.com/photo-1586907835000-f692bbd4c9e0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGdpcmxzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width * .02),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Name, 22",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge,
                                                ),
                                                SizedBox(
                                                  height: height * .01,
                                                ),
                                                Text(
                                                  "Fashion Designer",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.copyWith(fontSize: 14),
                                                ),
                                                SizedBox(
                                                  height: height * .01,
                                                ),
                                                Text(
                                                  "Address",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                ),
                                                SizedBox(
                                                  height: height * .04,
                                                ),
                                                Text(
                                                  "Interest",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                ),
                                                SizedBox(
                                                  height: height * .01,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                      "Travelling",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall
                                                          ?.copyWith(
                                                              color: AppColors
                                                                  .subtitletextcolor,
                                                              fontSize: 14),
                                                    )),
                                                    SizedBox(
                                                      width: width * .01,
                                                    ),
                                                    Expanded(
                                                        child: Text(
                                                      "Books",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall
                                                          ?.copyWith(
                                                              color: AppColors
                                                                  .subtitletextcolor,
                                                              fontSize: 14),
                                                    )),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: height * .02,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    OutlinedButton.icon(
                                                      style: OutlinedButton.styleFrom(
                                                          side: BorderSide(
                                                              color: Color(
                                                                  0xff333333),
                                                              width: 1),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          22))),
                                                      onPressed: () {},
                                                      icon: Image.asset(
                                                          "assets/icons/religon.png",
                                                          height: height * .01),
                                                      label: Text('Hindu',
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .bodySmall
                                                              ?.copyWith(
                                                                  color: Color(
                                                                      0xff000000),
                                                                  fontSize: 7,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400)),
                                                    ),
                                                    OutlinedButton.icon(
                                                      style: OutlinedButton.styleFrom(
                                                          side: BorderSide(
                                                              color: Color(
                                                                  0xff333333),
                                                              width: 1),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          22))),
                                                      onPressed: () {},
                                                      icon: Image.asset(
                                                        "assets/icons/4013342 1 (2).png",
                                                        height: height * .01,
                                                      ),
                                                      label: Text('6 Feet',
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .bodySmall
                                                              ?.copyWith(
                                                                  color: Color(
                                                                      0xff000000),
                                                                  fontSize: 7,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400)),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: height * .01,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    OutlinedButton.icon(
                                                      style: OutlinedButton.styleFrom(
                                                          side: BorderSide(
                                                              color: Color(
                                                                  0xff333333),
                                                              width: 1),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          22))),
                                                      onPressed: () {},
                                                      icon: Image.asset(
                                                        "assets/icons/money.png",
                                                        height: height * .02,
                                                      ),
                                                      label: Text('50k Monthly',
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .bodySmall
                                                              ?.copyWith(
                                                                  color: Color(
                                                                      0xff000000),
                                                                  fontSize: 8,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400)),
                                                    ),
                                                    GestureDetector(
                                                        onTap: () {},
                                                        child: Image.asset(
                                                          'assets/icons/next.png',
                                                          height: height * .04,
                                                        )),
                                                  ],
                                                )
                                              ]))
                                    ],
                                  ),
                                ));
                          },
                        ),
                      ),
                    ),
                    
                    Flexible(
                      child: Container(
                        height: height * 1,
                        width: width * .48,
                        child: ListView.builder(
                          itemCount: 10,
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: height * .65,
                                  decoration: BoxDecoration(
                                      color: Color(0xffF4F4F4),
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Center(
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: height * .02),
                                          child: Container(
                                            height: height * .2,
                                            width: width * .35,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                image: DecorationImage(
                                                    image: NetworkImage(
                                                        "https://images.unsplash.com/photo-1586907835000-f692bbd4c9e0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTZ8fGdpcmxzfGVufDB8fDB8fHww&auto=format&fit=crop&w=500&q=60"),
                                                    fit: BoxFit.cover)),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: width * .02),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Name, 22",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleLarge,
                                                ),
                                                SizedBox(
                                                  height: height * .01,
                                                ),
                                                Text(
                                                  "Fashion Designer",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge
                                                      ?.copyWith(fontSize: 14),
                                                ),
                                                SizedBox(
                                                  height: height * .01,
                                                ),
                                                Text(
                                                  "Address",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall,
                                                ),
                                                SizedBox(
                                                  height: height * .04,
                                                ),
                                                Text(
                                                  "Interest",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall,
                                                ),
                                                SizedBox(
                                                  height: height * .01,
                                                ),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Expanded(
                                                        child: Text(
                                                      "Travelling",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall
                                                          ?.copyWith(
                                                              color: AppColors
                                                                  .subtitletextcolor,
                                                              fontSize: 14),
                                                    )),
                                                    SizedBox(
                                                      width: width * .01,
                                                    ),
                                                    Expanded(
                                                        child: Text(
                                                      "Books",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodySmall
                                                          ?.copyWith(
                                                              color: AppColors
                                                                  .subtitletextcolor,
                                                              fontSize: 14),
                                                    )),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: height * .02,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    OutlinedButton.icon(
                                                      style: OutlinedButton.styleFrom(
                                                          side: BorderSide(
                                                              color: Color(
                                                                  0xff333333),
                                                              width: 1),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          22))),
                                                      onPressed: () {},
                                                      icon: Image.asset(
                                                          "assets/icons/religon.png",
                                                          height: height * .01),
                                                      label: Text('Hindu',
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .bodySmall
                                                              ?.copyWith(
                                                                  color: Color(
                                                                      0xff000000),
                                                                  fontSize: 7,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400)),
                                                    ),
                                                    OutlinedButton.icon(
                                                      style: OutlinedButton.styleFrom(
                                                          side: BorderSide(
                                                              color: Color(
                                                                  0xff333333),
                                                              width: 1),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          22))),
                                                      onPressed: () {},
                                                      icon: Image.asset(
                                                        "assets/icons/4013342 1 (2).png",
                                                        height: height * .01,
                                                      ),
                                                      label: Text('6 Feet',
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .bodySmall
                                                              ?.copyWith(
                                                                  color: Color(
                                                                      0xff000000),
                                                                  fontSize: 7,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400)),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: height * .01,
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    OutlinedButton.icon(
                                                      style: OutlinedButton.styleFrom(
                                                          side: BorderSide(
                                                              color: Color(
                                                                  0xff333333),
                                                              width: 1),
                                                          shape: RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          22))),
                                                      onPressed: () {},
                                                      icon: Image.asset(
                                                        "assets/icons/money.png",
                                                        height: height * .02,
                                                      ),
                                                      label: Text('50k Monthly',
                                                          style: Theme.of(context)
                                                              .textTheme
                                                              .bodySmall
                                                              ?.copyWith(
                                                                  color: Color(
                                                                      0xff000000),
                                                                  fontSize: 8,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400)),
                                                    ),
                                                    GestureDetector(
                                                        onTap: () {},
                                                        child: Image.asset(
                                                          'assets/icons/next.png',
                                                          height: height * .04,
                                                        )),
                                                  ],
                                                )

                                              ]))
                                    ],
                                  ),
                                ));
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Positioned(
                    top: 230,
                    left: 125,
                    child: GestureDetector(
                        onTap: () {
                          ShowDialog(context);
                        },
                        child: Center(
                            child: Image.asset(
                          "assets/maker/Group 106.png",
                          height: height * 0.13,
                        )))),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
