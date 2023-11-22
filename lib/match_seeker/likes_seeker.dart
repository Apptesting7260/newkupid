import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/controllers/controller/LikeListController/LikeListController.dart';
import 'package:cupid_match/match_maker/invite_state.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/response/status.dart';
import '../res/colors/app_color.dart';
import '../res/components/general_exception.dart';
import '../res/components/internet_exceptions_widget.dart';


class LikesSeeker extends StatefulWidget {
  const LikesSeeker({Key? key}) : super(key: key);

  @override
  State<LikesSeeker> createState() => _LikesSeekerState();
}

class _LikesSeekerState extends State<LikesSeeker> {
final LikeListControllerinstance=Get.put(LikeListController());

@override
  void initState() {
  
    // TODO: implement initState
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return RefreshIndicator(
      onRefresh: () async{

      },
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {
            Get.back();
          }, icon: Icon(Icons.arrow_back,color: Color(0xff5A5A5A), size: 27,)),
          title: Text("Likes",style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),),
          centerTitle: true,
        ),
        body:
        Obx(() {
          switch (LikeListControllerinstance.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              if (LikeListControllerinstance.error.value == 'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {},
                );
              } else {
                return GeneralExceptionWidget(onPress: () {});
              }
            case Status.COMPLETED:

              return Column(

                children: [
                  if(LikeListControllerinstance.LikeList.value.message =='Data Not Found')SizedBox(height:Get.height*0.18),
                  if(LikeListControllerinstance.LikeList.value.message == 'Data Not Found')
                    Center(
                      child: Column(

                        children: [
                          Image.asset('assets/images/likeem.png',width: Get.width*0.7,),
                          SizedBox(height: Get.height*0.05,),
                          Text("No Like, yet.",style: Get.theme.textTheme.headlineSmall!.copyWith(
                              color: AppColor.blackColor
                          )),
                          SizedBox(height: Get.height*0.02,),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50.0),
                            child: Text("Reference site about Lorem Ipsum, giving as well as a random Lipsum generator.",style: Get.theme.textTheme.bodyMedium!.copyWith(
                                color: AppColor.blackColor,fontWeight: FontWeight.w300
                            ),textAlign: TextAlign.center,),
                          )
                        ],
                      ),
                    ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: LikeListControllerinstance.LikeList.value.data!.length,
                    itemExtent: 80,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return  ListView.builder(
                        itemCount: LikeListControllerinstance.LikeList.value.data!.length,
                        scrollDirection: Axis.vertical,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            visualDensity: VisualDensity(vertical: -3,horizontal: -2),
                            leading: CircleAvatar(
                              radius: 22,
                              child:
                              CircleAvatar(
                                radius: 30.0,
                                backgroundImage: CachedNetworkImageProvider(
                                    LikeListControllerinstance.LikeList.value.data![index].likeName![0].imgPath.toString()),
                                backgroundColor: Colors.transparent,
                              ),
                            ),
                            title: Text(LikeListControllerinstance.LikeList.value.data![index].likeName![0].name.toString(),style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),),
                            subtitle: Text("India",style: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.w300,color: Color(0xff777777)),),
                            trailing: MyButton(
                              width: width*.35,
                              height: 35,
                              title: 'View Profile', onTap: () {
                              // Get.to(()=> Videos());
                              // Get.to(()=> Invite());
                            },),
                          );
                        },);
                    },
                  )
                ],
              );
          }
        }
        )



      ),
    );
  }
}

