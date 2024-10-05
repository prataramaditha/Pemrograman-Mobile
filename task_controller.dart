import 'package:get/get.dart';

class Task {
  String title;
  String time;
  String place;
  String notes;

  Task({required this.title, required this.time, required this.place, required this.notes});
}

class TaskController extends GetxController {
  var tasks = <Task>[].obs;

  void addTask(String title, String time, String place, String notes) {
    tasks.add(Task(title: title, time: time, place: place, notes: notes));
  }

  void removeTask(int index) {
    tasks.removeAt(index);
  }
}
