import 'package:cached_network_image/cached_network_image.dart';
import 'package:cupid_match/GlobalVariable/GlobalVariable.dart';
import 'package:cupid_match/controllers/controller/OutgoingRequestController/OutgoingRequestController.dart';
import 'package:cupid_match/match_seeker/chat_screen.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:cupid_match/widgets/seekershortprofile.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../controllers/controller/IncomingRequestController/IncomingRequestController.dart';
import '../../controllers/controller/OutgoingMakerRequestController/outgoing_maker_request_controller.dart';
import '../../data/response/status.dart';
import '../../res/components/general_exception.dart';
import '../../res/components/internet_exceptions_widget.dart';
import '../../widgets/shortprofilemaker.dart';
import '../../widgets/shortprofilepopup.dart';
import 'MakerSingleIncomingRequest.dart';

class OutgoingMakerRequest extends StatefulWidget {
  const OutgoingMakerRequest({Key? key}) : super(key: key);

  @override
  State<OutgoingMakerRequest> createState() => _OutgoingMakerRequestState();
}

class _OutgoingMakerRequestState extends State<OutgoingMakerRequest> {
  OutgoingMakerRequestController outgoingMakerRequestController =
      Get.put(OutgoingMakerRequestController());
  int x = 5;
  @override
  void initState() {
    outgoingMakerRequestController.isOutgoingMakerRequestApi();
    requestid = null;

    // TODO: implement initState
    super.initState();


  }

  String? selectCityItems;
  var CityItems = ["Jaipur", "Sikar"];

  String? selectLocation;
  var LocationItems = [
    "Rajsthan",
    "Haryana",
  ];

