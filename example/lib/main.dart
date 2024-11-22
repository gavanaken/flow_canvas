import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flow_canvas/flow_canvas.dart';
import 'package:uuid/uuid.dart';

void main() {
  runApp(const CanvasExampleApp());
}

class CanvasExampleApp extends StatefulWidget {
  const CanvasExampleApp({super.key});

  @override
  State<CanvasExampleApp> createState() => _CanvasExampleAppState();
}

class _CanvasExampleAppState extends State<CanvasExampleApp> {
  final List<Widget> childNodes = [];

  Color generateRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255, // Full opacity
      random.nextInt(256), // Red (0-255)
      random.nextInt(256), // Green (0-255)
      random.nextInt(256), // Blue (0-255)
    );
  }

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
            child: Column(children: [
              Expanded(child: BasicFlowCanvas(children: childNodes)),
              Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: FloatingActionButton(
                      child: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          childNodes.add(Card(
                            key: Key(const Uuid().v4().toString()),
                            child: Container(
                              decoration:
                                  BoxDecoration(color: generateRandomColor()),
                              width: 100,
                              height: 100,
                            ),
                          ));
                        });
                      },
                    ),
                  ))
            ]),
          ),
        ),
      ),
    );
  }
}
