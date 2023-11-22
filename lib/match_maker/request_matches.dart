import 'package:cupid_match/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RequestMatches extends StatefulWidget {
  const RequestMatches({Key? key}) : super(key: key);

  @override
  State<RequestMatches> createState() => _RequestMatchesState();
}

class _RequestMatchesState extends State<RequestMatches> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        },
            icon: Icon(Icons.arrow_back,color: Color(0xff5A5A5A), size: 27,)),
        title: Text("Request Matches"),
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
                    // width: width * .65,
                    height: height*0.10,
                    child: ListTile(
                      leading:CircleAvatar(
                          radius: 18,
                          backgroundColor: AppColors.white,
                          backgroundImage: NetworkImage("https://www.seiu1000.org/sites/main/files/main-images/camera_lense_0.jpeg",
                          )),
                      title: Text("Name",style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.black),),
                      subtitle: Text("25/05/2022",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 10,color: AppColors.black),),
                      // trailing: Image.asset("assets/images/Group 221.png",width: width*0.09,),
                    )),
              );
            },
          ),
        ],
      ),
    );
  }
}
