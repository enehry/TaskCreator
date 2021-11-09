import 'package:flutter/material.dart';
import 'package:task_creator/app_theme.dart';
import 'package:task_creator/views/home.dart';

void main() {
  runApp(const TaskCreator());
}

class TaskCreator extends StatefulWidget {
  const TaskCreator({Key? key}) : super(key: key);

  @override
  _TaskCreatorState createState() => _TaskCreatorState();
}

class _TaskCreatorState extends State<TaskCreator> {
  bool isDark = false;

  void changeTheme(bool isDark) {
    setState(() {
      this.isDark = isDark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: isDark ? AppTheme().dark() : AppTheme().light(),
      home: Home(changeTheme),
    );
  }
}
