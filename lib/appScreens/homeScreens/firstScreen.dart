import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../controls/controlsForApp.dart';

class firstScreen extends StatefulWidget {
  const firstScreen({Key? key}) : super(key: key);

  @override
  State<firstScreen> createState() => _firstScreenState();
}

class _firstScreenState extends State<firstScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: SvgPicture.asset("images/homeImage/logo1.svg"),
          elevation: 0.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Expanded(
                flex: 4,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  color: Color(0x1B1816).withOpacity(1.0),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Enter the Code ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "to Get your course ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                                flex: 4,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      decoration: InputDecoration(
                                        filled: true,
                                        fillColor: Color(0x2B2B2B).withOpacity(1.0),
                                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.09)),
                                        label: Text("enter code",style: TextStyle(color: Color(0x636363).withOpacity(1.0),))

                                      ),
                                    ),
                                  ],
                                )),
                            Expanded(
                                flex: 1,
                                child: Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: orangColor,
                                      child: Icon(Icons.arrow_forward),
                                    ),
                                  ],
                                )),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  flex: 4,
                  child: Row(
                    children: [],
                  )),
              Expanded(
                  flex: 5,
                  child: Row(
                    children: [],
                  )),
            ],
          ),
        ));
  }
}
