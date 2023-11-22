import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/controller/GetAllMakerContrioller/GetAllMakerController.dart';
import 'package:cupid_match/controllers/controller/MagicProfileController/MagicProfileConrtroller.dart';
import 'package:cupid_match/match_seeker/viewMakerProfileinseeker/ViewMakerProfile.dart';
import 'package:cupid_match/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/SeekerToMakerController/SeekerToMakerController.dart';
import '../../models/AllMakerModel/AllMakerModel.dart';

class SeeAllMaker extends StatefulWidget {
  const SeeAllMaker({super.key});

  @override
  State<SeeAllMaker> createState() => _SeeAllMakerState();
}

class _SeeAllMakerState extends State<SeeAllMaker> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final ListAllMakerControllerinstance = Get.put(ListAllMakerController());
  SeekerToMakerRequestController SeekerToMakerRequestControllerinstance = Get
      .put(SeekerToMakerRequestController());
  TextEditingController _searchController=TextEditingController();
  @override
  late List<Allmakers>  allmaker;
  void initState() {
    ListAllMakerControllerinstance.ListAllMakerApi();
    search("");
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    final width = MediaQuery
        .of(context)
        .size
        .width;
    return RefreshIndicator(
      onRefresh: () async {
        ListAllMakerControllerinstance.ListAllMakerApi();
      },
      child: SafeArea(
        child: Scaffold(
          endDrawer: MyDrawer(),
          appBar: AppBar(
            title: Text(
              "List Maker",
              style: Theme
                  .of(context)
                  .textTheme
                  .titleSmall,
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 28.0),
                child: GestureDetector(
                    onTap: () {
                      _scaffoldKey.currentState!.openEndDrawer();
                    },
                    child: Image.asset("assets/icons/menu.png")),
              )
            ],
          ),
          body: Column(


              children: [
              Stack(
              alignment: AlignmentDirectional.topStart,

              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20)),
                            borderSide:
                            BorderSide(color: Color(0xffFE0091))),
                        hintStyle: TextStyle(
                            fontSize: 12, color: Color(0xffBABABA)),
                        contentPadding: EdgeInsets.all(18),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20)),
                            borderSide:
                            BorderSide(color: Color(0xffBABABA))),
                        errorBorder: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(20.0)),
                            borderSide:
                            BorderSide(color: Color(0xffBABABA))),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Color(0xffBABABA)),
                        ),
                        hintText: "Search....",
                        filled: true,
                        fillColor: Colors.white),
                    controller: _searchController,
                    onChanged: (value) {
                      search(value);
                    },
                  ),
                ),



    ],
    ),
             Expanded(
               child:    allmaker.length!=0 ?Container(
                 child: ListView.builder(

                   itemCount: allmaker!.length,
                   // itemExtent: 80,

                   itemBuilder: (context, index) {
                     return Padding(
                         padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                         child: Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             //width: Get.width*0.35,
                             //height: Get.height*0.2,
                             Row(
                               children: [
                                 InkWell(
                                   child: CircleAvatar(
                                     radius: 25.0,
                                     backgroundImage: NetworkImage(
                                         allmaker![index].imgPath
                                             .toString()

                                            ),
                                     backgroundColor: Colors.transparent,
                                   ),
                                   onTap: () {
                                     Makerid = allmaker![index].id
                                         .toString();
                                     setState(() {
                                       Makerid;
                                       print(Makerid);
                                     });
                                     Get.to(ViewMakerProfileInSeeker());
                                   },
                                 ),
                                 SizedBox(
                                   width: width * .03,
                                 ),
                                 Container(
                                   width: Get.width*0.25,
                                   height: Get.height*0.1,
                                   child: Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     children: [

                                       Text(
                                         allmaker[index].name
                                             .toString(),
                                         style: Theme.of(context).textTheme.titleSmall,
                                         overflow: TextOverflow.ellipsis,
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
                                 ),
                                 SizedBox(width: width * .08),
                               ],
                             ),
                             selectedseekerid==null? GestureDetector(
                               onTap: () {
                                 setState(() {
                                   selectedseekerid=null;
                                 });

                                 Makerid=allmaker[index].id.toString();

                                 SeekerToMakerRequestControllerinstance.SeekerToMakerRequestApiHit(context);
                               },
                               child: Container(
                                 height: height * .04,
                                 width: width * .35,
                                 decoration: BoxDecoration(
                                   color: Color(0xffFE0091),
                                   borderRadius: BorderRadius.circular(15),
                                 ),
                                 child: Center(
                                   child: Text(
                                     "Request To Maker",
                                     style: Theme.of(context)
                                         .textTheme
                                         .bodySmall!
                                         .copyWith(color: Colors.white),
                                   ),
                                 ),
                               ),
                             ):
                             GestureDetector(
                               onTap: () {
                                 // showdilog();


                                 Makerid=allmaker[index].id.toString();

                                 SeekerToMakerRequestControllerinstance.SeekerToMakerRequestApiHit(context);
                               },
                               child: Container(
                                 height: height * .04,
                                 width: width * .25,
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
                             )
                           ],
                         ));
                   },
                 ),
               ): Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 // crossAxisAlignment: CrossAxisAlignment.center,
                 children: [



                   Center(child: Text("Data is Empty",style: TextStyle(color: Colors.black)),)
                 ],
               ),
             )


              ],
    )
    ,
    )
    )
    ,
    );
  }
  void search(String query) {
    // Use the original list and filter it based on the query
    List<Allmakers> searchResults = ListAllMakerControllerinstance
        .userList.value.allmakers
        !.where((item) => item.name!.toLowerCase().contains(query.toLowerCase())).cast<Allmakers>()
        .toList();

    // Update the UI with the search results
    setState(() {
     if(_searchController.text !=""){
       allmaker = searchResults;
     }
     else{
       allmaker=ListAllMakerControllerinstance
           .userList.value.allmakers!;
     }
    });
  }
}
