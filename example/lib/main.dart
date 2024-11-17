import 'package:flutter/material.dart';
import 'package:free_scroll/free_scroll.dart';

class FreeScrollScreen extends StatelessWidget {
  FreeScrollScreen({super.key});

  // Instantiate the FreeScrollManager
  final FreeScrollManager freeScrollManager = FreeScrollManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Free Scroll")),
      body: Stack(
        children: [
          FreeScroll(
            key: freeScrollManager.key,
            children: [
              for (int i = 0; i <= 100; i++)
                Container(
                  width: 150,
                  height: 150,
                  color: Colors.blue[100 * ((i % 9) + 1)],
                  alignment: Alignment.center,
                  child: Text('Item $i', style: const TextStyle(fontSize: 16)),
                )
            ],
          ),
          Positioned(
            bottom: 16,
            right: 16,
            child: FloatingActionButton(
              onPressed: () {
                // If you want to reset the view when clicking the button, use this method
                freeScrollManager.resetView();
              },
              child: const Icon(Icons.refresh),
            ),
          ),
        ],
      ),
    );
  }
}

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
      home: FreeScrollScreen(),
    );
  }
}
