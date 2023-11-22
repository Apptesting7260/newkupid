// import 'dart:async';
// import 'dart:io';

// import 'package:audioplayers/audioplayers.dart';
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:cupid_match/controllers/controller/RequestDetailsController/RequestDetailsController.dart';
// import 'package:cupid_match/controllers/controller/ViewSikerDetailsController/ViewSikerDetaolsController.dart';
// import 'package:cupid_match/data/response/status.dart';
// import 'package:cupid_match/match_maker/chat_screen.dart';
// import 'package:cupid_match/match_seeker/chat/RequestAcceptWidget.dart';
// import 'package:cupid_match/res/components/general_exception.dart';
// import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
// import 'package:cupid_match/widgets/audio_play%20widget.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'package:flutter_sound/public/flutter_sound_recorder.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:voice_message_package/voice_message_package.dart';

// String messagetype="text";
// String ?messageimgurl;
// String ?messagaudiourl;
// class ChatPage extends StatefulWidget {
//   const ChatPage({Key? key}) : super(key: key);

//   @override
//   State<ChatPage> createState() => _ChatPageState();
// }

// class _ChatPageState extends State<ChatPage> {

//   int maxduration = 100;
//   int currentpos = 0;
//   String currentpostlabel = "00:00";
//   String audioasset = "assets/audio/red-indian-music.mp3";
//   bool isplaying = false;
//   bool audioplayed = false;
//   late Uint8List audiobytes;

//   AudioPlayer player = AudioPlayer();
//    Map<String, dynamic>? messages ;
//   TextEditingController messagecontroller = TextEditingController();


//     final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   final ViewRequestDetailsControllerinstance=Get.put(ViewRequestDetailsController());
  
//   final ViewSikerProfileDetailsControllernstance=Get.put(ViewSikerProfileDetailsController());
//    String formatTimestamp(Timestamp timestamp) {
//     final DateTime dateTime = timestamp.toDate();
//     final DateFormat formatter = DateFormat('h:mm a');
//     return formatter.format(dateTime);
//   }
//  FocusNode messageFocusNode = FocusNode();
// void updatetryeDataInFirestore() async {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
// print(("hited"));
//   // Replace 'users' with your collection name and 'documentId' with the specific document ID
//   DocumentReference docRef =  firestore
//           .collection("RoomId's")
//           .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
// .collection("typestatus").doc("userstypingstatus");

//    Map<String, dynamic> typestatus = {
//         "id": ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString(),
//         "status":true,
        
//       };

//   await docRef.update(typestatus);
// }

// void updatefalseDataInFirestore() async {
//    FirebaseFirestore firestore = FirebaseFirestore.instance;
// print(("hited"));
//   // Replace 'users' with your collection name and 'documentId' with the specific document ID
//   DocumentReference docRef =  firestore
//           .collection("RoomId's")
//           .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
// .collection("typestatus").doc("userstypingstatus");

//    Map<String, dynamic> typestatus = {
//         "id": ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString(),
//         "status":false,
        
//       };

//   await docRef.update(typestatus);
// }
//     void _onFocusChange() {
//     if (messageFocusNode.hasFocus) {
//       updatetryeDataInFirestore();
//       print("TextField is active: true");
//     } else {
//       updatefalseDataInFirestore();
//       print("TextField is active: false");
//     }
//   }

//  void typeingstatusofuser()async{
//     print("hited");
//      Map<String, dynamic> typestatus = {
//         "id": ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString(),
//         "status":false,
        
//       };

//       await _firestore
//           .collection("RoomId's")
//           .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
// .collection("typestatus").doc("userstypingstatus").set(typestatus);
// }

// @override
//   void initState() {
   
//       messageFocusNode.addListener(_onFocusChange);
     
//                 ViewSikerProfileDetailsControllernstance.ViewSikerProfileDetailsApiHit();
// ViewRequestDetailsControllerinstance.ViewRequestDetailsApiHit();


  
//     super.initState();
//   }
//   final ViewSikerProfileDetailsControllerinstance=Get.put(ViewSikerProfileDetailsController
// ());
//  final ScrollController _scrollController = ScrollController();

