import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:statemanagement/providerdemo/provider_GetX_MVVM_UserAPI/view/user_list_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Example - Riverpod UI FakeStore API',
      debugShowCheckedModeBanner: false,
      home: UserListScreen(),
    );
  }
}
