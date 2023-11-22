// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'dart:math';

// class SlotMachine extends StatefulWidget {
//   @override
//   _SlotMachineState createState() => _SlotMachineState();
// }

// class _SlotMachineState extends State<SlotMachine> {
//   final List<String> items = [
//     'https://plus.unsplash.com/premium_photo-1661763150703-149671deb82c?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80',
//     'https://images.pexels.com/photos/1580271/pexels-photo-1580271.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
//     'https://media.istockphoto.com/id/639695818/photo/photographer-workplace.jpg?s=1024x1024&w=is&k=20&c=3puvOnZJWmuXv_5L76LLroWemCqVvZ-5_Oux_xvEa7w='
//   ];
//   late ScrollController _controller1;
//   late ScrollController _controller2;
//   late ScrollController _controller3;
//   bool isRolling = false;
//   bool showResult = false;
//   late int resultIndex1;
//   late int resultIndex2;
//   late int resultIndex3;
// @override
// void initState() {
//   super.initState();
//   _controller1 = ScrollController();
//   _controller2 = ScrollController();
//   _controller3 = ScrollController();
//   _startRolling();
// }
//  Future<void> _startRolling() async {
//   setState(() {
//     isRolling = true;
//     showResult = false;
//   });

//   // Reset scroll controllers
//   _controller1.jumpTo(0);
//   _controller2.jumpTo(0);
//   _controller3.jumpTo(0);

//   final random = Random();
//   final duration = Duration(seconds: 10);

//   // Generate unique indices for each photo
//   List<int> uniqueIndices = [];
//   while (uniqueIndices.length < 3) {
//     int index = random.nextInt(items.length);
//     if (!uniqueIndices.contains(index)) {
//       uniqueIndices.add(index);
//     }
//   }

//   resultIndex1 = uniqueIndices[0];
//   resultIndex2 = uniqueIndices[1];
//   resultIndex3 = uniqueIndices[2];

//   final target1 = resultIndex1 + (items.length * 20);
//   final target2 = resultIndex2 + (items.length * 20);
//   final target3 = resultIndex3 + (items.length * 20);

//   // Update ScrollControllers here
//   _controller1 = ScrollController(initialScrollOffset: resultIndex1 * 80.0);
//   _controller2 = ScrollController(initialScrollOffset: resultIndex2 * 80.0);
//   _controller3 = ScrollController(initialScrollOffset: resultIndex3 * 80.0);

//   await Future.wait([
//     _controller1.animateTo(
//       target1 * 80.0,
//       duration: duration,
//       curve: Curves.linear,
//     ),
//     _controller2.animateTo(
//       target2 * 80.0,
//       duration: duration,
//       curve: Curves.linear,
//     ),
//     _controller3.animateTo(
//       target3 * 80.0,
//       duration: duration,
//       curve: Curves.linear,
//     ),
//   ]);

//   await Future.delayed(Duration(milliseconds: 500)); // Delay for smooth display

//   setState(() {
//     isRolling = false;
//     showResult = true;
//   });
// }

//   Widget _buildSlotItem(ScrollController controller, int index) {
//   return Container(
//     width: 80,
//     height: 200,
//     margin: EdgeInsets.all(8.0),
//     decoration: BoxDecoration(
//       border: Border.all(color: Colors.black),
//       borderRadius: BorderRadius.circular(10),
//     ),
//     child: ListView.builder(
//       controller: controller,
//       itemExtent: 80,
//       physics: NeverScrollableScrollPhysics(),
//       itemCount: items.length,
//       itemBuilder: (context, itemIndex) {
//         return Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Image.network(
//             items[itemIndex],
//             width: 60,
//             height: 60,
//           ),
//         );
//       },
//     ),
//   );
// }

//   Widget _buildResultItem(int index) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Image.network(
//         items[index],
//         width: 60,
//         height: 60,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         SizedBox(height: 20),
//         if (!showResult)
//          Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   children: [
//     _buildSlotItem(_controller1, resultIndex1),
//     _buildSlotItem(_controller2, resultIndex2),
//     _buildSlotItem(_controller3, resultIndex3),
//   ],
// ),
//         if (showResult)
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               _buildResultItem(resultIndex1),
//               _buildResultItem(resultIndex2),
//               _buildResultItem(resultIndex3),
//             ],
//           ),
//         SizedBox(height: 20),
//         if (isRolling == false)
//           ElevatedButton(
//             onPressed: _startRolling,
//             child: Text('Roll'),
//           ),
//         if (isRolling == true)
//           ElevatedButton(
//             onPressed: _startRolling,
//             child: Text('Roll Again'),
//           ),
//       ],
//     );
//   }
// }