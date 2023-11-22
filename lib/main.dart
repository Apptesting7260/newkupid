
import 'package:cupid_match/utils/my_theme.dart';
import 'package:cupid_match/views/sign_up/signup_screen.dart';
import 'package:cupid_match/views/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'match_maker/match_maker_profile_update.dart';
import 'match_maker/photo_access.dart';
import 'match_maker/profile_maker.dart';
import 'match_seeker/Chose_role_Type.dart';
import 'match_seeker/SeeAllMaker/SeAllMaker.dart';
import 'match_seeker/home_screen.dart';
import 'match_seeker/lever/new_liver.dart';
import 'match_seeker/profile/interest.dart';
import 'match_seeker/profile/update_profile_details.dart';
import 'match_seeker/siker_Home_Screen.dart';

Future main()async {
    
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,

    ]);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: MyTheme.light, // home: MakerProfileDetails(),


   

      home:  SplashScreen(),
    );
  }
}





// import 'dart:io';

// import 'package:audio_waveforms/audio_waveforms.dart';

// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: 'Audio Waveforms',
//       debugShowCheckedModeBanner: false,
//       home: Home(),
//     );
//   }
// }

// class Home extends StatefulWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   late final RecorderController recorderController;

//   String? path;
//   String? musicFile;
//   bool isRecording = false;
//   bool isRecordingCompleted = false;
//   bool isLoading = true;
//   late Directory appDirectory;

//   @override
//   void initState() {
//     super.initState();
//     _getDir();
//     _initialiseControllers();
//   }

//   void _getDir() async {
//     appDirectory = await getApplicationDocumentsDirectory();
//     path = "${appDirectory.path}/recording.m4a";
//     isLoading = false;
//     setState(() {});
//   }

//   void _initialiseControllers() {
//     recorderController = RecorderController()
//       ..androidEncoder = AndroidEncoder.aac
//       ..androidOutputFormat = AndroidOutputFormat.mpeg4
//       ..iosEncoder = IosEncoder.kAudioFormatMPEG4AAC
//       ..sampleRate = 44100;
//   }

//   void _pickFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//     if (result != null) {
//       musicFile = result.files.single.path;
//       setState(() {});
//     } else {
//       debugPrint("File not picked");
//     }
//   }

//   @override
//   void dispose() {
//     recorderController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF252331),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF252331),
//         elevation: 1,
//         centerTitle: true,
//         shadowColor: Colors.grey,
//         title: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // Image.asset(
//             //   'assets/images/logo.png',
//             //   scale: 1.5,
//             // ),
//             const SizedBox(width: 10),
//             const Text('Simform'),
//           ],
//         ),
//       ),
//       body: isLoading
//           ? const Center(
//               child: CircularProgressIndicator(),
//             )
//           : SafeArea(
//               child: Column(
//                 children: [
//                   const SizedBox(height: 20),
//                   // Expanded(
//                   //   child: ListView.builder(
//                   //     itemCount: 4,
//                   //     itemBuilder: (_, index) {
//                   //       return WaveBubble(
//                   //         index: index + 1,
//                   //         isSender: index.isOdd,
//                   //         width: MediaQuery.of(context).size.width / 2,
//                   //         appDirectory: appDirectory,
//                   //       );
//                   //     },
//                   //   ),
//                   // ),
//                   // if (isRecordingCompleted)
//                   //   WaveBubble(
//                   //     path: path,
//                   //     isSender: true,
//                   //     appDirectory: appDirectory,
//                   //   ),
//                   // if (musicFile != null)
//                   //   WaveBubble(
//                   //     path: musicFile,
//                   //     isSender: true,
//                   //     appDirectory: appDirectory,
//                   //   ),
//                   SafeArea(
//                     child: Row(
//                       children: [
//                         AnimatedSwitcher(
//                           duration: const Duration(milliseconds: 200),
//                           child: isRecording
//                               ? AudioWaveforms(
//                                   enableGesture: true,
//                                   size: Size(
//                                       MediaQuery.of(context).size.width / 2,
//                                       50),
//                                   recorderController: recorderController,
//                                   waveStyle: const WaveStyle(
//                                     waveColor: Colors.white,
//                                     extendWaveform: true,
//                                     showMiddleLine: false,
//                                   ),
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(12.0),
//                                     color: const Color(0xFF1E1B26),
//                                   ),
//                                   padding: const EdgeInsets.only(left: 18),
//                                   margin: const EdgeInsets.symmetric(
//                                       horizontal: 15),
//                                 )
//                               : Container(
//                                   width:
//                                       MediaQuery.of(context).size.width / 1.7,
//                                   height: 50,
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xFF1E1B26),
//                                     borderRadius: BorderRadius.circular(12.0),
//                                   ),
//                                   padding: const EdgeInsets.only(left: 18),
//                                   margin: const EdgeInsets.symmetric(
//                                       horizontal: 15),
//                                   child: TextField(
//                                     readOnly: true,
//                                     decoration: InputDecoration(
//                                       hintText: "Type Something...",
//                                       hintStyle: const TextStyle(
//                                           color: Colors.white54),
//                                       contentPadding:
//                                           const EdgeInsets.only(top: 16),
//                                       border: InputBorder.none,
//                                       suffixIcon: IconButton(
//                                         onPressed: _pickFile,
//                                         icon: Icon(Icons.adaptive.share),
//                                         color: Colors.white54,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                         ),
//                         IconButton(
//                           onPressed: _refreshWave,
//                           icon: Icon(
//                             isRecording ? Icons.refresh : Icons.send,
//                             color: Colors.white,
//                           ),
//                         ),
//                         const SizedBox(width: 16),
//                         IconButton(
//                           onPressed: _startOrStopRecording,
//                           icon: Icon(isRecording ? Icons.stop : Icons.mic),
//                           color: Colors.white,
//                           iconSize: 28,
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }

//   void _startOrStopRecording() async {
//     try {
//       if (isRecording) {
//         recorderController.reset();

//         final path = await recorderController.stop(false);

//         if (path != null) {
//           isRecordingCompleted = true;
//           debugPrint(path);
//           debugPrint("Recorded file size: ${File(path).lengthSync()}");
//         }
//       } else {
//         await recorderController.record(path: path!);
//       }
//     } catch (e) {
//       debugPrint(e.toString());
//     } finally {
//       setState(() {
//         isRecording = !isRecording;
//       });
//     }
//   }

//   void _refreshWave() {
//     if (isRecording) recorderController.refresh();
//   }
// }