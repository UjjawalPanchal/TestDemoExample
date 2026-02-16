/*
* Created by ujjawal on 06/02/26.
*/
import 'package:flutter/material.dart';
import 'package:test_project/custom_widgets/container_button.dart';
import 'package:test_project/custom_widgets/text_widget.dart';
import 'package:test_project/models/todo_model.dart';
import 'package:test_project/screens/detail_screen/profile_details.dart';
import 'package:test_project/screens/detail_screen/profile_header.dart';

class DetailDemoScreen extends StatelessWidget {
  final TodoModel data;

  const DetailDemoScreen({super.key, required this.data});

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
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 10,
          children: [
            ProfileHeader(assetId: "assets/place_holder_image.png"),
            ProfileDetails(todoItem: data),
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
}
