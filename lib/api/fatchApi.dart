import 'package:http/http.dart' as http;
import 'dart:convert';

import 'catagoris.dart';

class fatchApi {
  Future<List<Data>> fatchCatagoris() async {
    List<Data> datalist = [];
    http.Response response = await http.get(
        Uri.parse('https://5742-196-205-94-85.eu.ngrok.io/api/v1/categories'),
        headers: {
          'Authorization':
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MSwiaWF0IjoxNjUzNDAzNjU3LCJleHAiOjE2NTM0MDcyNTd9.Q29zVdRshQ0M1IzUaM1Im5sQhSG_6UL-cn4SIbavxBo'
        });

    if (response.statusCode == 200) {
      var catag = await jsonDecode(response.body)['data'];
      for (var i in catag) {
        datalist.add(Data(
            category_name: i["category_name"],
            id: i["id"],
            image_url: i["image_url"]));
      }
      return datalist;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
