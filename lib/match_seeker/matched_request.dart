import 'package:cupid_match/match_seeker/list_matches.dart';
import 'package:cupid_match/match_seeker/profile.dart';
import 'package:cupid_match/match_seeker/profile/filter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchedRequesd extends StatefulWidget {
  const MatchedRequesd({Key? key}) : super(key: key);

  @override
  State<MatchedRequesd> createState() => _MatchedRequesdState();
}

class _MatchedRequesdState extends State<MatchedRequesd> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Request to be Matched",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Search by Filter",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                GestureDetector(
                    onTap: () {
                      Get.to(() => Filter());
                    },
                    child: Image.asset("assets/icons/filter.png"))
              ],
            ),
            Expanded(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 6,
                itemExtent: 80,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundImage: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
                        backgroundColor: Colors.transparent,
                      ),
                      SizedBox(
                        width: width * .05,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "John Deo",
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          SizedBox(
                            height: height * .01,
                          ),
                          Text(
                            "Match Maker",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(width: width * .17),
                      GestureDetector(
                        onTap: () {
                         Get.to(()=>ListMatches());
                          // showDialog(
                          //   barrierDismissible: false,
                          //   context: context,
                          //   builder: (context) {
                          //     return AlertDialog(
                          //       shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.all(
                          //               Radius.circular(32.0))),
                          //       insetPadding: EdgeInsets.all(0),
                          //       title: Column(
                          //         crossAxisAlignment: CrossAxisAlignment.center,
                          //         children: [
                          //           Align(
                          //               alignment: Alignment.bottomRight,
                          //               child: GestureDetector(
                          //                 onTap: () {
                          //                   Get.back();
                          //                 },
                          //                 child: Image.asset(
                          //                     "assets/icons/cancel.png"),
                          //               )),
                          //           Text(
                          //             "Profile",
                          //             style: Theme.of(context)
                          //                 .textTheme
                          //                 .titleLarge,
                          //           ),
                          //           Center(
                          //             child: Container(
                          //               height: height * .3,
                          //               width: width * .3,
                          //               child: CircleAvatar(
                          //                 radius: 30.0,
                          //                 backgroundImage: NetworkImage(
                          //                     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU"),
                          //                 backgroundColor: Colors.transparent,
                          //               ),
                          //             ),
                          //           ),
                          //           Text(
                          //             "John Deo, 22",
                          //             style: Theme.of(context)
                          //                 .textTheme
                          //                 .titleLarge,
                          //           ),
                          //           SizedBox(
                          //             height: height * .02,
                          //           ),
                          //           Text(
                          //             "Jaipur, Indian",
                          //             style: Theme.of(context)
                          //                 .textTheme
                          //                 .bodySmall!
                          //                 .copyWith(color: Colors.grey),
                          //           ),
                          //           SizedBox(
                          //             height: height * .02,
                          //           ),
                          //           Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.center,
                          //             children: [
                          //               Text(
                          //                 "Sex",
                          //                 style: Theme.of(context)
                          //                     .textTheme
                          //                     .bodySmall,
                          //               ),
                          //               Text(
                          //                 " Male",
                          //                 style: Theme.of(context)
                          //                     .textTheme
                          //                     .bodySmall!
                          //                     .copyWith(color: Colors.grey),
                          //               ),
                          //             ],
                          //           ),
                          //           SizedBox(
                          //             height: height * .01,
                          //           ),
                          //           Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.center,
                          //             children: [
                          //               Text(
                          //                 "Experience:",
                          //                 style: Theme.of(context)
                          //                     .textTheme
                          //                     .bodySmall,
                          //               ),
                          //               Text(
                          //                 " 5 Years",
                          //                 style: Theme.of(context)
                          //                     .textTheme
                          //                     .bodySmall!
                          //                     .copyWith(color: Colors.grey),
                          //               ),
                          //             ],
                          //           ),
                          //           SizedBox(
                          //             height: height * .01,
                          //           ),
                          //           Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.center,
                          //             children: [
                          //               Text(
                          //                 "Matches Completed",
                          //                 style: Theme.of(context)
                          //                     .textTheme
                          //                     .bodySmall,
                          //               ),
                          //               Text(
                          //                 " 50 Matches",
                          //                 style: Theme.of(context)
                          //                     .textTheme
                          //                     .bodySmall!
                          //                     .copyWith(color: Colors.grey),
                          //               ),
                          //             ],
                          //           ),
                          //           SizedBox(
                          //             height: height * .01,
                          //           ),
                          //           Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.center,
                          //             children: [
                          //               Text(
                          //                 "Successful Matches",
                          //                 style: Theme.of(context)
                          //                     .textTheme
                          //                     .bodySmall,
                          //               ),
                          //               Text(
                          //                 " 40 Matches",
                          //                 style: Theme.of(context)
                          //                     .textTheme
                          //                     .bodySmall!
                          //                     .copyWith(color: Colors.grey),
                          //               ),
                          //             ],
                          //           ),
                          //           SizedBox(
                          //             height: height * .01,
                          //           ),
                          //           Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.center,
                          //             children: [
                          //               Text(
                          //                 "Liked Profile",
                          //                 style: Theme.of(context)
                          //                     .textTheme
                          //                     .bodySmall,
                          //               ),
                          //               Text(
                          //                 " 30 likes",
                          //                 style: Theme.of(context)
                          //                     .textTheme
                          //                     .bodySmall!
                          //                     .copyWith(color: Colors.grey),
                          //               ),
                          //             ],
                          //           ),
                          //           SizedBox(
                          //             height: height * .02,
                          //           ),
                          //           GestureDetector(
                          //             onTap: () {
                          //               Get.to(() => Profile());
                          //             },
                          //             child: Container(
                          //               height: height * .04,
                          //               width: width * .3,
                          //               decoration: BoxDecoration(
                          //                 color: Color(0xffFE0091),
                          //                 borderRadius:
                          //                     BorderRadius.circular(15),
                          //               ),
                          //               child: Center(
                          //                 child: Text(
                          //                   "Request",
                          //                   style: Theme.of(context)
                          //                       .textTheme
                          //                       .bodySmall!
                          //                       .copyWith(color: Colors.white),
                          //                 ),
                          //               ),
                          //             ),
                          //           ),
                          //           SizedBox(
                          //             height:
                          //                 MediaQuery.of(context).size.height *
                          //                     .02,
                          //           ),
                          //         ],
                          //       ),
                          //     );
                          //   },
                          // );
                        },
                        child: Container(
                          height: height * .04,
                          width: width * .3,
                          decoration: BoxDecoration(
                            color: Color(0xffFE0091),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              "Request",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
