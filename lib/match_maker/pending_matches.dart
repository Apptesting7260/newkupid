import 'package:cupid_match/match_maker/payment_info.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PendingMatches extends StatefulWidget {
  const PendingMatches({Key? key}) : super(key: key);

  @override
  State<PendingMatches> createState() => _PendingMatchesState();
}

class _PendingMatchesState extends State<PendingMatches> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
          "Pending Matches",
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
                visualDensity: VisualDensity(vertical: -3),
                leading: CircleAvatar(
                  radius: 20,
                  child: CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                        "https://images.unsplash.com/photo-1687161590608-6d948d357bad?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHwzMjV8fHxlbnwwfHx8fHw%3D&auto=format&fit=crop&w=500&q=60"),
                  ),
                ),
                title: Text(
                  "Robert Downey, 22",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall
                      ?.copyWith(fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  "India",
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      fontWeight: FontWeight.w300, color: Color(0xfff777777)),
                ),
                trailing: MyButton(
                  width: width*.34,
                  height: height*.04,
                  title: 'Approved',
                  onTap: () {
                    Get.to(() => PaymentInfo());
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
