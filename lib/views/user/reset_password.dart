import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/controller/ForgotPasswordResetController/ForgotPasswordResetController.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  ForgotPasswordResetController ForgotPasswordResetControllerInstanse=Get.put(ForgotPasswordResetController());

  // final TextEditingController _pass = TextEditingController();
  // final TextEditingController _confirmPass = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey();

  @override
  void initState() {
    _passwordVisible = false;
    _passwordVisiblee = false;
    // TODO: implement initState
    super.initState();
  }

  bool isValid = true;
  bool _passwordVisible = true;
  bool _passwordVisiblee = true;

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
          "New Password",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: height * .06),
              TextFormField(
                obscureText: !_passwordVisible,
                keyboardType: TextInputType.emailAddress,
                controller: ForgotPasswordResetControllerInstanse.PasswordController.value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Password";
                  } else {
                    return null;
                  }
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
                      borderSide: BorderSide(color: Color(0xffBABABA)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA)),
                    ),
                    hintText: "Enter your password",
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        )),
                    filled: true,
                    fillColor: Colors.white),
              ),
              SizedBox(
                height: height * .02,
              ),
              TextFormField(
                obscureText: !_passwordVisiblee,
                keyboardType: TextInputType.emailAddress,
                controller: ForgotPasswordResetControllerInstanse.PasswordController.value,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Password";
                  } else if (value != ForgotPasswordResetControllerInstanse.PasswordController.value.text) {
                    return "Not Matched";
                  } else {
                    return null;
                  }
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
                      borderSide: BorderSide(color: Color(0xffBABABA)),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA)),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(35.0)),
                      borderSide: BorderSide(color: Color(0xffBABABA)),
                    ),
                    hintText: "Enter your password",
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _passwordVisiblee = !_passwordVisiblee;
                          });
                        },
                        icon: Icon(
                          _passwordVisiblee
                              ? Icons.visibility
                              : Icons.visibility_off,
                        )),
                    filled: true,
                    fillColor: Colors.white),
              ),
              SizedBox(height: height * .02),
              MyButton(
                title: "Save",
                onTap: () {
                  ForgotPasswordResetControllerInstanse.ForgotPasswordResetApiHit();
                  //validate();

                },
              )
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
    }
  }
}
