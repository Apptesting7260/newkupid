// import 'dart:async';

// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
// import 'package:cupid_match/controllers/controller/MagicProfileController/MagicProfileConrtroller.dart';
// import 'package:cupid_match/controllers/controller/SeekerToSeekerRequestController/SeekerToSeekerRequestController.dart';
// import 'package:cupid_match/data/response/status.dart';
// import 'package:cupid_match/match_maker/chat_screen.dart';
// import 'package:cupid_match/match_seeker/SeeAllMaker/SeAllMaker.dart';
// import 'package:cupid_match/match_seeker/choose_one.dart';
// import 'package:cupid_match/match_seeker/home_screen.dart';
// import 'package:cupid_match/match_seeker/chat_screen.dart';
// import 'package:cupid_match/match_seeker/siker_Home_Screen.dart';
// import 'package:cupid_match/res/components/general_exception.dart';
// import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
// import 'package:cupid_match/widgets/my_button.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:rxdart/subjects.dart';
// import 'package:shared_preferences/shared_preferences.dart';


// class SpinWillWidget extends StatefulWidget {
//   const SpinWillWidget({super.key});

//   @override
//   State<SpinWillWidget> createState() => _SpinWillWidgetState();
// }

// class _SpinWillWidgetState extends State<SpinWillWidget> {
//     final MagicProfileControllerinstance = Get.put(MagicProfileController());

//   List<int> items = [100, 200, 300, 400, ];
//   List<Color> colorstwo = [
//     Color(0xffFF1616),
//     Color(0xffFF914D),
//     Color(0xffFFDE59),
//     Color(0xff7ED957),

//   ];
//   List<Map<String, String>> imageUrlsList = []; // List to store key-value pairs

//   final selected = BehaviorSubject<int>();









//   int rewards = 0;
//   int selectedRadioTile = 0;

// final SeekerToSeekerRequestControllerinstance=Get.put(SeekerToSeekerRequestController());


//   @override
//   void initState() {
//     print("object");
//     MagicProfileControllerinstance.MagicProfileApiHit();


//     // TODO: implement initState
//     super.initState();
//     selectedRadioTile = 0;
//   }

//   setSelectedRadioTile(int value) {
//     setState(() {
//       selectedRadioTile = value;
//     });
//   }

