  import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class ShowAllImage extends StatefulWidget {
//     const ShowAllImage({super.key});
//
//     @override
//     State<ShowAllImage> createState() => _ShowAllImageState();
//   }
//
//   class _ShowAllImageState extends State<ShowAllImage> {
//     final _pageController = PageController();
//     static const _kDuration = Duration(milliseconds: 300);
//     static const _kCurve = Curves.ease;
//
//     final List<ImageProvider> _imageProviders = [
//       Image.network("https://picsum.photos/id/1001/4912/3264").image,
//       Image.network("https://picsum.photos/id/1003/1181/1772").image,
//       Image.network("https://picsum.photos/id/1004/4912/3264").image,
//       Image.network("https://picsum.photos/id/1005/4912/3264").image
//     ];
//
//     late final _easyEmbeddedImageProvider = MultiImageProvider(_imageProviders);
//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         body: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//
//                 ElevatedButton(
//                     child: const Text("Show Multiple Images (Custom)"),
//                     onPressed: () {
//
//                     }),
//                 SizedBox(
//                   width: MediaQuery.of(context).size.width,
//                   height: MediaQuery.of(context).size.height / 2.0,
//                   child: EasyImageViewPager(
//                       easyImageProvider: _easyEmbeddedImageProvider,
//                       pageController: _pageController),
//                 ),
//
//               ],
//             )),
//       );
//     }
//   }

  class CustomImageProvider extends EasyImageProvider {
    @override
    final int initialIndex;
    final List<String> imageUrls;


    CustomImageProvider({required this.imageUrls, this.initialIndex = 0})
        : super();

    @override
    ImageProvider<Object> imageBuilder(BuildContext context, int index) {
      return  CachedNetworkImageProvider(imageUrls[index]);
    }

    @override
    int get imageCount => imageUrls.length;
  }