  String? selectRadius;
  var radiusItems = [
    "5Km",
    "10Km",
    "15Km",
    "20Km",
  ];
  String? selectSearch;
  var searchItems = [
    "Rajasthan",
    "Haryana",
  ];
  String? selectLike;
  var likesItems = [
    "100 Like",
    "200 Like",
  ];
  String? confirmMatches;
  var confirmItems = [
    "10 Matches",
    "20 Matches",
  ];
  var _formKey = GlobalKey<FormState>();
  var isLoading = false;
  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  Future<void> _showDialog(BuildContext context) async {
    await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        final height = MediaQuery.of(context).size.height;
        final width = MediaQuery.of(context).size.width;
        return AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          // title: Center(child: Text('Sort By')),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: InkWell(
                        child: Image.asset(
                          "assets/images/remove.png",
                          height: height * .03,
                        ),
                        onTap: () {
                          Get.back();
                        },
                      )),
                  Center(
                      child: Text(
                    'Sort By',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(fontSize: 17, fontWeight: FontWeight.w600),
                  )),
                  SizedBox(
                    height: height * .05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Select City",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: height * .01,
                          ),
                          DropdownButtonFormField(
                              value: selectCityItems,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xff000000),
                                size: 22,
                              ),
                              style: Theme.of(context).textTheme.bodyLarge,
                              items: CityItems.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              validator: (value) {
                                if (value == null) return "Select your city";
                                return null;
                              },
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectCityItems = newValue!;
                                });
                              },
                              // itemHeight: 20,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: height * .01,
                                    horizontal: width * .04),
                                hintText: "Select",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: AppColors.subtitletextcolor,
                                        fontSize: 12),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.pinkAccent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide: BorderSide(color: Colors.pink),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Color(0xffBABABA))),
                              )),
                        ],
                      )),
                      SizedBox(
                        width: width * .02,
                      ),
                      Flexible(
                          child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Select State",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: height * .01,
                          ),
                          DropdownButtonFormField(
                              value: selectLocation,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xff000000),
                                size: 22,
                              ),
                              style: Theme.of(context).textTheme.bodyLarge,
                              items: LocationItems.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              validator: (value) {
                                if (value == null) return "Select your state";
                                return null;
                              },
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectLocation = newValue!;
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: height * .01,
                                    horizontal: width * .04),
                                hintText: "Select",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: AppColors.subtitletextcolor,
                                        fontSize: 12),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.pinkAccent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide: BorderSide(color: Colors.pink),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Color(0xffBABABA))),
                              )),
                        ],
                      ))
                    ],
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Radius",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: height * .01,
                          ),
                          DropdownButtonFormField(
                              value: selectRadius,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xff000000),
                                size: 22,
                              ),
                              style: Theme.of(context).textTheme.bodyLarge,
                              items: radiusItems.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              validator: (value) {
                                if (value == null) return "Select your radius";
                                return null;
                              },
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectRadius = newValue!;
                                });
                              },
                              // itemHeight: 20,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: height * .01,
                                    horizontal: width * .04),
                                hintText: "Select",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: AppColors.subtitletextcolor,
                                        fontSize: 12),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.pinkAccent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide: BorderSide(color: Colors.pink),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Color(0xffBABABA))),
                              )),
                        ],
                      )),
                      SizedBox(
                        width: width * .02,
                      ),
                      Flexible(
                          child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Add Search Metrics",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: height * .01,
                          ),
                          DropdownButtonFormField(
                              value: selectLocation,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xff000000),
                                size: 22,
                              ),
                              style: Theme.of(context).textTheme.bodyLarge,
                              items: LocationItems.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              validator: (value) {
                                if (value == null)
                                  return "Select your add search Metrics";
                                return null;
                              },
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectLocation = newValue!;
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: height * .01,
                                    horizontal: width * .04),
                                hintText: "Select",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: AppColors.subtitletextcolor,
                                        fontSize: 12),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.pinkAccent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide: BorderSide(color: Colors.pink),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Color(0xffBABABA))),
                              )),
                        ],
                      ))
                    ],
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Sort by most",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: height * .01,
                          ),
                          DropdownButtonFormField(
                              value: selectRadius,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xff000000),
                                size: 22,
                              ),
                              style: Theme.of(context).textTheme.bodyLarge,
                              items: radiusItems.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              validator: (value) {
                                if (value == null)
                                  return "select your sort by matches";
                                return null;
                              },
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectRadius = newValue!;
                                });
                              },
                              // itemHeight: 20,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: height * .01,
                                    horizontal: width * .04),
                                hintText: "Select",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: AppColors.subtitletextcolor,
                                        fontSize: 12),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.pinkAccent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide: BorderSide(color: Colors.pink),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Color(0xffBABABA))),
                              )),
                        ],
                      )),
                      SizedBox(
                        width: width * .02,
                      ),
                      Flexible(
                          child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Most like profile",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: height * .01,
                          ),
                          DropdownButtonFormField(
                              value: selectLike,
                              icon: const Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xff000000),
                                size: 22,
                              ),
                              style: Theme.of(context).textTheme.bodyLarge,
                              items: likesItems.map((String items) {
                                return DropdownMenuItem(
                                  value: items,
                                  child: Text(items),
                                );
                              }).toList(),
                              validator: (value) {
                                if (value == null)
                                  return "Select your likes profile";
                                return null;
                              },
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectLike = newValue!;
                                });
                              },
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: height * .01,
                                    horizontal: width * .04),
                                hintText: "Select",
                                hintStyle: Theme.of(context)
                                    .textTheme
                                    .bodyLarge
                                    ?.copyWith(
                                        color: AppColors.subtitletextcolor,
                                        fontSize: 12),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Colors.pinkAccent),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide: BorderSide(color: Colors.red),
                                ),
                                disabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xffBABABA)),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(35.0)),
                                  borderSide: BorderSide(color: Colors.pink),
                                ),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Color(0xffBABABA))),
                              )),
                        ],
                      ))
                    ],
                  ),
                  SizedBox(
                    height: height * .03,
                  ),
                  Container(
                    width: width * .37,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Confirmed Matches",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: height * .01,
                            ),
                            DropdownButtonFormField(
                                value: confirmMatches,
                                icon: const Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Color(0xff000000),
                                  size: 22,
                                ),
                                style: Theme.of(context).textTheme.bodyLarge,
                                items: confirmItems.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                validator: (value) {
                                  if (value == null)
                                    return "Select your confirm matches";
                                  return null;
                                },
                                onChanged: (String? newValue) {
                                  setState(() {
                                    confirmMatches = newValue!;
                                  });
                                },
                                // itemHeight: 20,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: height * .01,
                                      horizontal: width * .04),
                                  hintText: "Select",
                                  hintStyle: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.copyWith(
                                          color: AppColors.subtitletextcolor,
                                          fontSize: 12),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Colors.pinkAccent),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide:
                                        BorderSide(color: Color(0xffBABABA)),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(35.0)),
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  disabledBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(35.0)),
                                    borderSide:
                                        BorderSide(color: Color(0xffBABABA)),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(35.0)),
                                    borderSide: BorderSide(color: Colors.pink),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(30),
                                      borderSide:
                                          BorderSide(color: Color(0xffBABABA))),
                                )),
                          ],
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * .04,
                  ),
                  Center(
                    child: MyButton(
                      width: width * .4,
                      title: "Apply",
                      onTap: () {
                        _submit();
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> showmaker(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          final height = MediaQuery.of(context).size.height;
          final width = MediaQuery.of(context).size.width;
          return ShortProfileMaker();
        });
  }

  Future<void> showseeker(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          final height = MediaQuery.of(context).size.height;
          final width = MediaQuery.of(context).size.width;
          return shortprofilepopup();
        });
  }

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
                size: 27,
                color: Color(0xff5A5A5A),
              )),
          title: Text(
            "Outgoing Requests",
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async{
            outgoingMakerRequestController.isOutgoingMakerRequestApi();
          },
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: width * .05, vertical: height * .03),




                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Search by Filter",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(fontWeight: FontWeight.w600),
                            ),
                            InkWell(
                              child: Image.asset(
                                "assets/images/filter.png",
                                height: height * .05,
                              ),
                              onTap: () {
                                _showDialog(context);
                              },
                            ),
                          ],
                        ),

                      ),

                SizedBox(
                  height: height * .02,
                ),
                Obx(() {
                  switch (outgoingMakerRequestController.rxRequestStatus.value) {
                    case Status.LOADING:
                      return Container(

                          child:  Center(child: CircularProgressIndicator()),
                      height: Get.height *0.5,);
                    case Status.ERROR:
                      if (outgoingMakerRequestController.error.value ==
                          'No internet') {
                        return InterNetExceptionWidget(
                          onPress: () {
                            outgoingMakerRequestController.refreshApi();
                          },
                        );
                      } else {
                        return GeneralExceptionWidget(onPress: () {});
                      }
                    case Status.COMPLETED:
                      return outgoingMakerRequestController.OutgoingMakerRequestValue.value.message!="No request found"||
                      //     outgoingMakerRequestController
                      // .OutgoingMakerRequestValue.value.requests != []
                  outgoingMakerRequestController
                      .OutgoingMakerRequestValue.value.requests!
                      .length != 0
                  // ||outgoingMakerRequestController
                  //     .OutgoingMakerRequestValue.value.requests != null
                  ? Container(
                        // height: Get.height*0.6,
                        width: Get.width,
                        child:  ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: outgoingMakerRequestController
                                .OutgoingMakerRequestValue.value.requests!.length,
                            itemBuilder: (BuildContext context, int index) {
                            if(outgoingMakerRequestController
                                .OutgoingMakerRequestValue.value.requests![index].getanotherseeker!=[]||
                                outgoingMakerRequestController
                                    .OutgoingMakerRequestValue.value.requests![index].getanotherseeker!=null||
                                outgoingMakerRequestController
                                    .OutgoingMakerRequestValue.value.requests![index].getanotherseeker!=0||
                                outgoingMakerRequestController
                                    .OutgoingMakerRequestValue.value.requests![index].getseeker!=[]||
                                outgoingMakerRequestController
                                    .OutgoingMakerRequestValue.value.requests![index].getseeker!=null||
                                outgoingMakerRequestController
                                    .OutgoingMakerRequestValue.value.requests![index].getseeker!=0
                            ){
                              return Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                      height: Get.height * 0.08,
                                      color: Color.fromRGBO(254, 0, 145, 1),
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [

                                                Expanded(
                                                    flex: 2,

                                                    child: Row(

                                                  children: [
                                                    SizedBox(
                                                      width: Get.width * 0.02,
                                                    ),
                                                    Container(
                                                        height: Get.height * 0.07,
                                                        width: Get.width * 0.13,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                            BorderRadius.circular(40)),
                                                        child: outgoingMakerRequestController
                                                            .OutgoingMakerRequestValue
                                                            .value.requests![index]
                                                            .getseeker!.imgPath !=
                                                            null
                                                            ? CircleAvatar(
                                                            radius: 22,
                                                            backgroundImage: CachedNetworkImageProvider(
                                                                outgoingMakerRequestController
                                                                    .OutgoingMakerRequestValue
                                                                    .value
                                                                    .requests![index]
                                                                    .getseeker!.imgPath
                                                                    .toString()))
                                                            : CircleAvatar(
                                                          radius: 22,
                                                          backgroundImage:
                                                          NetworkImage(
                                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU",
                                                          ),
                                                          backgroundColor:
                                                          Colors
                                                              .transparent,
                                                        )
                                                    ),
                                                    SizedBox(
                                                      width: Get.width * 0.025,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                      children: [
                                                        Container(
                                                          width: Get.width * 0.15,
                                                          child: Text(
                                                            outgoingMakerRequestController
                                                                .OutgoingMakerRequestValue
                                                                .value.requests![index]
                                                                .getseeker!.name,
                                                            style: TextStyle(
                                                                color: Colors.white,
                                                                fontSize: 12,
                                                                fontWeight: FontWeight
                                                                    .w600),
                                                            overflow: TextOverflow.ellipsis,

                                                          ),
                                                        ),
                                                        Text(
                                                          'Match Seeker',
                                                          style: TextStyle(
                                                              color: Colors.white,
                                                              fontSize: 10,
                                                              fontWeight: FontWeight
                                                                  .w300),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                )),

                                                Expanded(
                                                  flex: 2,
                                                  child: Padding(
                                                    padding:
                                                    const EdgeInsets.only(top: 8.0),
                                                    child: Container(
                                                      width: Get.width * 0.5,
                                                      height: Get.height * 0.065,
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius: BorderRadius
                                                              .only(
                                                              topLeft:
                                                              Radius.circular(10),
                                                              bottomLeft:
                                                              Radius.circular(10))),
                                                      child: Row(
                                                        children: [
                                                          SizedBox(
                                                            width: Get.width * 0.025,
                                                          ),
                                                          Container(
                                                              height: Get.height * 0.06,
                                                              width: Get.width * 0.12,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                  BorderRadius.circular(
                                                                      40)),
                                                              child: outgoingMakerRequestController
                                                                  .OutgoingMakerRequestValue
                                                                  .value
                                                                  .requests![index]!
                                                                  .getanotherseeker!
                                                                  .imgPath !=
                                                                  null
                                                                  ? CircleAvatar(
                                                                  radius: 22,
                                                                  backgroundImage: CachedNetworkImageProvider(
                                                                      outgoingMakerRequestController
                                                                          .OutgoingMakerRequestValue
                                                                          .value
                                                                          .requests![index]!
                                                                          .getanotherseeker!
                                                                          .imgPath
                                                                          .toString()))
                                                                  : CircleAvatar(
                                                                radius: 22,
                                                                backgroundImage:
                                                                NetworkImage(
                                                                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2av8pAdOHJdgpwkYC5go5OE07n8-tZzTgwg&usqp=CAU",
                                                                ),
                                                                backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                              )
                                                          ),
                                                          SizedBox(
                                                            width: Get.width * 0.025,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                            mainAxisAlignment:
                                                            MainAxisAlignment.center,
                                                            children: [
                                                              Container(
                                                                width: Get.width * 0.15,
                                                                child: Text(
                                                                  outgoingMakerRequestController
                                                                      .OutgoingMakerRequestValue
                                                                      .value
                                                                      .requests![index]!
                                                                      .getanotherseeker!
                                                                      .name,
                                                                  style: TextStyle(
                                                                      color: Colors.black,
                                                                      fontSize: 9,
                                                                      fontWeight:
                                                                      FontWeight.w600),
                                                                  overflow: TextOverflow.ellipsis,

                                                                ),
                                                              ),
                                                              Text(
                                                                'Match Seeker',
                                                                style: TextStyle(
                                                                    color: Colors.black,
                                                                    fontSize: 8,
                                                                    fontWeight:
                                                                    FontWeight.w300),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: Get.width * 0.1,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              setState(() {
                                                                requestid=null;
                                                              });

                                                              requestid =  outgoingMakerRequestController
                                                                  .OutgoingMakerRequestValue
                                                                  .value
                                                                  .requests![index]!
                                                                  .id.toString();
                                                              print(requestid);

                                                              if (requestid != null) {
                                                                print(requestid);
                                                                Get.to(MakerSingleRequstPage(title: 'Outgoing Request',));
                                                              }
                                                            },
                                                            child: Text(
                                                              'View',
                                                              style: TextStyle(
                                                                  decorationColor:
                                                                  Color.fromRGBO(
                                                                      254, 0, 145, 1),
                                                                  decoration:
                                                                  TextDecoration
                                                                      .underline,
                                                                  fontSize: 9,
                                                                  fontWeight:
                                                                  FontWeight.w500,
                                                                  color: Color.fromRGBO(
                                                                      254, 0, 145, 1)),
                                                            ),
                                                          )
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
                                  ),
                                ],
                              );
                            }

                            })

                      )
                          : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  SizedBox(
                  height: Get.height * 0.10,
                  ),
                  Container(
                  height: Get.height * 0.2,
                  width: Get.width * 0.8,
                  decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage(
                  "assets/images/recentConversationempty.png"))),
                  ),
                  SizedBox(
                  height: Get.height * 0.01,
                  ),
                  Center(
                  child: Text(
                  "Reference site about Lorem Ipsum\n   giving information on its origins",
                  style: TextStyle(color: Colors.black),
                  ))
                  ],
                  );
                  }



                      //   ListView.builder(
                      //   shrinkWrap: true,
                      //   itemCount: outgoingMakerRequestController.OutgoingMakerRequestValue.value.requests!.length,
                      //   physics: NeverScrollableScrollPhysics(),
                      //   itemBuilder: (context, index) {
                      //     return Padding(
                      //       padding: EdgeInsets.symmetric(vertical: height * .01),
                      //       child: Stack(
                      //         children: [
                      //           Container(
                      //             height: height * 0.11,
                      //             decoration:
                      //                 BoxDecoration(color: Color(0xffFE0091)),
                      //             child: Row(
                      //               mainAxisAlignment: MainAxisAlignment.center,
                      //               children: [
                      //                 Flexible(
                      //                   child: ListTile(
                      //                     leading: InkWell(
                      //                       child: CircleAvatar(
                      //                         radius: 24,
                      //                         backgroundColor: AppColors.white,
                      //                         child: CircleAvatar(
                      //                           radius: 22,
                      //                           backgroundImage:
                      //                           CachedNetworkImageProvider(outgoingMakerRequestController
                      //                               .OutgoingMakerRequestValue
                      //                               .value
                      //                               .requests![index]
                      //                               .getmaker!
                      //                               .imgPath
                      //                               .toString()),),
                      //                       ),
                      //                       onTap: () {
                      //                         // userIdsiker = Incontroller
                      //                         //     .IncomingRequestvalue
                      //                         //     .value
                      //                         //     .requests![index]
                      //                         //     .getSeeker!
                      //                         //     .id
                      //                         //     .toString();
                      //
                      //                         print(userIdsiker);
                      //                         if (userIdsiker != null) {
                      //                           showseeker(context);
                      //                         }
                      //                         // Get.to(ShortProfileSeeker());
                      //                       },
                      //                     ),
                      //                     horizontalTitleGap: 10,
                      //                     title: Text(outgoingMakerRequestController
                      //                             .OutgoingMakerRequestValue
                      //                             .value
                      //                             .requests![index]
                      //                             .getmaker!
                      //                             .name
                      //                             .toString(),
                      //                       style: Theme.of(context)
                      //                           .textTheme
                      //                           .bodySmall
                      //                           ?.copyWith(
                      //                               fontWeight: FontWeight.w600,
                      //                               color: AppColors.white),
                      //                     ),
                      //                     subtitle: Text(
                      //                       "Match Maker",
                      //                       style: Theme.of(context)
                      //                           .textTheme
                      //                           .labelSmall
                      //                           ?.copyWith(
                      //                               fontWeight: FontWeight.w300,
                      //                               color: AppColors.white),
                      //                     ),
                      //                   ),
                      //                 ),
                      //                 if (x == 5)
                      //                   InkWell(
                      //                     child: Padding(
                      //                       padding: const EdgeInsets.only(
                      //                           right: 18.0),
                      //                       child: Text(
                      //                         "View",
                      //                         style: Theme.of(context)
                      //                             .textTheme
                      //                             .labelSmall
                      //                             ?.copyWith(
                      //                                 fontSize: 9,
                      //                                 fontWeight: FontWeight.w500,
                      //                                 color: Colors.white,
                      //                                 decoration: TextDecoration
                      //                                     .underline),
                      //                       ),
                      //                     ),
                      //                     onTap: () {
                      //                       // requestid = Incontroller
                      //                       //     .IncomingRequestvalue
                      //                       //     .value
                      //                       //     .requests![index]
                      //                       //     .id
                      //                       //     .toString();
                      //                       // setState(() {
                      //                       //   requestype = "1";
                      //                       //   requestid;
                      //                       //   print(Incontroller
                      //                       //       .IncomingRequestvalue
                      //                       //       .value
                      //                       //       .requests![index]
                      //                       //       .id
                      //                       //       .toString());
                      //                       // });
                      //
                      //                       if (requestid != null) {
                      //                         print(requestid);
                      //                         Get.to(ChatPage());
                      //                       }
                      //                     },
                      //                   ),
                      //                 if (x != 5)
                      //                   Flexible(
                      //                     child: Container(
                      //                       height: height * 0.10,
                      //                       decoration: BoxDecoration(
                      //                           color: AppColors.white,
                      //                           borderRadius: BorderRadius.only(
                      //                             topLeft: Radius.circular(11),
                      //                             bottomLeft: Radius.circular(11),
                      //                           )),
                      //                       child: ListTile(
                      //                         leading: CircleAvatar(
                      //                           radius: 22,
                      //                           child: InkWell(
                      //                             child: CircleAvatar(
                      //                               radius: 26,
                      //                               backgroundImage:
                      //                                   CachedNetworkImageProvider(
                      //                                       'https://images.pexels.com/photos/17896249/pexels-photo-17896249/free-photo-of-monschau-overview.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
                      //                             ),
                      //                             onTap: () {
                      //                               // Makerid = Incontroller
                      //                               //     .IncomingRequestvalue
                      //                               //     .value
                      //                               //     .requests![index]
                      //                               //     .getMaker!
                      //                               //     .id
                      //                               //     .toString();
                      //                               // showmaker(context);
                      //                             },
                      //                           ),
                      //                         ),
                      //                         horizontalTitleGap: 10,
                      //                         title: Text(
                      //                           "name",
                      //                           style: Theme.of(context)
                      //                               .textTheme
                      //                               .bodySmall
                      //                               ?.copyWith(
                      //                                   fontWeight:
                      //                                       FontWeight.w600,
                      //                                   fontSize: 9),
                      //                         ),
                      //                         subtitle: Text(
                      //                           "Match Maker",
                      //                           style: Theme.of(context)
                      //                               .textTheme
                      //                               .bodySmall
                      //                               ?.copyWith(
                      //                                   fontSize: 8,
                      //                                   fontWeight:
                      //                                       FontWeight.w300,
                      //                                   color: Color(0xff777777)),
                      //                         ),
                      //                         trailing: InkWell(
                      //                             child: Text(
                      //                               "View",
                      //                               style: Theme.of(context)
                      //                                   .textTheme
                      //                                   .labelSmall
                      //                                   ?.copyWith(
                      //                                       fontSize: 9,
                      //                                       fontWeight:
                      //                                           FontWeight.w500,
                      //                                       color:
                      //                                           Color(0xffFE0091),
                      //                                       decoration:
                      //                                           TextDecoration
                      //                                               .underline),
                      //                             ),
                      //                             onTap: () {
                      //                               // requestid = Incontroller
                      //                               //     .IncomingRequestvalue
                      //                               //     .value
                      //                               //     .requests![index]
                      //                               //     .id
                      //                               //     .toString();
                      //                               // setState(() {
                      //                               //   requestype = "1";
                      //                               //   requestid;
                      //                               //   print(Incontroller
                      //                               //       .IncomingRequestvalue
                      //                               //       .value
                      //                               //       .requests![index]
                      //                               //       .id
                      //                               //       .toString());
                      //                               // });
                      //
                      //                               if (requestid != null) {
                      //                                 print(requestid);
                      //                                 Get.to(ChatPage());
                      //                               }
                      //                             }),
                      //                       ),
                      //                     ),
                      //                   )
                      //               ],
                      //             ),
                      //           ),
                      //         ],
                      //       ),
                      //     );
                      //   },
                      // );

                }),
              ],
            ),
          ),
        ));
  }
}
