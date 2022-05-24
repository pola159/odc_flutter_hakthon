import 'package:flutter/material.dart';

import '../controls/controlsForApp.dart';

class policy extends StatelessWidget {
  const policy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWithBack(titel: ""),
      body: Container(
        padding: EdgeInsets.all(40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    blackText(
                        text: "Privacy ",
                        fontSize: 35,
                        wid: FontWeight.w700),
                    orangeText(
                        text: "Policy",
                        fontSize: 35,
                        wid: FontWeight.w700),
                  ],
                ),
                blackText(text: "text", fontSize: 15, wid: FontWeight.w400)
              ],
            ),
      ),
    );
  }
}
