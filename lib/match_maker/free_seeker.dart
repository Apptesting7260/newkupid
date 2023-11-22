import 'package:cupid_match/match_maker/pending_matches.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class FreeSeekers extends StatefulWidget {
  const FreeSeekers({Key? key}) : super(key: key);

  @override
  State<FreeSeekers> createState() => _FreeSeekersState();
}

class _FreeSeekersState extends State<FreeSeekers> {

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
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: ListView(
        children: [
          SizedBox(height: height*.03,),
          ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 15,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                visualDensity: VisualDensity(vertical: -3),
                leading: CircleAvatar(
                  radius: 20,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage('https://images.unsplash.com/photo-1687208833983-ab2ac071fa41?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxMTV8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60'),
                  ),
                ),
                title: Text("Valentina, 22",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),),
                subtitle: Text("Jaipur",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w400,color: Color(0xff777777)),),
                trailing: MyButton(
                  bgColor: Color(0xffFE0091),
                  width: width*.34,
                  height: height*.04,
                  title: 'Approved', onTap: () {
                  // showDialog(
                  //   barrierDismissible: false,
                  //   context: context,
                  //   builder: (context) {
                  //     return Container(
                  //       child: Column(
                  //         children: [
                  //           AlertDialog(
                  //             backgroundColor: Color(0xffFFFFFF),
                  //             shape: RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(20),
                  //             ),
                  //             content: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 Align(
                  //                     alignment: Alignment.topRight,
                  //                     child: GestureDetector(
                  //                         onTap: () {
                  //                           Get.back();
                  //                         },
                  //                         child: Image.asset('assets/icons/cancel.png',height: height*.02,))),
                  //                 SizedBox(height: height*.01,),
                  //                 Text("Sorted Based On",style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600,fontSize: 17),),
                  //                 SizedBox(height: height*.03,),
                  //                 Row(
                  //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //                   children: [
                  //                     Column(
                  //                       crossAxisAlignment: CrossAxisAlignment.start,
                  //                       children: [
                  //                         Text(
                  //                           "Sex",
                  //                           style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 12,fontWeight: FontWeight.w600),
                  //                         ),
                  //                         SizedBox(height: height * 0.01,),
                  //                         Container(
                  //                           width: width*.3,
                  //                           height: height*.07,
                  //                           child: DropdownButtonFormField(value: genderValue,
                  //                               icon: const Icon(Icons.keyboard_arrow_down,color: Color(0xff000000)),
                  //                               style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xff777777)),
                  //                               items: genderItems.map((String items) {
                  //                                 return DropdownMenuItem(
                  //                                   value: items,
                  //                                   child: Text(items),
                  //                                 );
                  //                               }).toList(),
                  //                               onChanged: (String? newValue) {
                  //                                 setState(() {
                  //                                   genderValue = newValue!;
                  //                                 });
                  //                               },
                  //                               decoration: InputDecoration(
                  //                                 border: OutlineInputBorder(
                  //                                     borderRadius: BorderRadius.circular(30),
                  //                                     borderSide: BorderSide(color: Color(0xff777777))),
                  //                               )
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                     SizedBox(width: width*.01,),
                  //                     Column(
                  //                       crossAxisAlignment: CrossAxisAlignment.start,
                  //                       children: [
                  //                         Text(
                  //                           "Most Paid",
                  //                           style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 12, fontWeight: FontWeight.w600),
                  //                         ),
                  //                         SizedBox(height: height * 0.01,),
                  //                         Container(
                  //                           width: width*.3,
                  //                           height: height*.07,
                  //                           child: DropdownButtonFormField(value: paidValue,
                  //                               icon: const Icon(Icons.keyboard_arrow_down,color: Color(0xff000000)),
                  //                               style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xff777777)),
                  //                               items: paidItems.map((String items) {
                  //                                 return DropdownMenuItem(
                  //                                   value: items,
                  //                                   child: Text(items),
                  //                                 );
                  //                               }).toList(),
                  //                               onChanged: (String? newValue) {
                  //                                 setState(() {
                  //                                   paidValue = newValue!;
                  //                                 });
                  //                               },
                  //                               decoration: InputDecoration(
                  //                                 border: OutlineInputBorder(
                  //                                     borderRadius: BorderRadius.circular(30),
                  //                                     borderSide: BorderSide(color: Color(0xff777777))),
                  //                               )
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ],
                  //                 ),
                  //                 SizedBox(height: height*.03,),
                  //                 Text("Overdue Matches",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600,fontSize: 12),),
                  //                 SizedBox(height: height*.01,),
                  //                 DropdownButtonFormField(value: overdueValue,
                  //                     icon: const Icon(Icons.keyboard_arrow_down,color: Color(0xff000000)),
                  //                     style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Color(0xff777777)),
                  //                     items: overdueItems.map((String items) {
                  //                       return DropdownMenuItem(
                  //                         value: items,
                  //                         child: Text(items),
                  //                       );
                  //                     }).toList(),
                  //                     onChanged: (String? newValue) {
                  //                       setState(() {
                  //                         overdueValue = newValue!;
                  //                       });
                  //                     },
                  //                     decoration: InputDecoration(
                  //                       border: OutlineInputBorder(
                  //                           borderRadius: BorderRadius.circular(30),
                  //                           borderSide: BorderSide(color:Color(0xff777777))),
                  //                     )
                  //                 ),
                  //                 SizedBox(height: height*.04,),
                  //                 Center(
                  //                   child: MyButton(bgColor: Color(0xffFE0091),
                  //                     width: width*.5,
                  //                     title: 'Apply',
                  //                     onTap: () {
                  //                       Get.to(()=>PendingMatches());
                  //                     },),
                  //                 ),
                  //                 SizedBox(height: height*.03,),
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     );
                  //   },);
                },),
              );
            },)
        ],
      ),
    );
  }
}