//  onSendMessage() async {
//   print(messagecontroller.text);
  
//    if(messagetype=="text") {
//     print(("texthoted"));
//  Map<String, dynamic> messages = {
//         "sentby": ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString(),
//         "message": messagecontroller.text,
//         "type": "text",
//         "time": FieldValue.serverTimestamp(),
//       };
//         messagecontroller.clear();
//     await _firestore
//           .collection("RoomId's")
//           .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
// .collection("massages").add(messages);
//       print("Enter Some Text");
//    } 

    
//     // }
  
  
//   if(messagetype=="img"){
//     print("object");
// messages = {
//         "sentby": ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString(),
//         "message": messagecontroller.text,
//         "imageurl":messageimgurl,
//         "type": "img",
//         "time": FieldValue.serverTimestamp(),
//       };
//    }
//    if(messagetype=="audio"){
//     messages = {
//         "sentby": ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString(),
//         "message": messagecontroller.text,
//         "imageurl":messagaudiourl,
//         "audiourl":messagaudiourl,
//         "type": "audio",
//         "time": FieldValue.serverTimestamp(),
//       };
//    }}


//  String customPath = '/flutter_audio_recorder_';
// Future<String> uploadSelectedImageAndGetUrl() async {
//   final picker = ImagePicker();
//   final pickedFile = await picker.getImage(source: ImageSource.gallery);

//   if (pickedFile != null) {
//     try {
//       // Create a reference to the Firebase Storage location where you want to store the image.
//       final Reference storageReference = FirebaseStorage.instance.ref().child('images/${DateTime.now()}.jpg');

//       // Upload the selected image to Firebase Storage
//       final UploadTask uploadTask = storageReference.putFile(File(pickedFile.path));

//       // Await the completion of the upload
//       final TaskSnapshot storageTaskSnapshot = await uploadTask.whenComplete(() => null);

//       // Retrieve the download URL for the uploaded image
//       final String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
// print(downloadUrl);

// setState(() {
//   messageimgurl=downloadUrl;
//   messagetype="img";
// });
// onSendMessage();
//       return downloadUrl;

      
//     } catch (error) {
//       // Handle any errors that occur during the upload process
//       print('Error uploading image: $error');
//       return "null";
//     }
//   } else {
//     // User canceled the image selection
//     return "null";
//   }
// }
// //  late FlutterAudioRecorder2 _audioRecorder;
// //   bool _isRecording = false;
// //   String? _recordingPath;
// // late Timer _recordingTimer;


// // Future<void> _initAudioRecorder() async {
// //   final appDocumentsDirectory = await getApplicationDocumentsDirectory();
// //   final uniqueFileName = DateTime.now().toIso8601String(); // Generate a unique filename
// //   final recorder = FlutterAudioRecorder2(
// //     '${appDocumentsDirectory.path}/$uniqueFileName', // Use a unique filename
// //     audioFormat: AudioFormat.WAV,
// //   );
// //   await recorder.initialized;
// //   setState(() {
// //     _audioRecorder = recorder;
// //   });
// // }
// //   bool isRecordingAudio = false; 

// // Future<void> _startRecording() async {
// //     try {
// //       await _audioRecorder.start();
// //       setState(() {
// //         _isRecording = true;
// //         isRecordingAudio = true; // Set recording flag to true
// //         print("Recording started");
// //       });

// //       // Start a timer to stop the recording after 1 minute (60 seconds)
// //       _recordingTimer = Timer(Duration(seconds: 60), () {
// //         // Stop the recording when the timer expires
// //         _stopRecording();
// //       });
// //     } catch (e) {
// //       print(e);
// //     }
// //   }

// //   Future<void> _stopRecording() async {
// //     try {
// //       // Cancel the recording timer if it's active
// //       // if (_recordingTimer.isActive) {
// //       //   _recordingTimer.cancel();
// //       // }

// //       final recording = await _audioRecorder.stop();
// //       setState(() {
// //         _isRecording = false;
// //         _recordingPath = recording!.path;
// //         isRecordingAudio = false; // Set recording flag to false
// //       });

