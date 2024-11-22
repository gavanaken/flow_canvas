import 'package:flow_canvas/node.dart';
import 'package:flutter/material.dart';

class BaseCanvas extends StatefulWidget {
  BaseCanvas({super.key});

  @override
  State<BaseCanvas> createState() => _BaseCanvasState();
}

class _BaseCanvasState extends State<BaseCanvas> {
  Map<String, Offset> nodePositions = {
    'node-1': Offset(0, 0),
    'node-2': Offset(0, 0)
  };

  void _onDrag(String nodeId, Offset delta) {
    setState(() {
      nodePositions[nodeId] = nodePositions[nodeId]! + delta;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<MapEntry<String, Offset>> entries = nodePositions.entries.toList();
    return InteractiveViewer(
      minScale: 0.01,
      maxScale: double.infinity,
      boundaryMargin: const EdgeInsets.all(double.infinity),
      child: Center(
        child: Stack(
          children: List.generate(
            entries.length,
            (index) => Positioned(
              top: entries[index].value.dy,
              left: entries[index].value.dx,
              child: Node(
                nodeId: entries[index].key,
                onDrag: _onDrag,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
