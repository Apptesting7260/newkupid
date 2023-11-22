// import 'package:cupid_match/match_maker/create_plan_Matches.dart';
// import 'package:cupid_match/widgets/my_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';



// class CreateMatchesSubcriptionPlan extends StatefulWidget {
//   const CreateMatchesSubcriptionPlan({Key? key}) : super(key: key);

//   @override
//   State<CreateMatchesSubcriptionPlan> createState() => _CreateMatchesSubcriptionPlanState();
// }

// class _CreateMatchesSubcriptionPlanState extends State<CreateMatchesSubcriptionPlan> {
//   List<Map<String, String>> listItems = [
//     {"title":"5",
//       "price":"6"},

//     {"title":"10",
//       "price":"12"},

//     {"title":"15",
//       "price":"18"},
//   ];

//   final _NewValue = "";

//   // @override
//   // void dispose() {
//   //   titleController.dispose();
//   //   priceController.dispose();
//   //   super.dispose();
//   // }

//   TextEditingController titleController = TextEditingController();
//   TextEditingController priceController = TextEditingController();

//   ShowDialog(BuildContext context) {
//     showDialog(context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             backgroundColor: Color(0xffFFFFFF),
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(22)
//             ),
//             content: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 TextFormField(
//                   controller: titleController,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     suffixIcon: IconButton(onPressed: () {
//                       titleController.clear();
//                     }, icon: Icon(Icons.cancel)),
//                     hintText: 'Enter Plan',
//                     hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Color(0xff777777)),
//                   ),
//                 ),
//                 //SizedBox(height: MediaQuery.of(context).size.height*.01,),
//                 TextFormField(
//                   controller: priceController,
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     suffixIcon: IconButton(onPressed: () {
//                       priceController.clear();
//                     }, icon: Icon(Icons.cancel)),
//                     hintText: 'Enter Price',
//                     hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Color(0xff777777)),
//                   ),
//                 ),
//                 SizedBox(height: MediaQuery.of(context).size.height*.02,),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     TextButton(onPressed: () {
//                       Navigator.of(context).pop();
//                     }, child: Text('Cancel',style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 13),)),
//                     TextButton(onPressed: () {
//                       setState(() {
//                         listItems.add({"title":titleController.text,"price":priceController.text});
//                         titleController.text = _NewValue;
//                         priceController.text = _NewValue;
//                       });
//                       Navigator.of(context).pop(true);
//                       Get.to(ApplyMatchesPlan());
//                     }, child: Text('Ok',style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 13),)),
//                   ],
//                 )
//               ],
//             ),
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final height = MediaQuery.of(context).size.height;
//     final width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(onPressed: () {
//           Get.back();
//         }, icon: Icon(Icons.arrow_back,color: Color(0xff5A5A5A), size: 27)),
//         title: Text("Subscriptions",style: Theme.of(context).textTheme.titleLarge,),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding:  EdgeInsets.symmetric(horizontal: width*.02),
//         child: ListView(
//           children: [
//             SizedBox(height: height*.03,),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: width*.02),
//               child: Text("Matches Subscriptions",style: Theme.of(context).textTheme.titleSmall,),
//             ),
//             Container(
//               height: height*.4,
//               child: ListView.builder(
//                 itemCount: listItems.length,
//                 itemBuilder: (context, index) {
//                   return Padding(padding: EdgeInsets.all(12),
//                     child: Container(
//                       height: height*.07,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(35),
//                           color: Color(0xffFFFFFF),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Color(0xffBABABA),
//                               blurRadius: 2.0,
//                               spreadRadius: .4,
//                               offset: Offset(0.0, 0.0),
//                             ),
//                           ]
//                       ),
//                       child: ListTile(
//                         title: RichText(
//                             text: TextSpan(
//                                 text: '${listItems[index]["title"]} Matches  ',style: Theme.of(context).textTheme.titleSmall,
//                                 children: [
//                                   TextSpan(
//                                     text: '\$${listItems[index]["price"]}',style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Color(0xffFE008F)),
//                                   ),
//                                 ]
//                             )),
//                         trailing: Wrap(
//                           spacing: -10,
//                           children: [
//                             IconButton(onPressed: () {
//                               showDialog(
//                                 barrierDismissible: false,
//                                 context: context,
//                                 builder: (context) {
//                                   return AlertDialog(
//                                     backgroundColor: Color(0xffFFFFFF),
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(22)
//                                     ),
//                                     content: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         Align(
//                                             alignment: Alignment.topRight,
//                                             child: GestureDetector(
//                                                 onTap: () {
//                                                   Get.back();
//                                                 },
//                                                 child: Image.asset('assets/images/Group 115 (2).png',height: height*.02,))),
//                                         TextField(
//                                           decoration: InputDecoration(
//                                             hintText: 'Enter Plan',
//                                             hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Color(0xff777777)),
//                                           ),
//                                           onChanged: (value) {
//                                             setState(() {

//                                             });
//                                           },
//                                         ),
//                                         TextField(
//                                           decoration: InputDecoration(
//                                             hintText: 'Enter Plan',
//                                             hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Color(0xff777777)),
//                                           ),
//                                           onChanged: (value) {
//                                             setState(() {

//                                             });
//                                           },
//                                         ),
//                                         SizedBox(height: height*.03,),
//                                         TextButton(onPressed: () {
//                                           setState(() {

//                                           });

//                                         }, child: Text("Update",style: Theme.of(context).textTheme.bodyLarge,))
//                                       ],
//                                     ),
//                                   );
//                                 },);
//                             }, iconSize: 28,
//                                 color: Color(0xff34A853),
//                                 icon: Icon(Icons.edit)),
//                             IconButton(onPressed: () {
//                               setState(() {
//                                 listItems.removeAt(index);
//                               });
//                             }, iconSize: 28,
//                                 color: Color(0xffFE005B),
//                                 icon: Icon(Icons.delete)),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },),
//             ),
//             SizedBox(height: height*0.07,),
//             Center(
//               child: MyButton(
//                 width: width*.8,
//                 title: '+ Create New Plan',
//                 onTap: () {
//                   ShowDialog(context);
//                 },),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

