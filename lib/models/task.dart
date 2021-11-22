import 'dart:convert';

class Task {
  final String title;
  bool isDone;

  Task({required this.title, this.isDone = false});

  void toggleDone() => isDone = !isDone;

  static Map<String, dynamic> toMap(Task task) =>
      {'title': task.title, 'isDone': task.isDone};

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      title: json['title'],
      isDone: json['isDone'],
    );
  }

  static String encode(List<Task> tasks) =>
      json.encode(tasks.map((task) => Task.toMap(task)).toList());

  static List<Task> decode(String? tasks) =>
      (json.decode(tasks!) as List<dynamic>)
          .map<Task>((task) => Task.fromJson(task))
          .toList();
}