// //       if (_recordingPath != null) {
// //         await _uploadAudioToFirebase(File(_recordingPath!));

// //         setState(() {
// //           _recordingPath=null;
// //           print(_recordingPath);
// //         });
// //       }
// //     } catch (e) {
// //       print(e);
// //     }
// //   }


//   Future<void> _uploadAudioToFirebase(File audioFile) async {
//   if (audioFile.existsSync()) {
//     try {
//       final storage = FirebaseStorage.instance;
//       final fileName = DateTime.now().toIso8601String();
//       final Reference reference = storage.ref().child('audio_recordings/$fileName.mp3');

//       final UploadTask uploadTask = reference.putFile(audioFile);

//       // Await the completion of the upload task
//       final TaskSnapshot storageTaskSnapshot = await uploadTask;

//       // Get the download URL
//       final String downloadURL = await storageTaskSnapshot.ref.getDownloadURL();
//       setState(() {
//         messagetype="audio";
//         messagaudiourl=downloadURL;
//       });
//       onSendMessage();
//       print('File uploaded successfully. Download URL: $downloadURL');
//     } catch (error) {
//       print('Error uploading file: $error');
//     }
//   } else {
//     print('File does not exist: ${audioFile.path}');
//   }
// }


//   @override
//   void dispose() {
//     // _audioRecorder.dispose();
//     super.dispose();
//   }


//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return SafeArea(

      
//       child: Scaffold(
// resizeToAvoidBottomInset: true,
//         appBar:AppBar(
          
//           actions: [Container(child:               Image.asset("assets/icons/menuu.png"),)],
//           leading: GestureDetector(
//                       onTap: () {
//                         Get.back();
//                       },
//                       child: Icon(
//                         Icons.arrow_back_ios,
//                         size: 25,
//                         color: Colors.black,
//                       ),
//                     ),
                    
//                     title: Container( child:Row(children: [ SizedBox(width: width * .02),
//                     CircleAvatar(
//                       radius: 30.0,
//                       backgroundImage: NetworkImage(
//                           "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
//                       backgroundColor: Colors.transparent,
//                     ),
//                     SizedBox(width: width * .05),
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "John Deo",
//                           style: Theme.of(context).textTheme.titleSmall,
//                         ),
//                         SizedBox(
//                           height: height * .01,
//                         ),
//                         Text(
//                           "Hey! How\'s it going?",
//                           style: Theme.of(context)
//                               .textTheme
//                               .bodySmall!
//                               .copyWith(color: Colors.grey),
//                         ),
//                       ],
//                     ),
//                     ],),),),

//         body: Container(
        
//           child: Column(
//             children: [
             
//               // SizedBox(height: height*.03),
        
//              AcceptRequestwidget(),
        
//               SizedBox(height: Get.height*0.02,),
//           Obx(() {
//           switch (ViewRequestDetailsControllerinstance.rxRequestStatus.value) {
//             case Status.LOADING:
//               return const Center(child: Text(""));
//             case Status.ERROR:
//               if (ViewRequestDetailsControllerinstance.error.value == 'No internet') {
//                 return InterNetExceptionWidget(
//                   onPress: () {},
//                 );
//               } else {
//                 return GeneralExceptionWidget(onPress: () {});
//               }
//             case Status.COMPLETED:
//               return     Expanded(
//         child: StreamBuilder<QuerySnapshot>(
//           stream: _firestore
//             .collection("RoomId's")
//             .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
//             .collection('massages')
//             .orderBy("time", descending: true) // Reverse order here
//             .snapshots(),
//           builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return Center(child: Text(""));
//             }

//             if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
//               return Center(
//                 child: Text("No messages yet."),
//               );
//             }

//             return ListView.builder(
//   reverse: true,
//   itemCount: snapshot.data!.docs.length,
//   itemBuilder: (context, index) {
//     final message = snapshot.data!.docs[index]['message'].toString();
//     final timestamp = snapshot.data!.docs[index]['time'] as Timestamp? ; // Assuming 'time' is the timestamp field
//     final isSentByCurrentUser = snapshot.data!.docs[index]['sentby'].toString() ==
//         ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString();

