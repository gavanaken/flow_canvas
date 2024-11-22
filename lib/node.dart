import 'package:flutter/material.dart';

class Node extends StatefulWidget {
  final String nodeId;
  final void Function(String, Offset)? onDrag;

  Node({super.key, this.onDrag, required this.nodeId});

  @override
  _NodeState createState() => _NodeState();
}

class _NodeState extends State<Node> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        widget.onDrag!(widget.nodeId, details.delta);
      },
      child: const Card(
        child: SizedBox(height: 100, width: 100),
      ),
    );
  }
}
