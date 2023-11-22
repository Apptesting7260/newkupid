import 'package:flutter/material.dart';

class Bottom extends StatefulWidget {
  final int bottomSelectedIndex;
  final Function bottomTapped;

  const Bottom(
      {Key? key, required this.bottomSelectedIndex, required this.bottomTapped})
      : super(key: key);

  @override
  _BottomState createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  List<BottomNavigationBarItem> buildBottomNavBarItems = [
    const BottomNavigationBarItem(
        label: "",
        icon: ImageIcon(AssetImage("assets/icons/home.png")),
        activeIcon: ImageIcon(AssetImage(
          "assets/icons/home.png",
        ))),
    const BottomNavigationBarItem(
        label: "",
        icon: ImageIcon(AssetImage("assets/icons/like.png")),
        activeIcon: ImageIcon(AssetImage(
          "assets/icons/like.png",
        ))),
    const BottomNavigationBarItem(
        label: "",
        icon: ImageIcon(AssetImage("assets/icons/message.png")),
        activeIcon: ImageIcon(AssetImage(
          "assets/icons/message.png",
        ))),
    const BottomNavigationBarItem(
        label: "",
        icon: ImageIcon(AssetImage("assets/icons/people.png")),
        activeIcon: ImageIcon(AssetImage(
          "assets/icons/people.png",
        ))),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: buildBottomNavBarItems,
      selectedItemColor: const Color(0xffFE0091),
      unselectedItemColor: Colors.grey,
      selectedIconTheme: const IconThemeData(
        color: const Color(0xffFE0091),
      ),
      unselectedIconTheme: const IconThemeData(
        color: const Color(0xffADADAD),
      ),
      elevation: 8,
      backgroundColor: Colors.white,
      currentIndex: widget.bottomSelectedIndex,
      onTap: (index) => widget.bottomTapped(index),
      selectedFontSize: 12,
      unselectedFontSize: 10,
    );
  }
}
