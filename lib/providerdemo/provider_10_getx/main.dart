import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:statemanagement/providerdemo/provider_10_getx/screens/homeScreen10.dart';

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
      home: HomeScreen10(),
    );
  }
}
