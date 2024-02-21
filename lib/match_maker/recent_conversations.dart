import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/SeekerMyProfileDetailsController/SeekerMyProfileController.dart';
import 'package:cupid_match/match_seeker/Requests/SeekerRequestPage.dart';
import 'package:cupid_match/match_seeker/chat_screen.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'dart:math' as math;

import '../controllers/MakerGetMyProfileDetails/MakerGetProfileDetailsController.dart';
import '../controllers/controller/RecentSeekerMatchesController/recent_seeker_matches_controller.dart';
import '../match_seeker/profile/profile_details.dart';
import '../match_seeker/profile/profile_details.dart';
import 'chatScreenaMaker.dart';
import 'chat_screen.dart';

class RecentConversations extends StatefulWidget {
  const RecentConversations({Key? key}) : super(key: key);

  @override
  State<RecentConversations> createState() => _RecentConversationsState();
}

class _RecentConversationsState extends State<RecentConversations> {
  final SeekerMyProfileDetailsController seekerMyProfileController =
      Get.put(SeekerMyProfileDetailsController());

  final ViewMakerProfileDetailsControllerinstance =
      Get.put(ViewMakerMyProfileDetailsController());

  getusers() {
    var name;
    name = firestore
        .collection("m" +
            ViewMakerProfileDetailsControllerinstance
                .ViewProfileDetail.value.requests!.id
                .toString())
        .orderBy('timestamp', descending: true)
        .get();
  }

  Stream<QuerySnapshot> getMessagesStream() {
    return firestore
        .collection("m" +
            ViewMakerProfileDetailsControllerinstance
                .ViewProfileDetail.value.requests!.id
                .toString())
        .orderBy('timestamp', descending: true)
        .snapshots();
  }

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      getusers();
    });
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
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff5A5A5A),
              size: 27,
            )),
        title: Text("Recent Conversations"),
      ),
      body: ListView(
        children: [
          StreamBuilder(
              stream: getMessagesStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  return snapshot.data!.docs.isEmpty == false
                      ? ListView.builder(
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data?.docs.length,
                          itemBuilder: (context, index) {
                            var data = snapshot.data?.docs[index];
                            var timestamp = data![
                                'timestamp']; // Assuming 'timestamp' is of type Timestamp

// Convert the Timestamp to a DateTime object
                            DateTime dateTime = timestamp.toDate();

// Extract only the date part
                            DateTime dateOnly = DateTime(
                                dateTime.year, dateTime.month, dateTime.day);
                            String formattedDate =
                                DateFormat('dd/MM/yyyy').format(dateOnly);
                            return Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.04,
                                  vertical: height * 0.02),
                              child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.ratingcodeColor,
                                      borderRadius: BorderRadius.circular(15)),
                                  width: width,
                                  height: height * 0.10,
                                  child: ListTile(
                                    leading: Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Container(
                                        height: height * .33,
                                        width: width * .2,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              right: 30,
                                              child: CircleAvatar(
                                                radius: 15.0,
                                                backgroundImage:
                                                    CachedNetworkImageProvider(
                                                        // seekerChatListController
                                                        //     .seekerChatListValue
                                                        //     .value
                                                        //     .chat![
                                                        // index]
                                                        //     .seekerwithImg!
                                                        //     .toString()),
                                                        data!['seeker_inage2']),
                                                backgroundColor:
                                                    Colors.transparent,
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                border: Border.all(
                                                    color: Colors.white,
                                                    width: 2),
                                              ),
                                              child: CircleAvatar(
                                                radius: 15.0,
                                                backgroundImage:
                                                    CachedNetworkImageProvider(
                                                        // seekerChatListController
                                                        //     .seekerChatListValue
                                                        //     .value
                                                        //     .chat![
                                                        // index]
                                                        //     .seekerfromImg!
                                                        //     .toString()

                                                        data['seeker_inage1']),
                                                backgroundColor:
                                                    Colors.transparent,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    title: Text(
                                      data['roomname'],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium
                                          ?.copyWith(color: AppColors.black),
                                    ),
                                    subtitle: Text(
                                      "${formattedDate.toString()}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                              fontSize: 10,
                                              color: AppColors.black),
                                    ),
                                    trailing: InkWell(
                                        onTap: () {
                                          roomid = data!["roomid"];
                                          userIdsiker = data!["Requestid"];
                                          makeridchat = data!["maker_id"];
                                          seeker1 = data!['seeker_id1'];
                                          seeker2 = data!['seeker_id2'];
                                          chatname = data!['roomname'];
                                          chatimage1 = data!['seeker_inage1'];
                                          chatimage = data!['seeker_inage2'];
                                          makeridchatimage =
                                              data!['maker_image'];

                                          setState(() {});
                                          Get.to(MakerChatScreen());
                                        },
                                        child: Image.asset(
                                          "assets/maker/Group 221.png",
                                          width: width * 0.09,
                                        )),
                                  )),
                            );
                          },
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: height * 0.3,
                            ),
                            Image.asset(
                              'assets/images/recentC.png',
                              width: Get.width * 0.83,
                            ),
                            Text(
                              "Reference site about Lorem Ipsum, giving information on its origins",
                              style: Get.theme.textTheme.bodySmall,
                              textAlign: TextAlign.center,
                            )
                          ],
                        );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * 0.3,
                      ),
                      Image.asset(
                        'assets/images/recentC.png',
                        width: Get.width * 0.83,
                      ),
                      Text(
                        "Reference site about Lorem Ipsum, giving information on its origins",
                        style: Get.theme.textTheme.bodySmall,
                        textAlign: TextAlign.center,
                      )
                    ],
                  );
                }
              })
        ],
      ),
    );
  }

  Future<bool> doesMakerIdExist(
      String collectionPath, String documentPath, String makerId) async {
    final documentReference =
        FirebaseFirestore.instance.collection(collectionPath).doc(documentPath);
    final snapshot = await documentReference.get();

    if (snapshot.exists) {
      final data = snapshot.data();
      if (data != null) {
        return data.containsKey(makerId);
      }
    }

    return false;
  }

  getMessagesStream1() async {
    print("an vb ");
    var data = await firestore
        .collection("m" +
            ViewMakerProfileDetailsControllerinstance
                .ViewProfileDetail.value.requests!.id
                .toString())
        .doc(roomid)
        .get();
    var roomdetails = data.data() as Map<String, dynamic>;
    roomid = roomdetails["roomid"];
    userIdsiker = roomdetails["Requestid"];
    makeridchat = roomdetails["maker_id"];
    seeker1 = roomdetails['seeker_id1'];
    seeker2 = roomdetails['seeker_id2'];
    chatname = roomdetails['roomname'];
    chatimage1 = roomdetails['seeker_inage1'];
    chatimage = roomdetails['seeker_inage2'];
    makeridchatimage = roomdetails['maker_image'];

    setState(() {});
    Get.to(MakerChatScreen());
  }

  // Example usage:
  exist() async {
    final collectionPath = seekerMyProfileController
        .SeekerMyProfileDetail.value.ProfileDetail!.id
        .toString();
    final documentPath = roomid.toString();
    final makerIdToCheck = "maker_id"; // Replace with the key you want to check

    final exists =
        await doesMakerIdExist(collectionPath, documentPath, makerIdToCheck);

    if (exists) {
      setState(() {
        makeride = true;
      });
      print("The makerid key exists in the document.");
    } else {
      print("The makerid key does not exist in the document.");
    }
  }

  List images = [
    "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
    "https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg"
  ];
}
