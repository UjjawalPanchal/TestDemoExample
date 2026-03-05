/*
* Created by ujjawal on 29/01/26.
*/
import 'package:flutter/material.dart'; // import 'package:flutter_thermal_printer/flutter_thermal_printer.dart';
import 'package:get/get.dart';
import 'package:test_project/screens/login_screen/controller/login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Text("Login Form", style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.green,
            iconTheme: IconThemeData(color: Colors.white),
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
          ),
          body: Form(
            key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.emailController,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Username is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(prefixIcon: Icon(Icons.person), border: OutlineInputBorder(), hint: Text('Username')),
                ),
                TextFormField(
                  controller: controller.passwordController,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Password is required";
                    }
                    return null;
                  },
                  decoration: InputDecoration(prefixIcon: Icon(Icons.password), border: OutlineInputBorder(), hint: Text('Password')),
                ),
                Obx(() {
                  return TextButton(
                    onPressed: () {
                      if (controller.isLoading.value) {
                        return;
                      }
                      if (controller.formKey.currentState!.validate()) {
                        controller.callLoginAPI();
                      }
                    },
                    child: controller.isLoading.value ? CircularProgressIndicator() : Text("Submit"),
                  );
                }),
              ],
            ),
          ),
        );
      },
    );
  }
}

class UserData {
  String? name;
  int? age;

  UserData(this.name, this.age);

  UserData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    age = json['age'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['age'] = age;
    return data;
  }

  UserData.copyWith(String this.name, int this.age);
}
