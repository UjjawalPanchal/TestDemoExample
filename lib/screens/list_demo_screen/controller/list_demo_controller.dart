/*
* Created by ujjawal on 25/02/26.
*/
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test_project/models/todo_model.dart';

class ListDemoController extends GetxController {
  List<TodoModel> todoList = [];
  List<TodoModel> dummyTodo = [];
  int total = 0;
  TodoModel? selectedItem;

  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getTodoListData();

    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent) {
        if (isLoading.value) return;
        getTodoListData(skip: todoList.length * 30);
      }
    });
  }

  Future<void> getTodoListData({int skip = 0}) async {
    isLoading.value = true;
    http.get(Uri.parse("https://dummyjson.com/todos?limit=30&skip=$skip")).then((http.Response response) {
      TodoMainModel data = TodoMainModel.fromJson(jsonDecode(response.body));
      todoList.addAll(data.todos ?? []);
      dummyTodo = todoList;
      if (todoList.isNotEmpty) {
        selectedItem = todoList.first;
      }
      total = data.total ?? 0;
      isLoading.value = false;
      update();
    });
  }

  void onSearchFilter(String searchValue) {
    dummyTodo = [];
    if (searchValue.isEmpty) {
      dummyTodo = todoList;
      return;
    }
    for (var element in todoList) {
      if (element.todo!.toLowerCase().contains(searchValue.toLowerCase())) {
        dummyTodo.add(element);
      }
    }
  }

  void setSelectedItem(int index) {
    selectedItem = dummyTodo[index];
    update();
  }
}
