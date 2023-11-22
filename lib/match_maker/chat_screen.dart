import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/ChataController/ChatController.dart';
import 'package:cupid_match/controllers/controller/MakerRequestDetailViewController/MakerRequestDetailViewController.dart';
import 'package:cupid_match/controllers/controller/RequestDetailsController/RequestDetailsController.dart';
import 'package:cupid_match/controllers/controller/ViewMakerProfileDetailsController/ViewMakerProfileDetailscontroller.dart';
import 'package:cupid_match/controllers/controller/ViewSikerDetailsController/ViewSikerDetaolsController.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/match_maker/chat/chatfunctionmaker.dart';
import 'package:cupid_match/match_maker/chatScreenaMaker.dart';
import 'package:cupid_match/match_seeker/chat/RequestAcceptWidget.dart';
import 'package:cupid_match/res/components/general_exception.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:cupid_match/widgets/audio_play%20widget.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
// import 'package:flutter_sound/public/flutter_sound_recorder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:kplayer/kplayer.dart';
import 'package:path_provider/path_provider.dart';

import 'package:video_player/video_player.dart';

import '../utils/app_colors.dart';
String messagetype="text";
String ?messageimgurl;
String ?messagaudiourl;
String? seeker1;
String? seeker2;
var playerx;
bool ismessage=false;

class MakerChatScreen extends StatefulWidget {
  const MakerChatScreen({Key? key}) : super(key: key);

  @override
  State<MakerChatScreen> createState() => _MakerChatScreenState();
}

class _MakerChatScreenState extends State<MakerChatScreen> {
  bool ispageloading=false;
  final ViewMakerProfileDetailsControllerinstance=Get.put(ViewMakerProfileDetailsController());
  String url="";
  int maxduration = 100;
  int currentpos = 0;
  String currentpostlabel = "00:00";
  String audioasset = "assets/audio/red-indian-music.mp3";
  bool isplaying = false;
  bool audioplayed = false;
  late Uint8List audiobytes;
// Recording ?recording;
  AudioPlayer player = AudioPlayer();
  Map<String, dynamic>? messages;
  TextEditingController messagecontroller = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final MakerRequestDetailsControllerinstance =
  Get.put(MakerRequestDetailsController());

  String formatTimestamp(Timestamp timestamp) {
    final DateTime dateTime = timestamp.toDate();
    final DateFormat formatter = DateFormat('h:mm a');
    return formatter.format(dateTime);
  }

  FocusNode messageFocusNode = FocusNode();
  // void updatetryeDataInFirestore() async {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   print(("hited"));
  //   // Replace 'users' with your collection name and 'documentId' with the specific document ID
  //   DocumentReference docRef = firestore
  //       .collection("RoomId's")
  //       .doc(roomid)
  //       .collection("typestatus")
  //       .doc("userstypingstatus");

  //   Map<String, dynamic> typestatus = {
  //     "id": ViewMakerProfileDetailsControllerinstance
  //         .ViewProfileDetail.value.ProfileDetail!.id
  //         .toString(),
  //     "status": true,
  //   };

  //   await docRef.update(typestatus);
  // }

  // void updatefalseDataInFirestore() async {
  //   FirebaseFirestore firestore = FirebaseFirestore.instance;
  //   print(("hited"));
  //   // Replace 'users' with your collection name and 'documentId' with the specific document ID
  //   DocumentReference docRef = firestore
  //       .collection("RoomId's")
  //       .doc(roomid)
  //       .collection("typestatus")
  //       .doc("userstypingstatus");

  //   Map<String, dynamic> typestatus = {
  //     "id":ViewMakerProfileDetailsControllerinstance
  //         .ViewProfileDetail.value.ProfileDetail!.id
  //         .toString(),
  //     "status": false,
  //   };

  //   await docRef.update(typestatus);
  // }

  void _onFocusChange() {
    if (messageFocusNode.hasFocus) {
      // updatetryeDataInFirestore();
      print("TextField is active: true");
    } else {
      // updatefalseDataInFirestore();
      print("TextField is active: false");
    }
  }

  // void typeingstatusofuser() async {
  //   print("hited");
  //   Map<String, dynamic> typestatus = {
  //     "id": ViewMakerProfileDetailsControllerinstance
  //         .ViewProfileDetail.value.ProfileDetail!.id
  //         .toString(),
  //     "status": false,
  //   };

  //   await _firestore
  //       .collection("RoomId's")
  //       .doc(roomid)
  //       .collection("typestatus")
  //       .doc("userstypingstatus")
  //       .set(typestatus);
  // }

