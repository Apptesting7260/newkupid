import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class ProfileLikes extends StatefulWidget {
  const ProfileLikes({Key? key}) : super(key: key);

  @override
  State<ProfileLikes> createState() => _ProfileLikesState();
}

class _ProfileLikesState extends State<ProfileLikes> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              height: height * 1,
              width: width * 1,
              child: Stack(
                children: [
                  Container(
                    width: width * 1,
                    height: height * .4,
                    child: Image.network(
                      "https://img.freepik.com/premium-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      top: 30,
                      left: 20,
                      child: GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Icon(
                          Icons.arrow_back,
                          size: 20,
                          color: Colors.black,
                        ),
                      )),
                  Positioned(
                    left: 147,top: 235,
                    child: Container(
                      height: 90,
                        width: 90,
                        child: Image.asset("assets/maker/like.png",fit: BoxFit.cover,)),
                  ),
                  Positioned(
                    top: 270,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,


                          borderRadius: BorderRadius.circular(40)),
                      height: height * .7,
                      width: width * 1,
                      child: Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: ListView(
                          children: [
                            SizedBox(height: height * .02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Henry Peterson, 28",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium),
                                    SizedBox(
                                      height: height * .01,
                                    ),
                                    Text("Proffesional model",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: Colors.grey)),
                                  ],
                                ),
                                Image.asset("assets/icons/send.png")
                              ],
                            ),
                            SizedBox(height: height * .02),
                            Center(
                              child: Image.asset("assets/images/vedio.png"),
                            ),
                            SizedBox(height: height * .02),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("Location",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall),
                                    SizedBox(
                                      height: height * .01,
                                    ),
                                    Text("Chicago, IL United States",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(color: Colors.grey)),
                                  ],
                                ),
                                Container(
                                  height: height * .05,
                                  width: width * .18,
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade50,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.location_on_outlined,
                                        size: 20,
                                        color: Color(0xff000CAA),
                                      ),
                                      Text(
                                        "1 km",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(color: Color(0xff000CAA)),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: height * .03),
                            Text("Mobile Number",
                                style: Theme.of(context).textTheme.titleSmall),
                            SizedBox(
                              height: height * .01,
                            ),
                            Text("0987654321",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.grey)),
                            SizedBox(height: height * .03),
                            Text("Occupation",
                                style: Theme.of(context).textTheme.titleSmall),
                            SizedBox(
                              height: height * .01,
                            ),
                            Text("Electrician",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.grey)),
                            SizedBox(height: height * .03),
                            Text("Birthday Date",
                                style: Theme.of(context).textTheme.titleSmall),
                            SizedBox(
                              height: height * .01,
                            ),
                            Text("11 July",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.grey)),
                            SizedBox(height: height * .03),
                            Text("About",
                                style: Theme.of(context).textTheme.titleSmall),
                            SizedBox(
                              height: height * .01,
                            ),
                            Text(
                                "My name is Henry and i enjoy meeting new people\nand finding ways to help them have an uplifting\nexperience. I enjoy reading.",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: Colors.grey)),
                            SizedBox(height: height * .01),
                            Text("Read more",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(color: Color(0xffFE0091))),
                            SizedBox(height: height * .03),
                            Text("Interests",
                                style: Theme.of(context).textTheme.titleSmall),
                            SizedBox(height: height * .02),
                            Wrap(
                              runSpacing: 15.0,
                              spacing: 10.0,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Color(0xffFE0091)),
                                      borderRadius: BorderRadius.circular(20)),
                                  height: height * .04,
                                  width: width * .25,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.done_all,
                                        size: 15,
                                        color: Color(0xffFE0091),
                                      ),
                                      SizedBox(width: width * .01),
                                      Text(
                                        "Travelling",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(color: Color(0xffFE0091)),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border:
                                      Border.all(color: Color(0xffFe0091)),
                                      borderRadius: BorderRadius.circular(20)),
                                  height: height * .04,
                                  width: width * .22,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.done_all,
                                        size: 15,
                                        color: Color(0xffFE0091),
                                      ),
                                      SizedBox(width: width * .01),
                                      Text(
                                        "Books",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(color: Color(0xffFE0091)),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(20)),
                                  height: height * .04,
                                  width: width * .25,
                                  child: Center(
                                    child: Text(
                                      "Music",
                                      style:
                                      Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(20)),
                                  height: height * .04,
                                  width: width * .25,
                                  child: Center(
                                    child: Text(
                                      "Dancing",
                                      style:
                                      Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(20)),
                                  height: height * .04,
                                  width: width * .25,
                                  child: Center(
                                    child: Text(
                                      "Modeling",
                                      style:
                                      Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * .03,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Gallery",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                Text(
                                  "See all",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(color: Color(0xff000CAA)),
                                ),
                              ],
                            ),
                            SizedBox(height: height * .02),
                            StaggeredGrid.count(
                                crossAxisCount: 4,
                                mainAxisSpacing: 7,
                                crossAxisSpacing: 7,
                                children: [
                                  StaggeredGridTile.count(
                                      crossAxisCellCount: 2,
                                      mainAxisCellCount: 2,
                                      child: imageContainer(
                                          "https://img.freepik.com/premium-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg")),
                                  StaggeredGridTile.count(
                                      crossAxisCellCount: 2,
                                      mainAxisCellCount: 2,
                                      child: imageContainer(
                                          "https://img.freepik.com/premium-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg")),
                                  StaggeredGridTile.count(
                                      crossAxisCellCount: 1,
                                      mainAxisCellCount: 1,
                                      child: imageContainer(
                                          "https://img.freepik.com/premium-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg")),
                                  StaggeredGridTile.count(
                                      crossAxisCellCount: 1,
                                      mainAxisCellCount: 1,
                                      child: imageContainer(
                                          "https://img.freepik.com/premium-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg")),
                                  StaggeredGridTile.count(
                                      crossAxisCellCount: 1,
                                      mainAxisCellCount: 1,
                                      child: imageContainer(
                                          "https://img.freepik.com/premium-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg")),
                                  StaggeredGridTile.count(
                                      crossAxisCellCount: 1,
                                      mainAxisCellCount: 1,
                                      child: imageContainer(
                                          "https://img.freepik.com/premium-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg")),
                                ]),
                            SizedBox(height: height * .1),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  imageContainer(imgPath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.network(
        imgPath,
        fit: BoxFit.cover,
      ),
    );
  }
}
