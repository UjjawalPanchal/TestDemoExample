/*
* Created by ujjawal on 27/02/26.
*/
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test_project/models/todo_model.dart';

class DetailScreenController extends GetxController {
  final int todoId;

  DetailScreenController({required this.todoId});

  @override
  void onInit() {
    super.onInit();
    getTodoDetailById();
  }

  TodoModel? todoModel;
  var isLoading = false.obs;

  void getTodoDetailById() async {
    isLoading.value = true;
    final http.Response response = await http.get(Uri.parse("https://dummyjson.com/todos/$todoId"));
    todoModel = TodoModel.fromJson(jsonDecode(response.body));
    isLoading.value = false;
  }
}
