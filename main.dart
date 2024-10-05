import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_page.dart';
import 'task_controller.dart';

void main() {
  Get.put(TaskController()); // Inisialisasi TaskController di sini
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'To-Do List Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',  // Company Branding font
      ),
      home: LoginPage(),
    );
  }
}
