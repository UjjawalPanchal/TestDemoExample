/*
* Created by ujjawal on 11/03/26.
*/
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:test_project/models/todo_model.dart';
import 'package:test_project/repositories/todo_repo/todo_repo.dart';

class TodoRepoImpl extends TodoRepo {
  @override
  Future<TodoMainModel> getTodoData({int limit = 30, int skip = 30}) async {
    http.Response response = await http.get(Uri.parse("https://dummyjson.com/todos?limit=$limit&skip=$skip"));
    try {
      return TodoMainModel.fromJson(jsonDecode(response.body));
    } catch (e) {
      throw Exception(e);
    }
  }
}
