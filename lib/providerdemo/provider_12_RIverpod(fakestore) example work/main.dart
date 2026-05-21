import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:statemanagement/providerdemo/provider_12_RIverpod(fakestore)%20example%20work/screens/HomeScreen12.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Session 12 - Riverpod UI FakeStore API',
      debugShowCheckedModeBanner: false,
      home: Postscreen12(),
    );
  }
}
