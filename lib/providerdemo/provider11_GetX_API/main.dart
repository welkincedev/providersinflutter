import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement/providerdemo/provider11_GetX_API/screens/homescreen11.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Session 10 - GetX MVC',
      debugShowCheckedModeBanner: false,
      home: HomeScreen11(),
    );
  }
}
