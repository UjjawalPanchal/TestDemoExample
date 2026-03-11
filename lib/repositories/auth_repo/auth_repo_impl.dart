/*
* Created by ujjawal on 11/03/26.
*/

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_project/api_data/api_end_points.dart';
import 'package:test_project/model_class/login_pojo.dart';
import 'package:test_project/repositories/auth_repo/auth_repository.dart';

class AuthRepoImpl extends AuthRepository {
  @override
  Future<LoginMainResponse> login(String email, String password) async {
    try {
      http.Response response = await http.post(Uri.parse(ApiEndPoints.login), body: {"email": email, "password": password});
      return LoginMainResponse.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw Exception("Something went wrong");
    }
  }
}
