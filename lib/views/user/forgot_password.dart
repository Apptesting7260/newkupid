import 'package:cupid_match/views/user/login_Screen.dart';
import 'package:cupid_match/views/user/reset_password.dart';
import 'package:cupid_match/views/user/verification.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/controller/ForgotPasswordController/ForgotPasswordController.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  ForgotPasswordController ForgotPasswordControllerInstanse=Get.put(ForgotPasswordController());


  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back,
            size: 20,
            color: Color(0xff5A5A5A),
          ),
        ),
        title: Text(
          "Forgot Password",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Email/Mobile no.",
                style: Theme.of(context)
                    .textTheme
                    .titleSmall!
                    .copyWith(color: Colors.black),
              ),
              SizedBox(height: height * .01),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: ForgotPasswordControllerInstanse.EmailController.value,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !value.contains('@') ||
                      !value.contains('.')) {
                    return 'Invalid Email';
                  }
                  return null;
                },
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Color(0xffBABABA))),
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
                    hintText: "Enter email/Mobile no.",
                    filled: true,
                    fillColor: Colors.white),
              ),
              SizedBox(height: height * .03),
             Obx(() => Center(
               child: MyButton(
                 loading: ForgotPasswordControllerInstanse.loading.value,
                 title: "Send",
                 onTap: () {

                   ForgotPasswordControllerInstanse.ForgotPasswordApiHit();
                 },
               ),
             ),) ,
              SizedBox(height: height * .02),
              GestureDetector(
                onTap: () {
                  Get.to(() => LoginScreen());
                },
                child: Center(
                  child: RichText(
                    text: const TextSpan(
                        text: "Back to ",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Colors.grey),
                        children: [
                          TextSpan(
                              text: "Login",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  color: Color(0xffFE0091)))
                        ]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  validation() {
    print("send");
    if (!formKeyotp.currentState!.validate()) {
      return;
    } else {


    }
  }
}
