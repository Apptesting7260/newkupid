

// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Player'),
//       ),
//       body: ListView(
//         children: <Widget>[
//           ChewieListItem(
//             videoPlayerController: VideoPlayerController.asset(
//               'videos/IntroVideo.mp4',
//             ),
//             looping: true,
//           ),
//           ChewieListItem(
//             looping: true,
//             videoPlayerController: VideoPlayerController.network(
//               'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
//             ),
//           ),
//           ChewieListItem(
//             // This URL doesn't exist - will display an error
//             videoPlayerController: VideoPlayerController.network(
//               'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
//             ), looping: true,
//           ),
//         ],
//       ),
//     );
//   }
// }

// class ChewieListItem extends StatefulWidget {
//   // This will contain the URL/asset path which we want to play
//   final VideoPlayerController videoPlayerController;
//   final bool looping;

//   ChewieListItem({
//     required this.videoPlayerController,
//     required this.looping,
//     Key? key,
//   }) : super(key: key);

//   @override
//   _ChewieListItemState createState() => _ChewieListItemState();
// }

// class _ChewieListItemState extends State<ChewieListItem> {
//   late ChewieController _chewieController;

//   @override
//   void initState() {
//     super.initState();
//     // Wrapper on top of the videoPlayerController
//     _chewieController = ChewieController(
//       videoPlayerController: widget.videoPlayerController,
//       aspectRatio: 16 / 9,
//       // Prepare the video to be played and display the first frame
//       autoInitialize: true,
//       looping: widget.looping,
//       // Errors can occur for example when trying to play a video
//       // from a non-existent URL
//       errorBuilder: (context, errorMessage) {
//         return Center(
//           child: Text(
//             errorMessage,
//             style: TextStyle(color: Colors.white),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Chewie(
//         controller: _chewieController,
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     // IMPORTANT to dispose of all the used resources
//     widget.videoPlayerController.dispose();
//     _chewieController.dispose();
//   }
// }