//     return Align(
//       alignment: isSentByCurrentUser ? Alignment.centerRight : Alignment.centerLeft,
//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           padding: EdgeInsets.all(8.0),
//           decoration: BoxDecoration(

//             color: isSentByCurrentUser ? Color(0xffFFCCCB) : Color(0xffcce7e8),
//             borderRadius:isSentByCurrentUser? BorderRadius.only(
//               topLeft: Radius.circular(8),
//               topRight: Radius.circular(8),
//               bottomLeft: Radius.circular(8),
//             ):BorderRadius.only(
//               topRight: Radius.circular(8),
//               bottomRight: Radius.circular(8),
//               bottomLeft: Radius.circular(8),
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: isSentByCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
//             children: [
//        if(snapshot.data!.docs[index]['type'].toString()=="text")  Text(
//             breakMessage(message),
//                 style: TextStyle(color: Colors.black),
//               ),
//               if(snapshot.data!.docs[index]['type'].toString()=="img")
//               Container(
//                 height: 150,width: 100,
//                 child: 
//                 CachedNetworkImage(
//        imageUrl: snapshot.data!.docs[index]['imageurl'].toString(),
//        progressIndicatorBuilder: (context, url, downloadProgress) => 
//                Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
//        errorWidget: (context, url, error) => Icon(Icons.error),
//     ),
                
//              ),

//              if(snapshot.data!.docs[index]['type'].toString()=="audio")VoiceMessage(
//   audioSrc: snapshot.data!.docs[index]['audiourl'].toString(),
//   played: false, // To show played badge or not.
//   me: true, // Set message side.
//   onPlay: () {}, // Do something when voice played.
// ),
//              if (timestamp != null)  Text(
//                 formatTimestamp(timestamp), // Format timestamp as needed
//                 style: TextStyle(color: Colors.grey, fontSize: 12),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   },
// );

//           },
//         ),
//         );}}) ,

//             Obx(() {
//           switch (ViewRequestDetailsControllerinstance.rxRequestStatus.value) {
//             case Status.LOADING:
//               return const Center(child: CircularProgressIndicator());
//             case Status.ERROR:
//               if (ViewRequestDetailsControllerinstance.error.value == 'No internet') {
//                 return InterNetExceptionWidget(
//                   onPress: () {},
//                 );
//               } else {
//                 return GeneralExceptionWidget(onPress: () {});
//               }
//             case Status.COMPLETED:
//               return   StreamBuilder<DocumentSnapshot>(
//   stream: _firestore
//       .collection("RoomId's")
//       .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
//       .collection('typestatus')
//       .doc("userstypingstatus") // Replace with the actual document ID
//       .snapshots(),
//   builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//     if (snapshot.connectionState == ConnectionState.waiting) {
//       return Center(child: CircularProgressIndicator());
//     }

//     if (!snapshot.hasData || !snapshot.data!.exists) {
//       return Center(
//         child: Text("No status data yet."),
//       );
//     }

//     Map<String, dynamic> statusData = snapshot.data!.data() as Map<String, dynamic>;
//     String status = statusData['status'].toString(); // Assuming 'status' is the field name
//     String id = statusData['id'].toString(); // Assuming 'status' is the field name

//     return id!= ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString()&& status=="true"?Align(

//       child: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Container(
//           padding: EdgeInsets.all(8.0),
//           decoration: BoxDecoration(

//             color:  Color(0xffcce7e8),
//             borderRadius:BorderRadius.only(
//               topRight: Radius.circular(8),
//               bottomRight: Radius.circular(8),
//               bottomLeft: Radius.circular(8),
//             ),
//           ),
//           child: Row(
//             children: [
//               Text("typing...",style: TextStyle(color: Colors.black),),
//             ],
//           )
//           ),
//         ),
//       ):Container();
    
//   },
//             );}}),

