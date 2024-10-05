import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'task_controller.dart';
import 'task_form.dart';

class TaskListPage extends StatelessWidget {
  final TaskController taskController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do List'),
        backgroundColor: Color(0xFF7E64FF),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2A2A2E), Color(0xFF2B125A), Color(0xFF000000)],
          ),
        ),
        child: Obx(() {
          return ListView.builder(
            itemCount: taskController.tasks.length,
            itemBuilder: (context, index) {
              final task = taskController.tasks[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFF7E64FF),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              task.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Divider(color: Colors.white),
                            Text(
                              'Time: ${task.time}',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Place: ${task.place}',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(height: 5),
                            Text(
                              'Notes: ${task.notes}',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit, color: Colors.white),
                            onPressed: () {
                              _showUpdateTaskDialog(context, task, index);
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: Colors.white),
                            onPressed: () {
                              taskController.removeTask(index);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(TaskForm());
        },
        backgroundColor: Color(0xFF7E64FF),
        child: Icon(Icons.add),
      ),
    );
  }

  // Dialog untuk Update Task
  void _showUpdateTaskDialog(BuildContext context, Task task, int index) {
    final TextEditingController titleController =
        TextEditingController(text: task.title);
    final TextEditingController timeController =
        TextEditingController(text: task.time);
    final TextEditingController placeController =
        TextEditingController(text: task.place);
    final TextEditingController noteController =
        TextEditingController(text: task.notes);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Update Task'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(labelText: 'Title'),
              ),
              TextField(
                controller: timeController,
                decoration: InputDecoration(labelText: 'Time'),
              ),
              TextField(
                controller: placeController,
                decoration: InputDecoration(labelText: 'Place'),
              ),
              TextField(
                controller: noteController,
                decoration: InputDecoration(labelText: 'Note'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Get.back(),
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (titleController.text.isNotEmpty) {
                  taskController.tasks[index] = Task(
                    title: titleController.text.trim(),
                    time: timeController.text.trim(),
                    place: placeController.text.trim(),
                    notes: noteController.text.trim(),
                  );
                  Get.back();
                } else {
                  Get.snackbar(
                    'Error',
                    'Title cannot be empty',
                    snackPosition: SnackPosition.BOTTOM,
                  );
                }
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
