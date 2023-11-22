import 'package:cupid_match/controllers/SeekerMyProfileDetailsController/SeekerMyProfileController.dart';
import 'package:cupid_match/controllers/controller/IncomingRequestController/IncomingRequestController.dart';
import 'package:cupid_match/controllers/controller/LikeListController/LikeListController.dart';
import 'package:cupid_match/controllers/controller/OutgoingRequestController/OutgoingRequestController.dart';
import 'package:cupid_match/controllers/controller/RecentSeekerMatchesController/recent_seeker_matches_controller.dart';
import 'package:cupid_match/controllers/controller/SeekerChatListController/seeker_chat_list_controller.dart';
import 'package:cupid_match/controllers/controller/ViewSikerDetailsController/ViewSikerDetaolsController.dart';
import 'package:cupid_match/match_maker/Create_Match/Create_Match.dart';
import 'package:cupid_match/match_maker/MakerLikes.dart';
import 'package:cupid_match/match_seeker/Chose_role_Type.dart';
import 'package:cupid_match/match_seeker/home_screen.dart';
import 'package:cupid_match/match_seeker/invitation.dart';
import 'package:cupid_match/match_seeker/likes_seeker.dart';
import 'package:cupid_match/match_seeker/Chat_list_Screen.dart';
import 'package:cupid_match/match_seeker/profile/profile_page.dart';
import 'package:cupid_match/match_seeker/siker_Home_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'bottom_navigation.dart';

class Siker_Tab_View extends StatefulWidget {


  const Siker_Tab_View({Key? key, required this.index}) : super(key: key);
  final int index;
  @override
  _Siker_Tab_ViewState createState() => _Siker_Tab_ViewState();
}

class _Siker_Tab_ViewState extends State<Siker_Tab_View> {
  int? bottomSelectedIndex;
  PageController? pageController;
  DateTime currentBackPressTime = DateTime.now();
  bool loading = false;
  var data;
  final drawerKey = GlobalKey<ScaffoldState>();
  OutgoinRequestController sekeerOutGoingController = Get.put(OutgoinRequestController());
  IncomingSeekerRequestController sekeerIncomingController = Get.put(IncomingSeekerRequestController());
  final ViewSikerProfileDetailsControllernstance =
      Get.put(ViewSikerProfileDetailsController());
  RecentSeekerMatchesController recentSeekerMatchesController =
      Get.put(RecentSeekerMatchesController());
  final seekerMyProfileDetailsController =
      Get.put(SeekerMyProfileDetailsController());
      SeekerChatListController seekerChatListController = Get.put(SeekerChatListController());
      final LikeListControllerinstance=Get.put(LikeListController());
  @override
  void initState() {
    // fetchApi();

    // TODO: implement initState
    bottomSelectedIndex = widget.index;
    pageController = PageController(initialPage: widget.index, keepPage: true);
    homepageapis();
    chatpageapis();
    likepagepais();
      // seekerMyProfileDetailsController.SeekerMyProfileDetailsApiHit();
      //  recentSeekerMatchesController.isrecentSeekermatchesApi();
      //      sekeerOutGoingController.seekerOutGoingRequest();
      //    sekeerIncomingController.seekerIncomingGoingRequest();
    super.initState();
    // studentType = MySharedPreferences.localStorage?.getString(MySharedPreferences.studentType) ?? "";
  }

  homepageapis() {
    // sekeerOutGoingController.seekerOutGoingRequest();
    // sekeerIncomingController.seekerIncomingGoingRequest();
    recentSeekerMatchesController.isrecentSeekermatchesApi();

    seekerMyProfileDetailsController.SeekerMyProfileDetailsApiHit();
  }

  likepagepais(){
  LikeListControllerinstance.LikeListApiHit();
  }
  chatpageapis(){
   seekerChatListController.isSeekerChatListApi();
  }
  profilepageapis(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          Get.to(Chose_Role_Type());
        },
        child: Icon(
          Icons.add,
          size: 30,
          color: Color(0xffFE0091),
        ),
      ),
      key: drawerKey,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) => pageChanged(index),
            children: [
              SikerHomeScreen(),
              LikesSeeker(),
              ChatListScreen(),
              ProfilePage(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Bottom(
        bottomSelectedIndex: bottomSelectedIndex!,
        bottomTapped: bottomTapped,
      ),
    );
  }

  void bottomTapped(int index) {
    setState(
      () {
        bottomSelectedIndex = index;
        pageController!.animateToPage(index,
            duration: const Duration(microseconds: 1), curve: Curves.ease);
      },
    );
  }

  void pageChanged(int index) {
    setState(() {
      bottomSelectedIndex = index;
    });
  }

  Future<bool> _onWillPop() {
    if (bottomSelectedIndex != 1) {
      setState(
        () {
          pageController!.jumpTo(0);
        },
      );
      return Future.value(false);
    } else if (bottomSelectedIndex == 1) {
      setState(
        () {
          pageController!.jumpTo(1);
        },
      );
      return Future.value(false);
    }
    DateTime now = DateTime.now();
    if (now.difference(currentBackPressTime) > Duration(milliseconds: 500)) {
      currentBackPressTime = now;
      SystemNavigator.pop();
      return Future.value(false);
    } else {
      SystemNavigator.pop();
    }
    return Future.value(true);
  }

  goAtLikeTab() {
    pageController!.animateToPage(1,
        duration: const Duration(microseconds: 1), curve: Curves.ease);
  }
}
