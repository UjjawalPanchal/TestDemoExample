/*
* Created by ujjawal on 11/03/26.
*/

import 'package:test_project/models/todo_model.dart';

abstract class TodoRepo {
  Future<TodoMainModel> getTodoData({int limit = 30, int skip = 30});
}
