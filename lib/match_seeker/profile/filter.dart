import 'package:cupid_match/match_seeker/Siker_TabView.dart';
import 'package:cupid_match/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  var items1 = [
    'USA',
    'India',
    'China',
    'Japan',
  ];
  var items2 = [
    'Jaipur',
    'Ajmer',
    'Jodhpur',
    'Kota',
  ];
  var items3 = [
    'USA',
    'India',
    'China',
    'Japan',
  ];

  String dropdownvalue1 = 'USA';
  String dropdownvalue2 = 'Jaipur';
  String dropdownvalue3 = 'USA';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Filter",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Find Your Partner",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            SizedBox(
              height: height * .02,
            ),
            Text(
                "Lorem Ipsum is simply dummy text of the\nprinting and typesetting industry.",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: Colors.grey)),
            SizedBox(
              height: height * .03,
            ),
            Text(
              "Country",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black),
            ),
            SizedBox(
              height: height * .01,
            ),
            DropdownButtonFormField(
              value: dropdownvalue1,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Drop Points';
                }
              },
              hint: Text(
                "USA",
                style: TextStyle(fontSize: 10),
              ),
              items: items1.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  dropdownvalue1 = value!;
                });
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 22),
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(35.0)),
              ),
            ),
            SizedBox(
              height: height * .03,
            ),
            Text(
              "City",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black),
            ),
            SizedBox(
              height: height * .01,
            ),
            DropdownButtonFormField(
              value: dropdownvalue2,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Drop Points';
                }
              },
              hint: Text(
                "1",
                style: TextStyle(fontSize: 10),
              ),
              items: items2.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  dropdownvalue2 = value!;
                });
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 22),
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(35.0)),
              ),
            ),
            SizedBox(
              height: height * .03,
            ),
            Text(
              "Country",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black),
            ),
            SizedBox(
              height: height * .01,
            ),
            DropdownButtonFormField(
              value: dropdownvalue3,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please Enter Drop Points';
                }
              },
              hint: Text(
                "1",
                style: TextStyle(fontSize: 10),
              ),
              items: items3.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  dropdownvalue3 = value!;
                });
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(20, 10, 10, 22),
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(35.0),
                  borderSide: const BorderSide(
                    color: Colors.grey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.circular(35.0)),
              ),
            ),
            SizedBox(
              height: height * .03,
            ),
            Center(
              child: MyButton(
                title: "Submit",
                onTap: () {
                  Get.to(() => Siker_Tab_View(index: 0));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
