

// import 'dart:async';
// import 'dart:ui';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
// import 'package:cupid_match/controllers/controller/MagicProfileController/MagicProfileConrtroller.dart';
// import 'package:cupid_match/controllers/controller/SeekerToSeekerRequestController/SeekerToSeekerRequestController.dart';
// import 'package:cupid_match/data/response/status.dart';
// import 'package:cupid_match/match_maker/chat_screen.dart';
// import 'package:cupid_match/match_seeker/SeeAllMaker/SeAllMaker.dart';
// import 'package:cupid_match/match_seeker/chat_screen.dart';
// import 'package:cupid_match/match_seeker/lever/request_makers.dart';
// import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
// import 'package:cupid_match/widgets/my_button.dart';
// import 'package:flutter/material.dart';
// import 'dart:math';

// import 'package:get/get.dart';
// import 'package:get/get_connect/http/src/utils/utils.dart';

// class SlotMachine extends StatefulWidget {
//   @override
//   _SlotMachineState createState() => _SlotMachineState();
// }

// class _SlotMachineState extends State<SlotMachine> {
//   final MagicProfileControllerinstance = Get.put(MagicProfileController());
//   bool pulled = false;

//   bool isVisible = true;
//   bool isNotVisible = false;

// final SeekerToSeekerRequestControllerinstance=Get.put(SeekerToSeekerRequestController());
  
//   final Random _random = Random();
//    List<String> _slotImages = [
//     'https://imgd.aeplcdn.com/1280x720/n/cw/ec/44686/activa-6g-right-front-three-quarter.jpeg?q=80', // Replace with actual image URLs
//     'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=765&q=80',
//     'https://media.istockphoto.com/id/1464605251/photo/portrait-of-a-senior-black-man-on-the-tennis-court.jpg?s=1024x1024&w=is&k=20&c=cVNPufS_pFVAmzf59WjT-dsCYs4kXdu2420khMjSFlA=',
//     "https://media.istockphoto.com/id/1416048929/photo/woman-working-on-laptop-online-checking-emails-and-planning-on-the-internet-while-sitting-in.jpg?s=1024x1024&w=is&k=20&c=rsMEfrDiYh3Y2CbJ8OQYRfJZ2kOGBneREKETBn0vyjU=",
//     "https://media.istockphoto.com/id/1461077577/photo/spring-portrait-of-excited-young-woman.jpg?s=2048x2048&w=is&k=20&c=4Itt6GMqwqgkotQPvcuasyrrKhmecrDjweCmFHWnx4Q=",
//     "https://media.istockphoto.com/id/1443305526/photo/young-smiling-man-in-headphones-typing-on-laptop-keyboard.jpg?s=2048x2048&w=is&k=20&c=YbyIE-QkVeacJODEhS5_LQzJahwiTmZTnism-xUwCLA=",
//     "https://media.istockphoto.com/id/1460124878/photo/social-media-connection-and-woman-typing-on-a-phone-for-communication-app-and-chat-web-search.jpg?s=1024x1024&w=is&k=20&c=OEumglh0LddR8e2IG7FWSK-lG76tUhjhQGksCY64ubM=",
// "https://media.istockphoto.com/id/1435220822/photo/african-american-software-developer.jpg?s=1024x1024&w=is&k=20&c=htyLzgrvGN1McCRuSkQIrG1BuBmNLJUR-nBBKxb86ko=",
// "https://images.unsplash.com/photo-1546019170-f1f6e46039f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80",
// "https://images.unsplash.com/photo-1461800919507-79b16743b257?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80",
// "https://images.unsplash.com/photo-1536378482916-d6371707105a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80"  ];
//   List<String> _slotname = [
//     'a', // Replace with actual image URLs
//     'b',
//     'c',
//     "d",
//     "e",
//     "f",
//     "g",
// "h",
// "i",
// "j",
// "k"  ];
//   List<int> _initialIndices = [0, 1, 2]; // Unique initial indices for each box
//   List<int> _currentIndices = [0, 1, 2];
//   List<int> _finalIndices = [0, 1, 2];
//   bool _isSpinning = false;
//   late Timer _spinTimer;
//   final _scaffoldKey = GlobalKey<ScaffoldState>();

