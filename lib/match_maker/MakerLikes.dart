import 'package:cupid_match/match_maker/invite_state.dart';
import 'package:cupid_match/widgets/MakerDrawer.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class MakerLikes extends StatefulWidget {
  const MakerLikes({Key? key}) : super(key: key);

  @override
  State<MakerLikes> createState() => _MakerLikesState();
}

class _MakerLikesState extends State<MakerLikes> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return RefreshIndicator(
      onRefresh: ()async {

      },
      child: Scaffold(
        appBar: AppBar(

          title: Text("Likes",style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),),
          centerTitle: true,
actions: [
              Builder(
                builder: (context) {
                  return GestureDetector(
                      onTap: () {
                        Scaffold.of(context).openEndDrawer();
                        MaterialLocalizations.of(context).openAppDrawerTooltip;
                      },
                      child: Image.asset("assets/icons/menu.png"));
                },
              )
            ],

        ),
        endDrawer: Drawer(
            child: MakerDrawer()
          ),
        body:
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/recentmatchempt.png',
              width: Get.width * 0.83,
            ),
            Text(
              "Reference site about Lorem Ipsum, giving information on its origins",
              style: Get.theme.textTheme.bodySmall,
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
