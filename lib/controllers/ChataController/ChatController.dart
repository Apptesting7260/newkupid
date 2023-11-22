// // import 'dart:async';
// // import 'dart:io';

// // import 'package:audioplayers/audioplayers.dart';
// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:cupid_match/controllers/controller/FetchSubcriptionController/FetchSubcriptionController.dart';
// // import 'package:cupid_match/controllers/controller/ForgotPasswordController/ForgotPasswordController.dart';
// // import 'package:cupid_match/controllers/controller/RequestDetailsController/RequestDetailsController.dart';
// // import 'package:cupid_match/controllers/controller/ViewSikerDetailsController/ViewSikerDetaolsController.dart';
// // import 'package:cupid_match/match_maker/Monthly_subscription_plans.dart';
// // import 'package:cupid_match/match_seeker/chat_screen.dart';
// // import 'package:cupid_match/repository/Auth_Repository/Auth_Repository.dart';
// // import 'package:cupid_match/utils/utils.dart';
// // import 'package:cupid_match/controllers/controller/SignUpController/SignUpController.dart';
// // import 'package:cupid_match/views/sign_up/create_password.dart';
// // import 'package:cupid_match/views/user/otp.dart';
// // import 'package:cupid_match/views/user/reset_password.dart';
// // import 'package:file_picker/file_picker.dart';
// // import 'package:firebase_storage/firebase_storage.dart';
// // import 'package:flutter/cupertino.dart';
// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
// // import 'package:get/get.dart';
// // import 'package:image_picker/image_picker.dart';
// // import 'package:intl/intl.dart';
// // import 'package:path_provider/path_provider.dart';


// // class CreateMontlyController extends GetxController {


// //   int maxduration = 100;
// //   int currentpos = 0;
// //   String currentpostlabel = "00:00";
// //   String audioasset = "assets/audio/red-indian-music.mp3";
// //   bool isplaying = false;
// //   bool audioplayed = false;
// //   late Uint8List audiobytes;
// // Recording ?recording;
// //   AudioPlayer player = AudioPlayer();
// //    Map<String, dynamic>? messages ;
// //   TextEditingController messagecontroller = TextEditingController();


// //     final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// //   final ViewRequestDetailsControllerinstance=Get.put(ViewRequestDetailsController());
  
// //   final ViewSikerProfileDetailsControllernstance=Get.put(ViewSikerProfileDetailsController());
// //    String formatTimestamp(Timestamp timestamp) {
// //     final DateTime dateTime = timestamp.toDate();
// //     final DateFormat formatter = DateFormat('h:mm a');
// //     return formatter.format(dateTime);
// //   }
// //  FocusNode messageFocusNode = FocusNode();
// // void updatetryeDataInFirestore() async {
// //   FirebaseFirestore firestore = FirebaseFirestore.instance;
// // print(("hited"));
// //   // Replace 'users' with your collection name and 'documentId' with the specific document ID
// //   DocumentReference docRef =  firestore
// //           .collection("RoomId's")
// //           .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
// // .collection("typestatus").doc("userstypingstatus");

// //    Map<String, dynamic> typestatus = {
// //         "id": ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString(),
// //         "status":true,
        
// //       };

// //   await docRef.update(typestatus);
// // }

// // void updatefalseDataInFirestore() async {
// //    FirebaseFirestore firestore = FirebaseFirestore.instance;
// // print(("hited"));
// //   // Replace 'users' with your collection name and 'documentId' with the specific document ID
// //   DocumentReference docRef =  firestore
// //           .collection("RoomId's")
// //           .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
// // .collection("typestatus").doc("userstypingstatus");

// //    Map<String, dynamic> typestatus = {
// //         "id": ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString(),
// //         "status":false,
        
// //       };

// //   await docRef.update(typestatus);
// // }
// //     void _onFocusChange() {
// //     if (messageFocusNode.hasFocus) {
// //       updatetryeDataInFirestore();
// //       print("TextField is active: true");
// //     } else {
// //       updatefalseDataInFirestore();
// //       print("TextField is active: false");
// //     }
// //   }

