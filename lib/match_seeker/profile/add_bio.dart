import 'package:cupid_match/controllers/controller/GetAllOcupationsController/GetAllOcupations.dart';
import 'package:cupid_match/controllers/controller/SeekerAddistionInfoController/Seeker_Addistion_InfoController.dart';
import 'package:cupid_match/match_seeker/Chose_role_Type.dart';
import 'package:cupid_match/match_seeker/profile/profile_page.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBio extends StatefulWidget {
  const AddBio({Key? key}) : super(key: key);

  @override
  State<AddBio> createState() => _AddBioState();
}

class _AddBioState extends State<AddBio> {
  final SeekerAddistionInfoControllerinstance= Get.put(SeekerAddistionInfoController());


  TextEditingController titlecontroller = TextEditingController();
  TextEditingController biocontroller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();


  @override
  void initState() {

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Bio",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: ListView(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                controller: SeekerAddistionInfoControllerinstance.BioTitleController.value,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter title';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Color(0xffFE0091))),
                    hintStyle:
                        TextStyle(fontSize: 16, color: Color(0xffBABABA)),
                    contentPadding: EdgeInsets.all(18),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Color(0xffBABABA))),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Color(0xffBABABA))),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA)),
                    ),
                    hintText: "Enter your title",
                    filled: true,
                    fillColor: Colors.white),
              ),
              SizedBox(height: height * .03),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(color: Colors.black),
                maxLines: 5,
                keyboardType: TextInputType.name,
                controller: SeekerAddistionInfoControllerinstance.BioDescriptionController.value,
                textAlign: TextAlign.start,
                textAlignVertical: TextAlignVertical.top,
                validator: (value) {
                  if (value == null) {
                    return "null";
                  } else if (value.length < 20) {
                    return "Please enter bio greater than 20 character";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffBABABA)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffBABABA)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffBABABA)),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20.0),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(color: Color(0xffFE0091))),
                  hintStyle: TextStyle(fontSize: 16, color: Color(0xffBABABA)),
                  hintText: "Enter your bio",
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: height * .03),
             Obx(() => Center(
                child: MyButton(loading:SeekerAddistionInfoControllerinstance.loading.value ,
                  title: "Continue",
                  onTap: () {
                    if(_formKey.currentState!.validate())
                    SeekerAddistionInfoControllerinstance.SeekerProfileApiHit();
              
                  },
                ),
              )) 
            ],
          ),
        ),
      ),
    );
  }

  validate() {
    print("send");
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      Get.to(() => Chose_Role_Type());
    }

  }
}
