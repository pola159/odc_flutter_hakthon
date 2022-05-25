import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orange_odc_flutter_hackathon_code/appScreens/screensToLogin/signScreen.dart';
import '../controls/controlsForApp.dart';

import 'loginScreen.dart';

class startPage extends StatefulWidget {
  const startPage({Key? key}) : super(key: key);

  @override
  State<startPage> createState() => _startPageState();
}

class _startPageState extends State<startPage> {
  int currentIndex = 0;
  PageController _controller = PageController(initialPage: 0);

  //installation controller
  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }
  //delete controller after end the page
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //get size for screen
    return Scaffold(
      body: Column(
        children: [
          //page split to 2 expanded
          Expanded(
            flex: 4,
            //create page view
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              //to make counter
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.only(
                    right: 60,
                    left: 60,
                    top: 120,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        contents[i].image,
                        height: 238,
                      ),
                      Text(
                        contents[i].title,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        contents[i].discription,
                        style: TextStyle(
                          fontFamily: "Roboto",
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                contents.length,
                (index) => buildDot(index, context),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          button(
                              them: true,
                              text: "Join Now",
                              pageToGo: () {
                                goToScreen(singin());
                              }),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          button(
                              them: false,
                              text: "Log in",
                              pageToGo: () {
                                goToScreen(login());
                              }),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      margin: EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: (currentIndex == index)
            ? Color(0xFF6600).withOpacity(1.0)
            : Color(0x777777).withOpacity(1.0),
      ),
    );
  }

  Future<Function> goToScreen(var page) async =>
      await Navigator.of(context)
          .push(MaterialPageRoute(builder: (c) {
        return page;
      }));
}

class UnbordingContent {
  String image;
  String title;
  String discription;

  UnbordingContent(
      {required this.image, required this.title, required this.discription});
}

List<UnbordingContent> contents = [
  UnbordingContent(
      image: 'images/loginSignImages/illustration.svg',
      title: 'Learn a lot of courses in Orange Education',
      discription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "),
  UnbordingContent(
      image: 'images/loginSignImages/illustrations.svg',
      title: 'Learn a lot of courses in Orange Education',
      discription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "),
  UnbordingContent(
      image: 'images/loginSignImages/illustrations(1).svg',
      title: 'Learn a lot of courses in Orange Education',
      discription:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "),
];
