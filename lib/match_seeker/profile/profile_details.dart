import 'package:cupid_match/controllers/controller/GetAllOcupationsController/GetAllOcupations.dart';
import 'package:cupid_match/match_seeker/profile/interested_in.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({Key? key}) : super(key: key);

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  String _value = "Woman";

    final GetAllOcupationsControllerinstance= Get.put(GetAllOcupationsController());

    @override
  void initState() {
    print("object");
        GetAllOcupationsControllerinstance.GetAllOcupationsListApiHit();
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
          "Profile Details",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "I am a",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(
              height: height * .04,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _value = "Woman";
                });
              },
              child: Container(
                height: height * .075,
                width: width * 1,
                decoration: BoxDecoration(
                    color: _value != "Woman" ? Colors.white : Color(0xff000CAA),
                    border: _value != "Woman"
                        ? Border.all(color: Colors.grey)
                        : Border.all(color: Color(0xff000CAA)),
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Woman",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: _value != "Woman"
                                ? Colors.black
                                : Colors.white),
                      ),
                      Icon(
                        Icons.done,
                        size: 20,
                        color: _value != "Woman" ? Colors.grey : Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .03,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _value = "Man";
                });
              },
              child: Container(
                height: height * .075,
                width: width * 1,
                decoration: BoxDecoration(
                    color: _value != "Man" ? Colors.white : Color(0xff000CAA),
                    border: _value != "Man"
                        ? Border.all(color: Colors.grey)
                        : Border.all(color: Color(0xff000CAA)),
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Man",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color:
                                _value != "Man" ? Colors.black : Colors.white),
                      ),
                      Icon(
                        Icons.done,
                        size: 20,
                        color: _value != "Man" ? Colors.grey : Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .03,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  _value = "Choose another";
                });
              },
              child: Container(
                height: height * .075,
                width: width * 1,
                decoration: BoxDecoration(
                    color: _value != "Choose another"
                        ? Colors.white
                        : Color(0xff000CAA),
                    border: _value != "Choose another"
                        ? Border.all(color: Colors.grey)
                        : Border.all(color: Color(0xff000CAA)),
                    borderRadius: BorderRadius.circular(30)),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Choose another",
                        style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: _value != "Choose another"
                                ? Colors.black
                                : Colors.white),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        size: 20,
                        color: _value != "Choose another"
                            ? Colors.grey
                            : Colors.white,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .03,
            ),
            Center(
              child: MyButton(
                title: "Continue",
                onTap: () {
                  Get.to(() => InterstedIn());
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
