import 'package:flutter/material.dart';
import 'package:flow_canvas/flow_canvas.dart';

void main() {
  runApp(const CanvasExampleApp());
}

class CanvasExampleApp extends StatelessWidget {
  const CanvasExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Infinite Canvas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Center(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: BaseCanvas(),
          ),
        ),
      ),
    );
  }
}
