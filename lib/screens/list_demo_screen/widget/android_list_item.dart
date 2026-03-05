/*
* Created by ujjawal on 26/02/26.
*/
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_project/models/todo_model.dart';

class AndroidListItem extends StatelessWidget {
  final TodoModel mItem;

  const AndroidListItem({super.key, required this.mItem});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint) {
        return Row(
          children: [
            Hero(
              tag: "todoTaskTag-${mItem.id}",
              child: SizedBox(
                height: constraint.maxWidth / 4,
                width: constraint.maxWidth / 4,
                child: ClipRRect(borderRadius: BorderRadius.circular(100), child: Image.asset("assets/place_holder_image.png")),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("ToDo: ${mItem.todo}"),
                  Text("Status: ${mItem.completed ?? false}"),
                  Text("Time: ${DateFormat("EEEE, dd MMM yyyy, hh:mm:ss").format(mItem.dateTime!)}"),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.black),
          ],
        );
      },
    );
  }
}
