import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _value = 1;
  int _valuee = 1;
  int currentindex = 0;
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 60.0),
                  alignment: Alignment.topCenter,
                  height: height * .25,
                  width: width * 1,
                  decoration: BoxDecoration(color: Color(0xffF3F3F3)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back,
                            size: 20,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(width: width * .36),
                        Text(
                          "Profile",
                          style: Theme.of(context).textTheme.titleLarge,
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 115,
                  left: 145,
                  child: Container(
                    height: height * .2,
                    width: width * .3,
                    child: CircleAvatar(
                      radius: 30.0,
                      backgroundImage: NetworkImage(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
                      backgroundColor: Colors.transparent,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height * .01,
                  ),
                  Center(
                    child: Text(
                      "John Deo, 22",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  SizedBox(
                    height: height * .01,
                  ),
                  Center(
                    child: Text(
                      "Jaipur, Indian",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: Colors.grey),
                    ),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Text("Sex",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black)),
                  SizedBox(
                    height: height * .01,
                  ),
                  Text(
                    "Male",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Text("Match Maker Experience:",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black)),
                  SizedBox(
                    height: height * .01,
                  ),
                  Text(
                    "5 Years Experience",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Text("Metrics of Matches Completed",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black)),
                  SizedBox(
                    height: height * .01,
                  ),
                  Text(
                    "50 Matches Completed",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Text("Successful Matches",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black)),
                  SizedBox(
                    height: height * .01,
                  ),
                  Text(
                    "40 Matches Completed",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Text("Liked Profile",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black)),
                  SizedBox(
                    height: height * .01,
                  ),
                  Text(
                    "30 likes",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Text("About The Match Maker",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black)),
                  SizedBox(
                    height: height * .01,
                  ),
                  Text(
                    "Loreum Ipsum is simply dummyy text of the printing\nand typesetting industry",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Text("How The Match Maker Will Work For The Matches",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black)),
                  SizedBox(
                    height: height * .01,
                  ),
                  Text(
                    "Loreum Ipsum is simply dummyy text of the printing\nand typesetting industry",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Text("What Do You Expect From Your Match Seekers",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black)),
                  SizedBox(
                    height: height * .01,
                  ),
                  Text(
                    "Loreum Ipsum is simply dummyy text of the printing\nand typesetting industry",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Text("Match Maker Heading That They Want\nEveryone To See:",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.black)),
                  SizedBox(
                    height: height * .01,
                  ),
                  Text(
                    "Loreum Ipsum is simply dummyy text of the printing\nand typesetting industry",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: Colors.grey),
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Text("Cost Breakdown:",
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(color: Colors.black)),
                  SizedBox(
                    height: height * .02,
                  ),
                  Text("Matches Subscriptions",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.black)),
                  SizedBox(
                    height: height * .02,
                  ),
                  Container(
                    height: height * .075,
                    width: width * 1,
                    decoration: BoxDecoration(
                        border: _value != 1
                            ? Border.all(color: Colors.grey)
                            : Border.all(color: Color(0xffFE0091)),
                        borderRadius: BorderRadius.circular(35)),
                    child: RadioListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "5 Matches",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.black),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.remove,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                Text(
                                  " \$6 ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: Color(0xffFE0091)),
                                ),
                                Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ],
                            )
                          ],
                        ),
                        value: 1,
                        groupValue: _value,
                        onChanged: (val) {
                          setState(() {
                            _value = val!;
                          });
                        },
                        activeColor: Color(0xffFE0091)),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Container(
                    height: height * .075,
                    width: width * 1,
                    decoration: BoxDecoration(
                        border: _value != 2
                            ? Border.all(color: Colors.grey)
                            : Border.all(color: Color(0xffFE0091)),
                        borderRadius: BorderRadius.circular(35)),
                    child: RadioListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "10 Matches",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.black),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.remove,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                Text(
                                  " \$6 ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: Color(0xffFE0091)),
                                ),
                                Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ],
                            )
                          ],
                        ),
                        value: 2,
                        groupValue: _value,
                        onChanged: (val) {
                          setState(() {
                            _value = val!;
                          });
                        },
                        activeColor: Color(0xffFE0091)),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Container(
                    height: height * .075,
                    width: width * 1,
                    decoration: BoxDecoration(
                        border: _value != 3
                            ? Border.all(color: Colors.grey)
                            : Border.all(color: Color(0xffFE0091)),
                        borderRadius: BorderRadius.circular(35)),
                    child: RadioListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "30 Matches",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.black),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.remove,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                Text(
                                  " \$6 ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: Color(0xffFE0091)),
                                ),
                                Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ],
                            )
                          ],
                        ),
                        value: 3,
                        groupValue: _value,
                        onChanged: (val) {
                          setState(() {
                            _value = val!;
                          });
                        },
                        activeColor: Color(0xffFE0091)),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Text("Monthly Subscriptions",
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall!
                          .copyWith(color: Colors.black)),
                  SizedBox(
                    height: height * .02,
                  ),
                  Container(
                    height: height * .075,
                    width: width * 1,
                    decoration: BoxDecoration(
                        border: _valuee != 1
                            ? Border.all(color: Colors.grey)
                            : Border.all(color: Color(0xffFE0091)),
                        borderRadius: BorderRadius.circular(35)),
                    child: RadioListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "1 Month",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.black),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.remove,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                Text(
                                  " \$6 ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: Color(0xffFE0091)),
                                ),
                                Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ],
                            )
                          ],
                        ),
                        value: 1,
                        groupValue: _valuee,
                        onChanged: (val) {
                          setState(() {
                            _valuee = val!;
                          });
                        },
                        activeColor: Color(0xffFE0091)),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Container(
                    height: height * .075,
                    width: width * 1,
                    decoration: BoxDecoration(
                        border: _valuee != 2
                            ? Border.all(color: Colors.grey)
                            : Border.all(color: Color(0xffFE0091)),
                        borderRadius: BorderRadius.circular(35)),
                    child: RadioListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "3 Month",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.black),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.remove,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                Text(
                                  " \$6 ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: Color(0xffFE0091)),
                                ),
                                Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ],
                            )
                          ],
                        ),
                        value: 2,
                        groupValue: _valuee,
                        onChanged: (val) {
                          setState(() {
                            _valuee = val!;
                          });
                        },
                        activeColor: Color(0xffFE0091)),
                  ),
                  SizedBox(
                    height: height * .02,
                  ),
                  Container(
                    height: height * .075,
                    width: width * 1,
                    decoration: BoxDecoration(
                        border: _valuee != 3
                            ? Border.all(color: Colors.grey)
                            : Border.all(color: Color(0xffFE0091)),
                        borderRadius: BorderRadius.circular(35)),
                    child: RadioListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "6 Month",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.black),
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.remove,
                                  size: 20,
                                  color: Colors.black,
                                ),
                                Text(
                                  " \$6 ",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(color: Color(0xffFE0091)),
                                ),
                                Icon(
                                  Icons.add,
                                  size: 20,
                                  color: Colors.black,
                                ),
                              ],
                            )
                          ],
                        ),
                        value: 3,
                        groupValue: _valuee,
                        onChanged: (val) {
                          setState(() {
                            _valuee = val!;
                          });
                        },
                        activeColor: Color(0xffFE0091)),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
