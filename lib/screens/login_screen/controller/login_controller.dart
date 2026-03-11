/*
* Created by ujjawal on 02/03/26.
*/

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/main.dart';
import 'package:test_project/model_class/login_pojo.dart';
import 'package:test_project/repositories/auth_repo/auth_repository.dart';
import 'package:test_project/screens/list_demo_screen/list_demo_screen.dart';

class LoginController extends GetxController {
  final AuthRepository authRepository;

  LoginController({required this.authRepository});

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

    LoginMainResponse login = await authRepository.login(emailController.text.trim(), passwordController.text.trim());
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
  }
}
