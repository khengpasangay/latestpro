import 'dart:convert';
import '../../plugins/http.dart';
import '../../plugins/local_shared_preferences.dart';

Future loginWithEmailAndPassword() async {
  final res = await PostRequest('authentication', <String, String>{
    'username': 'admin@expense.com',
    'password': 'admin'
  });
  await setTokenToLocalStorage(jsonDecode(res.body)['data']['accessToken']);
}

class AuthRepo{
  Future loginWithEmailAndPassword(String username, String password) async {
    final res = await PostRequest('authentication', <String, String>{
      'username': username,
      'password': password
    });
    await setTokenToLocalStorage(jsonDecode(res.body)['data']['accessToken']);
  }
}