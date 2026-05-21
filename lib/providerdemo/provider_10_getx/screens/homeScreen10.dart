import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:statemanagement/providerdemo/provider_10_getx/controller/counterController10.dart';

class HomeScreen10 extends StatelessWidget {
  final CounterController10 controller10 = Get.put(CounterController10());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("GetX Modal View Controller Example")),
      body: Center(
        child: Column(
          children: [
            Obx(
              () => Text(
                controller10.count.toString(),
                style: TextStyle(fontSize: 40),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  "Simple Snacbar",
                  "Just for Demo",
                  backgroundColor: Colors.green.shade200,
                );
              },
              child: Text("Show Snackbar"),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: controller10.increment,
            child: Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: controller10.decrement,
            child: Icon(Icons.minimize),
          ),
        ],
      ),
    );
  }
}
