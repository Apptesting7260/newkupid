import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/MakerChatListController/MakerChatListController.dart';
import 'package:cupid_match/controllers/MakerGetMyProfileDetails/MakerGetProfileDetailsController.dart';
import 'package:cupid_match/controllers/controller/ViewMakerProfileDetailsController/ViewMakerProfileDetailscontroller.dart';
import 'package:cupid_match/match_maker/chat_screen.dart';
import 'package:cupid_match/match_seeker/chat_screen.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/MakerDrawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../data/response/status.dart';
import '../res/components/general_exception.dart';
import '../res/components/internet_exceptions_widget.dart';
String ?makeridchat;
String ?makeridchatimage;
class ChatScreenMaker extends StatefulWidget {
  const ChatScreenMaker({Key? key}) : super(key: key);

  @override
  State<ChatScreenMaker> createState() => _ChatScreenMakerState();
}

class _ChatScreenMakerState extends State<ChatScreenMaker> {
  MakerChatListController makerChatListController =
  Get.put(MakerChatListController());
  final ViewMakerProfileDetailsControllerinstance=Get.put(ViewMakerMyProfileDetailsController());
  List imagesList = [
    "https://images.unsplash.com/photo-1687076613219-fb4b3d94e75a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMzJ8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60",
    "https://plus.unsplash.com/premium_photo-1686777550406-98c56a8bd590?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNzZ8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60"
  ];
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Stream<QuerySnapshot> getMessagesStream() {
    return firestore
        .collection("m"+ViewMakerProfileDetailsControllerinstance.ViewProfileDetail.value.requests!.id.toString())
        .orderBy('timestamp', descending: true)
        .snapshots();



  }

  
  getusers() {
    var name;
    name=firestore
        .collection(ViewMakerProfileDetailsControllerinstance.ViewProfileDetail.value.requests!.id.toString())
        .orderBy('timestamp', descending: true)
        .get();



  }
  @override
  void initState() {
    super.initState();
    makerChatListController.isMakerChatListApi();
    getusers();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Message",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          centerTitle: true,
          actions: [
            Builder(
              builder: (context) {
                return GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openEndDrawer();
                      MaterialLocalizations.of(context).openAppDrawerTooltip;
                    },
                    child: Image.asset("assets/icons/menu.png"));
              },
            )
          ],
        ),
        endDrawer: Drawer(child: MakerDrawer()),
        body:RefreshIndicator(
          onRefresh: ()async {
            makerChatListController.isMakerChatListApi();
            getusers();
          },
          child:  StreamBuilder(
              stream: getMessagesStream(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  return snapshot.data!.docs.isEmpty == false
                      ?
                  ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data?.docs[index];
                        // .snapshots();

                        return                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(
                              height: height *0.1,
                              color: Colors.amber[50],
                              width: Get.width,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: height * .33,
                                      width: width * .29,
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            right: 30,
                                            child: CircleAvatar(
                                              radius: 30.0,
                                              backgroundImage: CachedNetworkImageProvider(
                                                // seekerChatListController
                                                //     .seekerChatListValue
                                                //     .value
                                                //     .chat![
                                                // index]
                                                //     .seekerwithImg!
                                                //     .toString()),
                                                  data!['seeker_inage1']
                                              ),
                                              backgroundColor: Colors.transparent,
                                            ),
                                          ),
                                          Container(
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border:
                                              Border.all(color: Colors.white, width: 2),
                                            ),
                                            child: CircleAvatar(
                                              radius: 30.0,
                                              backgroundImage: CachedNetworkImageProvider(
                                                // seekerChatListController
                                                //     .seekerChatListValue
                                                //     .value
                                                //     .chat![
                                                // index]
                                                //     .seekerfromImg!
                                                //     .toString()

                                                  data['seeker_inage2']     ),
                                              backgroundColor: Colors.transparent,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: height * .01,
                                        ),
                                        Text(
                                          //  "data",
                                          data['roomname'],
                                          // (seekerChatListController
                                          //     .seekerChatListValue
                                          //     .value
                                          //     .chat![index]
                                          //     .seekerfromName!
                                          //     .toString())+ " & "
                                          //     +
                                          //     (seekerChatListController
                                          //         .seekerChatListValue
                                          //         .value
                                          //         .chat![index]
                                          //         .seekerwithName!
                                          //         .toString()),
                                          style: TextStyle(overflow: TextOverflow.ellipsis,color: Colors.black ,fontWeight: FontWeight.bold),
                                        ),

                                        SizedBox(
                                          height: height * .01,
                                        ),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              width:Get.width*0.4,
                                              child: Text(
                                                data['lastmsg'],
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall!
                                                    .copyWith(color: Colors.grey),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),

                                            Text(
                                              "${DateFormat('h:mm a').format(DateTime.parse(data['timestamp'].toDate().toString()))}"

                                              ,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall!
                                                  .copyWith(color: Colors.grey),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    //  SizedBox(width: 20,),
                                    //   Text(
                                    //  "${DateFormat('h:mm a').format(DateTime.parse(data['timestamp'].toDate().toString()))}"

                                    //    ,
                                    //     style: Theme.of(context)
                                    //         .textTheme
                                    //         .bodySmall!
                                    //         .copyWith(color: Colors.grey),
                                    //   )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          onTap: (){
                            roomid=data["roomid"];
                            userIdsiker=data["Requestid"];
                            makeridchat=data["maker_id"];
                            seeker1=data['seeker_id1'];
                            seeker2=data['seeker_id2'];
                            chatname=data['roomname'];
                            chatimage1=data['seeker_inage1'];
                            chatimage=data['seeker_inage2'];
                            makeridchatimage=data['maker_image'];
                            // anotherchatuser=["seeker_id1"]?data["seeker_id2"]:data["seeker_id1"];
                            setState(() {
                              userIdsiker;
                              anotherchatuser;
                              seeker1;
                              seeker2;
                              chatimage1;
                              chatimage;
                              makeridchat;
                            });
                            print(roomid);
                            if(roomid!=null){
                              Get.to(MakerChatScreen());
                            }
                          },
                        );
                      } ):Container(child: Center(child: Text("No Chat List Available",style: TextStyle(color: Colors.black),)),);
                }else{
                  return Container(child: Center(child: Text("No Chat List Available",style: TextStyle(color: Colors.black),)),);
                }
              }),
        )
    );
  }
}
