import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/SeekerMyProfileDetailsController/SeekerMyProfileController.dart';
import 'package:cupid_match/controllers/controller/ViewProfileDetailsController/ViewProfileDetailsController.dart';
import 'package:cupid_match/controllers/controller/ViewSikerDetailsController/ViewSikerDetaolsController.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/res/components/general_exception.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../viewMakerProfileinseeker/ShowAllImage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ViewSikerProfileDetailsControllernstance =
      Get.put(ViewSikerProfileDetailsController());

  final seekerMyProfileDetailsController =
      Get.put(SeekerMyProfileDetailsController());
  @override
  void initState() {
    // ViewSikerProfileDetailsControllernstance.ViewSikerProfileDetailsApiHit();
    seekerMyProfileDetailsController.SeekerMyProfileDetailsApiHit();

    setState(() {
      userIdsiker = null;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      onRefresh: ()async {
        seekerMyProfileDetailsController.SeekerMyProfileDetailsApiHit();
      },
      child: Scaffold(body: Obx(() {
        switch (seekerMyProfileDetailsController.rxRequestStatus.value) {
          case Status.LOADING:
            return const Center(child: CircularProgressIndicator());
          case Status.ERROR:
            if (seekerMyProfileDetailsController.error.value == 'No internet') {
              return InterNetExceptionWidget(
                onPress: () {},
              );
            } else {
              return GeneralExceptionWidget(onPress: () {});
            }
          case Status.COMPLETED:
            return SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      height: height * 1,
                      width: width * 1,
                      child: Stack(
                        children: [
                          //ViewSikerProfileDetailsControllernstance.ViewProfileDetail.value.profileDetails![0].imgPath.toString()
                          Container(
                            width: width * 1,
                            height: height * 0.4,
                            child: InkWell(
                              child: CachedNetworkImage(
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                fit: BoxFit.cover,
                                imageUrl:  seekerMyProfileDetailsController
                                    .SeekerMyProfileDetail
                                    .value.ProfileDetail!
                                    .imgPath
                                    .toString(), // Replace with your actual image URL
                              ),
                              onTap: () {
                                showImageViewer(
                                    context,
                                   CachedNetworkImageProvider( seekerMyProfileDetailsController
                                       .SeekerMyProfileDetail
                                       .value.ProfileDetail!
                                       .imgPath
                                       .toString())
                                       ,
                                    swipeDismissible: false,
                                    doubleTapZoomable: true);
                              },
                            ),
                          ),

                          // Positioned(
                          //     top: 30,
                          //     left: 20,
                          //     child: GestureDetector(
                          //       onTap: () {
                          //         Get.back();
                          //       },
                          //       child: Icon(
                          //         Icons.arrow_back,
                          //         size: 20,
                          //         color: Colors.black,
                          //       ),
                          //     )),
                          Positioned(
                            top: 270,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40)),
                              height: height * .7,
                              width: width * 1,
                              child: Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: ListView(
                                  children: [
                                    SizedBox(height: height * .02),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                               seekerMyProfileDetailsController
                                                    .SeekerMyProfileDetail
                                                    .value.ProfileDetail!
                                                    .name
                                                    .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headlineMedium),
                                            SizedBox(
                                              height: height * .01,
                                            ),
                                            Text(
                                                seekerMyProfileDetailsController
                                                    .SeekerMyProfileDetail
                                                    .value.ProfileDetail!
                                                            .occupation ==
                                                        null
                                                    ? ""
                                                    :  seekerMyProfileDetailsController
                                                    .SeekerMyProfileDetail
                                                    .value.ProfileDetail!
                                                        .occupation
                                                        .toString(),
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyMedium!
                                                    .copyWith(color: Colors.grey)),
                                          ],
                                        ),
                                        Image.asset("assets/icons/send.png")
                                      ],
                                    ),
                                    // SizedBox(height: height * .02),
                                    // Center(
                                    //   child: Image.asset("assets/images/vedio.png"),
                                    // ),
                                    SizedBox(height: height * .02),
                                    Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Location",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleSmall),
                                              SizedBox(
                                                height: height * .01,
                                              ),
                                              Container(
                                                        width: Get.width*0.7,
                                                child: Text(
                                                    seekerMyProfileDetailsController
                                                        .SeekerMyProfileDetail
                                                        .value.ProfileDetail!
                                                        .address
                                                        .toString(),
                                                  style: TextStyle(color: Colors.black),

                                                  overflow: TextOverflow.ellipsis,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: height * .05,
                                            width: width * .18,
                                            decoration: BoxDecoration(
                                              color: Colors.blue.shade50,
                                              borderRadius: BorderRadius.circular(10),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.location_on_outlined,
                                                  size: 20,
                                                  color: Color(0xff000CAA),
                                                ),
                                                Text(
                                                  "1 km",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodySmall!
                                                      .copyWith(
                                                          color: Color(0xff000CAA)),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: height * .03),
                                    Text("Mobile Number",
                                        style:
                                            Theme.of(context).textTheme.titleSmall),
                                    SizedBox(
                                      height: height * .01,
                                    ),
                                    Text(  seekerMyProfileDetailsController
                                                        .SeekerMyProfileDetail
                                                        .value.ProfileDetail!
                                                        .phone
                                                        .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: Colors.grey)),
                                    SizedBox(height: height * .03),
                                    Text("Occupation",
                                        style:
                                            Theme.of(context).textTheme.titleSmall),
                                    SizedBox(
                                      height: height * .01,
                                    ),
                                    Text(
                                         seekerMyProfileDetailsController
                                                    .SeekerMyProfileDetail
                                                    .value.ProfileDetail!
                                                    .occupation ==
                                                null
                                            ? ""
                                            :  seekerMyProfileDetailsController
                                                    .SeekerMyProfileDetail
                                                    .value.ProfileDetail!
                                                .occupation
                                                .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: Colors.grey)),
                                    SizedBox(height: height * .03),
                                    Text("Birthday Date",
                                        style:
                                            Theme.of(context).textTheme.titleSmall),
                                    SizedBox(
                                      height: height * .01,
                                    ),
                                    Text(
                                         seekerMyProfileDetailsController
                                                    .SeekerMyProfileDetail
                                                    .value.ProfileDetail!
                                            .dob
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: Colors.grey)),
                                    SizedBox(height: height * .03),
                                    Text("About",
                                        style:
                                            Theme.of(context).textTheme.titleSmall),
                                    SizedBox(
                                      height: height * .01,
                                    ),
                                    if ( seekerMyProfileDetailsController
                                                    .SeekerMyProfileDetail
                                                    .value.ProfileDetail!
                                            .details !=
                                        null)
                                      Text(
                                           seekerMyProfileDetailsController
                                                    .SeekerMyProfileDetail
                                                    .value.ProfileDetail!
                                              .details!
                                              .bioDescription
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(color: Colors.grey)),
                                    // SizedBox(height: height * .01),
                                    // Text("Read more",
                                    //     style: Theme.of(context)
                                    //         .textTheme
                                    //         .titleSmall!
                                    //         .copyWith(color: Color(0xffFE0091))),
                                    SizedBox(height: height * .03),
                                    Text("Interests",
                                        style:
                                            Theme.of(context).textTheme.titleSmall),
                                    SizedBox(height: height * .02),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      itemCount:  seekerMyProfileDetailsController
                                                    .SeekerMyProfileDetail
                                                    .value.ProfileDetail!
                                          .details!
                                          .interestName!
                                          .length, // Replace itemCount with the actual item count
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return
                                        (index % 3 ==
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
                                    // Wrap(
                                    //   runSpacing: 15.0,
                                    //   spacing: 10.0,
                                    //   children: [

                                    //     Container(
                                    //       decoration: BoxDecoration(
                                    //           border:
                                    //               Border.all(color: Color(0xffFe0091)),
                                    //           borderRadius: BorderRadius.circular(20)),
                                    //       height: height * .04,
                                    //       width: width * .22,
                                    //       child: Row(
                                    //         mainAxisAlignment: MainAxisAlignment.center,
                                    //         children: [
                                    //           Icon(
                                    //             Icons.done_all,
                                    //             size: 15,
                                    //             color: Color(0xffFE0091),
                                    //           ),
                                    //           SizedBox(width: width * .01),
                                    //           Text(
                                    //             "Books",
                                    //             style: Theme.of(context)
                                    //                 .textTheme
                                    //                 .bodySmall!
                                    //                 .copyWith(color: Color(0xffFE0091)),
                                    //           ),
                                    //         ],
                                    //       ),
                                    //     ),
                                    //     Container(
                                    //       decoration: BoxDecoration(
                                    //           border: Border.all(color: Colors.grey),
                                    //           borderRadius: BorderRadius.circular(20)),
                                    //       height: height * .04,
                                    //       width: width * .25,
                                    //       child: Center(
                                    //         child: Text(
                                    //           "Music",
                                    //           style:
                                    //               Theme.of(context).textTheme.bodySmall,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     Container(
                                    //       decoration: BoxDecoration(
                                    //           border: Border.all(color: Colors.grey),
                                    //           borderRadius: BorderRadius.circular(20)),
                                    //       height: height * .04,
                                    //       width: width * .25,
                                    //       child: Center(
                                    //         child: Text(
                                    //           "Dancing",
                                    //           style:
                                    //               Theme.of(context).textTheme.bodySmall,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //     Container(
                                    //       decoration: BoxDecoration(
                                    //           border: Border.all(color: Colors.grey),
                                    //           borderRadius: BorderRadius.circular(20)),
                                    //       height: height * .04,
                                    //       width: width * .25,
                                    //       child: Center(
                                    //         child: Text(
                                    //           "Modeling",
                                    //           style:
                                    //               Theme.of(context).textTheme.bodySmall,
                                    //         ),
                                    //       ),
                                    //     ),
                                    //   ],
                                    // ),
                                    SizedBox(
                                      height: height * .03,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Gallery",
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleSmall,
                                        ),
                                        InkWell(
                                          child: Text(
                                            "See all",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelLarge!
                                                .copyWith(color: Color(0xff000CAA)),
                                          ),
                                          onTap: () {

                                          },
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: height * .02),

                                    if ( seekerMyProfileDetailsController
                                                    .SeekerMyProfileDetail
                                                    .value.ProfileDetail!
                                                .details !=
                                            null &&
                                         seekerMyProfileDetailsController
                                                    .SeekerMyProfileDetail
                                                    .value.ProfileDetail!
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
                                               seekerMyProfileDetailsController
                                                    .SeekerMyProfileDetail
                                                    .value.ProfileDetail!
                                                  .details!
                                                  .gallaryPath!
                                                  .length,
                                          itemBuilder:
                                              (BuildContext context, int index) {
                                            return Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: InkWell(
                                                child: CachedNetworkImage(
                                                  imageUrl:
                                                     seekerMyProfileDetailsController
                                                      .SeekerMyProfileDetail
                                                      .value.ProfileDetail!
                                                          .details!
                                                          .gallaryPath![index]
                                                          .toString(),
                                                  fit: BoxFit.cover,
                                                  placeholder: (context, url) => Center(
                                                      child:
                                                          CircularProgressIndicator()), // Placeholder widget while loading
                                                  errorWidget: (context, url,
                                                          error) =>
                                                      Icon(Icons
                                                          .error), // Error widget if loading fails
                                                ),
                                                onTap: () {
                                                  List<String> imageUrl=[];
                                                  seekerMyProfileDetailsController
                                                      .SeekerMyProfileDetail
                                                      .value.ProfileDetail!
                                                      .details!
                                                      .gallaryPath?.forEach((element) {return imageUrl.add(element.toString());});
                                                  CustomImageProvider customImageProvider = CustomImageProvider(
                                                      imageUrls:imageUrl ,
                                                      initialIndex: index);
                                                  showImageViewerPager(context, customImageProvider,
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

                                    SizedBox(
                                      height: Get.height * 0.04,
                                    ),
                                    // StaggeredGrid.count(
                                    //     crossAxisCount: 4,
                                    //     mainAxisSpacing: 7,
                                    //     crossAxisSpacing: 7,
                                    //     children: [
                                    //       StaggeredGridTile.count(
                                    //           crossAxisCellCount: 2,
                                    //           mainAxisCellCount: 2,
                                    //           child: imageContainer(
                                    //               "https://img.freepik.com/premium-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg")),
                                    //       StaggeredGridTile.count(
                                    //           crossAxisCellCount: 2,
                                    //           mainAxisCellCount: 2,
                                    //           child: imageContainer(
                                    //               "https://img.freepik.com/premium-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg")),
                                    //       StaggeredGridTile.count(
                                    //           crossAxisCellCount: 1,
                                    //           mainAxisCellCount: 1,
                                    //           child: imageContainer(
                                    //               "https://img.freepik.com/premium-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg")),
                                    //       StaggeredGridTile.count(
                                    //           crossAxisCellCount: 1,
                                    //           mainAxisCellCount: 1,
                                    //           child: imageContainer(
                                    //               "https://img.freepik.com/premium-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg")),
                                    //       StaggeredGridTile.count(
                                    //           crossAxisCellCount: 1,
                                    //           mainAxisCellCount: 1,
                                    //           child: imageContainer(
                                    //               "https://img.freepik.com/premium-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg")),
                                    //       StaggeredGridTile.count(
                                    //           crossAxisCellCount: 1,
                                    //           mainAxisCellCount: 1,
                                    //           child: imageContainer(
                                    //               "https://img.freepik.com/premium-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg")),
                                    //     ]),
                                    SizedBox(height: height * .1),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
        }
      })),
    );
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

  Widget buildContainer(int index) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    if (index <
       seekerMyProfileDetailsController
                                                .SeekerMyProfileDetail
                                                .value.ProfileDetail!.details!.interestName!.length) {
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
              seekerMyProfileDetailsController
                                                  .SeekerMyProfileDetail
                                                  .value.ProfileDetail!.details!.interestName![index].title.toString(),
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
}