  @override
  void initState() {
    _getDir();
    _initialiseControllers();


    ViewMakerProfileDetailsControllerinstance.ViewMakerProfileDetailsApiHit();


    Timer(Duration(seconds: 3), () {setState(() {
      ispageloading=true;
    }); });
    super.initState();
  }

final ChatFunction ChatFunctioninstance=ChatFunction();
  final ScrollController _scrollController = ScrollController();
  void onSendMessage() async {
    switch (messagetype) {
      case "text":
        Map<String, dynamic> messages = {
          "sentby": "m"+makeridchat.toString(),

          "sendertype":"maker" ,
          "profileimage":makeridchatimage,
          "message": messagecontroller.text,
          "type": "text",
          "time": FieldValue.serverTimestamp(),
        };
  String textmsg= messagecontroller.text.toString();
      setState(() {
        textmsg;
      });
      messagecontroller.clear();
        // DocumentReference roomRef1 = _firestore.collection("s"+seeker1.toString()).doc(roomid);
        // DocumentReference roomRef2 = _firestore.collection("s"+seeker2.toString()).doc(roomid);
        // // DocumentReference roomRef3 = _firestore.collection("m"+makeridchat.toString()).doc(roomid);
        // // final List<DocumentReference> roomRefs = [roomRef1, roomRef2, roomRef3];

        // for (var roomRef in roomRefs) {

        //   await roomRef1.update({
        //     'timestamp': FieldValue.serverTimestamp(),
        //     "lastmsg": messagecontroller.text,

        //     // Add other room metadata if needed
        //   });
        //   await roomRef2.update({
        //     'timestamp':FieldValue.serverTimestamp(),
        //     "lastmsg": messagecontroller.text,
        //     // Add other room metadata if needed
        //   });

        //   await roomRef3.update({
        //     'timestamp':FieldValue.serverTimestamp(),
        //     "lastmsg": messagecontroller.text,
        //     // Add other room metadata if needed
        //   });

        // }
        // messagecontroller.clear();
        // await _firestore
        //     .collection("m"+makeridchat.toString())
        //     .doc(roomid)
        //     .collection("massages")
        //     .add(messages);
        // print("Enter Some Text");
        // print(messages);
        // await _firestore
        //     .collection("s"+seeker1.toString())
        //     .doc(roomid)
        //     .collection("massages")
        //     .add(messages);
        // await _firestore
        //     .collection("s"+seeker2.toString())
        //     .doc(roomid)
        //     .collection("massages")
        //     .add(messages);


        // print(messages);
ChatFunctioninstance.Makersender(textmsg,makeridchat.toString(),roomid.toString(),messages);
ChatFunctioninstance.Seekersender(textmsg,seeker1.toString(),roomid.toString(),messages);
ChatFunctioninstance.Seekersender(textmsg,seeker2.toString(),roomid.toString(),messages);


        setState(() {
          messagetype = "text";
          print(messagetype);
        });
        // Add your logic for handling text messages here
        break;
      case "img":
        Map<String, dynamic>  messages = {
          "sentby": "m"+makeridchat.toString(),
          "sendertype":"maker" ,
          "profileimage":makeridchatimage,
          "message": messagecontroller.text,
          "imageurl": messageimgurl,
          "type": "img",
          "time": FieldValue.serverTimestamp(),
        };
 String textmsg= messagecontroller.text.toString();
      setState(() {
        textmsg;
      });
      messagecontroller.clear();
        // DocumentReference roomRef1 = _firestore.collection(seeker1.toString()).doc(roomid);
        // DocumentReference roomRef2 = _firestore.collection(seeker2.toString()).doc(roomid);
        // DocumentReference roomRef3 = _firestore.collection(makeridchat.toString()).doc(roomid);


        // await roomRef1.update({
        //   'timestamp': FieldValue.serverTimestamp(),

        //   // Add other room metadata if needed
        // });
        // await roomRef2.update({
        //   'timestamp': FieldValue.serverTimestamp(),
        //   "lastmsg": "image",
        //   // Add other room metadata if needed
        // });

        // await roomRef3.update({
        //   'timestamp': FieldValue.serverTimestamp(),
        //   "lastmsg": "image",
        //   // Add other room metadata if needed
        // });

        // messagecontroller.clear();
        // await _firestore
        //     .collection("m"+makeridchat.toString())
        //     .doc(roomid)
        //     .collection("massages")
        //     .add(messages);
        // print("Enter Some Text");
        // print(messages);
        // await _firestore
        //     .collection("s"+seeker1.toString())
        //     .doc(roomid)
        //     .collection("massages")
        //     .add(messages);
        // await _firestore
        //     .collection("s"+seeker2.toString())
        //     .doc(roomid)
        //     .collection("massages")
        //     .add(messages);

        // print(messages);

        // setState(() {
        //   messagetype = "text";
        //   print(messagetype);
        // });
        // // Add your logic for handling image messages here
 ChatFunctioninstance.Makersender(textmsg,makeridchat.toString(),roomid.toString(),messages);
ChatFunctioninstance.Seekersender(textmsg,seeker1.toString(),roomid.toString(),messages);
ChatFunctioninstance.Seekersender(textmsg,seeker2.toString(),roomid.toString(),messages);
        break;
      case "audio":
        Map<String, dynamic>  messages = {
          "sentby": "m"+makeridchat.toString(),
          "sendertype":"maker" ,
          "profileimage":ViewMakerProfileDetailsControllerinstance
              .ViewProfileDetail.value.ProfileDetail!.imgPath,
          "message": messagecontroller.text,
          "audiourl":messagaudiourl,

          "type": "audio",
          "time": FieldValue.serverTimestamp(),
        };
 String textmsg= messagecontroller.text.toString();
      setState(() {
        textmsg;
      });
      messagecontroller.clear();
        // DocumentReference roomRef1 = _firestore.collection("s"+seeker1.toString()).doc(roomid);
        // DocumentReference roomRef2 = _firestore.collection("s"+seeker2.toString()).doc(roomid);
        // DocumentReference roomRef3 = _firestore.collection("m"+ViewMakerProfileDetailsControllerinstance
        //     .ViewProfileDetail.value.ProfileDetail!.id.toString()).doc(roomid);


        // await roomRef1.update({
        //   'timestamp': FieldValue.serverTimestamp(),
        //   "lastmsg": "audio",

        //   // Add other room metadata if needed
        // });
        // await roomRef2.update({
        //   'timestamp': FieldValue.serverTimestamp(),
        //   "lastmsg": "audio",
        //   // Add other room metadata if needed
        // });

        // await roomRef3.update({
        //   'timestamp': FieldValue.serverTimestamp(),
        //   "lastmsg": "audio",
        //   // Add other room metadata if needed
        // });

        // messagecontroller.clear();
        // await _firestore
        //     .collection(ViewMakerProfileDetailsControllerinstance
        //     .ViewProfileDetail.value.ProfileDetail!.id.toString())
        //     .doc(roomid)
        //     .collection("massages")
        //     .add(messages);
        // print("Enter Some Text");
        // print(messages);
        // await _firestore
        //     .collection(seeker1.toString())
        //     .doc(roomid)
        //     .collection("massages")
        //     .add(messages);
        // await _firestore
        //     .collection(seeker2.toString())
        //     .doc(roomid)
        //     .collection("massages")
        //     .add(messages);

        // print(messages);
        ChatFunctioninstance.Makersender(textmsg,makeridchat.toString(),roomid.toString(),messages);
ChatFunctioninstance.Seekersender(textmsg,seeker1.toString(),roomid.toString(),messages);
ChatFunctioninstance.Seekersender(textmsg,seeker2.toString(),roomid.toString(),messages);

        setState(() {
          messagetype = "text";
          print(messagetype);
        });
        break;
      case "video":
        print("Video");
        // Add your logic for handling video messages here
        break;
      default:
        print("Unknown message type");
    // Handle the case where the message type is unknown
    }
  }

