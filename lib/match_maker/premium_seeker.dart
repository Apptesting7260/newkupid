import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PremiumSeekers extends StatefulWidget {
  const PremiumSeekers({Key? key}) : super(key: key);

  @override
  State<PremiumSeekers> createState() => _PremiumSeekersState();
}

class _PremiumSeekersState extends State<PremiumSeekers> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Color(0xffFFFFFF),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: width*.02),
        child: ListView(
          children: [
            SizedBox(height: height*.03,),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 15,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return  GestureDetector(
                  onTap: () {

                  },
                  child: ListTile(
                    visualDensity: VisualDensity(vertical: -3),
                    leading: CircleAvatar(
                      radius: 20,
                      // backgroundColor: Color(0xffF4F4F4),
                      child: CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage('https://images.unsplash.com/photo-1687076613219-fb4b3d94e75a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwxNTh8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60'),
                      ),
                    ),
                    title: Text("Name, 20",style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),),
                    subtitle: Text("India",style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w400,color: Color(0xff777777)),),
                    trailing: MyButton(
                      width: width*.34,
                      height: height*.04,
                      bgColor: Color(0xffFE0091),

                      title: 'Approved',
                      onTap: () {

                      },),
                  ),
                );
              },)
          ],
        ),
      ),
    );
  }
}
