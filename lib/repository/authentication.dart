import 'dart:convert';

import 'package:admin_web_portal/models/profile.dart';
import 'package:admin_web_portal/utils/shared_preferences.dart';
import 'package:dio/dio.dart';

abstract class AuthenticationRepositoryI {
  Future<Profile> login(String username, String password);
}

class AuthenticationRepository implements AuthenticationRepositoryI {
  final Dio client;
  final SharedPreferencesUtil sharedPreferencesUtil;

  AuthenticationRepository(this.client, this.sharedPreferencesUtil);

  Future<Profile> login(String username, String password) async {
    try {
      final response = await client.post('/auth/owner/login',
          data: {"username": username, "password": password});
      print(response?.data['success']);
      if (response?.data != null && response?.data['success'] == true) {
        final prefs = sharedPreferencesUtil.instance;
        final profile = Profile.fromJson(response?.data['profile']);
        await prefs.setString(
            SharedPreferencesUtil.AUTH_TOKEN, response?.data['token']);
        await prefs.setString(
            SharedPreferencesUtil.PROFILE, json.encode(profile.toJson()));
        return profile;
      }
    } catch (e) {}
    return null;
  }
}
