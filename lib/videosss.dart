//
// import 'package:chewie/chewie.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'dart:io';
// void main() => runApp(MyApp());
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: VideoPlayerView(
//         url:
//         'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4',
//         dataSourceType: DataSourceType.network,
//       ),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class VideoPlayerView extends StatefulWidget {
//   const VideoPlayerView({
//     super.key,
//     required this.url,
//     required this.dataSourceType,
//   });
//
//   final String url;
//
//   final DataSourceType dataSourceType;
//
//   @override
//   State<VideoPlayerView> createState() => _VideoPlayerViewState();
// }
//
// class _VideoPlayerViewState extends State<VideoPlayerView> {
//   late VideoPlayerController _videoPlayerController;
//
//   late ChewieController _chewieController;
//
//   @override
//   void initState() {
//     super.initState();
//
//     switch (widget.dataSourceType) {
//       case DataSourceType.asset:
//         _videoPlayerController = VideoPlayerController.asset(widget.url);
//         break;
//       case DataSourceType.network:
//         _videoPlayerController = VideoPlayerController.network(widget.url);
//         break;
//       case DataSourceType.file:
//         _videoPlayerController = VideoPlayerController.file(File(widget.url));
//         break;
//       case DataSourceType.contentUri:
//         _videoPlayerController =
//             VideoPlayerController.contentUri(Uri.parse(widget.url));
//         break;
//     }
//
//     _videoPlayerController.initialize().then(
//           (_) => setState(
//             () => _chewieController = ChewieController(
//           videoPlayerController: _videoPlayerController,
//           aspectRatio: 16 / 9,
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _videoPlayerController.dispose();
//     _chewieController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Text(
//             widget.dataSourceType.name.toUpperCase(),
//             style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//           ),
//           const Divider(),
//           AspectRatio(
//             aspectRatio: 16 / 9,
//             child: Chewie(controller: _chewieController),
//           ),
//         ],
//       ),
//     );
//   }
// }