  String customPath = '/flutter_audio_recorder_';
  Future<String> uploadSelectedImageAndGetUrl(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.getImage(source: source);

    if (pickedFile != null) {
      try {
        // Create a reference to the Firebase Storage location where you want to store the image.
        final Reference storageReference = FirebaseStorage.instance
            .ref()
            .child('images/${DateTime.now()}.jpg');

        // Upload the selected image to Firebase Storage
        final UploadTask uploadTask =
        storageReference.putFile(File(pickedFile.path));

        // Await the completion of the upload
        final TaskSnapshot storageTaskSnapshot =
        await uploadTask.whenComplete(() => null);

        // Retrieve the download URL for the uploaded image
        final String downloadUrl =
        await storageTaskSnapshot.ref.getDownloadURL();
        print(downloadUrl);

        setState(() {
          messageimgurl=downloadUrl;
          messagetype="img";
        });
        onSendMessage();
        return downloadUrl;


      } catch (error) {
        // Handle any errors that occur during the upload process
        print('Error uploading image: $error');
        return "null";
      }
    } else {
      // User canceled the image selection
      return "null";
    }
  }

  Future<void> showOptionsDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Choose",style: Theme.of(context).textTheme.titleLarge,),
            //Image Picker
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child:Icon(Icons.camera_alt,color: Colors.pink,),
                  onTap: () {
                    uploadSelectedImageAndGetUrl(ImageSource.camera);
                    Navigator.of(context).pop();
                  },
                ),
                GestureDetector(
                  child: Icon(Icons.photo_library,color: Colors.pink,),
                  onTap: () {
                    Navigator.of(context).pop();
                    uploadSelectedImageAndGetUrl(ImageSource.gallery);
                  },
                ),
              ],
            ),
          );
        });
  }

  //  Future<void> openCamera(ImageSource source) async {
  //   var imgCamera = await imgPicker.pickImage(source: source);

  //   if (imgCamera != null) {
  //     setState(() {
  //       imgFile = File(imgCamera.path);
  //     });

  //     // Run compression in a background isolate
  //     await compressImageInBackground(imgFile!);
  //   }
  // }
