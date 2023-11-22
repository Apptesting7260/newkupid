import 'package:cupid_match/controllers/CreateMachesSubcriptionsController/CreateMatchesSubcreiptionsController.dart';
import 'package:cupid_match/controllers/controller/FetchSubcriptionController/FetchSubcriptionController.dart';
import 'package:cupid_match/match_maker/Maker_TabView.dart';
import 'package:cupid_match/match_maker/home_screen_maker.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ApplyMatchesPlan extends StatefulWidget {
  const ApplyMatchesPlan({Key? key}) : super(key: key);

  @override
  State<ApplyMatchesPlan> createState() => _ApplyMatchesPlanState();
}

class _ApplyMatchesPlanState extends State<ApplyMatchesPlan> {

  final CreateMonthplanControllerinstance=Get.put(CreateMonthplanController());
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if(isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Get.back();
        },
            icon: Icon(Icons.arrow_back,color: Color(0xff5A5A5A), size: 27)),
        title: Text(
          "Subscriptions",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height*0.04,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width*0.04),
              child: Text(
                "Create your Plan",
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ),

           
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.02),
              child: TextFormField(
                controller: CreateMonthplanControllerinstance.matchesController.value,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  hintText: "Enter Matches",
                  hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.subtitletextcolor),
                  filled: true,
                  fillColor: Color(0xffF9FAFB),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffBABABA)),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffBABABA)),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffBABABA)),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                validator: (value) {
                  if(value!.isEmpty) {
                    return "Required";
                  }
                  return null;
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height*0.01),
              child: TextFormField(
                controller: CreateMonthplanControllerinstance.AmountController.value,

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  hintText: "Enter amount",
                  hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.subtitletextcolor),
                  filled: true,
                  fillColor: Color(0xffF9FAFB),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffBABABA)),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffBABABA)),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Color(0xffBABABA)),
                  ),
                ),
                validator: (value) {
                  if(value!.isEmpty) {
                    return "Required";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: height*0.02,),
           Obx(() => Align(
              alignment: Alignment.center,
              child: MyButton(
                loading: CreateMonthplanControllerinstance.loading.value,
                  width: width*.8,
                  title: "Apply", onTap: (){
                if(_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  _submit();
                 CreateMonthplanControllerinstance.CreateMatchesPlanapiiHit();
                }
              }),
            ),) 
          ],
        ),
      ),
    );
  }
}
