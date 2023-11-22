import 'package:cupid_match/views/sign_up/create_password.dart';
import 'package:cupid_match/views/user/reset_password.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:new_pinput/new_pinput.dart';

import '../../controllers/controller/ForgotPasswordController/ForgotPasswordController.dart';
import '../../controllers/controller/OtpVarificationController/OtpVarificationController.dart';

final GlobalKey<FormState> formKeyotp = GlobalKey();
class Verification extends StatefulWidget {


  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {

  final FocusNode _pinPutFocusNode = FocusNode();

  OtpVarificationController OtpVerificationInstanse=Get.put(OtpVarificationController());

  // BoxDecoration get _pinPutDecoration {
  //   return BoxDecoration(
  //     border: Border.all(color: Color(0xff2a319c)),
  //     borderRadius: BorderRadius.circular(15.0),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    final BoxDecoration _pinPutDecoration = BoxDecoration(
        color: const Color.fromRGBO(235, 236, 237, 1),
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all());
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20, color: Colors.grey, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(40),
      ),
    );

    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Verification",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Form(
        key: formKeyotp,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              SizedBox(
                height: height * .05,
              ),
              Center(
                child: Text(
                  "Enter verification code",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
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
                  onSubmitted: (String pin) => _showSnackBar(pin, context),
                  focusNode: _pinPutFocusNode,
                  controller: OtpVerificationInstanse.OtpController.value,
                  submittedPinTheme: PinTheme(
                      height: 56,
                      width: 56,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40.0),
                          border: Border.all(color: Color(0xffFE0091)),
                          color: Color(0xffFe0091))),
                  focusedPinTheme: defaultPinTheme,
                  followingPinTheme: defaultPinTheme,
                ),
              ),

              SizedBox(height: height * .02),
              Center(
                child: RichText(
                  text: const TextSpan(
                      text: "If you didn't recieve a code. ",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: Colors.grey),
                      children: [
                        TextSpan(
                            text: "Resend",
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Color(0xffFE0091)))
                      ]),
                ),
              ),
              SizedBox(height: height * .02),
              Obx(() => Center(
                child: MyButton(
                  loading: OtpVerificationInstanse.loading.value,
                  title: "Verify",
                  onTap: () {
                    OtpVerificationInstanse.OtpVerificationapiiHit(context);

                  },
                ),
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
