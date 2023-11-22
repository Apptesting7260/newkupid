import 'package:cupid_match/controllers/controller/MakerPaymentinfoController/MakerPaymentInfoController.dart';
import 'package:cupid_match/match_maker/Chose_Subcription.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Maker_TabView.dart';


class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final MakerPaymentInfoControllerinstance=Get.put(MakerPaymentInfoController());
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
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(

        title: Text(
          "Payment",
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
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width*0.04,vertical: height *0.03),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: MakerPaymentInfoControllerinstance.banknamecontroller.value,

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  hintText: "Enter Your Bank Name",
                  hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.subtitletextcolor),
                  focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xffFE0091)),
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff777777)),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff777777)),
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
              padding: EdgeInsets.symmetric(horizontal: width *0.04),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: MakerPaymentInfoControllerinstance.fullnamecontroller.value,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  hintText: "Enter Your Full Name",
                  hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.subtitletextcolor),
                  focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xffFE0091)),
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff777777)),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Color(0xff777777)),
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
            SizedBox(height: height*0.03,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width *0.04),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: MakerPaymentInfoControllerinstance.account_nocontroller.value,
keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  hintText: "Bank Account Number",
                  hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.subtitletextcolor),
                focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xffFE0091)),
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff777777)),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff777777)),
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
            SizedBox(height: height * 0.03,),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: width *0.04),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: MakerPaymentInfoControllerinstance.raccount_nocontroller.value,
keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(20),
                    hintText: "Re-Enter Bank Account Number",
                    hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.subtitletextcolor),
                  focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xffFE0091)),
                      ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff777777)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xff777777)),
                      borderRadius: BorderRadius.circular(30),
                    )
                ),
                validator: (value) {
                  if(value!.isEmpty) {
                    return "Required";
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: height *0.03,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width*0.04),
              child: TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: MakerPaymentInfoControllerinstance.ifsc_codecontroller.value,

                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(20),
                  hintText: "Ifsc Code",
                  hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.subtitletextcolor),
                 focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Color(0xffFE0091)),
                      ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff777777)),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xff777777)),
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
            SizedBox(height: height*0.03,),
           Obx(() => Center(
              child: MyButton(loading: MakerPaymentInfoControllerinstance.loading.value,
                  width: width*0.8,
                  title: "Save",
                  onTap: (){
                    if(_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
           MakerPaymentInfoControllerinstance.MakerPaymentInfoapiiHit();

                      // _submit();
                      
                    }
                  }),
            ),) 
          ],
        ),
      ),
    );
  }
}
