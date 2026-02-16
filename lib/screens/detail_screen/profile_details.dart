/*
* Created by ujjawal on 11/02/26.
*/
import 'package:flutter/material.dart';
import 'package:test_project/custom_widgets/text_widget.dart';
import 'package:test_project/models/todo_model.dart';

class ProfileDetails extends StatelessWidget {
  final TodoModel todoItem;

  const ProfileDetails({super.key, required this.todoItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: TextWidget("Todo Data", textSize: 20, fontWeight: FontWeight.w600)),
        Center(child: TextWidget("Task: ${todoItem.todo ?? "Loading"}", textSize: 18, fontWeight: FontWeight.w600)),
        Center(child: TextWidget("Completed: ${todoItem.completed ?? "-"}", textSize: 16)),
        Center(child: TextWidget("CreatedBy: ${todoItem.userId ?? '-'}", textSize: 16)),
      ],
    );
  }
}
