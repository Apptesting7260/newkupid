import 'package:cupid_match/match_maker/like_profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/my_button.dart';

class Invite extends StatefulWidget {
  const Invite({Key? key}) : super(key: key);

  @override
  State<Invite> createState() => _InviteState();
}

class _InviteState extends State<Invite> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Color(0xff5A5A5A),
              size: 27,
            )),
        title: Text(
          "Invite Friends",
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          SizedBox(
            height: height * .02,
          ),
          ListView.builder(
            itemCount: 7,
            scrollDirection: Axis.vertical,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return ListTile(
                visualDensity: VisualDensity(vertical: -3, horizontal: -2),
                leading: CircleAvatar(
                  radius: 22,
                  child: CircleAvatar(
                    radius: 22,
                    backgroundImage: NetworkImage(
                        'https://images.unsplash.com/photo-1619539465730-fea9ebf950f8?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGUlMjBpbWFnZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                  ),
                ),
                title: Text(
                  "William Deo",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  "user1@gmail.com",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w300, color: Color(0xff777777)),
                ),
                trailing: MyButton(
                  width: width * .26,
                  height: height * .04,
                  title: 'Invite',
                  onTap: () {
                    // Get.to(()=> Videos());
                    Get.to(() => ProfileLikes());
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