//   @override
//   void initState() {
//     MagicProfileControllerinstance.MagicProfileApiHit();
//     // TODO: implement initState
//     super.initState();
//   }
//   @override
//   void dispose() {
//     _spinTimer.cancel();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//        final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Obx(() {
//            switch (MagicProfileControllerinstance.rxRequestStatus.value) {
//             case Status.LOADING:
//               return const Center(child: CircularProgressIndicator());
//             case Status.ERROR:
//               if (MagicProfileControllerinstance.error.value == 'No internet') {
//                 return InterNetExceptionWidget(
//                   onPress: () {},
//                 );
//               } else {
//                 return  SingleChildScrollView(
                
//                 );
//               }
              
//             case Status.COMPLETED:
//               return  Container(
//         child: Column(
//           children: [

//             SizedBox(
//               height: Get.height * .06,
//             ),
//         Stack(
//               children:[ Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   _buildReel(0),
//                   _buildReel(1),
//                   _buildReel(2),
//                 ],
//               ),
//                Positioned(
//               top:pulled==false?Get.height*0.04:Get.height*0.08,
//               right: -Get.width*0.01,
//               child: pulled==false?GestureDetector(child: Container(height: Get.height*0.08,width:Get.width*0.1,decoration:BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/liverup.PNG"))),),onTap: () {
//                if(pulled==false){
//                       _startSpinning();
//                 }
//                if(pulled==true) Timer(Duration(seconds: 2), () { _stopSpinning();});
            
//                 }
//              ,):Container(height: Get.height*0.08,width:Get.width*0.1,decoration:BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/liverdown.PNG"))),))
//           ]),
         
          

//              SizedBox(
//               height: Get.height * .03,
//             ),
              
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
//              Visibility(
//   visible: isNotVisible,
//   child: Container(
//     margin: EdgeInsets.only(left: 20),
//     child: ListView.builder(
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: _currentIndices.length, // Use the shuffled item count
//       shrinkWrap: true,
//       itemBuilder: (context, index) {
//         final shuffledIndex = _currentIndices[index]; // Get shuffled index
//         final request = MagicProfileControllerinstance.MagicProfileList.value.requests![shuffledIndex];

//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 10),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 height: Get.height * 0.1,
//                 width: Get.width * 0.2,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.all(Radius.circular(100)),
//                   color: Colors.green,
//                   image: DecorationImage(
//                     image: CachedNetworkImageProvider(request.imgPath.toString()),
//                     fit: BoxFit.fill,
//                   ),
//                 ),
//               ),
//               SizedBox(width: width * .03),
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     request.name.toString(),
//                     style: Theme.of(context).textTheme.titleSmall,
//                   ),
//                   SizedBox(height: height * .01),
//                   Text(
//                     "Match Maker",
//                     style: Theme.of(context)
//                         .textTheme
//                         .bodySmall!
//                         .copyWith(color: Colors.grey),
//                   ),
//                 ],
//               ),
//               SizedBox(width: width * .12),
//               GestureDetector(
//                 onTap: () {
//                   selectedseekerid = request.id!.toInt();
//                   if (selectedseekerid != null) {
//                     showdilog(index, selectedseekerid!);
//                   }
//                 },
//                 child: Container(
//                   height: height * .04,
//                   width: width * .3,
//                   decoration: BoxDecoration(
//                     color: Color(0xffFE0091),
//                     borderRadius: BorderRadius.circular(15),
//                   ),
//                   child: Center(
//                     child: Text(
//                       "Request",
//                       style: Theme.of(context)
//                           .textTheme
//                           .bodySmall!
//                           .copyWith(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           ),
//         );
//       },
//     ),
//   ),
// ),

//           ],
//         ),
//       );}});
//   }

//  Widget _buildReel(int index) {
//   return Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 2.0),
//     child: Container(
//       width: Get.width * 0.28,
//       height: Get.height * 0.25,
//       decoration: BoxDecoration(
//         border: Border.all(width: 2, color: Color(0xffDC9F3C)),
//         borderRadius: BorderRadius.all(Radius.circular(10)),
//         gradient: LinearGradient(
//           colors: [Color(0xffFE0091), Color(0xff000CAA)],
//           begin: Alignment.topLeft,
//           end: Alignment.bottomRight,
//         ),
//       ),
//       child: Column(
//         children: [
//           Container(
//             width: Get.width * 0.22,
//             height: Get.height * 0.17,
//             margin: EdgeInsets.all(10),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.white),
//               color: Color(0xffDC9F3C),
//               image: DecorationImage(
//                 image: CachedNetworkImageProvider(
//                  isNotVisible==false? "https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-538.jpg":    MagicProfileControllerinstance.MagicProfileList.value
//                       .requests![_currentIndices[index]].imgPath
//                       .toString(),
//                 ),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(bottom: 10),
//             child: Text(
//              isNotVisible==false? "":    MagicProfileControllerinstance.MagicProfileList.value
//                   .requests![_currentIndices[index]].name
//                   .toString(),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