// //  void typeingstatusofuser()async{
// //     print("hited");
// //      Map<String, dynamic> typestatus = {
// //         "id": ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString(),
// //         "status":false,
        
// //       };

// //       await _firestore
// //           .collection("RoomId's")
// //           .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
// // .collection("typestatus").doc("userstypingstatus").set(typestatus);
// // }

// // @override
// //   void initState() {
   
// //       messageFocusNode.addListener(_onFocusChange);
     
// //                 ViewSikerProfileDetailsControllernstance.ViewSikerProfileDetailsApiHit();
// // ViewRequestDetailsControllerinstance.ViewRequestDetailsApiHit();
// //   _initAudioRecorder();// TODO: implement initState

  
// //     super.initState();
// //   }
// //   final ViewSikerProfileDetailsControllerinstance=Get.put(ViewSikerProfileDetailsController
// // ());
// //  final ScrollController _scrollController = ScrollController();


// // void onSendMessage()async {
// //   switch (messagetype) {
// //     case "text":
// //       Map<String, dynamic> messages = {
// //         "sentby": ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString(),
// //         "message": messagecontroller.text,
// //         "type": "text",
// //         "time": FieldValue.serverTimestamp(),
// //       };
// //         messagecontroller.clear();
// //     await _firestore
// //           .collection("RoomId's")
// //           .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
// // .collection("massages").add(messages);
// //       print("Enter Some Text");
// //       setState(() {
// //         messagetype="text";
// //         print(messagetype);
// //       });
// //       // Add your logic for handling text messages here
// //       break;
// //     case "img":
// //     messages = {
// //         "sentby": ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString(),
// //         "message": messagecontroller.text,
// //         "imageurl":messageimgurl,
// //         "type": "img",
// //         "time": FieldValue.serverTimestamp(),
// //       };
// //         messagecontroller.clear();
// //     await _firestore
// //           .collection("RoomId's")
// //           .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
// // .collection("massages").add(messages!);
// //       print("Enter Some Text");
// //        setState(() {
// //         messagetype="text";
// //         print(messagetype);
// //       });
// //       // Add your logic for handling image messages here
// //       break;
// //     case "audio":
// //      messages = {
// //         "sentby": ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString(),
// //         "message": messagecontroller.text,
// //         "audiourl":messagaudiourl,
        
// //         "type": "audio",
// //         "time": FieldValue.serverTimestamp(),
// //       };
// //        await _firestore
// //           .collection("RoomId's")
// //           .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
// // .collection("massages").add(messages!);
// //       print("Enter Some Text");
// //        setState(() {
// //         messagetype="text";
// //         print(messagetype);
// //       });
// //       break;
// //     case "video":
// //       print("Video");
// //        messages = {
// //         "sentby": ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].id.toString(),
// //         "message": messagecontroller.text,
// //         "videourl":messagvideoourl,
        
// //         "type": "video",
// //         "time": FieldValue.serverTimestamp(),
// //       };
// //        await _firestore
// //           .collection("RoomId's")
// //           .doc(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.roomId.toString())
// // .collection("massages").add(messages!);
// //       print("Enter Some Text");
// //        setState(() {
// //         messagetype="text";
// //         print(messagetype);
// //       });
// //       // Add your logic for handling video messages here
// //       break;
// //     default:
// //       print("Unknown message type");
// //       // Handle the case where the message type is unknown
// //   }
// // }


// //  String customPath = '/flutter_audio_recorder_';
// // Future<String> uploadSelectedImageAndGetUrl() async {
// //   final picker = ImagePicker();
// //   final pickedFile = await picker.getImage(source: ImageSource.gallery);

// //   if (pickedFile != null) {
// //     try {
// //       // Create a reference to the Firebase Storage location where you want to store the image.
// //       final Reference storageReference = FirebaseStorage.instance.ref().child('images/${DateTime.now()}.jpg');

// //       // Upload the selected image to Firebase Storage
// //       final UploadTask uploadTask = storageReference.putFile(File(pickedFile.path));

// //       // Await the completion of the upload
// //       final TaskSnapshot storageTaskSnapshot = await uploadTask.whenComplete(() => null);

