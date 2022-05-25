import 'package:flutter/material.dart';


var orangColor = Color(0xFF6600).withOpacity(1.0);
Widget button({required bool them, required String text , required  Function pageToGo}) {
  return Padding(
    padding: const EdgeInsets.only(left: 40.0,right: 40 , top: 20,bottom: 20),
    child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: orangColor, width: 2)),
          ),
          backgroundColor: MaterialStateProperty.all(
              (them) ? orangColor : Colors.white),
          minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
        ),
        onPressed: (){
          pageToGo();
        },
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'Roboto',
            color: (them) ? Colors.white : orangColor,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
        )),
  );
}

Widget textField({required String text, required Icon icon }) {
  return Padding(
    padding: const EdgeInsets.only(right: 40.0 , left: 40.0 , top: 8 ,bottom: 8),
    child: TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xF8F8F8).withOpacity(1.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10.09)),
        label: Text(text),
        prefixIcon: icon,

      ),
    ),
  );
}

AppBar appBarWithBack({required String titel}){
  return AppBar(
    backgroundColor: Colors.white,
    elevation: 0.0,
    foregroundColor: Colors.black,
    title: Container(
      alignment: Alignment.center,
        child: Text(titel,)),
  );
}

Text orangeText({required String text , required double fontSize , required FontWeight wid}){
  return Text(text,
    style: TextStyle(
    fontSize: fontSize,
    fontWeight: wid,
    fontFamily: "Roboto",
    color: orangColor,
  ),);
}

Text blackText({required String text , required double fontSize,required FontWeight wid}){
  return Text(text,
    style: TextStyle(
        fontSize: fontSize,
        fontWeight: wid,
        fontFamily: "Roboto"),
  );
}

// Card Categories({required Icon icon , required String text , required double fontSize}){
//   return Card(
//     child: ListTile(
//
//        ElevatedButton(
//         style: ButtonStyle(
//           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
//             RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//                 side: BorderSide(color: orangColor, width: 2)),
//           ),
//           backgroundColor: MaterialStateProperty.all(Colors.white),
//           minimumSize: MaterialStateProperty.all(Size(double.infinity, double.infinity)),
//         ),
//         onPressed: (){},
//         child: icon,
//       ),
//     ),
//       Text(text , style: TextStyle(
//         fontSize: fontSize,
//         color: Colors.black,
//         fontWeight: FontWeight.w500,
//       ),)
//     ,
//   );
//}