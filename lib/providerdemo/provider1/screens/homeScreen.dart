import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/counterprovider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Subscribes to CounterProvider
    final counter = Provider.of<CounterProvider>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Counter'),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Counter Value'),
            SizedBox(height: 8),
            Text("${counter.count}", style: TextStyle(fontSize: 72)),
            SizedBox(height: 8),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    Provider.of<CounterProvider>(
                      context,
                      listen: false,
                    ).decrement();
                  },
                  label: Text("Decrement"),
                  icon: Icon(Icons.remove),
                ),
                SizedBox(width: 12),
                OutlinedButton(
                  onPressed: () => Provider.of<CounterProvider>(
                    context,
                    listen: false,
                  ).reset(),
                  child: Text("Reset"),
                ),
                SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: () {
                    Provider.of<CounterProvider>(
                      context,
                      listen: false,
                    ).increment();
                  },
                  label: Text("Increment"),
                  icon: Icon(Icons.add),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