// //       // Retrieve the download URL for the uploaded image
// //       final String downloadUrl = await storageTaskSnapshot.ref.getDownloadURL();
// // print(downloadUrl);

// // setState(() {
// //   messageimgurl=downloadUrl;
// //   messagetype="img";
// // });
// // onSendMessage();
// //       return downloadUrl;

      
// //     } catch (error) {
// //       // Handle any errors that occur during the upload process
// //       print('Error uploading image: $error');
// //       return "null";
// //     }
// //   } else {
// //     // User canceled the image selection
// //     return "null";
// //   }
// // }
// //  late FlutterAudioRecorder2 _audioRecorder;
// //   bool _isRecording = false;
// //   String? _recordingPath;
// //   late Timer _recordingTimer;
// //   bool isRecordingAudio = false;
// //   String messagetype = "";
// //   String messagaudiourl = "";


// //   Future<void> _initAudioRecorder() async {
// //     final appDocumentsDirectory = await getApplicationDocumentsDirectory();
// //     final uniqueFileName = DateTime.now().toIso8601String();

// //     final recorder = FlutterAudioRecorder2(
// //       '${appDocumentsDirectory.path}/$uniqueFileName',
// //       audioFormat: AudioFormat.WAV,
// //     );

// //     await recorder.initialized;
// //     setState(() {
// //       _audioRecorder = recorder;
// //     });
// //   }

// //   Future<void> _startRecording() async {
// //     try {
// //       final appDocumentsDirectory = await getApplicationDocumentsDirectory();
// //       final uniqueFileName = DateTime.now().toIso8601String();

// //       final recorder = FlutterAudioRecorder2(
// //         '${appDocumentsDirectory.path}/$uniqueFileName',
// //         audioFormat: AudioFormat.WAV,
// //       );

// //       await recorder.initialized;
// //       await recorder.start();

// //       setState(() {
// //         _audioRecorder = recorder;
// //         _isRecording = true;
// //         isRecordingAudio = true;
// //         print("Recording started");
// //       });

// //       _recordingTimer = Timer(Duration(seconds: 60), () {
// //         _stopRecording();
// //       });
// //     } catch (e) {
// //       print(e);
// //     }
// //   }

// //   Future<void> _stopRecording() async {
// //     try {
// //       if (_recordingTimer.isActive) {
// //         _recordingTimer.cancel();
// //       }

// //       final recording = await _audioRecorder.stop();

// //       setState(() {
// //         _isRecording = false;
// //         _recordingPath = recording!.path;
// //         isRecordingAudio = false;
// //       });

// //       if (_recordingPath != null) {
// //         await _uploadAudioToFirebase(File(_recordingPath!));

// //         setState(() {
// //           _recordingPath = null;
// //           print(_recordingPath);
// //         });
// //       }
// //     } catch (e) {
// //       print(e);
// //     }
// //   }

// //   Future<void> _uploadAudioToFirebase(File audioFile) async {
// //     if (audioFile.existsSync()) {
// //       try {
// //         final storage = FirebaseStorage.instance;
// //         final fileName = audioFile.path.split('/').last;
// //         final Reference reference = storage.ref().child('audio_recordings/$fileName');

// //         final UploadTask uploadTask = reference.putFile(audioFile);

// //         final TaskSnapshot storageTaskSnapshot = await uploadTask;
// //         final String downloadURL = await storageTaskSnapshot.ref.getDownloadURL();
// //         setState(() {
// //           messagetype = "audio";
// //           messagaudiourl = downloadURL;
// //         });
// //            onSendMessage();

// //         print('File uploaded successfully. Download URL: $downloadURL');
// //       } catch (error) {
// //         print('Error uploading file: $error');
// //       }
// //     } else {
// //       print('File does not exist: ${audioFile.path}');
// //     }
// //   }
// // Future<String?> uploadVideoToFirebaseStorage(String filePath) async {
// //   try {
// //     Reference storageReference = FirebaseStorage.instance.ref().child('videos/${DateTime.now()}.mp4');
// //     final UploadTask uploadTask = storageReference.putFile(File(filePath));