//   void _startSpinning() {
//   setState(() {
//     pulled = true;
//     MagicProfileControllerinstance.MagicProfileList.value.requests!.shuffle();
//     isVisible = !isVisible;
//     isNotVisible = !isNotVisible;
//     _isSpinning = true;
//   });

//   _spinTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
//     setState(() {
//       MagicProfileControllerinstance.MagicProfileList.value.requests!.shuffle();
//     });
//   });
// }
//   void _stopSpinning() {
//     _spinTimer.cancel();
//     setState(() {
//          pulled=false;
//       _isSpinning = false;
//       _finalIndices = _currentIndices.toList();
//     });
//     _checkResult();
//   }

//   void _checkResult() {
//     // Add your logic here to determine the outcome
//   }



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
//                                                         match_withid=MagicProfileControllerinstance.MagicProfileList.value.requests![index].id.toString();
// print(match_withid);
//                                                   SeekerToSeekerRequestControllerinstance.SikerTOSikerRequestApiHit(); 
                                                           
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
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/LiverPoolController/LiverpoolConteroller.dart';
import 'package:cupid_match/controllers/controller/MagicProfileController/MagicProfileConrtroller.dart';
import 'package:cupid_match/controllers/controller/SeekerToSeekerRequestController/SeekerToSeekerRequestController.dart';
import 'package:cupid_match/controllers/controller/StaticLiverPoolController/StaticLiverPoolController.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/match_maker/chat_screen.dart';
import 'package:cupid_match/match_seeker/SeeAllMaker/SeAllMaker.dart';
import 'package:cupid_match/match_seeker/chat_screen.dart';
import 'package:cupid_match/match_seeker/lever/StaticLiverPool.dart';
import 'package:cupid_match/match_seeker/lever/request_makers.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:math';

import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

import '../Requests/outgoingRequest.dart';
List Liverpooldprofiles=[];
class SlotMachine extends StatefulWidget {
  @override
  _SlotMachineState createState() => _SlotMachineState();
}

