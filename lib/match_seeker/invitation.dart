import 'package:flutter/material.dart';

class Invitation extends StatefulWidget {
  const Invitation({Key? key}) : super(key: key);

  @override
  State<Invitation> createState() => _InvitationState();
}

class _InvitationState extends State<Invitation> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Invitation",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
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
                        width: width * .03,
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
                      SizedBox(width: width*0.08),
                      Container(
                        height: height * .04,
                        width: width * .19,
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
                      SizedBox(width: width*0.02),

                      Container(
                        height: height * .04,
                        width: width * .19,
                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(15),border: Border.all(color: Color(0xff000CAA))
                        ),
                        child: Center(
                          child: Text(
                            "Decline",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: Color(0xff000CAA)),
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
