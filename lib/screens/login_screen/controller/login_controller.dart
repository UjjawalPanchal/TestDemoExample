/*
* Created by ujjawal on 02/03/26.
*/

import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/api_data/api_end_points.dart';
import 'package:test_project/main.dart';
import 'package:test_project/model_class/login_pojo.dart';
import 'package:test_project/screens/list_demo_screen/list_demo_screen.dart';

class LoginController extends GetxController {
  LoginController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late SharedPreferences prefs;

  @override
  void onInit() {
    super.onInit();
    initSharedPreference();
  }

  void initSharedPreference() async {
    prefs = await SharedPreferences.getInstance();
  }

  var isLoading = false.obs;

  void callLoginAPI() async {
    isLoading.value = true;
    http.Response response = await http.post(
      Uri.parse(ApiEndPoints.login),
      body: {"email": emailController.text.trim(), "password": passwordController.text.trim()},
    );
    isLoading.value = false;
    if (response.statusCode == 200) {
      LoginMainResponse login = LoginMainResponse.fromJson(jsonDecode(response.body));
      if ((login.success ?? false) && login.data != null && login.data!.user != null) {
        prefs.setString("token", login.data!.token!);
        prefs.setString("user_id", login.data!.user!.id.toString());
        prefs.setString("user_name", login.data!.user!.name.toString());
        prefs.setString("user_email", login.data!.user!.email.toString());
        prefs.setString("user_mobile", login.data!.user!.mobile.toString());

        navigateToAnyScreen(ListDemoScreen());
      } else {
        Get.snackbar("Error", login.message ?? "");
      }
    } else {
      Get.snackbar("Error", jsonDecode(response.body)["message"]);
    }
  }
}