// //     final TaskSnapshot downloadUrl = (await uploadTask.whenComplete(() {}));

// //     final String url = await downloadUrl.ref.getDownloadURL();
// //     print(url);
// //       setState(() {
// //         messagetype = "video";
// //         messagvideoourl = url;
// //       });
// //          onSendMessage();
// //     return url;
    
// //   } catch (e) {
// //     print('Error uploading video: $e');
// //     return null;
// //   }
// // }

// // Future<void> pickVideoAndUploadToFirebase(BuildContext context) async {
// //   try {
// //     FilePickerResult? result = await FilePicker.platform.pickFiles(
// //       type: FileType.video,
// //       // Remove the allowedExtensions parameter
// //     );

// //     if (result != null) {
// //       PlatformFile file = result.files.first;
// //       String filePath = file.path.toString();

// //       String? videoUrl = await uploadVideoToFirebaseStorage(filePath);

// //       if (videoUrl != null) {
// //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
// //           content: Text('Video uploaded to Firebase: $videoUrl'),
// //         ));
// //       }
// //     }
// //   } catch (e) {
// //     print('Error picking and uploading video: $e');
// //   }
// // }


// // }




  import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupid_match/controllers/controller/RequestDetailsController/RequestDetailsController.dart';
import 'package:cupid_match/controllers/controller/ViewSikerDetailsController/ViewSikerDetaolsController.dart';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';



class APIs {
  // for authentication


  final ViewRequestDetailsControllerinstance =
      Get.put(ViewRequestDetailsController());
  // for accessing cloud firestore database
  static FirebaseFirestore firestore = FirebaseFirestore.instance;

  // for accessing firebase storage
  static FirebaseStorage storage = FirebaseStorage.instance;


static Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages(String roomId) {
  return firestore
      .collection("RoomId's/$roomId/massages/")
      .orderBy('time', descending: true)
      .snapshots();
}

  // for storing self information
  // static ChatUser me = ChatUser(
  //     id: user.uid,
  //     name: user.displayName.toString(),
  //     email: user.email.toString(),
  //     about: "Hey, I'm using We Chat!",
  //     image: user.photoURL.toString(),
  //     createdAt: '',
  //     isOnline: false,
  //     lastActive: '',
  //     pushToken: '');

  // // to return current user
  // static User get user => auth.currentUser!;

  // // for accessing firebase messaging (Push Notification)
  // static FirebaseMessaging fMessaging = FirebaseMessaging.instance;

  // // for getting firebase messaging token
  // static Future<void> getFirebaseMessagingToken() async {
  //   await fMessaging.requestPermission();

  //   await fMessaging.getToken().then((t) {
  //     if (t != null) {
  //       me.pushToken = t;
  //       log('Push Token: $t');
  //     }
  //   });

  //   // for handling foreground messages
  //   // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //   //   log('Got a message whilst in the foreground!');
  //   //   log('Message data: ${message.data}');

  //   //   if (message.notification != null) {
  //   //     log('Message also contained a notification: ${message.notification}');
  //   //   }
  //   // });
  // }

  // // for sending push notification
  // static Future<void> sendPushNotification(
  //     ChatUser chatUser, String msg) async {
  //   try {
  //     final body = {
  //       "to": chatUser.pushToken,
  //       "notification": {
  //         "title": me.name, //our name should be send
  //         "body": msg,
  //         "android_channel_id": "chats"
  //       },
  //       // "data": {
  //       //   "some_data": "User ID: ${me.id}",
  //       // },
  //     };

  //     var res = await post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
  //         headers: {
  //           HttpHeaders.contentTypeHeader: 'application/json',
  //           HttpHeaders.authorizationHeader:
  //               'key=AAAAQ0Bf7ZA:APA91bGd5IN5v43yedFDo86WiSuyTERjmlr4tyekbw_YW6JrdLFblZcbHdgjDmogWLJ7VD65KGgVbETS0Px7LnKk8NdAz4Z-AsHRp9WoVfArA5cNpfMKcjh_MQI-z96XQk5oIDUwx8D1'
  //         },
  //         body: jsonEncode(body));
  //     log('Response status: ${res.statusCode}');
  //     log('Response body: ${res.body}');
  //   } catch (e) {
  //     log('\nsendPushNotificationE: $e');
  //   }
  // }

