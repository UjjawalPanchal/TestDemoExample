/*
* Created by ujjawal on 26/02/26.
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_project/models/todo_model.dart';

class AndroidListItem extends StatelessWidget {
  final TodoModel mItem;

  const AndroidListItem({super.key, required this.mItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Hero(
          tag: "todoTaskTag-${mItem.id}",
          child: SizedBox.square(
            dimension: 60,
            child: ClipRRect(borderRadius: BorderRadius.circular(100), child: Image.asset("assets/place_holder_image.png")),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("${mItem.todo}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, height: 1.2)),
              Text("Status: ${mItem.completed ?? false}"),
              Text("Time: ${DateFormat("EEEE, dd MMM yyyy, hh:mm:ss").format(mItem.dateTime!)}"),
            ],
          ),
        ),
        Icon(Icons.arrow_forward_ios, color: Colors.black),
      ],
    ).paddingSymmetric(horizontal: 12, vertical: 6);
  }
}
