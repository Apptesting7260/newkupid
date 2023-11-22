
import 'package:cupid_match/controllers/controller/FetchSubcriptionController/FetchSubcriptionController.dart';
import 'package:cupid_match/data/response/status.dart';
import 'package:cupid_match/res/components/general_exception.dart';
import 'package:cupid_match/res/components/internet_exceptions_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
class CreateplanMonthly extends StatefulWidget {
  const CreateplanMonthly({super.key});

  @override
  State<CreateplanMonthly> createState() => _CreateplanMonthlyState();
}

class _CreateplanMonthlyState extends State<CreateplanMonthly> {
    final FetchSubcriptionControllerinstance=Get.put(FetchSubcriptionController());

  List<Map<String, String>> listItems = [
    {"count": "1", "price": "6"},
    {"count": "3", "price": "12"},
    {"count": "6", "price": "18"},
  ];


  @override
  void initState() {
    FetchSubcriptionControllerinstance.SubcriptionListApi();
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Obx(() {
          switch (FetchSubcriptionControllerinstance.rxRequestStatus.value) {
            case Status.LOADING:
              return const Center(child: CircularProgressIndicator());
            case Status.ERROR:
              if (FetchSubcriptionControllerinstance.error.value == 'No internet') {
                return Center(
                  child: InterNetExceptionWidget(
                    onPress: () {},
                  ),
                );
              } else {
                return Center(child: GeneralExceptionWidget(onPress: () {}));
              }
            case Status.COMPLETED:
              return Container(
             
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: FetchSubcriptionControllerinstance.SubcriptionList.value.SubscriptionDat!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(12),
                    child: Container(
                      height: height * .07,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(35),
                          color: Color(0xffFFFFFF),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xffBABABA),
                              blurRadius: 2.0,
                              spreadRadius: .4,
                              offset: Offset(0.0, 0.0),
                            ),
                          ]),
                      child: ListTile(
                        title: RichText(
                            text: TextSpan(
                                text: FetchSubcriptionControllerinstance.SubcriptionList.value.SubscriptionDat![index].intervalCount.toString()+" "+FetchSubcriptionControllerinstance.SubcriptionList.value.SubscriptionDat![index].interval.toString(),
                                style: Theme.of(context).textTheme.titleSmall,
                                children: [
                              TextSpan(
                                  text: '  \$'+FetchSubcriptionControllerinstance.SubcriptionList.value.SubscriptionDat![index].amount.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall
                                      ?.copyWith(color: Color(0xffFE008F))),
                            ])),
                        trailing: Wrap(
                          spacing: -10,
                          children: [
                            IconButton(
                                onPressed: () {
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        backgroundColor: Color(0xffFFFFFF),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(22)),
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Align(
                                                alignment: Alignment.topRight,
                                                child: GestureDetector(
                                                    onTap: () {
                                                      Get.back();
                                                    },
                                                    child: Image.asset(
                                                      'assets/images/Group 115 (2).png',
                                                      height: height * .02,
                                                    ))),
                                            TextField(
                                              decoration: InputDecoration(
                                                hintText: 'Enter Plan',
                                                hintStyle: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                        color:
                                                            Color(0xff777777)),
                                              ),
                                              onChanged: (value) {
                                                setState(() {});
                                              },
                                            ),
                                            TextField(
                                              decoration: InputDecoration(
                                                hintText: 'Enter Plan',
                                                hintStyle: Theme.of(context)
                                                    .textTheme
                                                    .bodyLarge
                                                    ?.copyWith(
                                                        color:
                                                            Color(0xff777777)),
                                              ),
                                              onChanged: (value) {
                                                setState(() {});
                                              },
                                            ),
                                            SizedBox(
                                              height: height * .03,
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  setState(() {});
                                                },
                                                child: Text(
                                                  "Update",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyLarge,
                                                ))
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                                iconSize: 28,
                                color: Color(0xff34A853),
                                icon: Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    listItems.removeAt(index);
                                  });
                                },
                                iconSize: 28,
                                color: Color(0xffFE005B),
                                icon: Icon(Icons.delete)),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            );}} )  ;
  }
}