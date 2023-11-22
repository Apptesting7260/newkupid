import 'package:cupid_match/match_maker/free_seeker.dart';
import 'package:cupid_match/match_maker/pending_matches.dart';
import 'package:cupid_match/match_maker/premium_seeker.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PremiumTab extends StatefulWidget {
  const PremiumTab({Key? key}) : super(key: key);

  @override
  State<PremiumTab> createState() => _PremiumTabState();
}

class _PremiumTabState extends State<PremiumTab> {
  String genderValue = 'Male';
  var genderItems = [
    "Male",
    "Female",
    "Other",
  ];

  String paidValue = 'Paid';
  var paidItems = [
    "Paid",
    "100",
    "150",
  ];

  String overdueValue = 'Overdue Matches';
  var overdueItems = [
    "Overdue Matches",
    "Pending Matches",
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Color(0xffFFFFFF),
          // appBar: AppBar(
          //   leading: IconButton(onPressed: () {
          //     Get.back();
          //   }, icon: Icon(Icons.arrow_back,color: Color(0xff5A5A5A), size: 27)),
          //   elevation: 0,
          //   backgroundColor: Color(0xffFFFFFF),
          //  title:  Text("Premium & Free Seekers",style: Theme.of(context).textTheme.titleLarge,),
          //   centerTitle: true,
          //   bottom: TabBar(
          //     isScrollable: true,
          //     indicator: UnderlineTabIndicator(
          //       borderSide: BorderSide(width: 3.0,color: Color(0xffFE0091)),
          //       insets: EdgeInsets.symmetric(horizontal: width*.12),
          //     ),
          //    physics: AlwaysScrollableScrollPhysics(),
          //     unselectedLabelColor: Color(0xffD4D4D4),
          //     labelColor: Color(0xffFE0091),
          //     labelStyle: Theme.of(context).textTheme.titleSmall,
          //     tabs: [
          //       Tab(text: "Premium Seekers"),
          //       Tab(text: "Free Seekers",),
          //     ],
          //   ),
          // ),
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(180),
            child: AppBar(
              elevation: 0,
              backgroundColor: Color(0xffFFFFFF),
              leading: IconButton(onPressed: () {
                Get.back();
              }, icon: Icon(Icons.arrow_back,color: Color(0xff5A5A5A), size: 27,)),
              title: Text("Premium & Free Seekers",style: Theme.of(context).textTheme.titleLarge,),
              flexibleSpace: Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width*.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Can be sorted based on',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return Container(
                                child: Column(
                                  children: [
                                    AlertDialog(
                                      backgroundColor: Color(0xffFFFFFF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      content: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                              alignment: Alignment.topRight,
                                              child: GestureDetector(
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                  child: Image.asset('assets/icons/cancel.png',height: height*.02,))),
                                          SizedBox(height: height*.01,),
                                          Text("Sorted Based On",style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600,fontSize: 17),),
                                          SizedBox(height: height*.03,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Sex",
                                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 12,fontWeight: FontWeight.w600),
                                                  ),
                                                  SizedBox(height: height * 0.01,),
                                                  Container(
                                                    width: width*.3,
                                                    height: height*.07,
                                                    child: DropdownButtonFormField(value: genderValue,
                                                        icon: const Icon(Icons.keyboard_arrow_down,color: Color(0xff000000)),
                                                        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xff777777)),
                                                        items: genderItems.map((String items) {
                                                          return DropdownMenuItem(
                                                            value: items,
                                                            child: Text(items),
                                                          );
                                                        }).toList(),
                                                        onChanged: (String? newValue) {
                                                          setState(() {
                                                            genderValue = newValue!;
                                                          });
                                                        },
                                                        decoration: InputDecoration(
                                                          border: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(30),
                                                              borderSide: BorderSide(color: Color(0xff777777))),
                                                        )
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: width*.01,),
                                              Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Most Paid",
                                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 12, fontWeight: FontWeight.w600),
                                                  ),
                                                  SizedBox(height: height * 0.01,),
                                                  Container(
                                                    width: width*.3,
                                                    height: height*.07,
                                                    child: DropdownButtonFormField(value: paidValue,
                                                        icon: const Icon(Icons.keyboard_arrow_down,color: Color(0xff000000)),
                                                        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xff777777)),
                                                        items: paidItems.map((String items) {
                                                          return DropdownMenuItem(
                                                            value: items,
                                                            child: Text(items),
                                                          );
                                                        }).toList(),
                                                        onChanged: (String? newValue) {
                                                          setState(() {
                                                            paidValue = newValue!;
                                                          });
                                                        },
                                                        decoration: InputDecoration(
                                                          border: OutlineInputBorder(
                                                              borderRadius: BorderRadius.circular(30),
                                                              borderSide: BorderSide(color: Color(0xff777777))),
                                                        )
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: height*.03,),
                                          Text("Overdue Matches",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600,fontSize: 12),),
                                          SizedBox(height: height*.01,),
                                          DropdownButtonFormField(value: overdueValue,
                                              icon: const Icon(Icons.keyboard_arrow_down,color: Color(0xff000000)),
                                              style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xff777777)),
                                              items: overdueItems.map((String items) {
                                                return DropdownMenuItem(
                                                  value: items,
                                                  child: Text(items),
                                                );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                                setState(() {
                                                  overdueValue = newValue!;
                                                });
                                              },
                                              decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderRadius: BorderRadius.circular(30),
                                                    borderSide: BorderSide(color:Color(0xff777777))),
                                              )
                                          ),
                                          SizedBox(height: height*.04,),
                                          Center(
                                            child: MyButton(bgColor: Color(0xffFE0091),
                                              width: width*.5,
                                              title: 'Apply',
                                              onTap: () {
                                                Get.to(()=>PendingMatches());
                                              },),
                                          ),
                                          SizedBox(height: height*.03,),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },);
                        },
                          child: Image.asset('assets/icons/filter.png',height: height*.03,)),
                    ],
                  ),
                ),
              ),
              bottom: TabBar(
                indicatorPadding: EdgeInsets.only(right: 110),
                labelPadding: EdgeInsets.only(right: 50),
                isScrollable: true,
                indicator: UnderlineTabIndicator(
                  borderSide: BorderSide(width: 3.0,color: Color(0xffFE0091)),
                  //insets: EdgeInsets.symmetric(horizontal: width*.14),
                ),
                physics: AlwaysScrollableScrollPhysics(),
                unselectedLabelColor: Color(0xffD4D4D4),
                labelColor: Color(0xffFE0091),
                labelStyle: Theme.of(context).textTheme.titleSmall,
                tabs: [
                  Tab(text: "Premium Seekers"),
                  Tab(text: "Free Seekers",),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              PremiumSeekers(),
              FreeSeekers()
            ],
          ),
        ),
      ),
    );
  }
}
