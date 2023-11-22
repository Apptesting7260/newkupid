import 'package:cupid_match/match_maker/verification_method.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'Maker_TabView.dart';


class VerifyScreen extends StatefulWidget {
  const VerifyScreen({Key? key}) : super(key: key);

  @override
  State<VerifyScreen> createState() => _VerifyScreenState();
}

class _VerifyScreenState extends State<VerifyScreen> {
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

        actions: [InkWell(
          child: Padding(
            padding: const EdgeInsets.only(top:12,right:20),
            child: Text("Skip",style:TextStyle(color: Colors.pink,fontSize: 15),),
          ),
          onTap: () {
            Get.offAll(Maker_TabView(index: 0,));
          },
        )

        ],
      ),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: height * 0.02,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04,),
            child: Text(
              "Let’s Verify your identity",
              style: Theme.of(context).textTheme.displayLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04,vertical: height  *0.01),
            child: Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.subtitletextcolor),
            ),
          ),
          SizedBox(height: height * 0.1,),
          Center(
            child: Image.asset("assets/images/icon_verify.png",width: width*.4,),
            // child: Image.network('https://img.freepik.com/free-vector/smart-id-card-abstract-concept-illustration_335657-1814.jpg?size=626&ext=jpg&ga=GA1.1.825217261.1685343599&semt=ais',width: width * 0.4,),
          ),
          SizedBox(height:  height * 0.1,),
          Align(
            alignment: Alignment.center,
            child: MyButton(
              width: width * 0.8,
              title: 'Verify Indentity',
              onTap: () {
                Get.to(VerificationMethod());
              },
            ),
          ),
        ],
      ),
    );
  }
}
