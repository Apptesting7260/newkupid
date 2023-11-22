import 'package:cupid_match/controllers/SeekerMyProfileDetailsController/SeekerMyProfileController.dart';
import 'package:cupid_match/match_maker/Maker_TabView.dart';
import 'package:cupid_match/match_maker/invite_state.dart';
import 'package:cupid_match/match_seeker/Chose_role_Type.dart';
import 'package:cupid_match/match_seeker/dashboard.dart';
import 'package:cupid_match/match_seeker/home_screen.dart';
import 'package:cupid_match/match_seeker/payment_info.dart';
import 'package:cupid_match/match_seeker/profile/filter.dart';
import 'package:cupid_match/match_seeker/profile/interest.dart';
import 'package:cupid_match/match_seeker/profile/interested_in.dart';

import 'package:cupid_match/match_seeker/profile/update_profile_details.dart';
import 'package:cupid_match/views/splash_screen.dart';

import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../GlobalVariable/nullFunction.dart';
import '../match_seeker/Siker_TabView.dart';
import '../match_seeker/profile/SeekerUpdateProfileDetails.dart';
import '../match_seeker/profile/profile_page.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

  final box = GetStorage();

class _MyDrawerState extends State<MyDrawer> {
  final SeekerMyProfileDetailsController seekerMyProfileController =
  Get.put(SeekerMyProfileDetailsController());
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SizedBox(
      width: width * .7,
      child: Drawer(
        child: Obx(()=>
          ListView(
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
                    SizedBox(
                      height: height * .02,
                    ),
                    ListTile(
                      leading: CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                            seekerMyProfileController.SeekerMyProfileDetail.value.ProfileDetail!.imgPath.toString()),
                        backgroundColor: Colors.transparent,
                      ),

                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: Text(
                          seekerMyProfileController.SeekerMyProfileDetail.value.ProfileDetail!.name.toString(),
                          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ),

                      subtitle: GestureDetector(
                        onTap: () {
                        Get.to(() => ProfilePage());
                        },
                        child: Container(
                          height: height * .04,
                          decoration: BoxDecoration(
                              color: Color(0xffF3F3F3),
                              borderRadius: BorderRadius.circular(22),
                              border:
                                  Border.all(color: Color(0xff000CAA), width: 2)),
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "View Profile",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                      fontSize: 10, color: Color(0xff000CAA)),
                            ),
                          )),
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
              SizedBox(
                height: height * .05,
              ),
              ListTile(
                onTap: () {
                  Get.to(() => Siker_Tab_View(index: 0));
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
                  Get.to(() => Dashboard());
                },
                leading: Image.asset(
                  'assets/maker/Mask group.png',
                  width: 25,
                ),
                title: Text(
                  'Dashboard',
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
                  Get.to(() => Chose_Role_Type());
                },
                leading: Image.asset(
                  'assets/maker/Mask group (2).png',
                  width: 25,
                ),
                title: Text(
                  'Find New Matches',
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
                  'assets/maker/Mask group (3).png',
                  width: 25,
                ),
                title: Text(
                  'Subsciption Plan',
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
              // ListTile(
              //   onTap: () {
              //     // Get.to(() => PremiumTab());
              //   },
              //   leading: Image.asset(
              //     'assets/maker/Mask group (5).png',
              //     width: 25,
              //   ),
              //   title: Text(
              //     'Premium & Free Seekers',
              //     style: Theme.of(context).textTheme.titleSmall,
              //   ),
              // ),
              // Divider(
              //   height: 10,
              //   color: Color(0xffBABABA),
              //   thickness: .1,
              //   endIndent: 20,
              //   indent: 25,
              // ),
              // ListTile(
              //   onTap: () {
              //     // Get.to(() => PendingMatches());
              //   },
              //   leading: Image.asset(
              //     'assets/maker/Mask group (6).png',
              //     width: 25,
              //   ),
              //   title: Text(
              //     'Pending Matches',
              //     style: Theme.of(context).textTheme.titleSmall,
              //   ),
              // ),
              // Divider(
              //   height: 10,
              //   color: Color(0xffBABABA),
              //   thickness: .1,
              //   endIndent: 20,
              //   indent: 25,
              // ),
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
                  Get.to(() => SikerUpdateProfileDetails());
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
                onTap: () {
                  Get.to(() => InterstedIn());
                },
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
                height: height * .1,
              ),
              Center(
                child: MyButton(
                  width: width * .5,
                  title: 'Log Out',
                  onTap: () {
                    setState(() {
                      GlobalVarribalNull().NullFunction();
                    });
                    logout();


                  },
                ),
              ),
              SizedBox(
                height: height * .1,
              ),
            ],
          ),
        ),
      ),
    );
  }

   void logout()async {
  final SharedPreferences sp=await SharedPreferences.getInstance();

    // Delete the cached data when the user logs out
    box.remove('incomingRequestData');
    box.remove('outgoingRequestData');
    box.remove('recentSeekerMatchesData');
    box.remove('seekrprofiledata');
    box.remove('seekerChatListValue');
    sp.remove("BarearToken");
    
    // You can also clear all data in the storage if needed
    // box.erase();
    _restartApp(context);



  }
  void _restartApp(BuildContext context) {
    // Pop all routes from the navigator and push the initial route again
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (BuildContext context) => SplashScreen()),
      (Route<dynamic> route) => false,
    );
  }
}
