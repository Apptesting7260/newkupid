import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/controller/ViewProfileDetailsController/ViewProfileDetailsController.dart';
import 'package:cupid_match/controllers/controller/ViewSikerDetailsController/ViewSikerDetaolsController.dart';
import 'package:cupid_match/controllers/sikerProfileController/sikershortprofilecontrller.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/res/assets/image_assets.dart';
import 'package:cupid_match/res/components/general_exception.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class ShortProfileSeeker extends StatefulWidget {
  const ShortProfileSeeker({Key? key}) : super(key: key);

  @override
  State<ShortProfileSeeker> createState() => _ShortProfileSeekerState();
}

class _ShortProfileSeekerState extends State<ShortProfileSeeker> {

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){Get.back();},icon: Icon(Icons.arrow_back_ios_new_outlined),),
        centerTitle: true,
        elevation: 0,
        title: Text("Details",style: TextStyle(
          color: AppColors.black
        ),),
      ),
        body:     Obx(() {
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
                  return Padding(
          padding: const EdgeInsets.all(18.0),
          child:
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
               Center(
                 child: Stack(
                   children:[
                     Container(
                         height: Get.height*0.22,
                         child:CircleAvatar(radius: 70,backgroundColor:Colors.transparent,backgroundImage: CachedNetworkImageProvider(ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].imgPath.toString()),)),
                     Positioned(
                         bottom: 0,left:Get.width*0.12,
                         child: CircleAvatar(radius: 30, child: Icon(Icons.favorite_sharp,size: 35,),))
                   ] 
                 ),
               ),
                SizedBox(height: height * .03),
                Text(ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].name.toString()+"  28",
                    style: Theme.of(context).textTheme.titleSmall),
                SizedBox(
                  height: height * .01,
                ),
                Text(
                 ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].occupation.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.grey)),

                SizedBox(
                  height: height * .01,
                ),

                SizedBox(height: height * .03),
                Text("About",
                    style: Theme.of(context).textTheme.titleSmall),
                SizedBox(
                  height: height * .01,
                ),
                Text(
                     ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].details!.bioDescription.toString(),
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
                Text("Occupation",
                    style: Theme.of(context).textTheme.titleSmall),
                SizedBox(height: height * .02),
                Text(
                  'Electrician',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.grey)),

                SizedBox(height: height * .02),

                Text("Birthday Date",
                    style: Theme.of(context).textTheme.titleSmall),
                SizedBox(height: height * .02),
                Text(
                    ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].dob.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.grey)),
                SizedBox(height: height * .02),

                Text("Interests",
                    style: Theme.of(context).textTheme.titleSmall),
                SizedBox(height: height * .02),

                Container(
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                    childAspectRatio: 3.0,

                    ),
                  
                    itemCount: ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].details!.interest!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return     Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                                          decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(20)),
                                          
                               
                                          child: Center(
                        child: Text(
                          ViewSikerProfileDetailsControllerinstance.ViewProfileDetail.value.profileDetails![0].details!.interest![index].toString(),
                          style:
                          Theme.of(context).textTheme.bodySmall,
                        ),
                                          ),
                                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: height * .03,
                ),
               Center(
                 child: SizedBox(
                   height: height * .055,
                   width: width * .53,
                   child: ElevatedButton(
                     style: ElevatedButton.styleFrom(
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(30)
                       )
                     ),
                       onPressed: (){}, child: Center(
                     child: Text("Request",style: TextStyle(color: AppColors.white),),
                   )),
                 ),
               )
              ],
            ),
          ),
        );
  }}));
  }

}