import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:orange_odc_flutter_hackathon_code/api/fatchApi.dart';

import '../../api/catagoris.dart';
import '../controls/controlsForApp.dart';

class firstScreen extends StatefulWidget {
  const firstScreen({Key? key}) : super(key: key);

  @override
  State<firstScreen> createState() => _firstScreenState();
}

class _firstScreenState extends State<firstScreen> {
  fatchApi _fatch = fatchApi();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 150,
        leading: SvgPicture.asset(
          "images/homeImage/Logo1.svg",
        ),
        elevation: 0.0,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     blackText(
                //         text: 'Top Categories',
                //         fontSize: 20,
                //         wid: FontWeight.w600),
                //     TextButton(
                //         onPressed: () {},
                //         child: orangeText(
                //             text: "See All",
                //             fontSize: 12,
                //             wid: FontWeight.w500))
                //   ],
                // ),
                Row(
                  children: [
                    FutureBuilder<List<Data>>(
                      future: fatchApi().fatchCatagoris(),
                      builder: (BuildContext context, snapshot) {
                        // List<Widget>? children;
                        if (snapshot.hasData) {
                          print("${snapshot.data} ============>");
                          return ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemBuilder:
                                (BuildContext context, int index) {
                              return Text(snapshot.data![index].category_name.toString());
                                },
                          );
                          // children = <Widget>[
                          //      Text(snapshot.data![0].data![1].categoryName.toString())
                          // ];
                        } else if (snapshot.hasError) {
                          return Text('error future');
                        }
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                        // return Center(
                        //   child: Column(
                        //     mainAxisAlignment: MainAxisAlignment.center,
                        //     children:Categories != nulla ? children! :
                        //    [ const Center(child: CircularProgressIndicator(),)],
                        //   ),
                        // );
                      },
                    ),

                  ],
                )
              ],
            ),
          ),
          Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
                color: Color(0x1B1816).withOpacity(1.0),
                elevation: 10,
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Enter the Code",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "to Get your course",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            height: size.height * 0.05,
                          )
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
                                        fillColor:
                                            Color(0x2B2B2B).withOpacity(1.0),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.09)),
                                        label: Text("enter code",
                                            style: TextStyle(
                                              color: Color(0x636363)
                                                  .withOpacity(1.0),
                                            ))),
                                  ),
                                ],
                              )),
                          Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: CircleAvatar(
                                      backgroundColor: orangColor,
                                      child: Icon(Icons.arrow_forward),
                                    ),
                                  ),
                                ],
                              )),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
        shrinkWrap: true,
        reverse: true,
        itemExtent: size.height * 0.27,
        padding: EdgeInsets.all(15),
      ),
    );
  }
}
