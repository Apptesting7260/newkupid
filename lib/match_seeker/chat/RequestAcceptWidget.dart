

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/controller/RequestActioncontroller/RequestActionController.dart';
import 'package:cupid_match/controllers/controller/RequestDetailsController/RequestDetailsController.dart';
import 'package:cupid_match/controllers/controller/ViewSikerDetailsController/ViewSikerDetaolsController.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/res/components/general_exception.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AcceptRequestwidget extends StatefulWidget {
  const AcceptRequestwidget({super.key});

  @override
  State<AcceptRequestwidget> createState() => _AcceptRequestwidgetState();
}

class _AcceptRequestwidgetState extends State<AcceptRequestwidget> {
  String? Getcurrentuser;

  final ViewSikerProfileDetailsControllernstance=Get.put(ViewSikerProfileDetailsController());


  final ViewRequestDetailsControllerinstance=Get.put(ViewRequestDetailsController());
final RequestActionControllerinstance=Get.put(RequestActionController());
getcurrentuser()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    Getcurrentuser=sp.getString("Tokernid");
    print("$Getcurrentuser======currentuser");
}
  @override
  void initState() {
getcurrentuser();
  
            ViewSikerProfileDetailsControllernstance.ViewSikerProfileDetailsApiHit();
    ViewRequestDetailsControllerinstance.ViewRequestDetailsApiHit();

    // TODO: implement initState
    super.initState();
  }



