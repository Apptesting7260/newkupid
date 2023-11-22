import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/SeekerMyProfileDetailsController/SeekerMyProfileController.dart';
import 'package:cupid_match/controllers/controller/GetAllMakerContrioller/GetAllMakerController.dart';
import 'package:cupid_match/controllers/controller/MagicProfileController/MagicProfileConrtroller.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/match_seeker/SeeAllMaker/SeAllMaker.dart';
import 'package:cupid_match/match_seeker/choose_one.dart';
import 'package:cupid_match/match_seeker/lever/StaticLiverPool.dart';
import 'package:cupid_match/match_seeker/lever/new_liver.dart';
import 'package:cupid_match/match_seeker/Siker_TabView.dart';
import 'package:cupid_match/match_seeker/viewMakerProfileinseeker/ViewMakerProfile.dart';
import 'package:cupid_match/res/components/general_exception.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:cupid_match/widgets/Spin_Will_Wigdet.dart';
import 'package:cupid_match/widgets/Spined_Spin_Will_Screen.dart';
import 'package:cupid_match/widgets/drawer.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../controllers/SeekerToMakerController/SeekerToMakerController.dart';
import '../controllers/controller/SeekerToSeekerRequestController/SeekerToSeekerRequestController.dart';
import '../controllers/controller/liver_Pooled_Request_Controller/Liver_Pooled_Request_controller.dart';

class DomatchscreenSiker extends StatefulWidget {
   DomatchscreenSiker({Key? key, required this.title}) : super(key: key);
  String title;
  @override
  State<DomatchscreenSiker> createState() => _DomatchscreenSikerState();
}

class _DomatchscreenSikerState extends State<DomatchscreenSiker> {
  int? selectedrole;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final ListAllMakerControllerinstance = Get.put(ListAllMakerController());
  SeekerToMakerRequestController SeekerToMakerRequestControllerinstance=Get.put(SeekerToMakerRequestController());


  final MagicProfileControllerinstance = Get.put(MagicProfileController());
  ChoseRole() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    selectedrole = prefs.getInt("roll");
    print("$selectedrole======");

