import 'package:cupid_match/match_seeker/Chose_role_Type.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseOne extends StatefulWidget {
  const ChooseOne({Key? key}) : super(key: key);

  @override
  State<ChooseOne> createState() => _ChooseOneState();
}

class _ChooseOneState extends State<ChooseOne> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Choose one",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Align(
            alignment: Alignment.topCenter,
            child: GestureDetector(
              onTap: () {
                Get.to(()=>Chose_Role_Type());
              },
              child: Container(
                  width: width * 1,
                  child: Image.asset("assets/images/spin_wheel.png",fit: BoxFit.cover,)),
            )),
      ),
    );
  }
}
