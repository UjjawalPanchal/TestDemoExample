/*
* Created by ujjawal on 06/02/26.
*/

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:test_project/main.dart';
import 'package:test_project/models/todo_model.dart';
import 'package:test_project/screens/detail_screen/detail_demo_screen.dart';

class ListDemoScreen extends StatefulWidget {
  const ListDemoScreen({super.key});

  @override
  State<ListDemoScreen> createState() => _ListDemoScreenState();
}

class _ListDemoScreenState extends State<ListDemoScreen> {
  List<TodoModel> todoList = [];
  List<TodoModel> dummyTodo = [];
  int total = 0;

  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  final StreamController<String> _streamController = StreamController<String>.broadcast();

  @override
  void initState() {
    super.initState();

    getTodoListData();

    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent) {
        getTodoListData(skip: todoList.length * 30);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("Build method called");
    return Scaffold(
      appBar: AppBar(title: const Text("List Demo Screen")),
      body: Column(
        children: [
          TextFormField(
            textInputAction: TextInputAction.next,
            controller: searchController,
            onChanged: (value) {
              onSearchFilter(value);
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hint: Text('Search'),
              isDense: true,
              suffix: IconButton(
                onPressed: () {
                  searchController.clear();
                  onSearchFilter("");
                },
                icon: Icon(Icons.close),
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: _streamController.stream,
              builder: (context, asyncSnapshot) {
                print("asyncSnapshot = ${asyncSnapshot.data}");
                if (todoList.isEmpty) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  controller: scrollController,
                  itemBuilder: (context, index) {
                    return ListTile(
                      key: ValueKey(dummyTodo[index]),
                      onTap: () {
                        navigateToAnyScreen(DetailDemoScreen(todoId: dummyTodo[index].id ?? 0));
                      },
                      leading: ClipRRect(borderRadius: BorderRadius.circular(100), child: Image.asset("assets/place_holder_image.png")),
                      title: Text(dummyTodo[index].todo ?? ''),
                      subtitle: Column(
                        children: [
                          Text("Status: ${dummyTodo[index].completed ?? false}"),
                          Text("Time: ${DateFormat("EEEE, dd MMM yyyy, hh:mm:ss").format(dummyTodo[index].dateTime!)}"),
                        ],
                      ),
                      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
                    );
                  },
                  itemCount: dummyTodo.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void getTodoListData({int skip = 0}) async {
    _streamController.add(todoList.hashCode.toString());
    http.get(Uri.parse("https://dummyjson.com/todos?limit=30&skip=$skip")).then((http.Response response) {
      TodoMainModel data = TodoMainModel.fromJson(jsonDecode(response.body));
      todoList = data.todos ?? [];
      dummyTodo = data.todos ?? [];
      total = data.total ?? 0;
      _streamController.add(todoList.hashCode.toString());
    });
  }

  void onSearchFilter(String searchValue) {
    dummyTodo = [];
    if (searchValue.isEmpty) {
      dummyTodo = todoList;
      _streamController.add(dummyTodo.hashCode.toString());
      return;
    }
    for (var element in todoList) {
      if (element.todo!.toLowerCase().contains(searchValue.toLowerCase())) {
        dummyTodo.add(element);
      }
    }
    _streamController.add(dummyTodo.hashCode.toString());
  }

  @override
  void dispose() {
    _streamController.close();
    // arrayList.clear();
    super.dispose();
  }
}
