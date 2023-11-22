import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/match_maker/MachesSubscriptionplan.dart';
import 'package:cupid_match/match_maker/Maker_TabView.dart';
import 'package:cupid_match/match_maker/create_plan_Monthly.dart';
import 'package:cupid_match/match_maker/Monthly_subscription_plans.dart';
import 'package:cupid_match/match_maker/home_screen_maker.dart';
import 'package:cupid_match/match_seeker/home_screen.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


enum  SelectProfile  {Monthly,Matches, National}

class ChooseSubscriptions extends StatefulWidget {
  const ChooseSubscriptions({Key? key}) : super(key: key);

  @override
  State<ChooseSubscriptions> createState() => _ChooseSubscriptionsState();
}

class _ChooseSubscriptionsState extends State<ChooseSubscriptions> {
  SelectProfile selectProfile = SelectProfile.Monthly;
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
        title: Text(
          "Subscriptions",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,

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
      body: Column(
        children: [
          SizedBox(height: height * 0.03,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: width*0.04),
            child: Container(
              height: height *.07,
              decoration: BoxDecoration(
                color:  Color(0xffF9FAFB),
                border: Border.all(color:selectProfile == SelectProfile.Monthly? Color(0xffFE008F) : Colors.grey),
                borderRadius: BorderRadius.circular(35),
              ),
              child: Center(
                child: RadioListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: width*.02),
                  visualDensity: VisualDensity(horizontal: -4),
                  title: Text("Monthly Subscriptions",  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600,fontSize: 14),),
                  value: SelectProfile.Monthly,
                  groupValue: selectProfile,
                  activeColor: Color(0xffFE0091),
                  onChanged: (value){
                    setState(() {
                      selectProfile = value!;
                      print(selectProfile);
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: height *0.03,),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: width *0.04),
            child: Container(
              height: height *.07,
              decoration: BoxDecoration(
                color: Color(0xffF9FAFB),
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color:selectProfile == SelectProfile.Matches? Color(0xffFE008F) : Colors.grey),
              ),
              child: Center(
                child: RadioListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: width*.02),
                  visualDensity: VisualDensity(horizontal: -4),
                  title: Text("Matches Subscriptions",  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600,fontSize: 14),),
                  value: SelectProfile.Matches,
                  groupValue: selectProfile,
                  activeColor: Color(0xffFE0091),
                  onChanged: (value){
                    setState(() {
                      selectProfile = value!;
                      print(selectProfile);
                    });
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: height*0.03,),
          MyButton(
              width: width*0.8,
              title: "Next", onTap: (){
                if(selectProfile==SelectProfile.Monthly){
                  Subcriptiontype="Month";
            Get.to(CreateMonthlySubcription());

                }else{
                  Subcriptiontype="Matches";

            Get.to(MatchesSubcreiptionPlan());

                }
          })
        ],
      ),
    );
  }
}