    setState(() {});
  }

  @override
  void initState() {
    // ListAllMakerControllerinstance.ListAllMakerApi();
    ChoseRole();
    MagicProfileControllerinstance.MagicProfileApiHit();
    // TODO: implement initState
    super.initState();
  }

  final seekerMyProfileDetailsController =
      Get.put(SeekerMyProfileDetailsController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        key: _scaffoldKey,
        endDrawer: MyDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            widget.title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          actions: [
            GestureDetector(
                onTap: () {
                  _scaffoldKey.currentState!.openEndDrawer();
                },
                child: Image.asset("assets/icons/menu.png"))
          ],
        ),
        body: Obx(() {
          final ListAllMakerControllerstatus =
              ListAllMakerControllerinstance.rxRequestStatus.value;
          final MagicProfileControllerstatus =
              MagicProfileControllerinstance.rxRequestStatus.value;

          if (ListAllMakerControllerstatus == Status.ERROR ||
              MagicProfileControllerstatus == Status.ERROR) {
            return Text("Error ");
          } else if (ListAllMakerControllerstatus == Status.LOADING ||
              MagicProfileControllerstatus == Status.LOADING) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Center(child: Image.asset("assets/images/match.png")),

                 

                  if (selectedrole == 1 && seekerMyProfileDetailsController.SeekerMyProfileDetail.value.SpinLeverRequestedDat!.spin==false
                      )
                    SpinWillWidget(),

                    if (selectedrole == 1 && seekerMyProfileDetailsController.SeekerMyProfileDetail.value.SpinLeverRequestedDat!.spin==true
                      )
                  Spined_Spin_Wheel_Widget(),
                      //  SpinWillWidget(),

                   if (selectedrole == 2 && seekerMyProfileDetailsController.SeekerMyProfileDetail.value.SpinLeverRequestedDat!.leverpool==false
                      )
                   SlotMachine(),
                    if (selectedrole == 2 && seekerMyProfileDetailsController.SeekerMyProfileDetail.value.SpinLeverRequestedDat!.leverpool==true
                      )
                  LiverPooledWidget(),
                  //  SlotMachine(),


                  // if (selectedrole == 1 &&
                  //     seekerMyProfileDetailsController
                  //             .SeekerMyProfileDetail
                  //             .value
                  //             .ProfileDetails!
                  //             .spinLeverRequestedData![0]
                  //             .spinLiverRequestedStatus ==
                  //         true&&(seekerMyProfileDetailsController
                  //             .SeekerMyProfileDetail
                  //             .value
                  //             .ProfileDetails!
                  //             .spinLeverRequestedData![0].type=="spin"||seekerMyProfileDetailsController
                  //             .SeekerMyProfileDetail
                  //             .value
                  //             .ProfileDetails!
                  //             .spinLeverRequestedData![1].type=="spin"))
                  //   Spined_Spin_Wheel_Widget(),

                  // if (rolevalue == 2 &&
                  //     seekerMyProfileDetailsController
                  //             .SeekerMyProfileDetail
                  //             .value.profileDetails
                  //             .spinLeverRequestedData![0]
                  //             .spinLiverRequestedStatus ==
                  //         false&&(seekerMyProfileDetailsController
                  //             .SeekerMyProfileDetail
                  //             .value
                  //             .ProfileDetails!
                  //             .spinLeverRequestedData![0].type=="leverpool"||seekerMyProfileDetailsController
                  //             .SeekerMyProfileDetail
                  //             .value
                  //             .ProfileDetails!
                  //             .spinLeverRequestedData![1].type=="leverpool"))
                  //   SlotMachine(),
                  //    if (rolevalue == 2 &&
                  //     seekerMyProfileDetailsController
                  //             .SeekerMyProfileDetail
                  //             .value
                  //             .ProfileDetails!
                  //             .spinLeverRequestedData![1]
                  //             .spinLiverRequestedStatus ==
                  //         true&&(seekerMyProfileDetailsController
                  //             .SeekerMyProfileDetail
                  //             .value
                  //             .ProfileDetails!
                  //             .spinLeverRequestedData![0].type=="leverpool"||seekerMyProfileDetailsController
                  //             .SeekerMyProfileDetail
                  //             .value
                  //             .ProfileDetails!
                  //             .spinLeverRequestedData![1].type=="leverpool"))
                  //  LiverPooledWidget(),

               

                  SizedBox(
                    height: Get.height * 0.02,
                  ),
//sdfhsdjfsdhfjdshfjdshfjdshfjdshfdsjhfjdshfjdshf

  Padding(
                    padding: const EdgeInsets.only(left: 5,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Request to Random Profile",
                          style: Theme.of(context).textTheme.titleSmall,
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
                            setState(() {
                              selectedseekerid=null;
                            });
                            Get.to(SeeAllMaker());
                          },
                        ),
                      ],
                    ),
                  ),
                  ListAllMakerControllerinstance.userList
                      .value.allmakers!.length!=0?
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Container(
                                  
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        itemCount:  ListAllMakerControllerinstance.userList
                            .value.allmakers!.length>=4?4: ListAllMakerControllerinstance.userList
                            .value.allmakers!.length,
                        // itemExtent: 80,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  child: CircleAvatar(
                                    radius: 30.0,
                                    backgroundImage: NetworkImage(
                                        ListAllMakerControllerinstance.userList
                                            .value.allmakers![index].imgPath
                                            .toString()),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  onTap: () {
                                    Makerid = ListAllMakerControllerinstance
                                        .userList.value.allmakers![index].id
                                        .toString();
                                    Get.to(ViewMakerProfileInSeeker());
                                  },
                                ),
                                SizedBox(
                                  width: width * .03,
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: Get.width*0.2,
                                      child: Text(
                                        ListAllMakerControllerinstance
                                            .userList.value.allmakers![index].name
                                            .toString(),
                                        style:
                                            Theme.of(context).textTheme.titleSmall,
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * .01,
                                    ),
                                    Text(
                                      "Match Maker",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(color: Colors.grey),
                                    ),
                                  ],
                                ),
                                SizedBox(width: width * .15),
                                GestureDetector(
                                  onTap: () {
                                    // showdilog();
                  
                                    // String selectedseekerid= MagicProfileControllerinstance.MagicProfileList.value.requests![index].id.toString();
                                    // print(selectedseekerid);
                                    setState(() {
                                      selectedseekerid=null;
                                    });
                                    Makerid=ListAllMakerControllerinstance
                                        .userList.value.allmakers![index].id.toString();

                                    SeekerToMakerRequestControllerinstance.SeekerToMakerRequestApiHit(context);
                                  },
                                  child: Container(
                                    height: height * .04,
                                    // width: width * .2,
                                    decoration: BoxDecoration(
                                      color: Color(0xffFE0091),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Request to Maker",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ): Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height *0.1,
                      ),


                      Text("Data is Empty",style: TextStyle(color: Colors.black))
                    ],
                  )
                ],
              ),
            ); // Default case, return a Widget
          }
        }));
  }
}
