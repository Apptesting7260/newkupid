
import 'package:cupid_match/views/user/otp.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

import '../../controllers/controller/SignUpController/SignUpController.dart';

class Sign extends StatefulWidget {
  const Sign({Key? key}) : super(key: key);

  @override
  State<Sign> createState() => _SignState();
}

class _SignState extends State<Sign> {
 SignUpController SignUpControllerInstance=Get.put(SignUpController());
  final GlobalKey<FormState> _formKey = GlobalKey();
  bool isEmail(String input) => EmailValidator.validate(input);

  bool isPhone(String input) =>
      RegExp(r'^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$')
          .hasMatch(input);

        @override
  void initState() {
     SignUpControllerInstance.credentialsController.value.clear();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    //final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Sign Up",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: height * .03),
              Text(
                "Please enter your valid email. we will send\nyou a 6-digit code to verify",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey),
              ),
              SizedBox(height: height * .03),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.emailAddress,
                controller: SignUpControllerInstance.credentialsController.value,
                validator: (value) {
                  if (!isEmail(value!) && !isPhone(value!) ) {
                    return 'Please enter a valid email or phone number.';}

                  return null;
                },
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Colors.pinkAccent)),
                    hintStyle:
                        TextStyle(fontSize: 16, color: Color(0xffBABABA)),
                    contentPadding: EdgeInsets.all(18),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Color(0xffBABABA))),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(35.0)),
                        borderSide: BorderSide(color: Colors.red)
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Colors.pink),
                    ),
                    hintText: "Enter email/Mobile no.",
                    filled: true,
                    fillColor: Colors.white),
              ),
              SizedBox(height: height * .04),
             Obx(() =>  Center(
                child: 
                
                MyButton(
                  loading: SignUpControllerInstance.loading.value,
                  title: "Continue",
                  onTap: () {
                    print(SignUpControllerInstance.loading.value);
                    validation(context);
                  },
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  validation(BuildContext context) {
    print("send");
    if (!_formKey.currentState!.validate()) {
      return;
    } else {
      SignUpControllerInstance.SignUpapiHit(context);
      
    }
  }
}