requestcondition(){

  if(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.matchType==0){
    if(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.matchWith.toString()==Getcurrentuser.toString()){
      action_with=Getcurrentuser;
      action_from=ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.matchFrom.toString();
      setState(() {
      print(action_with);
      print(action_from);
      });

                      RequestActionControllerinstance.RequestActionApiHit();
    }else{
       action_from=Getcurrentuser;
      action_with=ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.matchWith.toString();
      setState(() {
      print(action_with);
      print(action_from);

      });

                      RequestActionControllerinstance.RequestActionApiHit();
    }

  }else{
action_with=Getcurrentuser;
setState(() {
  
print(action_with);
});

                      RequestActionControllerinstance.RequestActionApiHit();
  }
}


  @override
  Widget build(BuildContext context) {

        final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return       Obx(() {
          switch (ViewRequestDetailsControllerinstance.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(child: Text(""));
            case Status.ERROR:
              if (ViewRequestDetailsControllerinstance.error.value == 'No internet') {
                return InterNetExceptionWidget(
                  onPress: () {},
                );
              } else {
                return GeneralExceptionWidget(onPress: () {});
              }
            case Status.COMPLETED:
              return         Column(
      children: [
      if(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.matchType==0&&ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.matchFromStatus!="accepted"||ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.matchType==0&&ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.matchWithStatus!="accepted"||ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.matchType==1&&ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.matchWithStatus!="accepted")  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                       if(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.getseeker!.id.toString()==Getcurrentuser.toString())   Container(
                            // height: height * .5,
                            width: width * .46,
                            decoration: BoxDecoration(
                                color: Color(0xffF3F3F3),
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                   height: height * .25,
                                    width: width * .42,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: CachedNetworkImage(
       imageUrl:ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.getanotherseeker!.imgPath.toString(),
       progressIndicatorBuilder: (context, url, downloadProgress) => 
               CircularProgressIndicator(value: downloadProgress.progress),
       errorWidget: (context, url, error) => Icon(Icons.error),
       fit: BoxFit.cover,
      
    ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * .01,
                                  ),
                                  Text(
                                   ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.getanotherseeker!.name.toString(),
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                  SizedBox(
                                    height: height * .005,
                                  ),
                                  // Text(
                                  // ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.getanotherseeker!.occupationName.toString(),
                                  //   style: Theme.of(context)
                                  //       .textTheme
                                  //       .bodyMedium!
                                  //       .copyWith(color: Colors.grey),
                                  // ),
                                  SizedBox(
                                    height: height * .005,
                                  ),
                                  Text(
                                ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.getanotherseeker!.address.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: height * .01,
                                  ),
                                  Text(
                                    "Interest",
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                  SizedBox(
                                    height: height * .005,
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.getanotherseeker!.details!.interestName!.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Text(
                                 ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.getanotherseeker!.details!.interestName![index].title.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.grey),
                                  ) ;
                                    },
                                  ),
                                  
                                  SizedBox(
                                    height: height * .01,
                                  ),
                                  Wrap(
                                    runSpacing: 8.0,
                                    spacing: 6.0,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: height * .04,
                                        width: width * .18,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/icons/religon.png"),
                                            SizedBox(width: width * .01),
                                            // Transform.scale(
                                            //     scale: 2,
                                            //     child: IconButton(
                                            //         icon: ImageIcon(
                                            //           AssetImage(
                                            //               'assets/icons/religon.png'),
                                            //           size: 50,color: Colors.amber,
                                            //         ),
                                            //         onPressed: null)),
                                            Text(
                                            ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.getanotherseeker!.religion.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: height * .04,
                                        width: width * .22,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/icons/height.png"),
                                            SizedBox(width: width * .01),
                                            Text(
                                              "${ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.getanotherseeker!.height}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: height * .04,
                                        width: width * .25,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/icons/money.png"),
                                            SizedBox(width: width * .01),
                                            // Transform.scale(
                                            //     scale: 2,
                                            //     child: IconButton(
                                            //         icon: ImageIcon(
                                            //           AssetImage(
                                            //               'assets/icons/religon.png'),
                                            //           size: 50,color: Colors.amber,
                                            //         ),
                                            //         onPressed: null)),
                                            Text(
                                              "${ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.getanotherseeker!.salary}k Monthly",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  // Align(
                                  //     alignment: Alignment.bottomRight,
                                  //     child: Image.asset("assets/icons/next.png"))
                                ],
                              ),
                            ),
                          ),


                           if(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.getanotherseeker!.id.toString()==Getcurrentuser.toString())   Container(
                            // height: height * .5,
                            width: width * .46,
                            decoration: BoxDecoration(
                                color: Color(0xffF3F3F3),
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: height * .3,
                                    width: width * .42,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: CachedNetworkImage(
       imageUrl:ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.getseeker!.imgPath.toString(),
       progressIndicatorBuilder: (context, url, downloadProgress) => 
               CircularProgressIndicator(value: downloadProgress.progress),
       errorWidget: (context, url, error) => Icon(Icons.error),
       fit: BoxFit.cover,
      
    ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * .01,
                                  ),
                                  Text(
                                   ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.getseeker!.name.toString(),
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                  SizedBox(
                                    height: height * .005,
                                  ),
                                  // Text(
                                  // ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.getseeker!.occupationName.toString(),
                                  //   style: Theme.of(context)
                                  //       .textTheme
                                  //       .bodyMedium!
                                  //       .copyWith(color: Colors.grey),
                                  // ),
                                  SizedBox(
                                    height: height * .005,
                                  ),
                                  Text(
                                ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.getseeker!.address.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: height * .01,
                                  ),
                                  Text(
                                    "Interest",
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                  SizedBox(
                                    height: height * .005,
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.getseeker!.details!.interestName!.length,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Text(
                                 ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.getseeker!.details!.interestName![index].title.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.grey),
                                  ) ;
                                    },
                                  ),
                                  
                                  SizedBox(
                                    height: height * .01,
                                  ),
                                  Wrap(
                                    runSpacing: 8.0,
                                    spacing: 6.0,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: height * .04,
                                        width: width * .18,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/icons/religon.png"),
                                            SizedBox(width: width * .01),
                                            // Transform.scale(
                                            //     scale: 2,
                                            //     child: IconButton(
                                            //         icon: ImageIcon(
                                            //           AssetImage(
                                            //               'assets/icons/religon.png'),
                                            //           size: 50,color: Colors.amber,
                                            //         ),
                                            //         onPressed: null)),
                                            Text(
                                            ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.getanotherseeker!.religion.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: height * .04,
                                        width: width * .22,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/icons/height.png"),
                                            SizedBox(width: width * .01),
                                            Text(
                                              "${ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.getseeker!.height}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: height * .04,
                                        width: width * .25,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/icons/money.png"),
                                            SizedBox(width: width * .01),
                                            // Transform.scale(
                                            //     scale: 2,
                                            //     child: IconButton(
                                            //         icon: ImageIcon(
                                            //           AssetImage(
                                            //               'assets/icons/religon.png'),
                                            //           size: 50,color: Colors.amber,
                                            //         ),
                                            //         onPressed: null)),
                                            Text(
                                              "${ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.getanotherseeker!.salary}k Monthly",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  // Align(
                                  //     alignment: Alignment.bottomRight,
                                  //     child: Image.asset("assets/icons/next.png"))
                                ],
                              ),
                            ),
                          ),
                         
                             Obx(() {
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
              return       Container(
                            // height: height * .5,
                            width: width * .46,
                            decoration: BoxDecoration(
                                color: Color(0xffF3F3F3),
                                borderRadius: BorderRadius.circular(15)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: height * .25,
                                    width: width * .42,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: CachedNetworkImage(
       imageUrl:ViewSikerProfileDetailsControllernstance.ViewProfileDetail.value.profileDetails![0].imgPath.toString(),
       progressIndicatorBuilder: (context, url, downloadProgress) => 
               CircularProgressIndicator(value: downloadProgress.progress),
       errorWidget: (context, url, error) => Icon(Icons.error),
       fit: BoxFit.cover,
      
    ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * .01,
                                  ),
                                  Text(
                                   ViewSikerProfileDetailsControllernstance.ViewProfileDetail.value.profileDetails![0].name.toString(),
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                  SizedBox(
                                    height: height * .005,
                                  ),
                                  Text(
                                   ViewSikerProfileDetailsControllernstance.ViewProfileDetail.value.profileDetails![0].occupationName.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: height * .005,
                                  ),
                                  Text(
                                  ViewSikerProfileDetailsControllernstance.ViewProfileDetail.value.profileDetails![0].address.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.grey),
                                  ),
                                  SizedBox(
                                    height: height * .01,
                                  ),
                                  Text(
                                    "Interest",
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ),
                                  SizedBox(
                                    height: height * .005,
                                  ),
                         if( ViewSikerProfileDetailsControllernstance.ViewProfileDetail.value.profileDetails![0].details!.interestName!=[])         ListView.builder(
                                    shrinkWrap: true,
                                    itemCount:  0,
                                    itemBuilder: (BuildContext context, int index) {
                                      return Text(
                                   ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.getseeker!.details!.interestName![index].title.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(color: Colors.grey),
                                  ) ;
                                    },
                                  ),
                                  
                                  SizedBox(
                                    height: height * .01,
                                  ),
                                  Wrap(
                                    runSpacing: 8.0,
                                    spacing: 6.0,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: height * .04,
                                        width: width * .18,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/icons/religon.png"),
                                            SizedBox(width: width * .01),
                                            // Transform.scale(
                                            //     scale: 2,
                                            //     child: IconButton(
                                            //         icon: ImageIcon(
                                            //           AssetImage(
                                            //               'assets/icons/religon.png'),
                                            //           size: 50,color: Colors.amber,
                                            //         ),
                                            //         onPressed: null)),
                                            Text(
                                            ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.getseeker!.religion.toString(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: height * .04,
                                        width: width * .22,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/icons/height.png"),
                                            SizedBox(width: width * .01),
                                            Text(
                                              "${ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.getseeker!.height}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                            border: Border.all(color: Colors.black),
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        height: height * .04,
                                        width: width * .25,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.asset("assets/icons/money.png"),
                                            SizedBox(width: width * .01),
                                            // Transform.scale(
                                            //     scale: 2,
                                            //     child: IconButton(
                                            //         icon: ImageIcon(
                                            //           AssetImage(
                                            //               'assets/icons/religon.png'),
                                            //           size: 50,color: Colors.amber,
                                            //         ),
                                            //         onPressed: null)),
                                            Text(
                                              "${ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.getseeker!.salary}k Monthly",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                  // Align(
                                  //     alignment: Alignment.bottomRight,
                                  //     child: Image.asset("assets/icons/next.png"))
                                
                              
                            
                          
                         
                                    
                                  
                                  // Align(
                                  //     alignment: Alignment.bottomRight,
                                  //     child: Image.asset("assets/icons/next.png"))
                                ],
                              ),
                            ),
                          );}}),
                        ],
                      ),



       
       
       
  if(requestype=="2")   Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  SizedBox(
                    height: height * .03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap:(){
                          // Get.to(()=>ChatScreen());
                        },
                        child: Container(
                          height: height * .04,
                          width: width * .21,
                          decoration: BoxDecoration(
                            color: Color(0xffFE0091),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              "Requested",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   width: width * .02,
                      // ),
                      // Container(
                      //   height: height * .04,
                      //   width: width * .21,
                      //   decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(15),
                      //       border: Border.all(color: Color(0xff000CAA))),
                      //   child: Center(
                      //     child: Text(
                      //       "Declined",
                      //       style: Theme.of(context)
                      //           .textTheme
                      //           .bodySmall!
                      //           .copyWith(color: Color(0xff000CAA)),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                  
    
                ],
              ),
            ),
            if(requestype=="1")   if(ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.matchType==0&&ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.matchFromStatus!="accepted"||ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.matchType==0&&ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.matchWithStatus!="accepted"||ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.matchType==1&&ViewRequestDetailsControllerinstance.ViewProfileDetail.value.data!.matchWithStatus!="accepted") Obx(() => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  SizedBox(
                    height: height * .03,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap:(){

actiontype="accepted";
setState(() {
  actiontype;
});

requestcondition();

                        },
                        child: Container(
                          height: height * .04,
                          width: width * .21,
                          decoration: BoxDecoration(
                            color: Color(0xffFE0091),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: 
                            
                            RequestActionControllerinstance.loading.value==true?CircularProgressIndicator():
                            Text(
                              "Accept",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: width * .02,
                      ),
                      InkWell(
                        child: Container(
                          height: height * .04,
                          width: width * .21,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Color(0xff000CAA))),
                          child: Center(
                            child: Text(
                              "Declined",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: Color(0xff000CAA)),
                            ),
                          ),
                        ),
                        onTap: (){
                          actiontype="Declined";
setState(() {
  actiontype;
});

requestcondition();
                        },
                      ),
                    ],
                  ),
                  
    
                ],
              ),
            )) 
      ],
    );
  }


  });}}