//               Row(
//                 children: [
//                   Wrap(
//                           runSpacing: 8.0,
//                           spacing: 6.0,
//                           children: [
//                             GestureDetector(
//                               onTap: () {
//                                 // messagecontroller.text = "Hello!";
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     border: Border.all(color: Colors.grey),
//                                     borderRadius: BorderRadius.circular(20)),
//                                 height: height * .04,
//                                 width: width * .18,
//                                 child: Center(
//                                   child: Text(
//                                     "Hello!",
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodySmall!
//                                         .copyWith(color: Colors.grey),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 // messagecontroller.text = "How are you?";
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     border: Border.all(color: Colors.grey),
//                                     borderRadius: BorderRadius.circular(20)),
//                                 height: height * .04,
//                                 width: width * .3,
//                                 child: Center(
//                                   child: Text(
//                                     "How are you?",
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodySmall!
//                                         .copyWith(color: Colors.grey),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                             GestureDetector(
//                               onTap: () {
//                                 // messagecontroller.text = "What are you doing?";
//                               },
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                     border: Border.all(color: Colors.grey),
//                                     borderRadius: BorderRadius.circular(20)),
//                                 height: height * .04,
//                                 width: width * .37,
//                                 child: Center(
//                                   child: Text(
//                                     "What are you doing?",
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodySmall!
//                                         .copyWith(color: Colors.grey),
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                 ],
//               ),
        
        
//               SizedBox(height: Get.height*0.02,),
        
//               Container(width:Get.width,child:  Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         InkWell(child: Image.asset("assets/icons/camera.png"),onTap: (){
//                           uploadSelectedImageAndGetUrl();
//                         },),
//                         Container(
//                           height: height * .06,
//                           width: width * .7,
//                           child: TextFormField(
//                             keyboardType: TextInputType.emailAddress,
//                             controller: messagecontroller,
//                             focusNode: messageFocusNode,
//                             validator: (value) {},
//                             decoration: InputDecoration(
//                                 focusedBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(15.0)),
//                                     borderSide:
//                                         BorderSide(color: Color(0xffF3F3F3))),
//                                 hintStyle: TextStyle(
//                                     fontSize: 16, color: Color(0xffBABABA)),
//                                 contentPadding: EdgeInsets.all(12),
//                                 enabledBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(15.0)),
//                                     borderSide:
//                                         BorderSide(color: Color(0xffF3F3F3))),
//                                 errorBorder: OutlineInputBorder(
//                                     borderRadius:
//                                         BorderRadius.all(Radius.circular(15.0)),
//                                     borderSide:
//                                         BorderSide(color: Color(0xffF3F3F3))),
//                                 focusedErrorBorder: OutlineInputBorder(
//                                   borderRadius:
//                                       BorderRadius.all(Radius.circular(15.0)),
//                                   borderSide:
//                                       BorderSide(color: Color(0xffF3F3F3)),
//                                 ),
//                                 hintText: "Type a message...",
//               //                   suffixIcon: GestureDetector(child: Icon(Icons.mic),
//               //                     onLongPress: () {
//               //  print("start");
//               // //  _startRecording();
//               // },
            
//               // onLongPressUp: () {
//               //   print("stop");
//               //   // _stopRecording();
//               // },),
//                                 filled: true,
//                                 fillColor: Color(0xffF3F3F3)),
//                           ),
//                         ),
//                         InkWell(
//                           child: Icon(
//                             Icons.send_rounded,
//                             size: 35,
//                             color: Color(0xffFE0091),
//                           ),
//                           onTap: (){
//                             print("sent");
// // typeingstatusofuser(); if()
// if(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId!=null){

//                             onSendMessage();
// }
//                           },
//                         )
//                       ],
//                     ),
//       ),),
               
//             ],
//           ),
//         ),
     
//     ));
//   }

//   String breakMessage(String message) {
//   List<String> words = message.split(' ');
//   List<String> lines = [];
//   for (int i = 0; i < words.length; i += 9) {
//     lines.add(words.skip(i).take(9).join(' '));
//   }
//   return lines.join('\n');
// }



// }