//   @override
//   void dispose() {
//     selected.close();
//     // TODO: implement dispose
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {

//         final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Obx(() {
//           switch (MagicProfileControllerinstance.rxRequestStatus.value) {
//             case Status.LOADING:
//               return const Center(child: CircularProgressIndicator());
//             case Status.ERROR:
//               if (MagicProfileControllerinstance.error.value == 'No internet') {
//                 return InterNetExceptionWidget(
//                   onPress: () {},
//                 );
//               } else {
//                 return GeneralExceptionWidget(onPress: () {});
//               }
//             case Status.COMPLETED:
//               return Container(
//       child: Column(
//             children: [
              
              
//               SizedBox(
//                 height: height * .05,
//               ),
//               Center(
//                 child: (isVisible = !isNotVisible)
//                     ? Text(
//                         "Find Your Matches",
//                         style: Theme.of(context).textTheme.titleLarge,
//                       )
//                     : Text(
//                         "Select Your Perfect Match",
//                         style: Theme.of(context).textTheme.titleLarge,
//                       ),
//               ),
//               SizedBox(
//                 height: height * .03,
//               ),

//               CircleAvatar(radius: 150,backgroundImage: AssetImage("assets/images/spinner2.PNG"),child: Center(child: CircleAvatar(radius: 130, child:
//  FortuneWheel(
//     indicators: <FortuneIndicator>[
//       FortuneIndicator(
//         alignment: Alignment.center,
//         child: Stack(
//           children: [
//             // TriangleIndicator()
//           ],
//         ),
//       ),
//     ],
//     physics: NoPanPhysics(),
//     selected: selected.stream,
//     animateFirst: true,
//     onAnimationEnd: () {
//       // setState(() {
//       //   rewards = items[selected.value];
//       //   print("${selected.value}==============");

//       //   // Clear the list before storing new key-value pairs
//       //   imageUrlsList.clear();
        
//       //   // Store the image URLs in the list as key-value pairs
//       //   for (int i = 0; i < 4; i++) {
//       //     String itemId = MagicProfileControllerinstance.MagicProfileList.value.requests![i].id.toString();
//       //     String imagepath=MagicProfileControllerinstance.MagicProfileList.value.requests![i].imgPath.toString();
//       //     String name=MagicProfileControllerinstance.MagicProfileList.value.requests![i].name.toString();
//       //     String ?question;
//       //    if(MagicProfileControllerinstance.MagicProfileList.value.requests![i].questions==null){

//       //    } else{
//       //     question=MagicProfileControllerinstance.MagicProfileList.value.requests![i].questions!.question.toString();
//       //     print(question);
//       //     }// String question=MagicProfileControllerinstance.MagicProfileList.value.requests![i].questions!.question.toString();
//       //     Map<String, String> keyValueMap = {"id": itemId,"name":name,"imagepath":imagepath,"question":question.toString()};
//       //     imageUrlsList.add(keyValueMap);
//       //   }
//       //   setState(() {
//       //     imageUrlsList;
//       //   });
//       //   // Print the list of key-value pairs
//       //   print(imageUrlsList);
//       // });
//       // print(items);
//     },
//     items: [
//       for (int i = 0; i < 4; i++) ...<FortuneItem>[
//         FortuneItem(
//           style: FortuneItemStyle(borderColor: Colors.amber, color: colorstwo[i]),
//           child: Row(
//             children: [
//               SizedBox(width: Get.width * 0.15,),
//              InkWell(
//                 child: Container(
//                   height: Get.height * 0.07,
//                   width: Get.width * 0.15,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(100)),
//                     color: Colors.green,
//                     image: DecorationImage(
//                       image: CachedNetworkImageProvider(
//                      isNotVisible==false? "https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-538.jpg":  MagicProfileControllerinstance.MagicProfileList.value.requests![i].imgPath.toString()
//                       ),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 onTap: () {
//                   print(MagicProfileControllerinstance.MagicProfileList.value.requests![i].imgPath.toString());
//                 },
//               ),
//             ],
//           ),
//         ),
//       ],
//     ],
//   )



//               ),),),
     
//               SizedBox(
//                 height: height * .03,
//               ),
//               Visibility(
//                 visible: isVisible,
//                 child: Center(
//                   child: MyButton(
//                     title: "Spin Now",
//                     onTap: () {
//                       setState(() {
//     // Update the model data and shuffle it
//     MagicProfileControllerinstance.MagicProfileList.value.requests!.shuffle();

//     // Change the selected index
//     selected.add(Fortune.randomInt(0, items.length));

//     // Toggle the visibility flags
//     isVisible = !isVisible;
//     isNotVisible = !isNotVisible;
//   });
//                     },
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: height * .02,
//               ),
//               Visibility(
//                 visible: isNotVisible,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Request to be matched",
//                       style: Theme.of(context).textTheme.titleSmall,
//                     ),
//                     // Text(
//                     //   "See all",
//                     //   style: Theme.of(context)
//                     //       .textTheme
//                     //       .labelLarge!
//                     //       .copyWith(color: Color(0xff000CAA)),
//                     // ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: height * .02,
//               ),
//               Visibility(
//                 visible: isNotVisible,
//                 child:  Container(
//                          margin: EdgeInsets.only(left: 20),
//                         child: ListView.builder(
//                           physics: NeverScrollableScrollPhysics(),
//                           itemCount:  4,
//                           // itemExtent: 80,
//                           shrinkWrap: true,
//                           itemBuilder: (context, index) {

//                             return  Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 10),
//                               child:  Row(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                    Container(
//                   height: Get.height * 0.1,
//                   width: Get.width * 0.2,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(100)),
//                     color: Colors.green,
//                     image: DecorationImage(
//                       image: CachedNetworkImageProvider(
//                         MagicProfileControllerinstance.MagicProfileList.value.requests![index].imgPath.toString()
//                       ),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                                   SizedBox(
//                                     width: width * .03,
//                                   ),
//                                   Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                       MagicProfileControllerinstance.MagicProfileList.value.requests![index].name.toString(),
//                                         style: Theme.of(context).textTheme.titleSmall,
//                                       ),
//                                       SizedBox(
//                                         height: height * .01,
//                                       ),
//                                       Text(
//                                         "Match Maker",
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodySmall!
//                                             .copyWith(color: Colors.grey),
//                                       ),
//                                     ],
//                                   ),
//                                   SizedBox(width: width * .12),
//                                   GestureDetector(
//                                     onTap: () {
//                                       // showdilog();
//  selectedseekerid= MagicProfileControllerinstance.MagicProfileList.value.requests![index].id!.toInt();
//                                 print(selectedseekerid);

//                                 if(selectedseekerid!=null){
//                                   showdilog(index, selectedseekerid!);
//                                 }

//                                       // String selectedseekerid= MagicProfileControllerinstance.MagicProfileList.value.requests![index].id.toString();
//                                       // print(selectedseekerid);
//                                     },
//                                     child: Container(
//                                       height: height * .04,
//                                       width: width * .3,
//                                       decoration: BoxDecoration(
//                                         color: Color(0xffFE0091),
//                                         borderRadius: BorderRadius.circular(15),
//                                       ),
//                                       child: Center(
//                                         child: Text(
//                                           "Request",
//                                           style: Theme.of(context)
//                                               .textTheme
//                                               .bodySmall!
//                                               .copyWith(color: Colors.white),
//                                         ),
//                                       ),
//                                     ),
//                                   )
//                                 ],
//                               )
//                             );
//                           },
//                         ),)
                
//                 //  Container(
                          
//                 //   child: ListView.builder(
//                 //     physics: NeverScrollableScrollPhysics(),
//                 //     itemCount:  4,
//                 //     // itemExtent: 80,
//                 //     shrinkWrap: true,
//                 //     itemBuilder: (context, index) {
                      
//                 //       return  Padding(
//                 //         padding: const EdgeInsets.symmetric(vertical: 10),
//                 //         child:  Row(
//                 //           mainAxisAlignment: MainAxisAlignment.start,
//                 //         children: [
//                 //             Container(
//                 //   height: Get.height * 0.1,
//                 //   width: Get.width * 0.2,
//                 //   decoration: BoxDecoration(
//                 //     borderRadius: BorderRadius.all(Radius.circular(100)),
//                 //     color: Colors.green,
//                 //     image: DecorationImage(
//                 //       image: CachedNetworkImageProvider(
//                 //         MagicProfileControllerinstance.MagicProfileList.value.requests![index].imgPath.toString()
//                 //       ),
//                 //       fit: BoxFit.fill,
//                 //     ),
//                 //   ),
//                 // ),
//                 //             SizedBox(
//                 //               width: width * .03,
//                 //             ),
//                 //             Column(
//                 //               mainAxisAlignment: MainAxisAlignment.center,
//                 //               crossAxisAlignment: CrossAxisAlignment.start,
//                 //               children: [
//                 //                 Text(
//                 //                    MagicProfileControllerinstance.MagicProfileList.value.requests![index].name.toString(),
//                 //                   style: Theme.of(context).textTheme.titleSmall,
//                 //                 ),
//                 //                 SizedBox(
//                 //                   height: height * .01,
//                 //                 ),
//                 //                 Text(
//                 //                   "Match Seeker",
//                 //                   style: Theme.of(context)
//                 //                       .textTheme
//                 //                       .bodySmall!
//                 //                       .copyWith(color: Colors.grey),
//                 //                 ),
//                 //               ],
//                 //             ),
//                 //             SizedBox(width: width * .12),
//                 //             GestureDetector(
//                 //               onTap: () {
                             


//                                 //  selectedseekerid= MagicProfileControllerinstance.MagicProfileList.value.requests![index].id!.toInt();
//                                 // print(selectedseekerid);

//                                 // if(selectedseekerid!=null){
//                                 //   showdilog(index, selectedseekerid!);
//                                 // }
//                 //               },
//                 //               child: Container(
//                 //                 height: height * .04,
//                 //                 width: width * .3,
//                 //                 decoration: BoxDecoration(
//                 //                   color: Color(0xffFE0091),
//                 //                   borderRadius: BorderRadius.circular(15),
//                 //                 ),
//                 //                 child: Center(
//                 //                   child: Text(
//                 //                     "Request",
//                 //                     style: Theme.of(context)
//                 //                         .textTheme
//                 //                         .bodySmall!
//                 //                         .copyWith(color: Colors.white),
//                 //                   ),
//                 //                 ),
//                 //               ),
//                 //             )
//                 //           ],
//                 //         )
//                 //       );
//                 //     },
//                 //   ),
                
//               ),

//             ],
//           ),
//     );
//   }
// });}

// showdilog(int index,int id){
//    final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//   showDialog(
//                                   barrierDismissible: false,
//                                   context: context,
//                                   builder: (context) {
//                                     return AlertDialog(
//                                       shape: RoundedRectangleBorder(
//                                           borderRadius: BorderRadius.all(
//                                               Radius.circular(32.0))),
//                                       insetPadding: EdgeInsets.all(0),
//                                       title: Column(
//                                         children: [
//                                           Align(
//                                               alignment: Alignment.bottomRight,
//                                               child: GestureDetector(
//                                                 onTap: () {
//                                                   Get.back();
//                                                 },
//                                                 child: Image.asset(
//                                                     "assets/icons/cancel.png"),
//                                               )),
//                                           Stack(
//                                             children: <Widget>[
//                                               Center(
//                                                 child:   Container(
//                   height: Get.height * 0.14,
//                   width: Get.width * 0.3,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(100)),
//                     color: Colors.green,
//                     image: DecorationImage(
//                       image: CachedNetworkImageProvider(
//                         MagicProfileControllerinstance.MagicProfileList.value.requests![index].imgPath.toString()
//                       ),
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
                                                
                                                
                                               
//                                               ),
//                                               Positioned(
//                                                   top: 80,
//                                                   left: 55,
//                                                   right: 0,
//                                                   child: Image.asset(
//                                                       "assets/icons/locked 1.png"))
//                                             ],
//                                           ),
                                      
//                                           Text(
//                                           MagicProfileControllerinstance.MagicProfileList.value.requests![index].questions!.question.toString(),
                                        
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .titleSmall,
//                                           ),
                                         
//                                           SizedBox(
//                                             height: height * .01,
//                                           ),
// Obx(() => Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("Select an Answer",style: TextStyle(fontSize: 15,)),
//               ],
//             ),
//             RadioListTile<String>(
//               title: Text(MagicProfileControllerinstance.MagicProfileList.value.requests![index].questions!.firstAnswer.toString()),
//               value: MagicProfileControllerinstance.MagicProfileList.value.requests![index].questions!.firstAnswer.toString(),
//               groupValue:MagicProfileControllerinstance.selectedAnswer.value.toString(),
//               onChanged: (value) {
//                     MagicProfileControllerinstance.selectedAnswer.value = value!;
             
//              MagicProfileControllerinstance.selectedAnswer.value.toString();
//              print(MagicProfileControllerinstance.selectedAnswer.value.toString());
                
//               },
//             ),
//             RadioListTile<String>(
//               title: Text(MagicProfileControllerinstance.MagicProfileList.value.requests![index].questions!.secondAnswer.toString()),
//               value: MagicProfileControllerinstance.MagicProfileList.value.requests![index].questions!.secondAnswer.toString(),
//              groupValue:MagicProfileControllerinstance.selectedAnswer.value.toString(),
//               onChanged: (value) {
//                     MagicProfileControllerinstance.selectedAnswer.value = value!;
             
//              MagicProfileControllerinstance.selectedAnswer.value.toString();
//              print(MagicProfileControllerinstance.selectedAnswer.value.toString());
                
//               },
//             ),
//             RadioListTile<String>(
//               title: Text(MagicProfileControllerinstance.MagicProfileList.value.requests![index].questions!.thirdAnswer.toString()),
//               value: MagicProfileControllerinstance.MagicProfileList.value.requests![index].questions!.thirdAnswer.toString(),
//                groupValue:MagicProfileControllerinstance.selectedAnswer.value.toString(),
//               onChanged: (value) {
//                     MagicProfileControllerinstance.selectedAnswer.value = value!;
             
//              MagicProfileControllerinstance.selectedAnswer.value.toString();
//              print(MagicProfileControllerinstance.selectedAnswer.value.toString());
                
//               },
//             ),
//           ],
//         ),),


                                          
//                                           GestureDetector(
//                                             onTap: () {
                                            
//                                          Get.back();
//                                        if(MagicProfileControllerinstance.MagicProfileList.value.requests![index].questions!.correctAnswer==MagicProfileControllerinstance.selectedAnswer.value.toString()){

//                                         showdiog2(index);
//                                        } if(MagicProfileControllerinstance.MagicProfileList.value.requests![index].questions!.correctAnswer!=MagicProfileControllerinstance.selectedAnswer.value.toString()){
                                        
//                                         showdiologwronganswer(index);
                                      
//                                        }
//                                             },
//                                             child: Container(
//                                               height: height * .04,
//                                               width: width * .3,
//                                               decoration: BoxDecoration(
//                                                 color: Color(0xffFE0091),
//                                                 borderRadius:
//                                                     BorderRadius.circular(15),
//                                               ),
//                                               child: Center(
//                                                 child: Text(
//                                                   "Submit",
//                                                   style: Theme.of(context)
//                                                       .textTheme
//                                                       .bodySmall!
//                                                       .copyWith(
//                                                           color: Colors.white),
//                                                 ),
//                                               ),
//                                             ),
//                                           ),
//                                           SizedBox(
//                                             height:
//                                                 MediaQuery.of(context).size.height *
//                                                     .02,
//                                           ),
//                                         ],
//                                       ),
//                                     );
//                                   },
//                                 );
//                               }


// showdiog2(int index){
//   final height = MediaQuery.of(context).size.height;
//       final width = MediaQuery.of(context).size.width;
//           showDialog(
//                                                 barrierDismissible: false,
//                                                 context: context,
//                                                 builder: (context) {
//                                                   return AlertDialog(
//                                                     shape: RoundedRectangleBorder(
//                                                         borderRadius:
//                                                             BorderRadius.all(
//                                                                 Radius.circular(
//                                                                     32.0))),
//                                                     insetPadding: EdgeInsets.all(0),
//                                                     title: Column(
//                                                       children: [
//                                                         Align(
//                                                             alignment: Alignment
//                                                                 .bottomRight,
//                                                             child: GestureDetector(
//                                                               onTap: () {
//                                                                 Get.back();
//                                                               },
//                                                               child: Image.asset(
//                                                                   "assets/icons/cancel.png"),
//                                                             )),
//                                                         Stack(
//                                                           children: <Widget>[
//                                                             Center(
//                                                               child: Container(
//                                                                 height: height * .3,
//                                                                 width: width * .3,
//                                                                 child: CircleAvatar(
//                                                                   radius: 30.0,
//                                                                   backgroundImage:
//                                                                       NetworkImage(
//                                                                         MagicProfileControllerinstance.MagicProfileList.value.requests![index].imgPath.toString()),
//                                                                   backgroundColor:
//                                                                       Colors
//                                                                           .transparent,
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                             Positioned(
//                                                                 top: 80,
//                                                                 left: 55,
//                                                                 right: 0,
//                                                                 child: Image.asset(
//                                                                     "assets/icons/unlocked 1.png"))
//                                                           ],
//                                                         ),
//                                                         Text(
//                                                           "Profile Unlocked",
//                                                           style: Theme.of(context)
//                                                               .textTheme
//                                                               .titleSmall,
//                                                         ),
//                                                         SizedBox(
//                                                           height: height * .01,
//                                                         ),
//                                                         Text(
//                                                           "Your answer is correct.",
//                                                           style: Theme.of(context)
//                                                               .textTheme
//                                                               .bodySmall!
//                                                               .copyWith(
//                                                                   color:
//                                                                       Colors.grey),
//                                                         ),
//                                                         SizedBox(
//                                                           height: height * .02,
//                                                         ),
//                                                         GestureDetector(
//                                                           onTap: () {
                                                        
// match_withid=MagicProfileControllerinstance.MagicProfileList.value.requests![index].id.toString();
// print(match_withid);
//                                                   SeekerToSeekerRequestControllerinstance.SikerTOSikerRequestApiHit();          // Timer(Duration(microseconds: 2), () { Get.to(ChatPage()); });
                                                           
//                                                           },
//                                                           child: Container(
//                                                             height: height * .04,
//                                                             width: width * .3,
//                                                             decoration:
//                                                                 BoxDecoration(
//                                                               color:
//                                                                   Color(0xffFE0091),
//                                                               borderRadius:
//                                                                   BorderRadius
//                                                                       .circular(15),
//                                                             ),
//                                                             child: Center(
//                                                               child: Text(
//                                                                 "Message",
//                                                                 style: Theme.of(
//                                                                         context)
//                                                                     .textTheme
//                                                                     .bodySmall!
//                                                                     .copyWith(
//                                                                         color: Colors
//                                                                             .white),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                         ),
//                                                         SizedBox(
//                                                           height:
//                                                               MediaQuery.of(context)
//                                                                       .size
//                                                                       .height *
//                                                                   .02,
//                                                         ),
//                                                       ],
//                                                     ),
//                                                   );
//                                                 },
//                                               );
// }

// showdiologwronganswer(int index){
//      final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//               showDialog(
//                                                               barrierDismissible:
//                                                                   false,
//                                                               context: context,
//                                                               builder: (context) {
//                                                                 return AlertDialog(
//                                                                   shape: RoundedRectangleBorder(
//                                                                       borderRadius:
//                                                                           BorderRadius.all(
//                                                                               Radius.circular(
//                                                                                   32.0))),
//                                                                   insetPadding:
//                                                                       EdgeInsets
//                                                                           .all(0),
//                                                                   title: Column(
//                                                                     children: [
//                                                                       Align(
//                                                                           alignment:
//                                                                               Alignment
//                                                                                   .bottomRight,
//                                                                           child:
//                                                                               GestureDetector(
//                                                                             onTap:
//                                                                                 () {
//                                                                               Get.back();
//                                                                             },
//                                                                             child: Image.asset(
//                                                                                 "assets/icons/cancel.png"),
//                                                                           )),
//                                                                       Stack(
//                                                                         children: <Widget>[
//                                                                           Center(
//                                                                             child:
//                                                                                 Container(
//                                                                               height:
//                                                                                   height * .3,
//                                                                               width:
//                                                                                   width * .3,
//                                                                               child:
//                                                                                   CircleAvatar(
//                                                                                 radius:
//                                                                                     30.0,
//                                                                                 backgroundImage:
//                                                                                     NetworkImage(  MagicProfileControllerinstance.MagicProfileList.value.requests![index].imgPath.toString()),
//                                                                                 backgroundColor:
//                                                                                     Colors.transparent,
//                                                                               ),
//                                                                             ),
//                                                                           ),
//                                                                           Positioned(
//                                                                               top:
//                                                                                   80,
//                                                                               left:
//                                                                                   50,
//                                                                               right:
//                                                                                   0,
//                                                                               child:
//                                                                                   Image.asset("assets/icons/locked 1.png"))
//                                                                         ],
//                                                                       ),
//                                                                       Text(
//                                                                         "Profile locked",
//                                                                         style: Theme.of(
//                                                                                 context)
//                                                                             .textTheme
//                                                                             .titleSmall,
//                                                                       ),
//                                                                       SizedBox(
//                                                                         height:
//                                                                             height *
//                                                                                 .01,
//                                                                       ),
//                                                                       Text(
//                                                                         "Better Luck Next Time!",
//                                                                         style: Theme.of(
//                                                                                 context)
//                                                                             .textTheme
//                                                                             .bodySmall!
//                                                                             .copyWith(
//                                                                                 color:
//                                                                                     Colors.grey),
//                                                                       ),
//                                                                       SizedBox(
//                                                                         height:
//                                                                             height *
//                                                                                 .02,
//                                                                       ),
//                                                                       GestureDetector(
//                                                                         onTap: () {
//                                                                           Get.back();
//                                                                         },
//                                                                         child:
//                                                                             Container(
//                                                                           height:
//                                                                               height *
//                                                                                   .04,
//                                                                           width:
//                                                                               width *
//                                                                                   .3,
//                                                                           decoration:
//                                                                               BoxDecoration(
//                                                                             color: Color(
//                                                                                 0xffFE0091),
//                                                                             borderRadius:
//                                                                                 BorderRadius.circular(15),
//                                                                           ),
//                                                                           child:
//                                                                               Center(
//                                                                             child:
//                                                                                 Text(
//                                                                               "Back",
//                                                                               style: Theme.of(context)
//                                                                                   .textTheme
//                                                                                   .bodySmall!
//                                                                                   .copyWith(color: Colors.white),
//                                                                             ),
//                                                                           ),
//                                                                         ),
//                                                                       ),
//                                                                       SizedBox(
//                                                                         height: MediaQuery.of(context)
//                                                                                 .size
//                                                                                 .height *
//                                                                             .02,
//                                                                       ),

//                                                                       InkWell(
//                                                                         child: Container(
//                                                                                                                     height: height * .04,
//                                                                                                                     width: width * .4,
//                                                                                                                     decoration: BoxDecoration(
//                                                                                                                       color: Colors.white,
//                                                                                                                       borderRadius:
//                                                                                                                           BorderRadius.circular(15),
//                                                                                                                           border: Border.all(color:Color(
//                                                                                   0xffFE0091) )
//                                                                                                                     ),
//                                                                                                                     child: Center(
//                                                                                                                       child: Text(
//                                                                                                                         "Request To Maker",
//                                                                                                                         style: Theme.of(context)
//                                                                                                                             .textTheme
//                                                                                                                             .bodySmall!
//                                                                                                                             .copyWith(
//                                                                                                                                 color: Color(
//                                                                                   0xffFE0091),)
//                                                                                                                       ),
//                                                                                                                     ),
//                                                                                                                   ),

//                                                                                                                   onTap: (){
//                                                                                                                       Get.back();


//                                                                                                                       userIdsiker=MagicProfileControllerinstance.MagicProfileList.value.requests![index].id.toString();

//                                                                                                                       setState(() {
//                                                                                                                         userIdsiker;
//                                                                                                                       });
//                                                             Timer(Duration(microseconds: 2), () { Get.to(SeeAllMaker()); });
                                                                                                                  
//                                                                                                                   },
//                                                                       ),
//                                                                     ],
//                                                                   ),
//                                                                 );
//                                                               },
//                                                             );
                                                          
// }

                              
// }


import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/controller/MagicProfileController/MagicProfileConrtroller.dart';
import 'package:cupid_match/controllers/controller/SeekerToSeekerRequestController/SeekerToSeekerRequestController.dart';
import 'package:cupid_match/controllers/controller/spinRequestController/SpinRequestController.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/match_maker/chat_screen.dart';
import 'package:cupid_match/match_seeker/SeeAllMaker/SeAllMaker.dart';
import 'package:cupid_match/match_seeker/choose_one.dart';
import 'package:cupid_match/match_seeker/home_screen.dart';
import 'package:cupid_match/match_seeker/chat_screen.dart';
import 'package:cupid_match/match_seeker/siker_Home_Screen.dart';
import 'package:cupid_match/res/components/general_exception.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rxdart/subjects.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/controller/liver_Pooled_Request_Controller/Liver_Pooled_Request_controller.dart';
import '../match_seeker/Requests/outgoingRequest.dart';
import '../match_seeker/lever/StaticLiverPool.dart';
List spinedprofilelist=[];
class SpinWillWidget extends StatefulWidget {
  const SpinWillWidget({super.key});

  @override
  State<SpinWillWidget> createState() => _SpinWillWidgetState();
}

class _SpinWillWidgetState extends State<SpinWillWidget> {
  final MagicProfileControllerinstance = Get.put(MagicProfileController());

  final spinRequestController = Get.put(SpinRequestController());
  final SpeendReqestControllerinstance = Get.put(SpeendReqestController());


  List<int> items = [
    100,
    200,
    300,
    400,
  ];
  List<Color> colorstwo = [
    Color(0xffFF1616),
    Color(0xffFF914D),
    Color(0xffFFDE59),
    Color(0xff7ED957),
  ];
  List<Map<String, String>> imageUrlsList = []; // List to store key-value pairs

  final selected = BehaviorSubject<int>();

  int rewards = 0;

  bool shouldShowSpinButton = true;

  late Timer countdownTimer;
  Duration remainingTime = Duration(hours: 2);
  final SeekerToSeekerRequestControllerinstance =
  Get.put(SeekerToSeekerRequestController());

  @override
  void initState() {
    print("object");
    MagicProfileControllerinstance.MagicProfileApiHit();
    SpeendReqestControllerinstance.SpeendRequestApihit();
    setState(() {
      isNotVisible = false;
      isSpinTimerVisible=false;


    });
    // TODO: implement initState
    super.initState();
    selectedRadioTile = 0;

  }

  void startCountdownTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime.inSeconds > 0) {
          remainingTime = remainingTime - Duration(seconds: 1);
        } else {
          isVisible = !isVisible;
          isNotVisible = !isNotVisible;
          shouldShowSpinButton = true; // Show the button when time is up
          isSpinTimerVisible = false;
          // Hide the timer
          timer.cancel();
        }
      });
    });
  }

  Future<void> saveLastSpinTime() async {
    final prefs = await SharedPreferences.getInstance();
    final currentTime = DateTime
        .now()
        .millisecondsSinceEpoch;
    await prefs.setInt('last_spin_time', currentTime);
  }

  setSelectedRadioTile(int value) {
    setState(() {
      selectedRadioTile = value;
    });
  }

  bool isRequestMade = false;

  void handleSpinButtonClick() {
    SpeendReqestControllerinstance.SpeendRequestApihit();
    if(MagicProfileControllerinstance
        .MagicProfileList
        .value
        .requests!.length>4){
      if (!isSpinTimerVisible) {
           print( SpeendReqestControllerinstance.seekerprofilerequested.value.toString());
                   print("8787328==================================================================");
        setState(() {
          MagicProfileControllerinstance.MagicProfileList.value.requests!.shuffle();
          selected.add(Fortune.randomInt(0, items.length));
          isVisible = !isVisible;
          isNotVisible = !isNotVisible;
          isspinedwill=true;
        });

        setState(() {
          shouldShowSpinButton = false;
          isSpinTimerVisible = true;
          remainingTime = Duration(hours: 2);
        });
        spinedprofilelist=[];
        for(int i =0; i<=3;i++){

          print(  MagicProfileControllerinstance.MagicProfileList.value.requests![i].name);
          spinedprofilelist.add({
            "seeker_id":MagicProfileControllerinstance.MagicProfileList.value.requests![i].id.toString(),
            "is_requested":"false"
          });
          print(spinedprofilelist);
          print(spinedprofilelist.length);

          if(spinedprofilelist.length==4){
            print("spined===================");
            spinRequestController.apihit();
            //  LiverPoolControllerinstance.apihit();
          }

        }

        // Save the current time as the last spin time
        saveLastSpinTime();

        // Start the countdown timer
        startCountdownTimer();
      }
    }
    else {
      Fluttertoast.showToast(
        msg: "Dont Have Enough Seekers",
        toastLength: Toast.LENGTH_SHORT, // You can use Toast.LENGTH_LONG for a longer duration.
        gravity: ToastGravity.BOTTOM, // You can change the position to TOP, CENTER, or BOTTOM.
        backgroundColor: Colors.black54,
        textColor: Colors.white,
      );
    }
  }

  @override
  void dispose() {
    selected.close();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;
    return Obx(() {
      if (MagicProfileControllerinstance.rxRequestStatus.value==Status.LOADING && 
         SpeendReqestControllerinstance.rxRequestStatus.value==Status.LOADING) {
        
          return const Center(child: CircularProgressIndicator(  color: Colors.pink,));
         }
    if (MagicProfileControllerinstance.rxRequestStatus.value==Status.ERROR && 
         SpeendReqestControllerinstance.rxRequestStatus.value==Status.ERROR) {
          if (MagicProfileControllerinstance.error.value == 'No internet'&&SpeendReqestControllerinstance.error.value == 'No internet') {
            return InterNetExceptionWidget(
              onPress: () {},
            );
          } else {
            return GeneralExceptionWidget(onPress: () {});
          }}
        else {
          return Container(
            child: Column(
              children: [
                SizedBox(
                  height: height * .05,
                ),
                Center(
                  child: (isVisible = !isNotVisible)
                      ? Text(
                    "Find Your Matches",
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge,
                  )
                      : Text(
                    "Select Your Perfect Match",
                    style: Theme
                        .of(context)
                        .textTheme
                        .titleLarge,
                  ),
                ),
                SizedBox(
                  height: height * .03,
                ),

                CircleAvatar(
                  radius: 150,
                  backgroundImage: AssetImage("assets/images/spinner2.PNG"),
                  child: Center(
                    child: CircleAvatar(
                        radius: 130,
                        child: FortuneWheel(
                          indicators: <FortuneIndicator>[
                            FortuneIndicator(
                              alignment: Alignment.center,
                              child: Stack(
                                children: [
                                  // TriangleIndicator()
                                ],
                              ),
                            ),
                          ],
                          physics: NoPanPhysics(),
                          selected: selected.stream,
                          animateFirst: true,
                          onAnimationEnd: () {
                            // setState(() {
                            //   rewards = items[selected.value];spin
                            //   print("${selected.value}==============");

                            //   // Clear the list before storing new key-value pairs
                            //   imageUrlsList.clear();

                            //   // Store the image URLs in the list as key-value pairs
                            //   for (int i = 0; i < 4; i++) {
                            //     String itemId = MagicProfileControllerinstance.MagicProfileList.value.requests![i].id.toString();
                            //     String imagepath=MagicProfileControllerinstance.MagicProfileList.value.requests![i].imgPath.toString();
                            //     String name=MagicProfileControllerinstance.MagicProfileList.value.requests![i].name.toString();
                            //     String ?question;
                            //    if(MagicProfileControllerinstance.MagicProfileList.value.requests![i].questions==null){

                            //    } else{
                            //     question=MagicProfileControllerinstance.MagicProfileList.value.requests![i].questions!.question.toString();
                            //     print(question);
                            //     }// String question=MagicProfileControllerinstance.MagicProfileList.value.requests![i].questions!.question.toString();
                            //     Map<String, String> keyValueMap = {"id": itemId,"name":name,"imagepath":imagepath,"question":question.toString()};
                            //     imageUrlsList.add(keyValueMap);
                            //   }
                            //   setState(() {
                            //     imageUrlsList;
                            //   });
                            //   // Print the list of key-value pairs
                            //   print(imageUrlsList);
                            // });
                            // print(items);
                          },
                          items: [
                            for (int i = 0; i < 4; i++) ...<FortuneItem>[
                              FortuneItem(
                                style: FortuneItemStyle(
                                    borderColor: Colors.amber,
                                    color: colorstwo[i]),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: Get.width * 0.10,
                                    ),
                                    InkWell(
                                      child: Transform.rotate(
                                        angle: 90 *
                                            3.1415926535897932 /
                                            180,
                                        child: Container(
                                          height: Get.height * 0.07,
                                          width: Get.width * 0.15,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(100)),
                                            color: Colors.green,
                                            image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  isNotVisible == false
                                                      ? "https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-538.jpg"
                                                      : MagicProfileControllerinstance
                                                      .MagicProfileList
                                                      .value
                                                      .requests![i]
                                                      .imgPath
                                                      .toString()),
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        print(MagicProfileControllerinstance
                                            .MagicProfileList
                                            .value
                                            .requests![i]
                                            .imgPath
                                            .toString());
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        )),
                  ),
                ),
                // for timer when user completed our 24 hours successfully
                SizedBox(
                  height: height * .03,
                ),
                // if(isSpinTimerVisible == false)
                if(isSpinTimerVisible == false)Visibility(
                  visible: shouldShowSpinButton, // Only show the button if shouldShowSpinButton is true
                  child: MyButton(
                    onTap: handleSpinButtonClick,
                    title: 'Spin Now',
                  ),
                ),
                if(isSpinTimerVisible == true)Visibility(
                  visible: !shouldShowSpinButton, // Only show the button if shouldShowSpinButton is true
                  child: MyButton(
                    onTap: (){
                      setState(() {
                        isNotVisible = false;
                        isSpinTimerVisible=false;
                        shouldShowSpinButton=true;
                      });
                    },
                    title: 'Spin Again',
                  ),
                ),
                SizedBox(
                  height: height * .01,
                ),


                /// Add some spacing
                // if(isSpinTimerVisible == true)
                // Visibility(
                //   visible: isSpinTimerVisible,
                //   child: Column(
                //     children: [
                //       Text(
                //         "Next Spin",
                //         style: Get.theme.textTheme.headlineSmall!.copyWith(
                //           color: Color(0xff000CAA),
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //       SizedBox(height: height * 0.02),
                //       Row(
                //         mainAxisAlignment: MainAxisAlignment.center,
                //         children: [
                //
                //           //&************ for hours
                //           Container(
                //             child: Column(
                //               crossAxisAlignment: CrossAxisAlignment.center,
                //               children: [
                //                 Container(
                //                   padding: EdgeInsets.all(15),
                //                   decoration: BoxDecoration(
                //                     color: Colors.blue[50],
                //                     borderRadius: BorderRadius.circular(15),
                //                   ),
                //                   child: Text(
                //                     "${remainingTime.inHours.toString().padLeft(2, '0')}",
                //                     style: Get.theme.textTheme.headlineSmall!.copyWith(
                //                       color: Color(0xff000CAA),
                //                       fontWeight: FontWeight.bold,
                //                     ),
                //                   ),
                //
                //                 ),
                //                 SizedBox(height: Get.height * 0.0105),
                //                 Text(
                //                   "Hour",
                //                   style: Theme.of(context)
                //                       .textTheme
                //                       .bodySmall!
                //                       .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                //                 ),
                //               ],
                //             ),
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.only(left:10,bottom: 25),
                //             child: Text(
                //               ":",
                //               style: Get.theme.textTheme.headlineSmall!.copyWith(
                //                 color: Color(0xff000CAA),
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //           ),
                //           SizedBox(width: Get.width * 0.025),
                //
                //           //&************ for minutes
                //           Container(
                //             child: Column(
                //               children: [
                //                 Container(
                //                   padding: EdgeInsets.all(15),
                //                   decoration: BoxDecoration(
                //                     color: Colors.blue[50],
                //                     borderRadius: BorderRadius.circular(15),
                //                   ),
                //                   child: Text(
                //                     "${remainingTime.inMinutes.remainder(60).toString().padLeft(2, '0')}",
                //                     style: Get.theme.textTheme.headlineSmall!.copyWith(
                //                       color: Color(0xff000CAA),
                //                       fontWeight: FontWeight.bold,
                //                     ),
                //                   ),
                //
                //                 ),
                //                 SizedBox(height: Get.height * 0.0105),
                //                 Text(
                //                   "Minute",
                //                   style: Theme.of(context)
                //                       .textTheme
                //                       .bodySmall!
                //                       .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                //                 ),
                //               ],
                //             ),
                //           ),
                //           Padding(
                //             padding: const EdgeInsets.only(left:10,bottom: 25),
                //             child: Text(
                //               ":",
                //               style: Get.theme.textTheme.headlineSmall!.copyWith(
                //                 color: Color(0xff000CAA),
                //                 fontWeight: FontWeight.bold,
                //               ),
                //             ),
                //           ),
                //
                //           SizedBox(width: Get.width * 0.025),
                //           //&************ for second
                //           Container(
                //             child: Column(
                //               children: [
                //                 Container(
                //                   padding: EdgeInsets.all(15),
                //                   decoration: BoxDecoration(
                //                     color: Colors.blue[50],
                //                     borderRadius: BorderRadius.circular(15),
                //                   ),
                //                   child: Text(
                //                     "${remainingTime.inSeconds.remainder(60).toString().padLeft(2, '0')}",
                //                     style: Get.theme.textTheme.headlineSmall!.copyWith(
                //                       color: Color(0xff000CAA),
                //                       fontWeight: FontWeight.bold,
                //                     ),
                //                   ),
                //
                //                 ),
                //                 SizedBox(height: Get.height * 0.0105),
                //                 Text(
                //                   "Second",
                //                   style: Theme.of(context)
                //                       .textTheme
                //                       .bodySmall!
                //                       .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                //                 ),
                //               ],
                //             ),
                //           ),
                //
                //
                //         ],
                //       ),
                //     ],
                //   ),
                // ),

                SizedBox(
                  height: height * .02,
                ),
                Visibility(
                  visible: isNotVisible,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Request to be matched",
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleSmall,
                        ),
                        // Text(
                        //   "See all",
                        //   style: Theme.of(context)
                        //       .textTheme
                        //       .labelLarge!
                        //       .copyWith(color: Color(0xff000CAA)),
                        // ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * .02,
                ),
                Visibility(
                    visible: isNotVisible,
                    child: Container(
                      margin: EdgeInsets.only(left: 20),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: 4,
                        // itemExtent: 80,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: Get.height * 0.1,
                                    width: Get.width * 0.2,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(100)),
                                      color: Colors.green,
                                      image: DecorationImage(
                                        image: CachedNetworkImageProvider(
                                            MagicProfileControllerinstance
                                                .MagicProfileList
                                                .value
                                                .requests![index]
                                                .imgPath
                                                .toString()),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * .03,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: width * .2,
                                        child: Text(
                                          MagicProfileControllerinstance
                                              .MagicProfileList
                                              .value
                                              .requests![index]
                                              .name
                                              .toString(),
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .titleSmall,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * .01,
                                      ),
                                      Text(
                                        "Match Seeker",
                                        style: Theme
                                            .of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: width * .12),
                                  if(SpeendReqestControllerinstance.seekerprofilerequested.value==false&&SpeendReqestControllerinstance
                                      .staticLiverPullvalue
                                      .value
                                      .data![0].spinLeverpoolRequestedData!.spinRequestData![index].isRequested=="false")  GestureDetector(
                                    onTap: () {
                                      // showdilog();
                                      selectedseekerid =
                                          SpeendReqestControllerinstance
                                              .staticLiverPullvalue
                                              .value
                                              .data![0]
                                              .spinLeverpoolRequestedData!
                                              .spinRequestData![index]
                                              .seekerData!.id;
                                      print(selectedseekerid);


                                        if (selectedseekerid != null) {
                                          showdilog(index, selectedseekerid!);
                                           
                                        }

                                      else if (selectedseekerid != null) {
                                        print("dhfsdh");
                                      }


                                      // String selectedseekerid= MagicProfileControllerinstance.MagicProfileList.value.requests![index].id.toString();
                                      // print(selectedseekerid);
                                    },
                                    child: Container(
                                      height: height * .04,
                                      width: width * .3,
                                      decoration: BoxDecoration(
                                        color: Color(0xffFE0091),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Request",
                                          style: Theme
                                              .of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  if(SpeendReqestControllerinstance
                                      .staticLiverPullvalue
                                      .value
                                      .data![0].spinLeverpoolRequestedData!.spinRequestData![index].isRequested=="true")
                                  GestureDetector(
                                    onTap: () {

                                      Fluttertoast.showToast(
                                        msg: "You Have Already Requested",
                                        toastLength: Toast.LENGTH_SHORT, // You can use Toast.LENGTH_LONG for a longer duration.
                                        gravity: ToastGravity.BOTTOM, // You can change the position to TOP, CENTER, or BOTTOM.
                                        backgroundColor: Colors.black54,
                                        textColor: Colors.white,
                                      );

//                                       if( dataofStaticPull.spinLeverpoolRequestedData!.spinRequestData![index].isRequested=="true"){
// // selectedseekerid =
// //                                           dataofStaticPull.id!.toInt();
// //                                       if (selectedseekerid != null) {
// //                                         showdilog(index, selectedseekerid!);
// //                                       }
// //                                       }else{
// //                                         print("Blocked");
//                                       }

                                    },
                                    child: Container(
                                      height: height * .04,
                                      width: width * .3,
                                      decoration: BoxDecoration(
                                        color: Color(0xffFE0091),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Requested",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(color: Colors.white,fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              )
                          );
                        },
                      ),
                    )

                  //  Container(

                  //   child: ListView.builder(
                  //     physics: NeverScrollableScrollPhysics(),
                  //     itemCount:  4,
                  //     // itemExtent: 80,
                  //     shrinkWrap: true,
                  //     itemBuilder: (context, index) {

                  //       return  Padding(
                  //         padding: const EdgeInsets.symmetric(vertical: 10),
                  //         child:  Row(
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //         children: [
                  //             Container(
                  //   height: Get.height * 0.1,
                  //   width: Get.width * 0.2,
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.all(Radius.circular(100)),
                  //     color: Colors.green,
                  //     image: DecorationImage(
                  //       image: CachedNetworkImageProvider(
                  //         MagicProfileControllerinstance.MagicProfileList.value.requests![index].imgPath.toString()
                  //       ),
                  //       fit: BoxFit.fill,
                  //     ),
                  //   ),
                  // ),
                  //             SizedBox(
                  //               width: width * .03,
                  //             ),
                  //             Column(
                  //               mainAxisAlignment: MainAxisAlignment.center,
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Text(
                  //                    MagicProfileControllerinstance.MagicProfileList.value.requests![index].name.toString(),
                  //                   style: Theme.of(context).textTheme.titleSmall,
                  //                 ),
                  //                 SizedBox(
                  //                   height: height * .01,
                  //                 ),
                  //                 Text(
                  //                   "Match Seeker",
                  //                   style: Theme.of(context)
                  //                       .textTheme
                  //                       .bodySmall!
                  //                       .copyWith(color: Colors.grey),
                  //                 ),
                  //               ],
                  //             ),
                  //             SizedBox(width: width * .12),
                  //             GestureDetector(
                  //               onTap: () {

                  //  selectedseekerid= MagicProfileControllerinstance.MagicProfileList.value.requests![index].id!.toInt();
                  // print(selectedseekerid);

                  // if(selectedseekerid!=null){
                  //   showdilog(index, selectedseekerid!);
                  // }
                  //               },
                  //               child: Container(
                  //                 height: height * .04,
                  //                 width: width * .3,
                  //                 decoration: BoxDecoration(
                  //                   color: Color(0xffFE0091),
                  //                   borderRadius: BorderRadius.circular(15),
                  //                 ),
                  //                 child: Center(
                  //                   child: Text(
                  //                     "Request",
                  //                     style: Theme.of(context)
                  //                         .textTheme
                  //                         .bodySmall!
                  //                         .copyWith(color: Colors.white),
                  //                   ),
                  //                 ),
                  //               ),
                  //             )
                  //           ],
                  //         )
                  //       );
                  //     },
                  //   ),

                ),
              ],
            ),
          );
      }
    });
  }

  showdilog(int index, int id) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          insetPadding: EdgeInsets.all(0),
          title: Column(
            children: [
              Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset("assets/icons/cancel.png"),
                  )),
              Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      height: Get.height * 0.14,
                      width: Get.width * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Colors.green,
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              SpeendReqestControllerinstance
                                  .staticLiverPullvalue.value.data![0]
                                  .spinLeverpoolRequestedData!
                                  .spinRequestData![index].seekerData!


                                  .imgPath

                                  .toString()),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 80,
                      left: 55,
                      right: 0,
                      child: Image.asset("assets/icons/locked 1.png"))
                ],
              ),
              Text(
                SpeendReqestControllerinstance
                    .staticLiverPullvalue
                    .value
                    .data![0].spinLeverpoolRequestedData!
                    .spinRequestData![index].seekerData!.questions!.question
                    .toString(),
                style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall,
              ),
              SizedBox(
                height: height * .01,
              ),
              Obx(
                    () =>
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Select an Answer",
                                style: TextStyle(
                                  fontSize: 15,
                                )),
                          ],
                        ),
                        RadioListTile<String>(
                          title: Text(SpeendReqestControllerinstance
                              .staticLiverPullvalue
                              .value
                              .data![0].spinLeverpoolRequestedData!
                              .spinRequestData![index].seekerData!.questions!
                              .firstAnswer

                              .toString()),
                          value: SpeendReqestControllerinstance
                              .staticLiverPullvalue
                              .value
                              .data![0].spinLeverpoolRequestedData!
                              .spinRequestData![index].seekerData!.questions!
                              .firstAnswer
                              .toString(),
                          groupValue: SpeendReqestControllerinstance
                              .selectedAnswer.value
                              .toString(),
                          onChanged: (value) {
                            SpeendReqestControllerinstance.selectedAnswer
                                .value =
                            value!;

                            SpeendReqestControllerinstance.selectedAnswer.value
                                .toString();
                            print(SpeendReqestControllerinstance
                                .selectedAnswer.value
                                .toString());
                          },
                        ),
                        RadioListTile<String>(
                          title: Text(SpeendReqestControllerinstance
                              .staticLiverPullvalue
                              .value
                              .data![0].spinLeverpoolRequestedData!
                              .spinRequestData![index].seekerData!.questions!
                              .secondAnswer
                              .toString()),
                          value: SpeendReqestControllerinstance
                              .staticLiverPullvalue
                              .value
                              .data![0].spinLeverpoolRequestedData!
                              .spinRequestData![index].seekerData!.questions!
                              .secondAnswer
                              .toString(),
                          groupValue: SpeendReqestControllerinstance
                              .selectedAnswer.value
                              .toString(),
                          onChanged: (value) {
                            SpeendReqestControllerinstance.selectedAnswer
                                .value =
                            value!;

                            SpeendReqestControllerinstance.selectedAnswer.value
                                .toString();
                            print(SpeendReqestControllerinstance
                                .selectedAnswer.value
                                .toString());
                          },
                        ),
                        RadioListTile<String>(
                          title: Text(SpeendReqestControllerinstance
                              .staticLiverPullvalue
                              .value
                              .data![0].spinLeverpoolRequestedData!
                              .spinRequestData![index].seekerData!.questions!
                              .thirdAnswer
                              .toString()),
                          value: SpeendReqestControllerinstance
                              .staticLiverPullvalue
                              .value
                              .data![0].spinLeverpoolRequestedData!
                              .spinRequestData![index].seekerData!.questions!
                              .thirdAnswer
                              .toString(),
                          groupValue: SpeendReqestControllerinstance
                              .selectedAnswer.value
                              .toString(),
                          onChanged: (value) {
                            SpeendReqestControllerinstance.selectedAnswer
                                .value =
                            value!;

                            SpeendReqestControllerinstance.selectedAnswer.value
                                .toString();
                            print(SpeendReqestControllerinstance
                                .selectedAnswer.value
                                .toString());
                          },
                        ),
                      ],
                    ),
              ),
              GestureDetector(
                onTap: () {
                    // SpeendReqestControllerinstance.SpeendRequestApihit();
                  setState(() {
                    isboxloading = true;
                  });

                  spinedprofilelist[index]['is_requested'] = "true";
                  spinRequestController.apihit();
                  
                   print( SpeendReqestControllerinstance.seekerprofilerequested.value.toString());
                   print("8787328==================================================================");

                  if (isboxloading == true) {
                    _showProgressDialog(context);
                  }

                  Timer(Duration(seconds: 2), () {
                    setState(() {
                      isboxloading = false;
                      Get.back();
                       Get.back();
                      if (SpeendReqestControllerinstance
                          .staticLiverPullvalue
                          .value
                          .data![0].spinLeverpoolRequestedData!
                          .spinRequestData![index]
                          .seekerData!
                          .questions!
                          .correctAnswer ==
                          SpeendReqestControllerinstance.selectedAnswer.value
                              .toString()) {
                        match_withid = SpeendReqestControllerinstance
                            .staticLiverPullvalue
                            .value
                            .data![0].spinLeverpoolRequestedData!
                            .spinRequestData![index].seekerData!.id
                            .toString();
                        print(match_withid);
                        SeekerToSeekerRequestControllerinstance
                            .SikerTOSikerRequestApiHit(); // T
                        showdiog2(index);
                      }
                      if (SpeendReqestControllerinstance
                          .staticLiverPullvalue
                          .value
                          .data![0].spinLeverpoolRequestedData!
                          .spinRequestData![index]
                          .seekerData!
                          .questions!
                          .correctAnswer !=
                          SpeendReqestControllerinstance.selectedAnswer.value
                              .toString()) {
                        showdiologwronganswer(index);
                      }
                    });
                  });
                  // Get.back();
                  // if ( SpeendReqestControllerinstance
                  //                                       .staticLiverPullvalue
                  //                                       .value
                  //                                       .data![0].spinLeverpoolRequestedData!.spinRequestData![index].seekerData!.questions!.correctAnswer ==
                  //     SpeendReqestControllerinstance.selectedAnswer.value
                  //         .toString()) {
                  //   showdiog2(index);
                  // }
                  // if (SpeendReqestControllerinstance.staticLiverPullvalue.value
                  //         .data![index].spinLeverpoolRequestedData!.spinRequestData![index].seekerData!.questions!.correctAnswer !=
                  //     SpeendReqestControllerinstance.selectedAnswer.value
                  //         .toString()) {
                  //   showdiologwronganswer(index);
                  // }
                },
                child: Container(
                  height: height * .04,
                  width: width * .3,
                  decoration: BoxDecoration(
                    color: Color(0xffFE0091),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Submit",
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .02,
              ),
            ],
          ),
        );
      },
    );
  }

  showdiog2(int index) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          insetPadding: EdgeInsets.all(0),
          title: Column(
            children: [
              // Align(
              //     alignment: Alignment.bottomRight,
              //     child: GestureDetector(
              //       onTap: () {
              //         Get.back();
              //       },
              //       child: Image.asset("assets/icons/cancel.png"),
              //     )),
              Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      height: height * .3,
                      width: width * .3,
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                            SpeendReqestControllerinstance
                                .staticLiverPullvalue
                                .value
                                .data![0].spinLeverpoolRequestedData!
                                .spinRequestData![index].seekerData!.imgPath
                                .toString()),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 80,
                      left: 55,
                      right: 0,
                      child: Image.asset("assets/icons/unlocked 1.png"))
                ],
              ),
              Text(
                "Profile Unlocked",
                style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall,
              ),
              SizedBox(
                height: height * .01,
              ),
              Text(
                "Your answer is correct.",
                style: Theme
                    .of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey),
              ),
              SizedBox(
                height: height * .02,
              ),
              GestureDetector(
                onTap: () {
                  Get.off(OutGoingRequest());
                  // match_withid =  SpeendReqestControllerinstance
                  //                                       .staticLiverPullvalue
                  //                                       .value
                  //                                       .data![0].spinLeverpoolRequestedData!.spinRequestData![index].seekerData!.id
                  //     .toString();
                  // print(match_withid);
                  // SeekerToSeekerRequestControllerinstance
                  //     .SikerTOSikerRequestApiHit(); // Timer(Duration(microseconds: 2), () { Get.to(ChatPage()); });
                },
                child: Container(
                  height: height * .04,
                  width: width * .3,
                  decoration: BoxDecoration(
                    color: Color(0xffFE0091),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "View",
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .02,
              ),
            ],
          ),
        );
      },
    );
  }

  showdiologwronganswer(int index) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          insetPadding: EdgeInsets.all(0),
          title: Column(
            children: [
              Align(
                  alignment: Alignment.bottomRight,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Image.asset("assets/icons/cancel.png"),
                  )),
              Stack(
                children: <Widget>[
                  Center(
                    child: Container(
                      height: height * .3,
                      width: width * .3,
                      child: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                            SpeendReqestControllerinstance
                                .staticLiverPullvalue
                                .value
                                .data![0].spinLeverpoolRequestedData!
                                .spinRequestData![index].seekerData!.imgPath
                                .toString()),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 80,
                      left: 50,
                      right: 0,
                      child: Image.asset("assets/icons/locked 1.png"))
                ],
              ),
              Text(
                "Profile locked",
                style: Theme
                    .of(context)
                    .textTheme
                    .titleSmall,
              ),
              SizedBox(
                height: height * .01,
              ),
              Text(
                "Better Luck Next Time!",
                style: Theme
                    .of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey),
              ),
              SizedBox(
                height: height * .02,
              ),
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: Container(
                  height: height * .04,
                  width: width * .3,
                  decoration: BoxDecoration(
                    color: Color(0xffFE0091),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Text(
                      "Back",
                      style: Theme
                          .of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * .02,
              ),
              InkWell(
                child: Container(
                  height: height * .04,
                  width: width * .4,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Color(0xffFE0091))),
                  child: Center(
                    child: Text("Request To Maker",
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(
                          color: Color(0xffFE0091),
                        )),
                  ),
                ),
                onTap: () {
                  userIdsiker = SpeendReqestControllerinstance
                      .staticLiverPullvalue
                      .value
                      .data![0].spinLeverpoolRequestedData!
                      .spinRequestData![index].seekerData!.id
                      .toString();

                  setState(() {
                    userIdsiker;
                  });
                  Timer(Duration(microseconds: 2), () {
                    Get.off(SeeAllMaker());
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showProgressDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 16.0),
              Text("Loading..."),
            ],
          ),
        );
      },
    );
  }


}