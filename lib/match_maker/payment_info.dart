import 'package:cupid_match/match_maker/MakerLikes.dart';
import 'package:cupid_match/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class PaymentInfo extends StatefulWidget {
  const PaymentInfo({Key? key}) : super(key: key);

  @override
  State<PaymentInfo> createState() => _PaymentInfoState();
}

class _PaymentInfoState extends State<PaymentInfo> {

  var _formKey = GlobalKey<FormState>();
  var isLoading = false;

  void _submit() {
    final isValid = _formKey.currentState!.validate();
    if(isValid) {
      return;
    }
    _formKey.currentState!.save();
  }

  String? matchesValue;
  var matchesItems = [
    "15 Matches",
    "20 Matches",
    "25 Matches",
  ];

  String? monthsValue;
  var monthsItems = [
    "1 Months",
    "2 Months",
    "3 Months",
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          Get.back();
        }, icon: Icon(Icons.arrow_back,color: Color(0xff5A5A5A), size: 27,)),
        title: Text("Payment Info",style: Theme.of(context).textTheme.titleLarge,),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width*.04),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              SizedBox(height: height*.03,),
              Row(
                children: [
                  Flexible(child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Matches",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 12,fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: height * 0.01,),
                      DropdownButtonFormField(value: matchesValue,
                          icon: const Icon(Icons.keyboard_arrow_down,color: Color(0xff000000)),
                          style: Theme.of(context).textTheme.bodyLarge,
                          items: matchesItems.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          validator: (value) {
                            if(value == null)
                              return "Required";
                            return null;
                          },
                          onChanged: (String? newValue) {
                            setState(() {
                              matchesValue = newValue!;
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: height*.02,horizontal: width*.03),
                            hintText: "Select matches",
                            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.subtitletextcolor),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Color(0xff777777))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Color(0xff777777))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Color(0xff777777))),
                          )
                      ),
                    ],
                  ),
                  ),
                  SizedBox(width: width*.03,),
                  Flexible(child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Monthes",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 12, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: height * 0.01,),
                      DropdownButtonFormField(value: monthsValue,
                          icon: const Icon(Icons.keyboard_arrow_down,color: Color(0xff000000)),
                          style: Theme.of(context).textTheme.bodyLarge,
                          items: monthsItems.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          validator: (value) {
                            if(value == null)
                              return "Required";
                            return null;
                          },
                          onChanged: (String? newValue) {
                            setState(() {
                              monthsValue = newValue!;
                            });
                          },
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: height*.02,horizontal: width*.03),
                            hintText: "Select months",
                            hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.subtitletextcolor),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Color(0xff777777))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Color(0xff777777))),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide(color: Color(0xff777777))),
                          )
                      ),
                    ],
                  ),)
                ],
              ),
              SizedBox(height: height*.01,),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: height*.02),
                    child: Container(
                      height: height*.09,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(33),
                        color: Color(0xffF3F3F3),
                      ),child: Center(
                      child: GestureDetector(
                        onTap: () {
                          if(_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            _submit();
                            Get.to(() => MakerLikes());
                          }
                        },
                        child: ListTile(
                          visualDensity: VisualDensity(vertical: -2),
                          leading: CircleAvatar(
                            radius: 16,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundImage: NetworkImage("https://images.unsplash.com/photo-1519085360753-af0119f7cbe7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHByb2ZpbGUlMjBpbWFnZXxlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60"),
                            ),
                          ),
                          title: Text("Henry Peterson, 28",style: Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w600),),
                          subtitle: Text("2 Months Subscription",style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 8,fontWeight: FontWeight.w300),),
                          trailing: Text("\$6",style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Color(0xffFE008F),fontWeight: FontWeight.w600),),
                        ),
                      ),
                    ),
                    ),
                  );
                },)
            ],
          ),
        ),
      ),
    );
  }
}
