import 'package:cupid_match/controllers/controller/CreateMonthlyPlanController/CreateMonthlyPlanController.dart';
import 'package:cupid_match/match_maker/createplanMonthley/Createplan_Monthly.dart';
import 'package:cupid_match/match_maker/CreateMonthlySubcription.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ApplyMonthlyPlan extends StatefulWidget {
  const ApplyMonthlyPlan({Key? key}) : super(key: key);

  @override
  State<ApplyMonthlyPlan> createState() => _ApplyMonthlyPlanState();
}

class _ApplyMonthlyPlanState extends State<ApplyMonthlyPlan> {
  final CreateMontlyControllerinstance=Get.put(CreateMontlyController());
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
        leading: IconButton(onPressed: (){
          Get.back();
        },
            icon: Icon(Icons.arrow_back,color: Color(0xff5A5A5A), size: 27,)),
        title: Text(
          "Subscriptions",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
           Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: height*0.05,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width*0.04),
                    child: Text(
                      "Create New Plan",
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: width *0.04,vertical: height*0.02),
                    child: TextFormField(controller: CreateMontlyControllerinstance.MonthController.value,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        hintText: "Enter Months",
                        filled: true,
                        fillColor: Color(0xffF9FAFB),
                        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Color(0xff777777)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffBABABA)),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        enabledBorder:  OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffBABABA)),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        focusedBorder:  OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffBABABA)),
                            borderRadius: BorderRadius.circular(30)
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
                    padding:  EdgeInsets.symmetric(horizontal: width *0.04,vertical: height*0.01),
                    child: TextFormField(controller:CreateMontlyControllerinstance.AmountController.value,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        hintText: "Enter amount",
                        filled: true,
                        fillColor: Color(0xffF9FAFB),
                        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Color(0xff777777)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffBABABA)),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffBABABA)),
                            borderRadius: BorderRadius.circular(30)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xffBABABA)),
                            borderRadius: BorderRadius.circular(30)
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
                      loading: CreateMontlyControllerinstance.loading.value,
                        width: width *.8,
                        title: "Apply",
                        onTap: () {
                          if(_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            _submit();
                          CreateMontlyControllerinstance.CreateMonthlyPlanapiiHit();
                          }
                        }),
                  )) 
                ],
              ),
            ),

            SizedBox(height:Get.height*0.02,),
          
    
        ],
      ),
    );
  }
}
