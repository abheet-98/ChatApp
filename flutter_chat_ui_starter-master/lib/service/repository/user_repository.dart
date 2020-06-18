import 'dart:async';
//import 'dart:html';
import 'package:flutter_todos/service/provider/user_api_provider.dart';
import 'package:flutter_todos/models/models.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_todos/config/storage_manager.dart';

//import '../models/trailer_model.dart';

class UserRepository {
 final userApiProvider = UserApiProvider();

 Future<User> login(User user) => userApiProvider.login(user);

 Future<User> signUp(User user) => userApiProvider.signUp(user);


// Future<User> signUp(User user) async {
//  return await userApiProvider.signUp(user);
// }

 Future<String> authenticate({
  @required User user,
  @required String token,
 }) async {
  await Future.wait([
   StorageManager.localStorage.setItem("token", token),
   StorageManager.localStorage.setItem("user", user)
  ]);

  return token;
 }

 Future<void> deleteToken() async {
  /// delete from keystore/keychain
  return StorageManager.deleteToken();
 }

Future<void> deleteTokenAndUser() async {
  /// delete from keystore/keychain
  return StorageManager.deleteTokenAndUser();
 }

 Future<void> persistUser(User user) async {
  /// write to keystore/keychain
  await Future.wait([
    StorageManager.setUser(user)]);
  return;
 }

 Future<void> persistToken(String token, User user) async {
  /// write to keystore/keychain
  await Future.wait([
    StorageManager.setToken(token),
    StorageManager.setUser(user)]);
  return;
 }

 Future<bool> hasToken() async {
  /// read from keystore/keychain

  String token = await StorageManager.getToken();
  return token == null ? false : true;
 }


 Future<void> signOut() async {

  StorageManager.deleteToken();

   return;
 }

  updateUserToken(String deviceId, int userId, String token) {}}
