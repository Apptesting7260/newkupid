import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/controllers/controller/ViewMakerProfileDetailsController/ViewMakerProfileDetailscontroller.dart';
import 'package:cupid_match/controllers/sikerProfileController/sikershortprofilecontrller.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/res/components/general_exception.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShortProfileMaker extends StatefulWidget {
  const ShortProfileMaker({super.key});

  @override
  State<ShortProfileMaker> createState() => _ShortProfileMakerState();
}

class _ShortProfileMakerState extends State<ShortProfileMaker> {

      final ViewMakerProfileDetailsControllerinstance=Get.put(ViewMakerProfileDetailsController());
@override
  void initState() {
        ViewMakerProfileDetailsControllerinstance.ViewMakerProfileDetailsApiHit();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
            final height = MediaQuery.of(context).size.height;
        final width = MediaQuery.of(context).size.width;
    return Obx(() {
          switch (ViewMakerProfileDetailsControllerinstance.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              if (ViewMakerProfileDetailsControllerinstance.error.value == 'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {},
                );
              } else {
                return GeneralExceptionWidget(onPress: () {});
              }
            case Status.COMPLETED:
              return  AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          'assets/images/remove.png',
                          height: height * .03,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Profile",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  CircleAvatar(
                    radius: 52,
                    backgroundImage: CachedNetworkImageProvider(
                       ViewMakerProfileDetailsControllerinstance.ViewProfileDetail.value.ProfileDetail!.imgPath.toString()),
                  ),
                  SizedBox(height: height * 0.04),
                  Text(
                     ViewMakerProfileDetailsControllerinstance.ViewProfileDetail.value.ProfileDetail!.name.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: height * 0.01),
                  Text(
                   "",
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w400, color: Color(0xff777777)),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Sex",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: " Male",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff777777)))
                  ])),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Experience:",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: "${ViewMakerProfileDetailsControllerinstance.ViewProfileDetail.value.ProfileDetail!.makerExperience.toString()}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff777777)))
                  ])),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Matches completed: ",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: ViewMakerProfileDetailsControllerinstance.ViewProfileDetail.value.ProfileDetail!.matchsCompleted.toString(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff777777)))
                  ])),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Successful Matches: ",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.w600)),
                    TextSpan(
                        text:ViewMakerProfileDetailsControllerinstance.ViewProfileDetail.value.ProfileDetail!.matchsSuccessfull.toString(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff777777)))
                  ])),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Liked Profile: ",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall
                            ?.copyWith(fontWeight: FontWeight.w600)),
                    TextSpan(
                        text: ViewMakerProfileDetailsControllerinstance.ViewProfileDetail.value.ProfileDetail!.likedProfile.toString(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontWeight: FontWeight.w400,
                            color: Color(0xff777777)))
                  ])),
                  SizedBox(height: height * 0.04),
                  MyButton(
                    width: width * .5,
                    title: "View All Request",
                    onTap: () {},
                  )
                ],
              ),
            ),);}});
  }
}