  // // for checking if user exists or not?
  // static Future<bool> userExists() async {
  //   return (await firestore.collection('users').doc(user.uid).get()).exists;
  // }

  // // for adding an chat user for our conversation
  // static Future<bool> addChatUser(String email) async {
  //   final data = await firestore
  //       .collection('users')
  //       .where('email', isEqualTo: email)
  //       .get();

  //   log('data: ${data.docs}');

  //   if (data.docs.isNotEmpty && data.docs.first.id != user.uid) {
  //     //user exists

  //     log('user exists: ${data.docs.first.data()}');

  //     firestore
  //         .collection('users')
  //         .doc(user.uid)
  //         .collection('my_users')
  //         .doc(data.docs.first.id)
  //         .set({});

  //     return true;
  //   } else {
  //     //user doesn't exists

  //     return false;
  //   }
  // }

  // // for getting current user info
  // static Future<void> getSelfInfo() async {
  //   await firestore.collection('users').doc(user.uid).get().then((user) async {
  //     if (user.exists) {
  //       me = ChatUser.fromJson(user.data()!);
  //       await getFirebaseMessagingToken();

  //       //for setting user status to active
  //       APIs.updateActiveStatus(true);
  //       log('My Data: ${user.data()}');
  //     } else {
  //       await createUser().then((value) => getSelfInfo());
  //     }
  //   });
  // }

  // // for creating a new user
  // static Future<void> createUser() async {
  //   final time = DateTime.now().millisecondsSinceEpoch.toString();

  //   final chatUser = ChatUser(
  //       id: user.uid,
  //       name: user.displayName.toString(),
  //       email: user.email.toString(),
  //       about: "Hey, I'm using We Chat!",
  //       image: user.photoURL.toString(),
  //       createdAt: time,
  //       isOnline: false,
  //       lastActive: time,
  //       pushToken: '');

  //   return await firestore
  //       .collection('users')
  //       .doc(user.uid)
  //       .set(chatUser.toJson());
  // }

  // // for getting id's of known users from firestore database
  // static Stream<QuerySnapshot<Map<String, dynamic>>> getMyUsersId() {
  //   return firestore
  //       .collection('users')
  //       .doc(user.uid)
  //       .collection('my_users')
  //       .snapshots();
  // }

  // // for getting all users from firestore database
  // static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers(
  //     List<String> userIds) {
  //   log('\nUserIds: $userIds');

  //   return firestore
  //       .collection('users')
  //       .where('id',
  //           whereIn: userIds.isEmpty
  //               ? ['']
  //               : userIds) //because empty list throws an error
  //       // .where('id', isNotEqualTo: user.uid)
  //       .snapshots();
  // }

  // // for adding an user to my user when first message is send
  // static Future<void> sendFirstMessage(
  //     ChatUser chatUser, String msg, Type type) async {
  //   await firestore
  //       .collection('users')
  //       .doc(chatUser.id)
  //       .collection('my_users')
  //       .doc(user.uid)
  //       .set({}).then((value) => sendMessage(chatUser, msg, type));
  // }

  // // for updating user information
  // static Future<void> updateUserInfo() async {
  //   await firestore.collection('users').doc(user.uid).update({
  //     'name': me.name,
  //     'about': me.about,
  //   });
  // }

  // // update profile picture of user
  // static Future<void> updateProfilePicture(File file) async {
  //   //getting image file extension
  //   final ext = file.path.split('.').last;
  //   log('Extension: $ext');

  //   //storage file ref with path
  //   final ref = storage.ref().child('profile_pictures/${user.uid}.$ext');

  //   //uploading image
  //   await ref
  //       .putFile(file, SettableMetadata(contentType: 'image/$ext'))
  //       .then((p0) {
  //     log('Data Transferred: ${p0.bytesTransferred / 1000} kb');
  //   });

  //   //updating image in firestore database
  //   me.image = await ref.getDownloadURL();
  //   await firestore
  //       .collection('users')
  //       .doc(user.uid)
  //       .update({'image': me.image});
  // }

