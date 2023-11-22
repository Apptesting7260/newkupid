import 'dart:async';

import 'package:cupid_match/controllers/controller/OtpVarificationController/OtpVarificationController.dart';
import 'package:cupid_match/views/sign_up/create_password.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:new_pinput/new_pinput.dart';

import '../../controllers/controller/ResendOtpController/ResendOtpController.dart';


class PinFields extends StatefulWidget {
  final Key formKey;
  final FocusNode pinPutFocusNode;

  const PinFields(
      {Key? key,
      required this.formKey,

      required this.pinPutFocusNode})
      : super(key: key);

  @override
  State<PinFields> createState() => _PinFieldsState();
}

class _PinFieldsState extends State<PinFields> {
final OtpVarificationControllerinstace=Get.put(OtpVarificationController());
  final FocusNode _pinPutFocusNode = FocusNode();
final ResendOtpControllerInstanse=Get.put(ResendOtpController());
@override
  void initState() {
    OtpVarificationControllerinstace.OtpController.value.clear();
    // TODO: implement initState
    super.initState();
    startTimer();
  }
  // BoxDecoration get _pinPutDecoration {
  //   return BoxDecoration(
  //     border: Border.all(color: Color(0xff2a319c)),
  //     borderRadius: BorderRadius.circular(15.0),
  //   );
  // }
var time=30;
var count="00";
late Timer _timer;
void startTimer() {
  const oneSecond = Duration(seconds: 1);
  _timer = Timer.periodic(oneSecond, (timer) {

  if(time>=1){
    setState(() {
      time--;
     if( time.toString().length==2){
       count=time.toString();
     }
     else{
       count="0$time";
     }

    });
  }


  });
}
  @override
  Widget build(BuildContext context) {
    final BoxDecoration _pinPutDecoration = BoxDecoration(
        color:  Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all());
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 30, color: Colors.white, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(40),
      ),
    );
    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      color: Color(0xffFE0091),
      border: Border.all(color: Colors.green),
      borderRadius: BorderRadius.circular(50),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration!.copyWith(
          color: Color(0xffFE0091),
          borderRadius: BorderRadius.circular(50)
      ),
    );

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text("Verification Screen"),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: widget.formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                height: height * .1,
              ),
             Center(
               child:Text(count.toString(),style: TextStyle(color: Color(0xffFE0091),fontWeight: FontWeight.bold,fontSize: 25),) ,
             ),
              SizedBox(
                height: height * .05,
              ),
              Center(
                child: Text(
                  "Type the verification code\n         we've sent you",
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: Colors.black),
                ),
              ),
              SizedBox(
                height: height * .05,
              ),
              /*Pinput(

              validator: (s) {
                if (s?.contains('1')??false) return null;
                return 'NOT VALID';
              },
              useNativeKeyboard: true,
              length: 6,
              // fieldsCount: 6,

              fieldsAlignment: MainAxisAlignment.spaceAround,
              textStyle: const TextStyle(fontSize: 25.0, color: Colors.black),
              eachFieldMargin: const EdgeInsets.all(0),
              eachFieldWidth: 45.0,
              eachFieldHeight: 55.0,
              onSubmit: (String pin) => DeviceUtils.hideKeyboard(context),
              focusNode: widget.pinPutFocusNode,
              controller: widget.controller,
              submittedFieldDecoration: pinPutDecoration.copyWith(
                color: Colors.white,

              ),
              selectedFieldDecoration: pinPutDecoration.copyWith(
                color: Colors.white,
                border: Border.all(
                  width: 2,
                  color:  Colors.black,
                ),
              ),

              followingFieldDecoration: pinPutDecoration.copyWith(color: Colors.white),
              pinAnimationType: PinAnimationType.scale,
            ),*/
              Center(
                child: Pinput(
                  validator: (value) {
                    if (value!.isEmpty && value.length != 6) {
                      return "Please enter your 6 digit pin";
                    } else {
                      return null;
                    }
                  },
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  length: 6,
                  autofocus: true,
                  //
                  // validator: (s) {
                  //   if (s?.contains('1')??false) return null;
                  //   return 'NOT VALID';
                  // },
                  useNativeKeyboard: true,
                  keyboardType: TextInputType.number,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  onSubmitted: (String pin) => _showSnackBar(pin, context),
                  focusNode: _pinPutFocusNode,
                  controller: OtpVarificationControllerinstace.OtpController.value,
                  // submittedPinTheme: PinTheme(
                  //     height: 56,
                  //     width: 56,
                  //     decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(40.0),
                  //         border: Border.all(color: Color(0xffFE0091)),
                  //         color: Color(0xffFe0091))),
                  // focusedPinTheme: defaultPinTheme,
                  followingPinTheme: defaultPinTheme,
                ),
              ),
              SizedBox(height: height * .05),
            Obx(() => Center(
                child: MyButton(
                  loading: OtpVarificationControllerinstace.loading.value,
                  title: "Verify",
                  onTap: () {
                    OtpVarificationControllerinstace.OtpVerificationapiiHit(context);
                  
                  },
                ),
              ),)  ,
              SizedBox(height: height * .05),
              Obx(() =>  InkWell(
                child: Center(
                  child: ResendOtpControllerInstanse.loading.value==false? Text(
                    "Resend Otp",
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Color(0xffFE0091)),
                  ):  LoadingAnimationWidget.inkDrop(
                    color: Color(0xffFE0091),
                    size: 20,
                  ),
                ),
                onTap: (){
                  setState(() {
                    startTimer();
                  });
                  ResendOtpControllerInstanse.ResendOtpapiiHit();
                },
              ),)

            ],
          ),
        ),
      ),
    );
  }

  void _showSnackBar(String pin, BuildContext context) {
    final snackBar = SnackBar(
      content: Container(
        height: 80.0,
        child: Center(
          child: Text(
            'Pin Submitted. Value: $pin',
            style: const TextStyle(fontSize: 25.0),
          ),
        ),
      ),
      backgroundColor: Theme.of(context).highlightColor,
    );
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
