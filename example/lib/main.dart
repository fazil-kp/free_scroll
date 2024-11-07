import 'package:flutter/material.dart';
import 'package:free_scroll/free_scroll.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Freeform Scroll and Zoom Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Freeform Scroll and Zoom Example")),
      body: FreeScroll(
        itemCount: 100,
        itemBuilder: (context, index) {
          return Container(
            width: 150,
            height: 150,
            color: Colors.blue[100 * ((index % 9) + 1)],
            alignment: Alignment.center,
            child: Text('Item $index', style: const TextStyle(fontSize: 16)),
          );
        },
      ),
    );
  }
}


