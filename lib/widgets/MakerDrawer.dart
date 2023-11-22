import 'package:cupid_match/controllers/controller/ViewMakerProfileDetailsController/ViewMakerProfileDetailscontroller.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/match_maker/Chose_Subcription.dart';
import 'package:cupid_match/match_maker/Create_Match/Create_Match.dart';
import 'package:cupid_match/match_maker/invite_state.dart';
import 'package:cupid_match/match_maker/new_matches.dart';
import 'package:cupid_match/match_maker/payment_info.dart';
import 'package:cupid_match/match_maker/pending_matches.dart';
import 'package:cupid_match/match_maker/premium.dart';
import 'package:cupid_match/match_maker/profile_maker.dart';
import 'package:cupid_match/res/components/general_exception.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../GlobalVariable/nullFunction.dart';
import '../controllers/MakerGetMyProfileDetails/MakerGetProfileDetailsController.dart';
import '../views/splash_screen.dart';

class MakerDrawer extends StatefulWidget {
  const MakerDrawer({super.key});

  @override
  State<MakerDrawer> createState() => _MakerDrawerState();
}

class _MakerDrawerState extends State<MakerDrawer> {
final ViewMakerProfileDetailsControllerinstance=Get.put(ViewMakerMyProfileDetailsController());

  @override
  void initState() {
// ViewMakerProfileDetailsControllerinstance.ViewMakerProfileDetailsApiHit();

    // TODO: implement initState
    super.initState();
  }
final box = GetStorage();

@override
  Widget build(BuildContext context) {

       final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return   Obx(() {
          switch (ViewMakerProfileDetailsControllerinstance.rxRequestStatus.value) {
            case Status.LOADING:
              // return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              if (ViewMakerProfileDetailsControllerinstance.error.value == 'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {},
                );
              } else {
                return GeneralExceptionWidget(onPress: () {});
              }
            case Status.COMPLETED:
              return   ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Color(0xffF3F3F3)),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topRight,
                        child: GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                            child: Image.asset(
                              'assets/maker/Group 115 (1).png',
                              height: 25,
                            ))),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                          ViewMakerProfileDetailsControllerinstance.ViewProfileDetail.value.requests!.imgPath.toString()),
                        backgroundColor: Colors.transparent,
                      ),

                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                       ViewMakerProfileDetailsControllerinstance.ViewProfileDetail.value.requests!.name.toString(),
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall
                              ?.copyWith(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),

                      subtitle: Padding(
                        padding: const EdgeInsets.only(right: 70, left: 0),
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => ViewProfileDetailsMaker());
                          },
                          child: Container(
                            width: 30,
                            height: height * .03,
                            decoration: BoxDecoration(
                                color: Color(0xffF3F3F3),
                                borderRadius: BorderRadius.circular(22),
                                border: Border.all(
                                    color: Color(0xff000CAA), width: 2)),
                            child: Center(
                                child: Text(
                              "View Profile",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      fontSize: 10, color: Color(0xff000CAA)),
                            )),
                          ),
                        ),
                      ),
                      // subtitle: OutlinedButton(
                      //   style: OutlinedButton.styleFrom(
                      //     shape: RoundedRectangleBorder(
                      //       borderRadius: BorderRadius.circular(27),
                      //     ),
                      //     side: BorderSide(color: Color(0xff000CAA), width: 2),
                      //   fixedSize: Size(30, 40)
                      //   ),
                      //   onPressed: () {},
                      //   child: Text(
                      //     "View Profile",
                      //     style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Color(0xff000CAA),fontWeight: FontWeight.w700),
                      //   ),
                      // ),
                    )
                  ],
                ),
              ),
              ListTile(
                onTap: () {
                  Get.back();
                },
                leading: Image.asset(
                  'assets/maker/Mask group (1).png',
                  width: 25,
                ),
                title: Text(
                  'Home',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Divider(
                height: 10,
                color: Color(0xffBABABA),
                thickness: .1,
                endIndent: 20,
                indent: 25,
              ),
              ListTile(
                onTap: () {
                  Get.to(() => MatchScreen());
                },
                leading: Image.asset(
                  'assets/maker/Mask group (2).png',
                  width: 25,
                ),
                title: Text(
                  'Create New Matches',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Divider(
                height: 10,
                color: Color(0xffBABABA),
                thickness: .1,
                endIndent: 20,
                indent: 25,
              ),
              ListTile(
                onTap: () {
                  Get.to(() => ChooseSubscriptions());
                },
                leading: Image.asset(
                  'assets/maker/Mask group (3).png',
                  width: 25,
                ),
                title: Text(
                  'Create Subsciption',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Divider(
                height: 10,
                color: Color(0xffBABABA),
                thickness: .1,
                endIndent: 20,
                indent: 25,
              ),
              ListTile(
                onTap: () {
                  Get.to(() => PaymentInfo());
                },
                leading: Image.asset(
                  'assets/maker/Mask group (4).png',
                  width: 25,
                ),
                title: Text(
                  'Payment Info',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Divider(
                height: 10,
                color: Color(0xffBABABA),
                thickness: .1,
                endIndent: 20,
                indent: 25,
              ),
              ListTile(
                onTap: () {
                  Get.to(() => PremiumTab());
                },
                leading: Image.asset(
                  'assets/maker/Mask group (5).png',
                  width: 25,
                ),
                title: Text(
                  'Premium & Free Seekers',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Divider(
                height: 10,
                color: Color(0xffBABABA),
                thickness: .1,
                endIndent: 20,
                indent: 25,
              ),
              ListTile(
                onTap: () {
                  Get.to(() => PendingMatches());
                },
                leading: Image.asset(
                  'assets/maker/Mask group (6).png',
                  width: 25,
                ),
                title: Text(
                  'Pending Matches',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Divider(
                height: 10,
                color: Color(0xffBABABA),
                thickness: .1,
                endIndent: 20,
                indent: 25,
              ),
              ListTile(
                onTap: () {
                  Get.to(() => Invite());
                },
                leading: Image.asset(
                  'assets/maker/Mask group (8).png',
                  width: 25,
                ),
                title: Text(
                  'Refer Friend',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Divider(
                height: 10,
                color: Color(0xffBABABA),
                thickness: .1,
                endIndent: 20,
                indent: 25,
              ),
              ListTile(
                onTap: () {
                  Get.to(()=>ViewProfileDetailsMaker());
                },
                leading: Image.asset(
                  'assets/maker/Mask group (7).png',
                  width: 25,
                ),
                title: Text(
                  'Update Profile',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              Divider(
                height: 10,
                color: Color(0xffBABABA),
                thickness: .1,
                endIndent: 20,
                indent: 25,
              ),
              ListTile(
                leading: Image.asset(
                  'assets/maker/Mask group (10).png',
                  width: 25,
                ),
                title: Text(
                  'Update Additional Info',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              SizedBox(
                height: height * .2,
              ),
              Center(
                child: MyButton(
                  width: width * .5,
                  title: 'Log Out',
                  onTap: () async {

                    final SharedPreferences sp=await SharedPreferences.getInstance();

                    // Delete the cached data when the user logs out

                    sp.remove("BarearToken");

                    // You can also clear all data in the storage if needed
                    // box.erase();

                    // Add any other logout logic you have here
                    setState(() {
                      GlobalVarribalNull().NullFunction();
                    });
                    Get.off(SplashScreen());
                    print("Logged out successfully");
                  },
                ),
              ),
              SizedBox(
                height: height * .1,
              ),
            ],
          );    

  }
});}}