/*
* Created by ujjawal on 26/02/26.
*/
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_project/models/todo_model.dart';

class IosListItem extends StatelessWidget {
  final TodoModel mItem;

  const IosListItem({super.key, required this.mItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          CupertinoSwitch(value: mItem.completed ?? false, onChanged: (value) {}),
          Expanded(child: Text(mItem.todo ?? '')),
          Icon(Icons.arrow_forward_ios, color: Colors.black),
          CupertinoButton(onPressed: () {}, color: Colors.orange, child: Text("Submit")),
        ],
      ),
    );
  }
}
