import 'package:cupid_match/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:math' as math;

import '../controllers/controller/RecentSeekerMatchesController/recent_seeker_matches_controller.dart';

class RecentConversations extends StatefulWidget {
  const RecentConversations({Key? key}) : super(key: key);

  @override
  State<RecentConversations> createState() => _RecentConversationsState();
}

class _RecentConversationsState extends State<RecentConversations> {

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Get.back();
        },
            icon: Icon(Icons.arrow_back,color: Color(0xff5A5A5A), size: 27,)),
        title: Text("Recent Conversations"),
      ),
      body: ListView(
        children: [
          ListView.builder(
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 15,
            itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.02),
                child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.ratingcodeColor,
                        borderRadius: BorderRadius.circular(15)),
                    width: width,
                    height: height*0.10,
                    child: ListTile(
                      leading: Container(
                        width: 30,
                        height: 45,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount:
                          images.length >= 3 ? 3 : images.length,
                          shrinkWrap: true,
                          reverse: true,
                          itemBuilder: (context, index) {
                            return Align(
                              alignment: Alignment.centerRight,
                              widthFactor: 0.3,
                              child: CircleAvatar(
                                radius: 18,
                                backgroundColor: AppColors.white,
                                child: CircleAvatar(
                                  radius: 16,
                                  backgroundImage:
                                  NetworkImage(images[index]),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      title: Text("Name",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.black),),
                      subtitle: Text("25/05/2022",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 10,color: AppColors.black),),
                      trailing: Image.asset("assets/maker/Group 221.png",width: width*0.09,),
                    )),
              );
            },
          ),
        ],
      ),
    );
  }
  List images = [
    "https://images.unsplash.com/photo-1575936123452-b67c3203c357?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8aW1hZ2V8ZW58MHx8MHx8fDA%3D&w=1000&q=80",
    "https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg"
  ];
}
