import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/controllers/sikerProfileController/sikershortprofilecontrller.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/res/components/general_exception.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class shortprofilepopup extends StatefulWidget {
  const shortprofilepopup({super.key});

  @override
  State<shortprofilepopup> createState() => _shortprofilepopupState();
}

class _shortprofilepopupState extends State<shortprofilepopup> {

      final ViewSikerProfileDetailsControllerinstance=Get.put(SikerShortProfileDetailsController());
@override
  void initState() {
        ViewSikerProfileDetailsControllerinstance.ViewSikerProfileDetailsApiHit();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
            final height = MediaQuery.of(context).size.height;
        final width = MediaQuery.of(context).size.width;
    return Obx(() {
          switch (ViewSikerProfileDetailsControllerinstance.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              if (ViewSikerProfileDetailsControllerinstance.error.value == 'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {},
                );
              } else {
                return GeneralExceptionWidget(onPress: () {});
              }
            case Status.COMPLETED:
              return  AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          'assets/images/remove.png',
                          height: height * .03,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    "Profile",
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  Stack(
                    children:[ Container(
                      height: Get.height*0.2,
                      child: CircleAvatar(
                        radius: 52,
                        backgroundImage: CachedNetworkImageProvider(
                            ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].imgPath.toString()),
                      ),
                    ),

                    Positioned(
                      top: Get.height*0.13,
                      left: Get.width*0.08,
                      child: CircleAvatar(radius: 25,backgroundColor: Color(0xffE1E1E1),child: Icon(Icons.favorite, color:ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].likeStatus==0? Colors.white:Colors.pink), ))
                ]),
                  // SizedBox(height: height * 0.02),
                  Text(
                    ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].name.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  // SizedBox(height: height * 0.01),
                  Text(
                    ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].occupationName.toString(),
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        fontWeight: FontWeight.w400, color: Color(0xff777777)),
                  ),
                  SizedBox(height: height * 0.02),

                 
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text("About",style:TextStyle(fontSize: 20,fontWeight:FontWeight.bold),),
                   ],
                 ),
                  SizedBox(height: height * 0.02),
Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
        Flexible(child: Text( ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].details!.bioDescription.toString())),
  ],
),
                  SizedBox(height: height * 0.02),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text("Birthday Date:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    Text( ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].dob.toString())
                  ],),
                  SizedBox(height: height * 0.04),

                  MyButton(
                    width: width * .5,
                    title: "Request",
                    onTap: () {},
                  )
                ],
              ),
            ),);}});
  }
}