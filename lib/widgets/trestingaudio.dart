
import 'package:cupid_match/res/colors/app_color.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyLikes extends StatefulWidget {
  const EmptyLikes({super.key});

  @override
  State<EmptyLikes> createState() => _EmptyLikesState();
}

class _EmptyLikesState extends State<EmptyLikes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Like",
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: (){
            Get.back();
          },
          icon: Icon(Icons.arrow_back_rounded),
        ),
      ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/likeempty.png',width: Get.width*0.7,),
            SizedBox(height: Get.height*0.05,),
            Text("No Like, yet.",style: Get.theme.textTheme.headlineSmall!.copyWith(
                color: AppColor.blackColor
            )),
            SizedBox(height: Get.height*0.02,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Text("Reference site about Lorem Ipsum, giving as well as a random Lipsum generator.",style: Get.theme.textTheme.bodyMedium!.copyWith(
                  color: AppColor.blackColor,fontWeight: FontWeight.w300
              ),textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
    );
  }
}
