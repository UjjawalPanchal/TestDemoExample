/*
* Created by ujjawal on 12/02/26.
*/

// {
// "id": 6,
// "todo": "Contribute code or a monetary donation to an open-source software project",
// "completed": false,
// "userId": 69
// }

class TodoMainModel {
  int? total;
  List<TodoModel>? todos;

  TodoMainModel({this.total, this.todos});

  TodoMainModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    if (json['todos'] != null) {
      todos = <TodoModel>[];
      for (int i = 0; i < json['todos'].length; i++) {
        todos!.add(TodoModel.fromJson(json['todos'][i]));
      }
    }
  }
}

class TodoModel {
  int? id;
  String? todo;
  bool? completed;
  int? userId;

  TodoModel({this.id, this.todo, this.completed, this.userId});

  TodoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
    completed = json['completed'];
    userId = json['userId'];
  }
}

class Reviews {
  String? reviewerName;
  String? reviewerEmail;

  Reviews({this.reviewerName, this.reviewerEmail});

  Reviews.fromJson(Map<String, dynamic> json) {
    reviewerName = json['reviewerName'];
    reviewerEmail = json['reviewerEmail'];
  }
}
