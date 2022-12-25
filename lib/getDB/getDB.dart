import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

// Future getJsonData() async {
//   var url = Uri.parse('http://localhost:8080/Flutter/soloGP/soloGP_insert.jsp');
//   var response = await http.get(url);
//   // print(response.body);
//   data.clear();
//   var dataConvertedJSON = json.decode(
//     utf8.decode(
//       response.bodyBytes,
//     ),
//   );
//   List result = dataConvertedJSON['results'];
//   setState(() {
//     data.addAll(result);
//   });
//   return true;
// }
