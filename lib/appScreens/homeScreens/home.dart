import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orange_odc_flutter_hackathon_code/appScreens/controls/controlsForApp.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

import 'firstScreen.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  int selectedIndex = 0;
  PageController _pageController = PageController(initialPage: 0);
  bool _colorful = true;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: _listOfWidget,
            ),
          ),
        ],
      ),
      bottomNavigationBar: _colorful
          ? SlidingClippedNavBar.colorful(
              backgroundColor: Colors.white,
              onButtonPressed: onButtonPressed,
              iconSize: 30,
              // activeColor: const Color(0xFF01579B),
              selectedIndex: selectedIndex,
              barItems: <BarItem>[
                BarItem(
                  icon: Icons.home_outlined,
                  title: 'Home',
                  activeColor: orangColor,
                  inactiveColor: orangColor,
                ),
                BarItem(
                  icon: Icons.menu_book_outlined,
                  title: 'My Cor',
                  activeColor: orangColor,
                  inactiveColor: orangColor,
                ),
                BarItem(
                  icon: Icons.person_outline,
                  title: 'prof',
                  activeColor: orangColor,
                  inactiveColor: orangColor,
                ),
              ],
            )
          : SlidingClippedNavBar(
              backgroundColor: Colors.white,
              onButtonPressed: onButtonPressed,
              iconSize: 30,
              activeColor: orangColor,
              selectedIndex: selectedIndex,
              barItems: <BarItem>[
                BarItem(
                  icon: Icons.event,
                  title: 'Events',
                ),
                BarItem(
                  icon: Icons.search_rounded,
                  title: 'Search',
                ),
                BarItem(
                  icon: Icons.bolt_rounded,
                  title: 'Energy',
                ),

              ],
            ),
    );
  }
}

// icon size:24 for fontAwesomeIcons
// icons size: 30 for MaterialIcons

List<Widget> _listOfWidget = <Widget>[
  firstScreen(),
  Container(
    alignment: Alignment.center,
    child: const Icon(
      Icons.search,
      size: 56,
      color: Colors.brown,
    ),
  ),
  Container(
    alignment: Alignment.center,
    child: const Icon(
      Icons.bolt,
      size: 56,
      color: Colors.brown,
    ),
  ),
];
