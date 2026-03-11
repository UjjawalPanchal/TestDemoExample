/*
* Created by ujjawal on 25/02/26.
*/
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_project/models/todo_model.dart';
import 'package:test_project/repositories/todo_repo/todo_repo.dart';

class ListDemoController extends GetxController {
  final TodoRepo todoRepo;

  ListDemoController({required this.todoRepo});

  List<TodoModel> todoList = [];
  List<TodoModel> dummyTodo = [];
  int total = 0;
  TodoModel? selectedItem;
  GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  final TextEditingController searchController = TextEditingController();
  final ScrollController scrollController = ScrollController();

  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getTodoListData();

    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent) {
        if (isLoading.value || dummyTodo.length == total) return;
        getTodoListData(skip: dummyTodo.length);
      }
    });
  }

  /*
  * this method is used to get todo list data from api
  * @skip
  * */
  Future<void> getTodoListData({int skip = 0}) async {
    isLoading.value = true;
    if (skip == 0) todoList.clear();
    TodoMainModel data = await todoRepo.getTodoData(limit: 30, skip: skip);
    if (skip == 0) todoList.clear();
    todoList.addAll(data.todos ?? []);
    dummyTodo = todoList;
    selectedItem ??= todoList.first;
    total = data.total ?? 0;
    isLoading.value = false;
    update();
  }

  void onSearchFilter(String searchValue) {
    isLoading.value = true;
    dummyTodo = [];
    if (searchValue.isEmpty) {
      dummyTodo = todoList;
      isLoading.value = false;
      update();
      return;
    }

    for (var element in todoList) {
      if (element.todo!.toLowerCase().contains(searchValue.toLowerCase())) {
        dummyTodo.add(element);
      }
    }
    update();
    isLoading.value = false;
  }

  void setSelectedItem(int index) {
    selectedItem = dummyTodo[index];
    update();
  }
}
