import 'package:country_list_pick/country_list_pick.dart';
import 'package:country_picker/country_picker.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/match_maker/photo_access.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:get/get.dart';

import '../country_name_with_flag_widget.dart';

enum SelectProfile {National,Passport,Driver}

class VerificationMethod extends StatefulWidget {
  const VerificationMethod({Key? key}) : super(key: key);

  @override
  State<VerificationMethod> createState() => _VerificationMethodState();
}

class _VerificationMethodState extends State<VerificationMethod> {
  bool checkCountry=false;
  SelectProfile selectProfile = SelectProfile.National;
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
          "Proof of Residency",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(height: Get.height*0.03,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Text(
              "Nationality",
              style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600,fontSize: 14),
            ),
          ),
          SizedBox(height: height * 0.01,),
          Container(
              height: Get.height*0.132,
              child: CustomCountryNameFlag()),





          SizedBox(height: height * 0.01,),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Text(
              "Verification Method",
              style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600,fontSize: 14),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width  *0.04,vertical: height * .02),
            child: Container(
              height: height * .07,
              decoration: BoxDecoration(
                color: Color(0xffF9FAFB),
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color:selectProfile == SelectProfile.National? Color(0xffFE008F) : Colors.grey),
              ),
              child: Center(
                child: RadioListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: width*.02),
                  visualDensity: VisualDensity(horizontal: -4),
                  title: Text("National identity card",  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600,fontSize: 14),),
                  value: SelectProfile.National,
                  groupValue: selectProfile,
                  activeColor: Color(0xffFE0091),
                  onChanged: (value){
                    setState(() {
                      selectProfile = value!;
                      verification_method="nationality_identity_card";

                      print(verification_method);
                    });
                  },
                ),
              ),
              // child: Row(
              //   children: [
              //     Expanded(
              //         child: ListTile(
              //           title: Row(
              //             children: [
              //               Radio(
              //                   value: SelectProfile.National,
              //                   groupValue: selectProfile,
              //                   activeColor: Color(0xffFE008F),
              //                   onChanged: (value) {
              //                     setState(() {
              //                      selectProfile = value!;
              //                     });
              //                   },
              //               ),
              //               Text(
              //                   "National identity card",
              //               style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600,fontSize: 14),
              //               )
              //             ],
              //           ),
              //         )),
              //   ],
              // ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width  *0.04,vertical: height * .02),
            child: Container(
              height: height * .07,
              decoration: BoxDecoration(
                color: Color(0xffF9FAFB),
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color:selectProfile == SelectProfile.Passport? Color(0xffFE008F) : Colors.grey),
              ),
              child: Center(
                child: RadioListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: width*.02),
                  visualDensity: VisualDensity(horizontal: -4),
                  title: Text("Passport",  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600,fontSize: 14),),
                  value: SelectProfile.Passport,
                  groupValue: selectProfile,
                  activeColor: Color(0xffFE0091),
                  onChanged: (value){
                    setState(() {
                      selectProfile = value!;
                      verification_method="passport";
                      print(verification_method);
                    });
                  },
                ),
              ),

            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04,vertical: height * .02),
            child: Container(
              height: height * .07,
              decoration: BoxDecoration(
                color: Color(0xffF9FAFB),
                borderRadius: BorderRadius.circular(35),
                border: Border.all(color: selectProfile == SelectProfile.Driver? Color(0xffFE008F) : Colors.grey),
              ),
              child: Center(
                child: RadioListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: width*.02),
                  visualDensity: VisualDensity(horizontal: -4),
                  title: Text("Driver License",  style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600,fontSize: 14),),
                  value: SelectProfile.Driver,
                  groupValue: selectProfile,
                  activeColor: Color(0xffFE0091),
                  onChanged: (value){
                    setState(() {
                      selectProfile = value!;
                      verification_method="driver_license";

                      print(verification_method);
                    });
                  },
                ),
              ),

            ),
          ),
          SizedBox(height: height * .02,),
          Align(
            alignment: Alignment.center,
            child: MyButton(
                width: width*0.8,
                title: "Continue", onTap: (){
                  if(selectedCountry.isNotEmpty){
                    Get.to(GalleryAccess());
                  }
                  else{
                    // Get.snackbar(
                    //   "Alert",
                    //   "Please select a country",
                    //   backgroundColor: Color(0xffFE008F),
                    // );
                    showOptionsDialog(context, "Please select a country");
                  }

            }),
          ),
          SizedBox(height: height*.1,),
        ],
      ),
    );
  }
  Future<void> showOptionsDialog(BuildContext context, String? error) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15) ,side: BorderSide.none ),
          title: Center(
            child: Column(
              children: [


                Text(
                  error.toString(),
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: 12,color: Colors.black),
                ),
              ],
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // GestureDetector(
              //   child: const Icon(
              //     Icons.camera_alt_outlined,
              //     color: Colors.white,
              //   ),
              //   onTap: () {
              //     _pickImage(ImageSource.camera);
              //   },
              // ),
              Center(
                child: MyButton(
                  width: Get.width*.27,
                  height: Get.height*.05,
                  title: "Ok", onTap: () {
                  Get.back();
                },),
              )
            ],
          ),
        );
      },
    );}
}
