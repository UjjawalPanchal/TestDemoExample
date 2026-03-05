/*
* Created by ujjawal on 23/02/26.
*/
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_project/custom_widgets/text_widget.dart';
import 'package:test_project/screens/login_screen/login_form.dart';

class FormUi extends StatefulWidget {
  final EdgeInsetsGeometry padding;
  final bool isScrollable;

  const FormUi({super.key, this.padding = EdgeInsets.zero, this.isScrollable = false});

  @override
  State<FormUi> createState() => _FormUiState();
}

class _FormUiState extends State<FormUi> {
  late SharedPreferences _preferences;
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  bool show = false;

  @override
  void initState() {
    super.initState();
    initSharedPreference();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: keyForm,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        margin: widget.padding,
        child: ListView(
          shrinkWrap: true,
          physics: widget.isScrollable ? AlwaysScrollableScrollPhysics() : NeverScrollableScrollPhysics(),
          children: [
            TextFormField(
              textInputAction: TextInputAction.next,
              controller: username,
              enableInteractiveSelection: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "The form field is required";
                }
                return null;
              },
              contextMenuBuilder: null,
              onChanged: (value) {
                print(value);
              },
              decoration: InputDecoration(prefixIcon: Icon(Icons.person), border: OutlineInputBorder(), labelText: 'Username'),
            ),
            SizedBox(height: 20),
            TextFormField(
              obscureText: show,
              controller: password,
              obscuringCharacter: '*',
              textInputAction: TextInputAction.go,
              maxLength: 6,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password is required";
                }
                if (value.length < 6) {
                  return "Password must be 6 digits";
                }
                return null;
              },
              onChanged: (value) {
                keyForm.currentState!.validate();
              },
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      show = !show;
                    });
                  },
                  icon: Icon(Icons.remove_red_eye),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              obscureText: show,
              controller: password,
              obscuringCharacter: '*',
              textInputAction: TextInputAction.go,
              maxLength: 6,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password is required";
                }
                if (value.length < 6) {
                  return "Password must be 6 digits";
                }
                return null;
              },
              onChanged: (value) {
                keyForm.currentState!.validate();
              },
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      show = !show;
                    });
                  },
                  icon: Icon(Icons.remove_red_eye),
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              obscureText: show,
              controller: password,
              obscuringCharacter: '*',
              textInputAction: TextInputAction.go,
              maxLength: 6,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Password is required";
                }
                if (value.length < 6) {
                  return "Password must be 6 digits";
                }
                return null;
              },
              onChanged: (value) {
                keyForm.currentState!.validate();
              },
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    setState(() {
                      show = !show;
                    });
                  },
                  icon: Icon(Icons.remove_red_eye),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: SizedBox(
                width: 200,
                height: 40,
                child: TextButton(
                  onPressed: () {
                    if (keyForm.currentState!.validate()) {
                      addDataToPreference();
                      // buttonClick(() {
                      //   ScaffoldMessenger.of(context).showSnackBar(
                      //     SnackBar(content: Text("Login Successful \nUserName: ${username.text}\nPassword: ${password.text}")),
                      //   );
                      // });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: TextWidget("Form is Not validate")));
                    }

                    // buttonClick(() {
                    //   ScaffoldMessenger.of(context).showSnackBar(
                    //     SnackBar(content: Text("Login Successful \nUserName: ${username.text}\nPassword: ${password.text}")),
                    //   );
                    // });

                    // initScanning();
                  },
                  style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.green)),
                  child: TextWidget("Submit", textSize: 16, tColor: Colors.white),
                  // Text(
                  //   "Submit",
                  //   style: TextStyle(fontSize: 14, color: Colors.white),
                  // ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addDataToPreference() {
    if (username.text.isEmpty || password.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: TextWidget("Username and Password is required")));
      return;
    }

    UserData userData = UserData(username.text, int.parse(password.text));
    _preferences.setString("userInfo", jsonEncode(userData.toJson()));
    // _preferences.remove("userInfo");

    _preferences.setString("username", username.text.trim());
    _preferences.setString("password", password.text.trim());
  }

  void initSharedPreference() async {
    _preferences = await SharedPreferences.getInstance();
    String? userInfo = _preferences.getString("userInfo");

    if (userInfo != null) {
      UserData userData = UserData.fromJson(jsonDecode(userInfo));
      username.text = userData.name ?? '';
      password.text = userData.age.toString();
    }
    // username.text = _preferences.getString("username") ?? '';
    // password.text = _preferences.getString("password") ?? '';
  }

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }
}
