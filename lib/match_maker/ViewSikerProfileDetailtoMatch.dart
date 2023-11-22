import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/controllers/controller/ViewProfileDetailsController/ViewProfileDetailsController.dart';
import 'package:cupid_match/controllers/controller/ViewSikerDetailsController/ViewSikerDetaolsController.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/res/components/general_exception.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class SikerProfilePage extends StatefulWidget {
  const SikerProfilePage({Key? key}) : super(key: key);

  @override
  State<SikerProfilePage> createState() => _SikerProfilePageState();
}

class _SikerProfilePageState extends State<SikerProfilePage> {

  final ViewSikerProfileDetailsControllernstance=Get.put(ViewSikerProfileDetailsController());


  @override
  void initState() {
    ViewSikerProfileDetailsControllernstance.ViewSikerProfileDetailsApiHit();
    // TODO: implement initState
    super.initState();
  }
 @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return RefreshIndicator(
      onRefresh: () async{
        ViewSikerProfileDetailsControllernstance.ViewSikerProfileDetailsApiHit();
      },
      child: Scaffold(
        body: Obx(() {
            switch (ViewSikerProfileDetailsControllernstance.rxRequestStatus.value) {
              case Status.LOADING:
                return const Center(child: CircularProgressIndicator());
              case Status.ERROR:
                if (ViewSikerProfileDetailsControllernstance.error.value == 'No internet') {
                  return InterNetExceptionWidget(
                    onPress: () {},
                  );
                } else {
                  return GeneralExceptionWidget(onPress: () {});
                }
              case Status.COMPLETED:
                return SafeArea(
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
                      child:

                      CachedNetworkImage(
  imageUrl: ViewSikerProfileDetailsControllernstance.ViewProfileDetail.value.profileDetails![0].imgPath.toString(),
  fit: BoxFit.contain,
  placeholder: (context, url) => Center(child: CircularProgressIndicator()), // Placeholder widget while loading
  errorWidget: (context, url, error) => Icon(Icons.error), // Error widget if loading fails
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
                                      Text(ViewSikerProfileDetailsControllernstance.ViewProfileDetail.value.profileDetails![0].name.toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineMedium),
                                      SizedBox(
                                        height: height * .01,
                                      ),
                                      Text(ViewSikerProfileDetailsControllernstance.ViewProfileDetail.value.profileDetails![0].occupation.toString(),
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
                              // Center(
                              //   child: Image.asset("assets/images/vedio.png"),
                              // ),
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
                                      Text(ViewSikerProfileDetailsControllernstance.ViewProfileDetail.value.profileDetails![0].address.toString(),
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
                              Text("",
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
                              Text(ViewSikerProfileDetailsControllernstance.ViewProfileDetail.value.profileDetails![0].occupation.toString(),
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
                              Text(ViewSikerProfileDetailsControllernstance.ViewProfileDetail.value.profileDetails![0].dob.toString(),
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


                  Container(
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                  ),
                                  itemCount: ViewSikerProfileDetailsControllernstance.ViewProfileDetail.value.profileDetails![0].details!.gallaryPath!.length,
                                  itemBuilder: (BuildContext context, int index) {
                                    return Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CachedNetworkImage(
                                      imageUrl:  ViewSikerProfileDetailsControllernstance.ViewProfileDetail.value.profileDetails![0].details!.gallaryPath![index].toString(),
                                      fit: BoxFit.cover,
                                      placeholder: (context, url) => Center(child: CircularProgressIndicator()), // Placeholder widget while loading
                                      errorWidget: (context, url, error) => Icon(Icons.error), // Error widget if loading fails
                                    ),
                                    );
                                  },
                                ),
                              ),

                              SizedBox(height:Get.height*0.04,),
                              // StaggeredGrid.count(
                              //     crossAxisCount: 4,
                              //     mainAxisSpacing: 7,
                              //     crossAxisSpacing: 7,
                              //     children: [
                              //       StaggeredGridTile.count(
                              //           crossAxisCellCount: 2,
                              //           mainAxisCellCount: 2,
                              //           child: imageContainer(
                              //               "https://img.freepik.com/premium-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg")),
                              //       StaggeredGridTile.count(
                              //           crossAxisCellCount: 2,
                              //           mainAxisCellCount: 2,
                              //           child: imageContainer(
                              //               "https://img.freepik.com/premium-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg")),
                              //       StaggeredGridTile.count(
                              //           crossAxisCellCount: 1,
                              //           mainAxisCellCount: 1,
                              //           child: imageContainer(
                              //               "https://img.freepik.com/premium-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg")),
                              //       StaggeredGridTile.count(
                              //           crossAxisCellCount: 1,
                              //           mainAxisCellCount: 1,
                              //           child: imageContainer(
                              //               "https://img.freepik.com/premium-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg")),
                              //       StaggeredGridTile.count(
                              //           crossAxisCellCount: 1,
                              //           mainAxisCellCount: 1,
                              //           child: imageContainer(
                              //               "https://img.freepik.com/premium-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg")),
                              //       StaggeredGridTile.count(
                              //           crossAxisCellCount: 1,
                              //           mainAxisCellCount: 1,
                              //           child: imageContainer(
                              //               "https://img.freepik.com/premium-photo/young-handsome-man-with-beard-isolated-keeping-arms-crossed-frontal-position_1368-132662.jpg")),
                              //     ]),
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
        );}}
      )),
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