  // // for getting specific user info
  // static Stream<QuerySnapshot<Map<String, dynamic>>> getUserInfo(
  //     ChatUser chatUser) {
  //   return firestore
  //       .collection('users')
  //       .where('id', isEqualTo: chatUser.id)
  //       .snapshots();
  // }

  // // update online or last active status of user
  // static Future<void> updateActiveStatus(bool isOnline) async {
  //   firestore.collection('users').doc(user.uid).update({
  //     'is_online': isOnline,
  //     'last_active': DateTime.now().millisecondsSinceEpoch.toString(),
  //     'push_token': me.pushToken,
  //   });
  // }

  // ///************** Chat Screen Related APIs **************

  // // chats (collection) --> conversation_id (doc) --> messages (collection) --> message (doc)

  // // useful for getting conversation id
  // static String getConversationID(String id) => user.uid.hashCode <= id.hashCode
  //     ? '${user.uid}_$id'
  //     : '${id}_${user.uid}';

  // // for getting all messages of a specific conversation from firestore database
  // static Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages(
  //     ChatUser user) {
  //   return firestore
  //       .collection('chats/${getConversationID(user.id)}/messages/')
  //       .orderBy('sent', descending: true)
  //       .snapshots();
  // }

  // // for sending message
  // static Future<void> sendMessage(
  //     ChatUser chatUser, String msg, Type type) async {
  //   //message sending time (also used as id)
  //   final time = DateTime.now().millisecondsSinceEpoch.toString();

  //   //message to send
  //   final Message message = Message(
  //       toId: chatUser.id,
  //       msg: msg,
  //       read: '',
  //       type: type,
  //       fromId: user.uid,
  //       sent: time);

  //   final ref = firestore
  //       .collection('chats/${getConversationID(chatUser.id)}/messages/');
  //   await ref.doc(time).set(message.toJson()).then((value) =>
  //       sendPushNotification(chatUser, type == Type.text ? msg : 'image'));
  // }

  // //update read status of message
  // static Future<void> updateMessageReadStatus(Message message) async {
  //   firestore
  //       .collection('chats/${getConversationID(message.fromId)}/messages/')
  //       .doc(message.sent)
  //       .update({'read': DateTime.now().millisecondsSinceEpoch.toString()});
  // }

  // //get only last message of a specific chat
  // static Stream<QuerySnapshot<Map<String, dynamic>>> getLastMessage(
  //     ChatUser user) {
  //   return firestore
  //       .collection('chats/${getConversationID(user.id)}/messages/')
  //       .orderBy('sent', descending: true)
  //       .limit(1)
  //       .snapshots();
  // }

  // //send chat image
  // static Future<void> sendChatImage(ChatUser chatUser, File file) async {
  //   //getting image file extension
  //   final ext = file.path.split('.').last;

  //   //storage file ref with path
  //   final ref = storage.ref().child(
  //       'images/${getConversationID(chatUser.id)}/${DateTime.now().millisecondsSinceEpoch}.$ext');

  //   //uploading image
  //   await ref
  //       .putFile(file, SettableMetadata(contentType: 'image/$ext'))
  //       .then((p0) {
  //     log('Data Transferred: ${p0.bytesTransferred / 1000} kb');
  //   });

  //   //updating image in firestore database
  //   final imageUrl = await ref.getDownloadURL();
  //   await sendMessage(chatUser, imageUrl, Type.image);
  // }

  // //delete message
  // static Future<void> deleteMessage(Message message) async {
  //   await firestore
  //       .collection('chats/${getConversationID(message.toId)}/messages/')
  //       .doc(message.sent)
  //       .delete();

  //   if (message.type == Type.image) {
  //     await storage.refFromURL(message.msg).delete();
  //   }
  // }

  // //update message
  // static Future<void> updateMessage(Message message, String updatedMsg) async {
  //   await firestore
  //       .collection('chats/${getConversationID(message.toId)}/messages/')
  //       .doc(message.sent)
  //       .update({'msg': updatedMsg});
  // }
}