class _SlotMachineState extends State<SlotMachine> {
  final MagicProfileControllerinstance = Get.put(MagicProfileController());
  final LiverPoolControllerinstance = Get.put(LiverPoolController());

  
  bool pulled = false;
  //********************* for timer functions here ok ! *********
  bool shouldShowSpinButton = true;
  bool isTimerVisible = false;
  late Timer countdownTimer;
  Duration remainingTime = Duration(hours: 2);
  void startCountdownTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime.inSeconds > 0) {
          remainingTime = remainingTime - Duration(seconds: 1);
        } else {
          isVisible =!isVisible;
          isNotVisible =!isNotVisible;
          shouldShowSpinButton = true;
          isTimerVisible = false;
          // Hide the timer
          timer.cancel();
        }
      });
    });
  }
  bool isVisible = true;
  bool isNotVisible = false;

  final SeekerToSeekerRequestControllerinstance =
      Get.put(SeekerToSeekerRequestController());
  final liverPoolController = Get.put(LiverPoolController());

  final Random _random = Random();
  List<String> _slotImages = [
    'https://imgd.aeplcdn.com/1280x720/n/cw/ec/44686/activa-6g-right-front-three-quarter.jpeg?q=80', // Replace with actual image URLs
    'https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=765&q=80',
    'https://media.istockphoto.com/id/1464605251/photo/portrait-of-a-senior-black-man-on-the-tennis-court.jpg?s=1024x1024&w=is&k=20&c=cVNPufS_pFVAmzf59WjT-dsCYs4kXdu2420khMjSFlA=',
    "https://media.istockphoto.com/id/1416048929/photo/woman-working-on-laptop-online-checking-emails-and-planning-on-the-internet-while-sitting-in.jpg?s=1024x1024&w=is&k=20&c=rsMEfrDiYh3Y2CbJ8OQYRfJZ2kOGBneREKETBn0vyjU=",
    "https://media.istockphoto.com/id/1461077577/photo/spring-portrait-of-excited-young-woman.jpg?s=2048x2048&w=is&k=20&c=4Itt6GMqwqgkotQPvcuasyrrKhmecrDjweCmFHWnx4Q=",
    "https://media.istockphoto.com/id/1443305526/photo/young-smiling-man-in-headphones-typing-on-laptop-keyboard.jpg?s=2048x2048&w=is&k=20&c=YbyIE-QkVeacJODEhS5_LQzJahwiTmZTnism-xUwCLA=",
    "https://media.istockphoto.com/id/1460124878/photo/social-media-connection-and-woman-typing-on-a-phone-for-communication-app-and-chat-web-search.jpg?s=1024x1024&w=is&k=20&c=OEumglh0LddR8e2IG7FWSK-lG76tUhjhQGksCY64ubM=",
    "https://media.istockphoto.com/id/1435220822/photo/african-american-software-developer.jpg?s=1024x1024&w=is&k=20&c=htyLzgrvGN1McCRuSkQIrG1BuBmNLJUR-nBBKxb86ko=",
    "https://images.unsplash.com/photo-1546019170-f1f6e46039f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=764&q=80",
    "https://images.unsplash.com/photo-1461800919507-79b16743b257?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80",
    "https://images.unsplash.com/photo-1536378482916-d6371707105a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=687&q=80"
  ];
    final staticLiverpullController = Get.put(StaticLiverPullController());
  List<String> _slotname = [
    'a', // Replace with actual image URLs
    'b',
    'c',
    "d",
    "e",
    "f",
    "g",
    "h",
    "i",
    "j",
    "k"
  ];
  List<int> _initialIndices = [0, 1, 2]; // Unique initial indices for each box
  List<int> _currentIndices = [0, 1, 2];
  List<int> _finalIndices = [0, 1, 2];
  bool _isSpinning = false;
  late Timer _spinTimer;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    MagicProfileControllerinstance.MagicProfileApiHit();
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _spinTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Obx(() {
      switch (MagicProfileControllerinstance.rxRequestStatus.value) {
        case Status.LOADING:
          return const Center(child: CircularProgressIndicator());
        case Status.ERROR:
          if (MagicProfileControllerinstance.error.value == 'No internet') {
            return InterNetExceptionWidget(
              onPress: () {},
            );
          } else {
            return SingleChildScrollView();
          }

        case Status.COMPLETED:
          return Container(
            child: Column(
              children: [
                SizedBox(
                  height: Get.height * .06,
                ),
                Stack(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildReel(0),
                      _buildReel(1),
                      _buildReel(2),
                    ],
                  ),
                  Positioned(
                      top: pulled == false
                          ? Get.height * 0.04
                          : Get.height * 0.08,
                      right: Get.width * 0.02,
                      child: pulled == false
                          ? GestureDetector(
                              child: Container(
                                height: Get.height * 0.08,
                                width: Get.width * 0.1,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/liverup.PNG"))),
                              ),
                              onTap: () {


                                if(MagicProfileControllerinstance.MagicProfileList.value
                                    .requests!.length> 3){
                                  if(staticLiverpullController.seekerprofilerequested.value.toString()=="false"){
                                    // if (pulled == false) {
                                      _startSpinning();
                                    // }
                                    // else if (pulled == true)
                                      Timer(Duration(seconds: 2), () {
                                        _stopSpinning();
                                      });
                                  }else{

                                    Fluttertoast.showToast(
                                      msg: "You Have Already Pooled",
                                      toastLength: Toast.LENGTH_SHORT, // You can use Toast.LENGTH_LONG for a longer duration.
                                      gravity: ToastGravity.BOTTOM, // You can change the position to TOP, CENTER, or BOTTOM.
                                      backgroundColor: Colors.black54,
                                      textColor: Colors.white,
                                    );

                                  }
                                }else{

                                  Fluttertoast.showToast(
                                    msg: "Dont Have Enough Seekers",
                                    toastLength: Toast.LENGTH_SHORT, // You can use Toast.LENGTH_LONG for a longer duration.
                                    gravity: ToastGravity.BOTTOM, // You can change the position to TOP, CENTER, or BOTTOM.
                                    backgroundColor: Colors.black54,
                                    textColor: Colors.white,
                                  );

                                }

                               
                              },
                            )
                          : Container(
                              height: Get.height * 0.08,
                              width: Get.width * 0.1,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/liverdown.PNG"))),
                            ))
                ]),
                SizedBox(
                  height: Get.height * .03,
                ),
                //******************** for timer of next polling

                // Visibility(
                //     visible: isTimerVisible,
                //     child: Column(
                //       children: [
                //         Text(
                //           "Next Spin",
                //           style: Get.theme.textTheme.headlineSmall!.copyWith(
                //             color: Color(0xff000CAA),
                //             fontWeight: FontWeight.bold,
                //           ),
                //         ),
                //         SizedBox(height: height * 0.02),
                //         Row(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //
                //             //&************ for hours
                //             Container(
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.center,
                //                 children: [
                //                   Container(
                //                     padding: EdgeInsets.all(15),
                //                     decoration: BoxDecoration(
                //                       color: Colors.blue[50],
                //                       borderRadius: BorderRadius.circular(15),
                //                     ),
                //                     child: Text(
                //                       "${remainingTime.inHours.toString().padLeft(2, '0')}",
                //                       style: Get.theme.textTheme.headlineSmall!.copyWith(
                //                         color: Color(0xff000CAA),
                //                         fontWeight: FontWeight.bold,
                //                       ),
                //                     ),
                //
                //                   ),
                //                   SizedBox(height: Get.height * 0.0105),
                //                   Text(
                //                     "Hour",
                //                     style: Theme.of(context)
                //                         .textTheme
                //                         .bodySmall!
                //                         .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.only(left:10,bottom: 25),
                //               child: Text(
                //                 ":",
                //                 style: Get.theme.textTheme.headlineSmall!.copyWith(
                //                   color: Color(0xff000CAA),
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //             ),
                //             SizedBox(width: Get.width * 0.025),
                //
                //             //&************ for minutes
                //             Container(
                //               child: Column(
                //                 children: [
                //                   Container(
                //                     padding: EdgeInsets.all(15),
                //                     decoration: BoxDecoration(
                //                       color: Colors.blue[50],
                //                       borderRadius: BorderRadius.circular(15),
                //                     ),
                //                     child: Text(
                //                       "${remainingTime.inMinutes.remainder(60).toString().padLeft(2, '0')}",
                //                       style: Get.theme.textTheme.headlineSmall!.copyWith(
                //                         color: Color(0xff000CAA),
                //                         fontWeight: FontWeight.bold,
                //                       ),
                //                     ),
                //
                //                   ),
                //                   SizedBox(height: Get.height * 0.0105),
                //                   Text(
                //                     "Minute",
                //                     style: Theme.of(context)
                //                         .textTheme
                //                         .bodySmall!
                //                         .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //             Padding(
                //               padding: const EdgeInsets.only(left:10,bottom: 25),
                //               child: Text(
                //                 ":",
                //                 style: Get.theme.textTheme.headlineSmall!.copyWith(
                //                   color: Color(0xff000CAA),
                //                   fontWeight: FontWeight.bold,
                //                 ),
                //               ),
                //             ),
                //
                //             SizedBox(width: Get.width * 0.025),
                //             //&************ for second
                //             Container(
                //               child: Column(
                //                 children: [
                //                   Container(
                //                     padding: EdgeInsets.all(15),
                //                     decoration: BoxDecoration(
                //                       color: Colors.blue[50],
                //                       borderRadius: BorderRadius.circular(15),
                //                     ),
                //                     child: Text(
                //                       "${remainingTime.inSeconds.remainder(60).toString().padLeft(2, '0')}",
                //                       style: Get.theme.textTheme.headlineSmall!.copyWith(
                //                         color: Color(0xff000CAA),
                //                         fontWeight: FontWeight.bold,
                //                       ),
                //                     ),
                //
                //                   ),
                //                   SizedBox(height: Get.height * 0.0105),
                //                   Text(
                //                     "Second",
                //                     style: Theme.of(context)
                //                         .textTheme
                //                         .bodySmall!
                //                         .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //
                //
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
SizedBox(height:Get.height*0.05,),
                Visibility(
                  visible: isNotVisible,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Request to be matched",
                          style: Theme.of(context).textTheme.titleSmall,
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
                      itemCount:
                          _currentIndices.length, // Use the shuffled item count
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final shuffledIndex =
                            _currentIndices[index]; // Get shuffled index
                        final request = MagicProfileControllerinstance
                            .MagicProfileList.value.requests![shuffledIndex];


                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                height: Get.height * 0.1,
                                width: Get.width * 0.2,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  color: Colors.green,
                                  image: DecorationImage(
                                    image: CachedNetworkImageProvider(
                                        request.imgPath.toString()),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(width: width * .03),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    width: Get.width*0.2,
                                    child: Text(
                                      request.name.toString(),
                                      style:
                                          Theme.of(context).textTheme.titleSmall,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(height: height * .01),
                                  Text(
                                    "Match Seeker",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.grey),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              SizedBox(width: width * .12),
                          if(staticLiverpullController.seekerprofilerequested.value==false)      GestureDetector(
                                onTap: () {
                                  // selectedseekerid = request.id!.toInt();
                                  selectedseekerid = staticLiverpullController
                                      .staticLiverPullvalue.value.data![0].spinLeverpoolRequestedData!
                                      .spinRequestData![index]
                                      .seekerData!
                                      .id;
                                  if (selectedseekerid != null) {
                                    showdilog(index, selectedseekerid!);
                                  }
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
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),

                                 if(staticLiverpullController.seekerprofilerequested.value==true&&staticLiverpullController
                                .staticLiverPullvalue.value.data![0].spinLeverpoolRequestedData!.spinRequestData![index].isRequested=="true")               GestureDetector(
                                    onTap: () {
                                        // showdiologwronganswer(index);

//                                       if( dataofStaticPull.spinLeverpoolRequestedData!.spinRequestData![index].isRequested=="true"){
// // selectedseekerid =
// //                                           dataofStaticPull.id!.toInt();
// //                                       if (selectedseekerid != null) {
// //                                         showdilog(index, selectedseekerid!);
// //                                       }
// //                                       }else{
// //                                         print("Blocked");
//                                       }

Fluttertoast.showToast(
  msg: "You Have Already Requested",
  toastLength: Toast.LENGTH_SHORT, // You can use Toast.LENGTH_LONG for a longer duration.
  gravity: ToastGravity.BOTTOM, // You can change the position to TOP, CENTER, or BOTTOM.
  backgroundColor: Colors.black54,
  textColor: Colors.white,
);
                                      
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
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
      }
    });
  }

  Widget _buildReel(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Container(
        width: Get.width * 0.25,
        height: Get.height * 0.24,
        decoration: BoxDecoration(
          border: Border.all(width: 2, color: Color(0xffDC9F3C)),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          image: DecorationImage(
            image: CachedNetworkImageProvider(
              isNotVisible == false
                  ? "https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-538.jpg"
                  : MagicProfileControllerinstance.MagicProfileList.value
                  .requests![_currentIndices[index]].imgPath
                  .toString(),
            ),
            fit: BoxFit.cover,
          ),
          // gradient: LinearGradient(
          //   colors: [Color(0xffFE0091), Color(0xff000CAA)],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),
        ),
        // child: Column(
        //   children: [
        //     Container(
        //       width: Get.width * 0.22,
        //       height: Get.height * 0.17,
        //       margin: EdgeInsets.all(10),
        //       decoration: BoxDecoration(
        //         border: Border.all(color: Colors.white),
        //         color: Color(0xffDC9F3C),
        //         image: DecorationImage(
        //           image: CachedNetworkImageProvider(
        //             isNotVisible == false
        //                 ? "https://img.freepik.com/premium-vector/man-avatar-profile-picture-vector-illustration_268834-538.jpg"
        //                 : MagicProfileControllerinstance.MagicProfileList.value
        //                     .requests![_currentIndices[index]].imgPath
        //                     .toString(),
        //           ),
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //     ),
        //     // Padding(
        //     //   padding: const EdgeInsets.only(bottom: 10),
        //     //   child: Container(
        //     //     width: Get.width*0.2,
        //     //     child: Text(
        //     //       isNotVisible == false
        //     //           ? ""
        //     //           : MagicProfileControllerinstance.MagicProfileList.value
        //     //               .requests![_currentIndices[index]].name
        //     //               .toString(),
        //     //       textAlign: TextAlign.center,
        //     //       overflow: TextOverflow.ellipsis,
        //     //     ),
        //     //   ),
        //     // ),
        //   ],
        // ),
      ),
    );
  }

  void _startSpinning() {
    setState(() {

      pulled = true;
      MagicProfileControllerinstance.MagicProfileList.value.requests!.shuffle();
      isVisible = !isVisible;
      isNotVisible = !isNotVisible;
      _isSpinning = true;
      shouldShowSpinButton = false;
      isTimerVisible = !isTimerVisible;
      islivierpooled=true;
      remainingTime = Duration(hours: 2);
      startCountdownTimer();
    });

    _spinTimer = Timer.periodic(Duration(milliseconds: 100), (timer) {
      setState(() {
        MagicProfileControllerinstance.MagicProfileList.value.requests!
            .shuffle();
      });
    });
  }

  void _stopSpinning() {
    _spinTimer.cancel();
    setState(() {
      pulled = false;
      _isSpinning = false;
      _finalIndices = _currentIndices.toList();


    });
            Liverpooldprofiles=[];
      for(int i =0; i<=2;i++){

    print( MagicProfileControllerinstance.MagicProfileList.value.requests![i].name);
    Liverpooldprofiles.add({
      "seeker_id":MagicProfileControllerinstance.MagicProfileList.value.requests![i].id.toString(),
      "is_requested":"false"
    });
 print(Liverpooldprofiles);
 print(Liverpooldprofiles.length);

    if(Liverpooldprofiles.length==3){
      print("pooled");
         LiverPoolControllerinstance.apihit();
    }
   
  }
    // if(Liverpooldprofiles.isNotEmpty){
   
    // }


    _checkResult();
  }

  void _checkResult() {
    // Add your logic here to determine the outcome
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

  showdilog(int index, int id) {
    final dataofStaticPull =
    staticLiverpullController.staticLiverPullvalue.value.data![0];

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
                          image: CachedNetworkImageProvider(dataofStaticPull
                              .spinLeverpoolRequestedData!
                              .spinRequestData![index]
                              .seekerData!
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
                dataofStaticPull.spinLeverpoolRequestedData!
                    .spinRequestData![index].seekerData!.questions!.question
                    .toString(),
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(
                height: height * .01,
              ),
              Obx(
                    () => Column(
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
                      title: Text(dataofStaticPull
                          .spinLeverpoolRequestedData!
                          .spinRequestData![index]
                          .seekerData!
                          .questions!
                          .firstAnswer
                          .toString()),
                      value: dataofStaticPull
                          .spinLeverpoolRequestedData!
                          .spinRequestData![index]
                          .seekerData!
                          .questions!
                          .firstAnswer
                          .toString(),
                      groupValue: staticLiverpullController.selectedAnswer.value
                          .toString(),
                      onChanged: (value) {
                        staticLiverpullController.selectedAnswer.value = value!;

                        staticLiverpullController.selectedAnswer.value
                            .toString();
                        print(staticLiverpullController.selectedAnswer.value
                            .toString());

                        print(Liverpooldprofiles);
                      },
                    ),
                    RadioListTile<String>(
                      title: Text(dataofStaticPull
                          .spinLeverpoolRequestedData!
                          .spinRequestData![index]
                          .seekerData!
                          .questions!
                          .secondAnswer
                          .toString()),
                      value: dataofStaticPull
                          .spinLeverpoolRequestedData!
                          .spinRequestData![index]
                          .seekerData!
                          .questions!
                          .secondAnswer
                          .toString(),
                      groupValue: staticLiverpullController.selectedAnswer.value
                          .toString(),
                      onChanged: (value) {
                        staticLiverpullController.selectedAnswer.value = value!;

                        staticLiverpullController.selectedAnswer.value
                            .toString();
                        print(staticLiverpullController.selectedAnswer.value
                            .toString());
                      },
                    ),
                    RadioListTile<String>(
                      title: Text(dataofStaticPull
                          .spinLeverpoolRequestedData!
                          .spinRequestData![index]
                          .seekerData!
                          .questions!
                          .thirdAnswer
                          .toString()),
                      value: dataofStaticPull
                          .spinLeverpoolRequestedData!
                          .spinRequestData![index]
                          .seekerData!
                          .questions!
                          .thirdAnswer
                          .toString(),
                      groupValue: staticLiverpullController.selectedAnswer.value
                          .toString(),
                      onChanged: (value) {
                        staticLiverpullController.selectedAnswer.value = value!;

                        staticLiverpullController.selectedAnswer.value
                            .toString();
                        print(staticLiverpullController.selectedAnswer.value
                            .toString());
                      },
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isboxloading = true;
                  });

                  Liverpooldprofiles[index]['is_requested'] = "true";
                  liverPoolController.apihit();

                  if (isboxloading == true) {
                    _showProgressDialog(context);
                  }

                  Timer(Duration(seconds: 2), () {
                    setState(() {
                      isboxloading = false;
                      Get.back();
                      if (dataofStaticPull
                          .spinLeverpoolRequestedData!
                          .spinRequestData![index]
                          .seekerData!
                          .questions!
                          .correctAnswer ==
                          staticLiverpullController.selectedAnswer.value
                              .toString()) {
                        match_withid =
                            Liverpooldprofiles[index]['seeker_id'].toString();
                        print(match_withid);
                        SeekerToSeekerRequestControllerinstance
                            .SikerTOSikerRequestApiHit();
                        showdiog2(index);
                      }
                      if (dataofStaticPull
                          .spinLeverpoolRequestedData!
                          .spinRequestData![index]
                          .seekerData!
                          .questions!
                          .correctAnswer !=
                          staticLiverpullController.selectedAnswer.value
                              .toString()) {
                        showdiologwronganswer(index);
                      }
                    });
                  });
                  // Get.back();
                  // if (dataofStaticPull
                  //         .spinLeverpoolRequestedData!
                  //         .spinRequestData![index]
                  //         .seekerData!
                  //         .questions!
                  //         .correctAnswer ==
                  //     staticLiverpullController.selectedAnswer.value
                  //         .toString()) {
                  //   showdiog2(index);
                  // }
                  // if (dataofStaticPull
                  //         .spinLeverpoolRequestedData!
                  //         .spinRequestData![index]
                  //         .seekerData!
                  //         .questions!
                  //         .correctAnswer !=
                  //     staticLiverpullController.selectedAnswer.value
                  //         .toString()) {
                  //   showdiologwronganswer(index);
                  // }

                  // String id=dataofStaticPull
                  //         .spinLeverpoolRequestedData!
                  //         .spinRequestData![index]
                  //         .seekerData!.id.toString();
                  //         print(id);

//   if (index != -1) {
//     // Update the is_requested value at the found index
//     Liverpooldprofiles[index1]["is_requested"] = "true";
//     setState(() {
//       Liverpooldprofiles;
//     });
//       print(Liverpooldprofiles);

// liverPoolController.apihit();
//   } else {
//     // print("Seeker with ID $targetSeekerId not found in the list.");
//   }

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
                      "Submit",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
            ],
          ),
        );
      },
    );
  }

  showdiog2(int index) {
    final dataofStaticPull =
    staticLiverpullController.staticLiverPullvalue.value.data![0];
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(32.0))),
          // insetPadding: EdgeInsets.all(0),
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
                      // height: height * .3,
                      width: width * .3,
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundImage: CachedNetworkImageProvider(
                            dataofStaticPull.imgPath.toString()),
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                  ),
                  Positioned(
                      top: 80,
                      left: 55,
                      right: 0,
                      child: Container(
                          child: Image.asset("assets/icons/unlocked 1.png")))
                ],
              ),
              SizedBox(
                height: height * .02,
              ),
              Text(
                "Profile Unlocked",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(
                height: height * .02,
              ),
              Text(
                "Your answer is correct.",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey),
              ),
              SizedBox(
                height: height * .02,
              ),
              GestureDetector(
                onTap: () {
                  // match_withid = dataofStaticPull.id.toString();
                  // print(match_withid);
                  // SeekerToSeekerRequestControllerinstance
                  //     .SikerTOSikerRequestApiHit();
                  Get.off(OutGoingRequest());
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
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
            ],
          ),
        );
      },
    );
  }

  showdiologwronganswer(int index) {
    // Get.back();
    final dataofStaticPull =
    staticLiverpullController.staticLiverPullvalue.value.data![0];
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
                      // height: height * .3,
                      width: width * .3,
                      child: CircleAvatar(
                        radius: 40.0,
                        backgroundImage: CachedNetworkImageProvider(
                            dataofStaticPull.imgPath.toString()),
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
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(
                height: height * .01,
              ),
              Text(
                "Better Luck Next Time!",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey),
              ),
              SizedBox(
                height: height * .02,
              ),
              // GestureDetector(
              //   onTap: () {
              //     Get.back();
              //   },
              //   child: Container(
              //     height: height * .04,
              //     width: width * .3,
              //     decoration: BoxDecoration(
              //       color: Color(0xffFE0091),
              //       borderRadius: BorderRadius.circular(15),
              //     ),
              //     child: Center(
              //       child: Text(
              //         "Back",
              //         style: Theme.of(context)
              //             .textTheme
              //             .bodySmall!
              //             .copyWith(color: Colors.white),
              //       ),
              //     ),
              //   ),
              // ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
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
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Color(0xffFE0091),
                        )),
                  ),
                ),
                onTap: () {
                  Get.off(SeeAllMaker());
                },
              ),
            ],
          ),
        );
      },
    );
  }

}
