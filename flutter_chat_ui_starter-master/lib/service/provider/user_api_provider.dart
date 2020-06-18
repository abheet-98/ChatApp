import 'dart:async';
import 'package:bethere_app/config/net/base_api.dart';
import 'package:bethere_app/models/models.dart';

class UserApiProvider {

  Future<User> login(User user) async {
    print("directLogin ${user}");
//     var response = await http.post('/auth/app/', data: user.toJsonForLogin(user));
//     print("/auth/app/login/'${response}");
//     var json = response.data['user'];
//     json['token'] = response.data['token'];
//     return User.fromJson(json);

  }

  Future<User> signUp(User user) async {
    print("signUp ${user}");
//     var response = await http.post('/user/register/', data: user.toJsonForSignUp(user));
//     print("/user/register/'${response}");
//     var json = response.data['user'];
////     json['token'] = response.data['token'];
//     return User.fromJson(json);

  }


}
