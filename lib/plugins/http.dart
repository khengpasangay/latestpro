import 'dart:convert';

import 'package:athang_expense_tracker/config/baseURL.dart';
import 'package:http/http.dart' as http;

Future GetRequest(url) async{
  return http.get(Uri.parse(BaseConfig().baseUrl + url));

}

Future PostRequest(url, body) async{
  return await http.post(
      Uri.parse(url),
      headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body));
}