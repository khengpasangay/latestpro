
import 'package:shared_preferences/shared_preferences.dart';

Future<String> getTokenFromLocalStorage() async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final token = await prefs.getString('_TOKEN');
  return token ?? '';
  // return token != null ? token : '';
}

Future<void> setTokenToLocalStorage(String token) async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('_TOKEN', token);
}

