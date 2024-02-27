import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/controller/ViewProfileDetailsController/ViewProfileDetailsController.dart';
import 'package:cupid_match/controllers/controller/ViewSikerDetailsController/ViewSikerDetaolsController.dart';
import 'package:cupid_match/controllers/sikerProfileController/sikershortprofilecontrller.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/match_seeker/viewMakerProfileinseeker/ShowAllImage.dart';
import 'package:cupid_match/res/assets/image_assets.dart';
import 'package:cupid_match/res/components/general_exception.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:dio/dio.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/controller/LikeListController/LikeController.dart';
import '../controllers/controller/MakerLikeListController/MakerLikeListController.dart';

class ShortProfileSeeker extends StatefulWidget {
  const ShortProfileSeeker({Key? key}) : super(key: key);

  @override
  State<ShortProfileSeeker> createState() => _ShortProfileSeekerState();
}

class _ShortProfileSeekerState extends State<ShortProfileSeeker> {
  final ViewSikerProfileDetailsControllerinstance =
      Get.put(SikerShortProfileDetailsController());
  LikeController likeController = Get.put(LikeController());

  @override
  void initState() {
    ViewSikerProfileDetailsControllerinstance.ViewSikerProfileDetailsApiHit();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined),
          ),
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Details",
            style: TextStyle(color: AppColors.black),
          ),
        ),
        body: Obx(() {
          switch (
              ViewSikerProfileDetailsControllerinstance.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.pinkAccent,
              ));
            case Status.ERROR:
              if (ViewSikerProfileDetailsControllerinstance.error.value ==
                  'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {
                    ViewSikerProfileDetailsControllerinstance.ViewSikerProfileDetailsApiHit();

                  },
                );
              } else {
                return GeneralExceptionWidget(onPress: () {
                  ViewSikerProfileDetailsControllerinstance.ViewSikerProfileDetailsApiHit();

                });
              }
            case Status.COMPLETED:
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: height * 0.22,
                          width: width,
                          color: Colors.white,
                        ),
                        Center(
                          child: Container(
                            height: height * 0.1,
                            width: width,
                            color: Color(0xffF3F3F3),
                          ),
                        ),
                        Positioned(
                          left: 115,
                          top: height * 0.03,
                          child: Stack(children: [
                            Container(
                                height: Get.height * 0.22,
                                child: CircleAvatar(
                                  radius: 60,
                                  backgroundColor: Colors.transparent,
                                  backgroundImage: CachedNetworkImageProvider(
                                      ViewSikerProfileDetailsControllerinstance
                                          .ViewProfileDetail
                                          .value
                                          .profileDetails![0]
                                          .imgPath
                                          .toString()),
                                )),
                            Obx(() => Positioned(
                                  bottom: 0,
                                  left: Get.width * 0.10,
                                  child: ViewSikerProfileDetailsControllerinstance
                                              .ViewProfileDetail
                                              .value
                                              .profileDetails![0]
                                              .loding
                                              .value ==
                                          true
                                      ? CircleAvatar(
                                          radius: 25,
                                          backgroundColor: Colors.white,
                                          child: CupertinoActivityIndicator(
                                            color: Colors.pinkAccent,
                                          ),
                                        )
                                      : ViewSikerProfileDetailsControllerinstance
                                                  .ViewProfileDetail
                                                  .value
                                                  .profileDetails![0]
                                                  .likeStatus !=
                                              1
                                          ? GestureDetector(
                                              onTap: () async {
                                                final SharedPreferences prefs = await SharedPreferences.getInstance();
                                                if(prefs.getString('Usertype')=="1"){
                                                  profileLike = '1';
                                                  like_type = '3';
                                                  LikeTo =
                                                      ViewSikerProfileDetailsControllerinstance
                                                          .ViewProfileDetail
                                                          .value
                                                          .profileDetails![0]
                                                          .id
                                                          .toString();

                                                  ViewSikerProfileDetailsControllerinstance
                                                      .ViewProfileDetail
                                                      .value
                                                      .profileDetails![0]
                                                      .loding
                                                      .value = true;
                                                  likeController.LikeApiHit();
                                                  print("object");

                                                }
                                                else{
                                                  profileLike = '1';
                                                  like_type = '1';
                                                  LikeTo =
                                                      ViewSikerProfileDetailsControllerinstance
                                                          .ViewProfileDetail
                                                          .value
                                                          .profileDetails![0]
                                                          .id
                                                          .toString();

                                                  ViewSikerProfileDetailsControllerinstance
                                                      .ViewProfileDetail
                                                      .value
                                                      .profileDetails![0]
                                                      .loding
                                                      .value = true;
                                                  likeController.LikeApiHit();
                                                  print("object");

                                                }

                                              },
                                              child: CircleAvatar(
                                                backgroundColor:
                                                    Colors.pinkAccent,
                                                radius: 25,
                                                child: Icon(
                                                  Icons.favorite_sharp,
                                                  color: Colors.white,
                                                  size: 25,
                                                ),
                                              ),
                                            )
                                          : GestureDetector(
                                              onTap: () async {
                                                final SharedPreferences prefs = await SharedPreferences.getInstance();
                                                if(prefs.getString('Usertype')=="1")  {
                                                  print(prefs.getString('Usertype'));
                                                  profileLike = '0';
                                                  like_type = '3';
                                                  LikeTo =
                                                      ViewSikerProfileDetailsControllerinstance
                                                          .ViewProfileDetail
                                                          .value
                                                          .profileDetails![0]
                                                          .id
                                                          .toString();

                                                  ViewSikerProfileDetailsControllerinstance
                                                      .ViewProfileDetail
                                                      .value
                                                      .profileDetails![0]
                                                      .loding
                                                      .value = true;
                                                  likeController.LikeApiHit();
                                                  print("object");
                                                }
                                                else{
                                                  profileLike = '0';
                                                  like_type = '1';
                                                  LikeTo =
                                                      ViewSikerProfileDetailsControllerinstance
                                                          .ViewProfileDetail
                                                          .value
                                                          .profileDetails![0]
                                                          .id
                                                          .toString();

                                                  ViewSikerProfileDetailsControllerinstance
                                                      .ViewProfileDetail
                                                      .value
                                                      .profileDetails![0]
                                                      .loding
                                                      .value = true;
                                                  likeController.LikeApiHit();
                                                  print("object");
                                                }
                                              },
                                              child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                radius: 25,
                                                child: Icon(
                                                  Icons.favorite_sharp,
                                                  color: Colors.pink,
                                                  size: 25,
                                                ),
                                              ),
                                            ),
                                ))
                          ]),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 18, right: 18),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: height * .03),
                          Text(
                              ViewSikerProfileDetailsControllerinstance
                                      .ViewProfileDetail
                                      .value
                                      .profileDetails![0]
                                      .name
                                      .toString() +
                                  "  28",
                              style: Theme.of(context).textTheme.titleSmall),
                          SizedBox(
                            height: height * .01,
                          ),
                          Text(
                              ViewSikerProfileDetailsControllerinstance
                                  .ViewProfileDetail
                                  .value
                                  .profileDetails![0]
                                  .occupation
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.grey)),

                          SizedBox(
                            height: height * .01,
                          ),

                          SizedBox(height: height * .03),
                          Text("About",
                              style: Theme.of(context).textTheme.titleSmall),
                          SizedBox(
                            height: height * .01,
                          ),
                          Text(
                              ViewSikerProfileDetailsControllerinstance
                                  .ViewProfileDetail
                                  .value
                                  .profileDetails![0]
                                  .details!
                                  .bioDescription
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.grey)),
                          SizedBox(height: height * .01),

                          SizedBox(height: height * .03),
                          Text("Occupation",
                              style: Theme.of(context).textTheme.titleSmall),
                          SizedBox(height: height * .02),
                          Text('Electrician',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.grey)),

                          SizedBox(height: height * .02),

                          Text("Birthday Date",
                              style: Theme.of(context).textTheme.titleSmall),
                          SizedBox(height: height * .02),
                          Text(
                              ViewSikerProfileDetailsControllerinstance
                                  .ViewProfileDetail
                                  .value
                                  .profileDetails![0]
                                  .dob
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.grey)),
                          SizedBox(height: height * .02),

                          Text("Interests",
                              style: Theme.of(context).textTheme.titleSmall),
                          SizedBox(height: height * .02),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: ViewSikerProfileDetailsControllerinstance
                                .ViewProfileDetail
                                .value
                                .profileDetails![0]
                                .details!
                                .interestName!
                                .length,
                            // Replace itemCount with the actual item count
                            itemBuilder: (BuildContext context, int index) {
                              return (index % 3 ==
                                      0) // Start a new row after every 3 items
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: buildContainer(index),
                                        ),
                                        buildContainer(index + 1),
                                        buildContainer(index + 2),
                                      ],
                                    )
                                  : Container(); // Empty container for items that don't start a new row
                            },
                          ),

                          // Container(
                          //   child: GridView.builder(
                          //     shrinkWrap: true,
                          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          //       crossAxisCount: 3,
                          //     childAspectRatio: 3.0,

                          //     ),

                          //     itemCount: ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].details!.interest.,
                          //     itemBuilder: (BuildContext context, int index) {
                          //       return     Padding(
                          //         padding: const EdgeInsets.all(8.0),
                          //         child: Container(
                          //                           decoration: BoxDecoration(
                          //           border: Border.all(color: Colors.grey),
                          //           borderRadius: BorderRadius.circular(20)),

                          //                           child: Center(
                          //         child: Text(
                          //           ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].details!.interest![index].toString(),
                          //           style:
                          //           Theme.of(context).textTheme.bodySmall,
                          //         ),
                          //                           ),
                          //                         ),
                          //       );
                          //     },
                          //   ),
                          // ),
                          SizedBox(
                            height: height * .03,
                          ),

                          if (ViewSikerProfileDetailsControllerinstance
                                      .ViewProfileDetail
                                      .value
                                      .profileDetails![0]
                                      .details !=
                                  null &&
                              ViewSikerProfileDetailsControllerinstance
                                      .ViewProfileDetail
                                      .value
                                      .profileDetails![0]
                                      .details!
                                      .gallaryPath !=
                                  [])
                            Container(
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                ),
                                itemCount:
                                    ViewSikerProfileDetailsControllerinstance
                                        .ViewProfileDetail
                                        .value
                                        .profileDetails![0]
                                        .details!
                                        .gallaryPath!
                                        .length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            ViewSikerProfileDetailsControllerinstance
                                                .ViewProfileDetail
                                                .value
                                                .profileDetails![0]
                                                .details!
                                                .gallaryPath![index]
                                                .toString(),
                                        fit: BoxFit.cover,
                                        placeholder: (context, url) => Center(
                                            child: CupertinoActivityIndicator(
                                              color: Colors.pinkAccent,
                                            ),),
                                        // Placeholder widget while loading
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons
                                                .error), // Error widget if loading fails
                                      ),
                                      onTap: () {
                                        List<String> imageUrl = [];
                                        ViewSikerProfileDetailsControllerinstance
                                            .ViewProfileDetail
                                            .value
                                            .profileDetails![0]
                                            .details!
                                            .gallaryPath
                                            ?.forEach((element) {
                                          return imageUrl
                                              .add(element.toString());
                                        });
                                        CustomImageProvider
                                            customImageProvider =
                                            CustomImageProvider(
                                                imageUrls: imageUrl,
                                                initialIndex: index);
                                        showImageViewerPager(
                                            context, customImageProvider,
                                            onPageChanged: (page) {
                                          // print("Page changed to $page");
                                        }, onViewerDismissed: (page) {
                                          // print("Dismissed while on page $page");
                                        });
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          //  Center(
                          //    child: SizedBox(
                          //      height: height * .055,
                          //      width: width * .53,
                          //      child: ElevatedButton(
                          //        style: ElevatedButton.styleFrom(
                          //          shape: RoundedRectangleBorder(
                          //            borderRadius: BorderRadius.circular(30)
                          //          )
                          //        ),
                          //          onPressed: (){}, child: Center(
                          //        child: Text("Request",style: TextStyle(color: AppColors.white),),
                          //      )),
                          //    ),
                          //  )
                        ],
                      ),
                    ),
                  ],
                ),
              );
          }
        }));
  }

  Widget buildContainer(int index) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    if (index <
        ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value
            .profileDetails![0].details!.interestName!.length) {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xffFE0091)),
          borderRadius: BorderRadius.circular(20),
        ),
        height: height * .04,
        width: width * .25,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.done_all,
              size: 15,
              color: Color(0xffFE0091),
            ),
            SizedBox(width: width * .01),
            Container(
              width: width * .15,
              child: Text(
                ViewSikerProfileDetailsControllerinstance
                    .ViewProfileDetail
                    .value
                    .profileDetails![0]
                    .details!
                    .interestName![index]
                    .title
                    .toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Color(0xffFE0091)),
                overflow: TextOverflow.ellipsis,
                softWrap: true,
              ),
            ),
          ],
        ),
      );
    } else {
      return Container(); // Return an empty container for items beyond itemCount
    }
  }

  imageContainer(imgPath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imgPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
