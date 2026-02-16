/*
* Created by ujjawal on 06/02/26.
*/

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:test_project/data/constants.dart';
import 'package:test_project/main.dart';
import 'package:test_project/models/todo_model.dart';
import 'package:test_project/screens/detail_screen/detail_demo_screen.dart';

class ListDemoScreen extends StatefulWidget {
  const ListDemoScreen({super.key});

  @override
  State<ListDemoScreen> createState() => _ListDemoScreenState();
}

class _ListDemoScreenState extends State<ListDemoScreen> {
  // List<Map<String, UserData>> arrayList = [];

  List<TodoModel> todoList = [];
  int total = 0;

  // final StreamController<Object> _selectionController = StreamController<Object>.broadcast();
  //
  // StreamSink<Object> get selectionSink => _selectionController.sink;
  //
  // Stream<Object> get selectionStream => _selectionController.stream;

  final StreamController<String> _streamController = StreamController<String>.broadcast();

  @override
  void initState() {
    super.initState();

    getTodoListData();
  }

  @override
  Widget build(BuildContext context) {
    print("Build method called");
    return Scaffold(
      appBar: AppBar(title: const Text("List Demo Screen")),
      body: StreamBuilder(
        stream: _streamController.stream,
        builder: (context, asyncSnapshot) {
          print("asyncSnapshot = ${asyncSnapshot.data}");
          if (todoList.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return Scrollbar(
            thumbVisibility: true,
            radius: Radius.circular(10),
            thickness: 20,
            trackVisibility: true,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  key: ValueKey(todoList[index]),
                  onTap: () {
                    navigateToAnyScreen(DetailDemoScreen(data: todoList[index]));
                  },
                  leading: ClipRRect(borderRadius: BorderRadius.circular(100), child: Image.asset("assets/place_holder_image.png")),
                  title: Text(todoList[index].todo ?? ''),
                  subtitle: Text("Status: ${todoList[index].completed ?? false}"),
                  trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
                );
              },
              itemCount: todoList.length,
            ),
          );
        },
      ),
    );
  }

  void getTodoListData() async {
    setState(() {});
    await Future.delayed(const Duration(seconds: 2));

    dynamic response = jsonDecode(Constants.todoArray);
    TodoMainModel data = TodoMainModel.fromJson(response);
    todoList = data.todos ?? [];
    total = data.total ?? 0;
    _streamController.add(todoList.hashCode.toString());
  }

  @override
  void dispose() {
    _streamController.close();
    // arrayList.clear();
    super.dispose();
  }
}
