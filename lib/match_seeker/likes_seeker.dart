import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/controllers/controller/LikeListController/LikeListController.dart';
import 'package:cupid_match/match_maker/invite_state.dart';
import 'package:cupid_match/match_seeker/viewMakerProfileinseeker/ViewMakerProfile.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../GlobalVariable/GlobalVariable.dart';
import '../data/response/status.dart';
import '../res/colors/app_color.dart';
import '../res/components/general_exception.dart';
import '../res/components/internet_exceptions_widget.dart';
import '../widgets/seekershortprofile.dart';

class LikesSeeker extends StatefulWidget {
  const LikesSeeker({Key? key}) : super(key: key);

  @override
  State<LikesSeeker> createState() => _LikesSeekerState();
}

class _LikesSeekerState extends State<LikesSeeker> {
  final LikeListControllerinstance = Get.put(LikeListController());

  @override
  void initState() {
    LikeListControllerinstance.LikeListApiHit();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return RefreshIndicator(
      onRefresh: () async {
        LikeListControllerinstance.LikeListApiHit();
      },
      child: Scaffold(
          appBar: AppBar(
            // leading: IconButton(
            //     onPressed: () {
            //       Get.back();
            //     },
            //     icon: Icon(
            //       Icons.arrow_back,
            //       color: Color(0xff5A5A5A),
            //       size: 27,
            //     )),

            title: Text(
              "Likes",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontWeight: FontWeight.w600),
            ),
            centerTitle: true,
          ),
          body: Obx(() {
            switch (LikeListControllerinstance.rxRequestStatus.value) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                if (LikeListControllerinstance.error.value == 'No internet') {
                  return InterNetExceptionWidget(
                    onPress: () {},
                  );
                } else {
                  return GeneralExceptionWidget(onPress: () {});
                }
              case Status.COMPLETED:
                return Column(
                  children: [
                    Container(
                      width: Get.width * 0.9,
                      height: Get.height * 0.065,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color.fromRGBO(242, 242, 242, 1)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: GestureDetector(
                                onTap: () {
                                  LikeListControllerinstance
                                      .button_maker.value = true;
                                  LikeListControllerinstance
                                      .button_seeker.value = false;
                                },
                                child: Container(
                                  width: Get.width * 0.35,
                                  height: Get.height * 0.04,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: LikeListControllerinstance
                                              .button_maker.value
                                          ? Color.fromRGBO(254, 0, 145, 1)
                                          : Color.fromRGBO(242, 242, 242, 1)),
                                  child: Center(
                                      child: Text(
                                    'Maker',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: LikeListControllerinstance
                                                .button_maker.value
                                            ? Colors.white
                                            : Colors.black),
                                  )),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 15.0),
                              child: GestureDetector(
                                onTap: () {
                                  LikeListControllerinstance
                                      .button_maker.value = false;
                                  LikeListControllerinstance
                                      .button_seeker.value = true;
                                },
                                child: Container(
                                  width: Get.width * 0.35,
                                  height: Get.height * 0.04,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: LikeListControllerinstance
                                              .button_seeker.value
                                          ? Color.fromRGBO(254, 0, 145, 1)
                                          : Color.fromRGBO(242, 242, 242, 1)),
                                  child: Center(
                                      child: Text(
                                    'Seeker',
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w700,
                                        color: LikeListControllerinstance
                                                .button_seeker.value
                                            ? Colors.white
                                            : Colors.black),
                                  )),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    LikeListControllerinstance.button_seeker.value != true
                        ? LikeListControllerinstance
                                    .LikeList.value.data!.toMaker!.length ==
                                0
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: Get.height * 0.2,
                                    ),
                                    Image.asset(
                                      'assets/images/likeem.png',
                                      width: Get.width * 0.7,
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.05,
                                    ),
                                    Text("No Like, yet.",
                                        style: Get
                                            .theme.textTheme.headlineSmall!
                                            .copyWith(
                                                color: AppColor.blackColor)),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50.0),
                                      child: Text(
                                        "Reference site about Lorem Ipsum, giving as well as a random Lipsum generator.",
                                        style: Get.theme.textTheme.bodyMedium!
                                            .copyWith(
                                                color: AppColor.blackColor,
                                                fontWeight: FontWeight.w300),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : ListView.builder(
                                itemCount: LikeListControllerinstance
                                    .LikeList.value.data!.toMaker!.length,
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Container(
                                    color: Colors.white,
                                    child: ListTile(
                                      visualDensity: VisualDensity(
                                          vertical: -3, horizontal: -2),
                                      leading: CircleAvatar(
                                        radius: 22,
                                        child: CircleAvatar(
                                          radius: 30.0,
                                          backgroundImage:
                                              CachedNetworkImageProvider(
                                                  LikeListControllerinstance
                                                      .LikeList
                                                      .value
                                                      .data!
                                                      .toMaker![index]
                                                      .likeName!
                                                      .imgPath
                                                      .toString()),
                                          backgroundColor: Colors.transparent,
                                        ),
                                      ),
                                      title: Text(
                                        LikeListControllerinstance
                                            .LikeList
                                            .value
                                            .data!
                                            .toMaker![index]
                                            .likeName!
                                            .name
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600),
                                      ),
                                      subtitle: Text(
                                        LikeListControllerinstance
                                            .LikeList
                                            .value
                                            .data!
                                            .toMaker![index]
                                            .likeName!
                                            .address
                                            .toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w300,
                                                color: Color(0xff777777)),
                                      ),
                                      trailing: GestureDetector(
                                        onTap: () {
                                          Makerid = LikeListControllerinstance
                                              .LikeList
                                              .value
                                              .data!
                                              .toMaker![index]
                                              .likeName!
                                              .id
                                              .toString();
                                          print('object');
                                          Get.to(ViewMakerProfileInSeeker());
                                        },
                                        child: Container(
                                          height: height * .04,
                                          width: width * .35,
                                          decoration: BoxDecoration(
                                            color: Color(0xffFE0091),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "View Profile",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                        : LikeListControllerinstance
                                    .LikeList.value.data!.toSeeker!.length ==
                                0
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: Get.height * 0.2,
                                    ),
                                    Image.asset(
                                      'assets/images/likeem.png',
                                      width: Get.width * 0.7,
                                    ),
                                    SizedBox(
                                      height: Get.height * 0.05,
                                    ),
                                    Text("No Like, yet.",
                                        style: Get
                                            .theme.textTheme.headlineSmall!
                                            .copyWith(
                                                color: AppColor.blackColor)),
                                    SizedBox(
                                      height: Get.height * 0.02,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50.0),
                                      child: Text(
                                        "Reference site about Lorem Ipsum, giving as well as a random Lipsum generator.",
                                        style: Get.theme.textTheme.bodyMedium!
                                            .copyWith(
                                                color: AppColor.blackColor,
                                                fontWeight: FontWeight.w300),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : ListView.builder(
                                itemCount: LikeListControllerinstance
                                    .LikeList.value.data!.toSeeker!.length,
                                scrollDirection: Axis.vertical,
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return Container(
                                    color: Colors.white,
                                    child: ListTile(
                                      visualDensity: VisualDensity(
                                          vertical: -3, horizontal: -2),
                                      leading: CircleAvatar(
                                        radius: 22,
                                        child: CircleAvatar(
                                          radius: 30.0,
                                          backgroundImage:
                                              CachedNetworkImageProvider(
                                                  LikeListControllerinstance
                                                      .LikeList
                                                      .value
                                                      .data!
                                                      .toSeeker![index]
                                                      .likeName!
                                                      .imgPath
                                                      .toString()),
                                          backgroundColor: Colors.transparent,
                                        ),
                                      ),
                                      title: Text(
                                        LikeListControllerinstance
                                            .LikeList
                                            .value
                                            .data!
                                            .toSeeker![index]
                                            .likeName!
                                            .name
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w600),
                                      ),
                                      subtitle: Text(
                                        LikeListControllerinstance
                                            .LikeList
                                            .value
                                            .data!
                                            .toSeeker![index]
                                            .likeName!
                                            .address
                                            .toString(),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall
                                            ?.copyWith(
                                                fontWeight: FontWeight.w300,
                                                color: Color(0xff777777)),
                                      ),
                                      trailing: GestureDetector(
                                        onTap: () {
                                          userIdsiker =
                                              LikeListControllerinstance
                                                  .LikeList
                                                  .value
                                                  .data!
                                                  .toSeeker![index]
                                                  .likeName!
                                                  .id
                                                  .toString();
                                          print('object');
                                          Get.to(ShortProfileSeeker());
                                        },
                                        child: Container(
                                          height: height * .04,
                                          width: width * .35,
                                          decoration: BoxDecoration(
                                            color: Color(0xffFE0091),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                          child: Center(
                                            child: Text(
                                              "View Profile",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                    if (LikeListControllerinstance.LikeList.value.message ==
                        'Data Not Found')
                      SizedBox(height: Get.height * 0.18),
                    if (LikeListControllerinstance.LikeList.value.message ==
                        'Data Not Found')
                      Center(
                        child: Column(
                          children: [
                            Image.asset(
                              'assets/images/likeem.png',
                              width: Get.width * 0.7,
                            ),
                            SizedBox(
                              height: Get.height * 0.05,
                            ),
                            Text("No Like, yet.",
                                style: Get.theme.textTheme.headlineSmall!
                                    .copyWith(color: AppColor.blackColor)),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 50.0),
                              child: Text(
                                "Reference site about Lorem Ipsum, giving as well as a random Lipsum generator.",
                                style: Get.theme.textTheme.bodyMedium!.copyWith(
                                    color: AppColor.blackColor,
                                    fontWeight: FontWeight.w300),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      )
                  ],
                );
            }
          })),
    );
  }
}