//  late FlutterAudioRecorder2 _audioRecorder;
//   bool _isRecording = false;
//   String? _recordingPath;
// late Timer _recordingTimer;


// Future<void> _initAudioRecorder() async {
//   final appDocumentsDirectory = await getApplicationDocumentsDirectory();
//   final uniqueFileName = DateTime.now().toIso8601String(); // Generate a unique filename
//   final recorder = FlutterAudioRecorder2(
//     '${appDocumentsDirectory.path}/$uniqueFileName', // Use a unique filename
//     audioFormat: AudioFormat.WAV,
//   );
//   await recorder.initialized;
//   setState(() {
//     _audioRecorder = recorder;
//   });
// }
//   bool isRecordingAudio = false;

// Future<void> _startRecording() async {
//   try {
//     final appDocumentsDirectory = await getApplicationDocumentsDirectory();
//     final uniqueFileName = DateTime.now().toIso8601String(); // Generate a unique filename

//     final recorder = FlutterAudioRecorder2(
//       '${appDocumentsDirectory.path}/$uniqueFileName', // Use a unique filename
//       audioFormat: AudioFormat.WAV,
//     );

//     await recorder.initialized;
//     await recorder.start(); // Start recording

//     setState(() {
//       _audioRecorder = recorder;
//       _isRecording = true;
//       isRecordingAudio = true; // Set recording flag to true
//       print("Recording started");
//     });

//     // Start a timer to stop the recording after 1 minute (60 seconds)
//     _recordingTimer = Timer(Duration(seconds: 60), () {
//       // Stop the recording when the timer expires
//       _stopRecording();
//     });
//   } catch (e) {
//     print(e);
//   }
// }

//   Future<void> _stopRecording() async {
//     try {
//       // Cancel the recording timer if it's active
//       // if (_recordingTimer.isActive) {
//       //   _recordingTimer.cancel();
//       // }
//  recording = await _audioRecorder.stop();
//       setState(() {
//         _isRecording = false;
//         _recordingPath = recording!.path;
//         isRecordingAudio = false; // Set recording flag to false
//       });

//       if (_recordingPath != null) {
//         await _uploadAudioToFirebase(File(_recordingPath!));

//         setState(() {
//           _recordingPath=null;
//           recording=null;
//           print(_recordingPath);
//         });
//       }
//     } catch (e) {
//       print(e);
//     }
//   }


//  var playerx = Player.network(
//       "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3",
//       autoPlay: false);


//   bool _changingPosition = false;
//   bool loading = false;
//   Duration _position = Duration.zero;


// double get position {
//     if (playerx.duration.inSeconds == 0) {
//       return 0;
//     }
//     if (_changingPosition) {
//       return _position.inSeconds * 100 / playerx.duration.inSeconds;
//     } else {
//       return playerx.position.inSeconds * 100 / playerx.duration.inSeconds;
//     }



//   }

  Future<void> _uploadAudioToFirebase(File audioFile) async {
    if (audioFile.existsSync()) {
      try {
        final storage = FirebaseStorage.instance;
        final fileName = audioFile.path.split('/').last; // Get the original file name
        final uniqueFileName = '${DateTime.now().millisecondsSinceEpoch}_$fileName'; // Add a timestamp to make the file name unique
        final Reference reference = storage.ref().child('audio_recordings/$uniqueFileName');

        final UploadTask uploadTask = reference.putFile(audioFile);

        // Await the completion of the upload task
        final TaskSnapshot storageTaskSnapshot = await uploadTask;

        // Get the download URL
        final String downloadURL = await storageTaskSnapshot.ref.getDownloadURL();

        // Now you can use downloadURL to store in Firestore as you were doing

        setState(() {
          messagetype = "audio";
          messagaudiourl = downloadURL;
        });
        onSendMessage();
        print('File uploaded successfully. Download URL: $downloadURL');
      } catch (error) {
        print('Error uploading file: $error');
      }
    } else {
      print('File does not exist: ${audioFile.path}');
    }
  }




