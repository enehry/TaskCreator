import 'package:flutter/material.dart';
import 'package:task_creator/helper/local_storage.dart';
import 'package:task_creator/models/task.dart';

class Home extends StatefulWidget {
  final Function changeTheme;
  const Home(this.changeTheme, {Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _formKey = GlobalKey<FormState>();
  final _taskController = TextEditingController();

  List<Task> tasks = [];

  int taskDone() => tasks.where((e) => e.isDone).length;

  bool isDark = false;

  late LocalStorage storage;

  @override
  void initState() {
    super.initState();
    storage = LocalStorage();
    getTask();
  }

  void getTask() async {
    await storage.init();
    if (storage.getString('tasks') != null) {
      setState(() {
        tasks = Task.decode(storage.getString('tasks'));
      });
    }
  }

  void setTask() {
    storage.setString('tasks', Task.encode(tasks));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Task\nCreator',
                      style: Theme.of(context).textTheme.headline1),
                  TextButton(
                    onPressed: () {
                      isDark = !isDark;
                      widget.changeTheme(isDark);
                    },
                    child: isDark
                        ? const Icon(
                            Icons.dark_mode,
                            color: Colors.white,
                          )
                        : const Icon(
                            Icons.light_mode,
                            color: Colors.black,
                          ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Flexible(
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      style: Theme.of(context).textTheme.headline2,
                      controller: _taskController,
                      validator: (String? value) =>
                          (value != null && value.isNotEmpty)
                              ? null
                              : 'The task cannot be empty',
                    ),
                  ),
                ),
                IconButton(
                    onPressed: saveTask,
                    icon: const Icon(
                      Icons.arrow_forward_sharp,
                      size: 30.0,
                    ))
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              'Tasks ${taskDone()}/${tasks.length}',
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          tasks[index].toggleDone();
                        });
                        setTask();
                      },
                      onLongPress: () {
                        setState(() {
                          deleteTask(tasks[index]);
                        });
                      },
                      child: ListTile(
                        leading: tasks[index].isDone
                            ? const Icon(
                                Icons.check_circle,
                                color: Colors.green,
                              )
                            : const Icon(Icons.circle),
                        title: Text(
                          tasks[index].title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.copyWith(
                                  decoration: tasks[index].isDone
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      )),
    );
  }

  void saveTask() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        tasks.insert(0, Task(title: _taskController.text));
        _taskController.clear();
      });
      setTask();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Task Save')),
      );
    }
  }

  void deleteTask(Task task) {
    setState(() {
      tasks.remove(task);
    });
    setTask();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Task Deleted Successfully')),
    );
  }
}
