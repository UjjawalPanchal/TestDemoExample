/*
* Created by ujjawal on 06/02/26.
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/custom_widgets/container_button.dart';
import 'package:test_project/custom_widgets/text_widget.dart';
import 'package:test_project/screens/detail_screen/controller/detail_screen_controller.dart';
import 'package:test_project/screens/detail_screen/profile_details.dart';
import 'package:test_project/screens/detail_screen/profile_header.dart';

class DetailDemoScreen extends StatelessWidget {
  final String todoId;

  const DetailDemoScreen({super.key, required this.todoId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Detail Screen"), leading: BackButton()),
      body: GetBuilder<DetailScreenController>(
        init: DetailScreenController(todoId: todoId),
        id: 'detail_screen_controller',
        builder: (controller) {
          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Obx(() {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 10,
                children: [
                  Hero(
                    tag: 'todoTaskTag-$todoId',
                    child: ProfileHeader(assetId: "assets/place_holder_image.png"),
                  ),
                  SizedBox(height: 10),
                  controller.isLoading.value ? Center(child: CircularProgressIndicator()) : ProfileDetails(todoItem: controller.todoModel!),
                ],
              );
            }),
          );
        },
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