//   @override
//   void dispose() {
//     // _audioRecorder.dispose();
//     super.dispose();
//   }


  late final RecorderController recorderController;

  String? path;
  String? musicFile;
  bool isRecording = false;
  bool isRecordingCompleted = false;
  bool isLoading = true;
  late Directory appDirectory;



  void _getDir() async {
    appDirectory = await getApplicationDocumentsDirectory();
    path = "${appDirectory.path}/recording.m4a";
    isLoading = false;
    setState(() {});
  }

  void _initialiseControllers() {
    recorderController = RecorderController()
      ..androidEncoder = AndroidEncoder.aac
      ..androidOutputFormat = AndroidOutputFormat.mpeg4
      ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
      ..sampleRate = 44100;
  }

  void _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      musicFile = result.files.single.path;
      setState(() {});
    } else {
      debugPrint("File not picked");
    }
  }

  @override
  void dispose() {
    recorderController.dispose();
    super.dispose();
  }
  Future<String?> uploadVideoToFirebaseStorage(String filePath) async {
    try {
      Reference storageReference = FirebaseStorage.instance.ref().child('videos/${DateTime.now()}.mp4');
      final UploadTask uploadTask = storageReference.putFile(File(filePath));

      final TaskSnapshot downloadUrl = (await uploadTask.whenComplete(() {}));

      final String url = await downloadUrl.ref.getDownloadURL();
      return url;
    } catch (e) {
      print('Error uploading video: $e');
      return null;
    }
  }

  Future<void> pickVideoAndUploadToFirebase(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        // type: FileType.custom,
        // allowedExtensions: ['mp4', 'mov'],
      );

      if (result != null) {
        PlatformFile file = result.files.first;
        String filePath = file.path.toString();

        String? videoUrl = await uploadVideoToFirebaseStorage(filePath);

        if (videoUrl != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Video uploaded to Firebase: $videoUrl'),
          ));
        }
      }
    } catch (e) {
      print('Error picking and uploading video: $e');
    }
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            toolbarHeight: Get.height*0.1,
            actions: [
              Container(
                child: Image.asset("assets/icons/menuu.png"),
              )
            ],
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 25,
                color: Colors.black,
              ),
            ),
            title: Container(
              child: Row(
                children: [
                  SizedBox(width: width * .01,height: Get.height*0.1,),
                  Container(width: width * .15,child: Stack(
                    children: [
                      chatimage1 !=
                          null
                          ? CircleAvatar(
                        backgroundImage: CachedNetworkImageProvider(
                            chatimage1
                                .toString()),
                        radius: 20,
                        backgroundColor: AppColors
                            .white,
                      )
                          : CircleAvatar(
                        backgroundImage: NetworkImage(
                            'https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                        radius: 20.0,
                        backgroundColor: Colors
                            .transparent,
                      ),
                      Positioned(
                        left:
                        15,
                        child: chatimage !=
                            null
                            ? CircleAvatar(
                          backgroundImage: CachedNetworkImageProvider(
                              chatimage
                                  .toString()),
                          radius: 20,

                        )
                            : CircleAvatar(
                          backgroundImage: NetworkImage(
                              'https://images.pexels.com/photos/33109/fall-autumn-red-season.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                          radius: 20.0,
                          backgroundColor: Colors
                              .transparent,
                        ),
                      ),
                    ],
                  ),),
                  SizedBox(width: width * .02),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                  width: width * .3,
                        child: Text(
                          "$chatname",
                          style: Theme.of(context).textTheme.titleSmall,
                          softWrap: true,
                          maxLines: 2,
                        ),
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      Text(
                        "Hey! How\'s it going?",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: ispageloading==false?Center(child: CircularProgressIndicator(),): Container(
            child: Column(
              children: [
                // SizedBox(height: height*.03),

                // AcceptRequestwidget(),

                SizedBox(
                  height: Get.height * 0.02,
                ),

                // switch (
                //     MakerRequestDetailsControllerinstance.rxRequestStatus.value) {
                //   case Status.LOADING:
                //     return const Center(child: Text(""));
                //   case Status.ERROR:
                //     if (MakerRequestDetailsControllerinstance.error.value ==
                //         'No internet') {
                //       return InterNetExceptionWidget(
                //         onPress: () {},
                //       );
                //     } else {
                //       return GeneralExceptionWidget(onPress: () {});
                //     }


                Expanded(
                  child:  StreamBuilder<QuerySnapshot>(
                    stream: _firestore
                        .collection("m"+ ViewMakerProfileDetailsControllerinstance
                        .ViewProfileDetail.value.ProfileDetail!.id
                        .toString())
                        .doc(roomid)
                        .collection('massages')
                        .orderBy("time", descending: true)
                        .snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      return snapshot.data != null
                          ?  ListView.builder(
                        reverse: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          final message = snapshot
                              .data!.docs[index]['message']
                              .toString();


                          if(message.isNotEmpty){
                            ismessage=true;
                          }                            final timestamp = snapshot.data!.docs[index]['time']
                          as Timestamp?; // Assuming 'time' is the timestamp field
                          final isSentByCurrentUser = snapshot
                              .data!.docs[index]['sentby']
                              .toString() ==
                              "m"+ ViewMakerProfileDetailsControllerinstance
                                  .ViewProfileDetail
                                  .value
                                  .ProfileDetail!
                                  .id
                                  .toString();

                          return Align(
                            alignment: isSentByCurrentUser
                                ? Alignment.centerRight
                                : Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment:isSentByCurrentUser
                                  ? MainAxisAlignment.end
                                  : MainAxisAlignment.start,
                              children: [
                                SizedBox(width: Get.width*0.02,),
                                if(snapshot
                                    .data!.docs[index]['sentby']
                                    .toString() !=
                                    "m"+  ViewMakerProfileDetailsControllerinstance
                                        .ViewProfileDetail
                                        .value
                                        .ProfileDetail!
                                        .id
                                        .toString())   CircleAvatar(radius: 10,backgroundImage: NetworkImage(snapshot
                                    .data!.docs[index]['profileimage']
                                    .toString()),),
                                Padding(

                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: EdgeInsets.all(8.0),
                                    decoration: BoxDecoration(
                                      color: isSentByCurrentUser
                                          ? Color(0xffFFCCCB)
                                          : Color(0xffcce7e8),
                                      borderRadius: isSentByCurrentUser
                                          ? BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8),
                                        bottomLeft: Radius.circular(8),
                                      )
                                          : BorderRadius.only(
                                        topRight: Radius.circular(8),
                                        bottomRight: Radius.circular(8),
                                        bottomLeft: Radius.circular(8),
                                      ),
                                    ),
                                    child: Column(
                                      crossAxisAlignment: isSentByCurrentUser
                                          ? CrossAxisAlignment.end
                                          : CrossAxisAlignment.start,
                                      children: [
                                        if (snapshot.data!.docs[index]['type']
                                            .toString() ==
                                            "text")
                                          Text(
                                            breakMessage(message),
                                            style: TextStyle(color: Colors.black),
                                          ),
                                        if (snapshot.data!.docs[index]['type']
                                            .toString() ==
                                            "img")
                                          Container(
                                            height: 150,
                                            width: 100,
                                            child: CachedNetworkImage(
                                              imageUrl: snapshot
                                                  .data!.docs[index]['imageurl']
                                                  .toString(),
                                              progressIndicatorBuilder: (context,
                                                  url, downloadProgress) =>
                                                  Center(
                                                      child:
                                                      CircularProgressIndicator(
                                                          value:
                                                          downloadProgress
                                                              .progress)),
                                              errorWidget:
                                                  (context, url, error) =>
                                                  Icon(Icons.error),
                                            ),
                                          ),

                                        if(snapshot.data!.docs[index]['type'].toString()=="audio") CustomAudioPlayer(audioUrl:snapshot.data!.docs[index]['audiourl'].toString() ,),

                                        //        Container(r
                                        //   alignment: AlignmentDirectional.bottomEnd,
                                        //   height: 70,
                                        //   width: 200,
                                        //   decoration: BoxDecoration(
                                        //     borderRadius: BorderRadius.circular(20),
                                        //     color: Colors.black,
                                        //   ),
                                        //   child: Padding(
                                        //     padding: const EdgeInsets.all(20.0),
                                        //     child: Row(
                                        //       children: [
                                        //         Stack(
                                        //           children: [
                                        //             SizedBox(

                                        //               width: 30,
                                        //               height: 30,
                                        //               child: StreamBuilder(
                                        //                 stream: playerx.streams.position,
                                        //                 builder: (context, snapshot) {
                                        //                   return CircularProgressIndicator(
                                        //                     strokeWidth: 2,
                                        //                     color: Colors.white,
                                        //                     value: loading
                                        //                         ? null
                                        //                         : playerx.position.inSeconds /
                                        //                         max(playerx.duration.inSeconds, 0.01),
                                        //                   );
                                        //                 },
                                        //               ),
                                        //             ),
                                        //             SizedBox(

                                        //               width: 30,
                                        //               height: 30,
                                        //               child: FloatingActionButton(
                                        //                 disabledElevation: 0,
                                        //                 elevation: 0,
                                        //                 focusElevation: 0,
                                        //                 hoverElevation: 0,
                                        //                 highlightElevation: 0,
                                        //                 backgroundColor: Colors.teal.withOpacity(0.1),
                                        //                 onPressed: () {
                                        //                   setState(() {
                                        //                     playerx.toggle();
                                        //                   });
                                        //                 },
                                        //                 child: DefaultTextStyle(
                                        //                   style: const TextStyle(color: Colors.black87),
                                        //                   child: StreamBuilder(
                                        //                     stream: playerx.streams.position,
                                        //                     builder: (context, snapshot) {
                                        //                       return playerx.playing
                                        //                           ? const Icon(
                                        //                         Icons.pause,
                                        //                         color: Colors.white,
                                        //                         size: 20,
                                        //                       )
                                        //                           : const Icon(
                                        //                         Icons.play_arrow,
                                        //                         color: Colors.white,
                                        //                         size: 20,
                                        //                       );
                                        //                     },
                                        //                   ),
                                        //                 ),
                                        //               ),
                                        //             ),
                                        //           ],
                                        //         ),
                                        //         Expanded(
                                        //           child: Container(

                                        //             width: double.infinity,
                                        //             child: StreamBuilder(
                                        //                 stream: playerx.streams.position,
                                        //                 builder: (context, AsyncSnapshot<Duration> snapshot) {
                                        //                   loading = false;
                                        //                   return Slider(
                                        //                     value: position,
                                        //                     min: 0,
                                        //                     max: 100,
                                        //                     onChangeStart: (double value) {
                                        //                       _changingPosition = true;
                                        //                     },
                                        //                     onChangeEnd: (double value) {
                                        //                       _changingPosition = false;
                                        //                     },
                                        //                     onChanged: (double value) {
                                        //                       setState(() {
                                        //                         loading = true;
                                        //                         _position = Duration(
                                        //                             seconds:
                                        //                             ((value / 100) * playerx.duration.inSeconds)
                                        //                                 .toInt());
                                        //                         playerx.position = _position;
                                        //                       });
                                        //                     },
                                        //                   );
                                        //                 }),
                                        //           ),
                                        //         )
                                        //       ],
                                        //     ),
                                        //   ),
                                        // ),
                                        //CustomAudioPlayerWidget(audioUrl: snapshot.data!.docs[index]['audiourl'].toString(),),

                                        //  CustomAudioPlayer(audioUrl:snapshot.data!.docs[index]['audiourl'].toString() ,),
                                        SizedBox(height: 4), // Adjust the spacing as needed
                                        if (timestamp != null)  Text(
                                          formatTimestamp(timestamp), // Format timestamp as needed
                                          style: TextStyle(color: Colors.grey, fontSize: 12),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ):Container();

                    },
                  ),
                ),

                // Obx(() {
                //   switch (
                //       ViewRequestDetailsControllerinstance.rxRequestStatus.value) {
                //     case Status.LOADING:
                //       return const Center(child: CircularProgressIndicator());
                //     case Status.ERROR:
                //       if (ViewRequestDetailsControllerinstance.error.value ==
                //           'No internet') {
                //         return InterNetExceptionWidget(
                //           onPress: () {},
                //         );
                //       } else {
                //         return GeneralExceptionWidget(onPress: () {});
                //       }
                //     case Status.COMPLETED:
                //       return StreamBuilder<DocumentSnapshot>(
                //         stream: _firestore
                //             .collection("RoomId's")
                //             .doc(ViewRequestDetailsControllerinstance
                //                 .ViewProfileDetail.value.data!.roomId
                //                 .toString())
                //             .collection('typestatus')
                //             .doc(
                //                 "userstypingstatus") // Replace with the actual document ID
                //             .snapshots(),
                //         builder: (BuildContext context,
                //             AsyncSnapshot<DocumentSnapshot> snapshot) {
                //           if (snapshot.connectionState == ConnectionState.waiting) {
                //             return Center(child: CircularProgressIndicator());
                //           }

                //           if (!snapshot.hasData || !snapshot.data!.exists) {
                //             return Center(
                //               child: Text("No status data yet."),
                //             );
                //           }

                //           Map<String, dynamic> statusData =
                //               snapshot.data!.data() as Map<String, dynamic>;
                //           String status = statusData['status']
                //               .toString(); // Assuming 'status' is the field name
                //           String id = statusData['id']
                //               .toString(); // Assuming 'status' is the field name

                //           return id !=
                //                       ViewSikerProfileDetailsControllerinstance
                //                           .ViewProfileDetail
                //                           .value
                //                           .profileDetails![0]
                //                           .id
                //                           .toString() &&
                //                   status == "true"
                //               ? Align(
                //                   child: Padding(
                //                     padding: const EdgeInsets.all(8.0),
                //                     child: Container(
                //                         padding: EdgeInsets.all(8.0),
                //                         decoration: BoxDecoration(
                //                           color: Color(0xffcce7e8),
                //                           borderRadius: BorderRadius.only(
                //                             topRight: Radius.circular(8),
                //                             bottomRight: Radius.circular(8),
                //                             bottomLeft: Radius.circular(8),
                //                           ),
                //                         ),
                //                         child: Row(
                //                           children: [
                //                             Text(
                //                               "typing...",
                //                               style: TextStyle(color: Colors.black),
                //                             ),
                //                           ],
                //                         )),
                //                   ),
                //                 )
                //               : Container();
                //         },
                //       );
                //   }
                // }),

                if(ismessage==false)    Row(
                  children: [
                    Wrap(
                      runSpacing: 8.0,
                      spacing: 6.0,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // messagecontroller.text = "Hello!";
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            height: height * .04,
                            width: width * .18,
                            child: Center(
                              child: Text(
                                "Hello!",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // messagecontroller.text = "How are you?";
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            height: height * .04,
                            width: width * .3,
                            child: Center(
                              child: Text(
                                "How are you?",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // messagecontroller.text = "What are you doing?";
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            height: height * .04,
                            width: width * .37,
                            child: Center(
                              child: Text(
                                "What are you doing?",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.grey),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),


                SizedBox(height: Get.height*0.02,),



              ],
            ),
          ),
          bottomNavigationBar:  TapRegion(
            onTapOutside: (event) => FocusScope.of(context).unfocus(),
            child: Container(
              padding: MediaQuery.of(context).viewInsets,

              width:Get.width,child:  Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    child: isRecording
                        ? AudioWaveforms(
                      enableGesture: true,
                      size: Size(
                          MediaQuery.of(context).size.width / 2,
                          50),
                      recorderController: recorderController,
                      waveStyle: const WaveStyle(
                        waveColor: Colors.black,
                        extendWaveform: true,
                        showMiddleLine: false,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: const Color(0xFF1E1B26),
                      ),
                      padding: const EdgeInsets.only(left: 18),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15),
                    )
                        : Container(
                      width:
                      MediaQuery.of(context).size.width / 1.7,
                      height: 50,
                      decoration: BoxDecoration(
                        border: Border.all(),
                        // color: const Color(0xFF1E1B26),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: const EdgeInsets.only(left: 18),
                      margin: const EdgeInsets.symmetric(
                          horizontal: 15),
                      child: TextField(
                    //     // readOnly: true,

                        controller: messagecontroller,
                        style: TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          
                          hintText: "Type Something...",
                          hintStyle: const TextStyle(
                              color: Colors.black),
                          contentPadding:
                          const EdgeInsets.only(top: 16),
                          border: InputBorder.none,

                          suffixIcon: IconButton(
                            onPressed: (){
                              showOptionsDialog(context);
                            },
                            icon: Icon(Icons.adaptive.share),
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(

                    onPressed:(){{
                       String userMessage = messagecontroller.text.trim();
                                      if(userMessage.isNotEmpty){
                      onSendMessage();
                    }
                    }
                    } ,
                    icon: Icon(
                      isRecording ? Icons.refresh : Icons.send,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 16),
                  IconButton(
                    onPressed: _startOrStopRecording,
                    icon: Icon(isRecording ? Icons.send : Icons.mic),
                    color: Colors.black,
                    iconSize: 28,
                  ),
                ],
              ),
            ),),
          ),
        ));
  }



  String breakMessage(String message) {




    var words = message.length; // Count of characters in the string
    var lines = "";
    var linesBreak="";// Variable to store the characters in separate lines

    for (int i = 0; i < words; i++) {
      // Concatenating characters to create separate lines
      if (linesBreak.length == 30) {
        linesBreak="";
        lines += '\n';
        print(lines);// Add a line break for each non-space character
      }

      lines += message[i];
      linesBreak += message[i];
      print(lines);

    }
    // List<String> words = message.split(' ');
    // List<String> lines = [];
    // for (int i = 0; i < words.length; i += 9) {
    //   lines.add(words.skip(i).take(9).join(' '));
    // }
    // return lines.join('\n');
    return lines;
  }





  void _startOrStopRecording() async {
    try {
      if (isRecording) {
        recorderController.reset();

        final path = await recorderController.stop(false);

        if (path != null) {
          isRecordingCompleted = true;
          debugPrint(path);
          debugPrint("Recorded file size: ${File(path).lengthSync()}");
          _uploadAudioToFirebase(File(path));
        }
      } else {
        await recorderController.record(path: path!);
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      setState(() {
        isRecording = !isRecording;
      });
    }
  }

  void _refreshWave() {
    if (isRecording) recorderController.refresh();
  }


}