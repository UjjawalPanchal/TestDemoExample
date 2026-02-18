/*
* Created by ujjawal on 06/02/26.
*/
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as ujjawal;
import 'package:test_project/custom_widgets/container_button.dart';
import 'package:test_project/custom_widgets/text_widget.dart';
import 'package:test_project/models/todo_model.dart';
import 'package:test_project/screens/detail_screen/profile_details.dart';
import 'package:test_project/screens/detail_screen/profile_header.dart';

class DetailDemoScreen extends StatefulWidget {
  final int todoId;

  const DetailDemoScreen({super.key, required this.todoId});

  @override
  State<DetailDemoScreen> createState() => _DetailDemoScreenState();
}

class _DetailDemoScreenState extends State<DetailDemoScreen> {
  TodoModel? todoModel;

  @override
  void initState() {
    super.initState();
    getTodoDetailById();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Screen"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 10,
          children: [
            ProfileHeader(assetId: "assets/place_holder_image.png"),
            SizedBox(height: 10),
            if (todoModel != null) ProfileDetails(todoItem: todoModel!),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: ContainerButton(
          height: 56,
          width: 100,
          color: Colors.orange,
          child: TextWidget("GoBack"),
          onCallback: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }

  void getTodoDetailById() async {
    final ujjawal.Response response = await ujjawal.get(Uri.parse("https://dummyjson.com/todos/${widget.todoId}"));
    todoModel = TodoModel.fromJson(jsonDecode(response.body));
    setState(() {});
  }
}
