import 'package:flow_canvas/flow_node.dart';
import 'package:flutter/material.dart';

class BasicFlowCanvas extends StatefulWidget {
  const BasicFlowCanvas({super.key, required this.children});
  final List<Widget> children;

  @override
  State<BasicFlowCanvas> createState() => _BasicFlowCanvasState();
}

class _BasicFlowCanvasState extends State<BasicFlowCanvas> {
  List<FlowNode> nodes = [];
  List<Key> tracked = [];

  final ValueNotifier<int> rebuildNotifier = ValueNotifier<int>(0);

  void triggerRebuild() {
    rebuildNotifier.value++;
  }

  @override
  Widget build(BuildContext context) {
    for (Widget child in widget.children) {
      if (!tracked.contains(child.key)) {
        tracked.add(child.key!);
        nodes.add(FlowNode(child: child, onPositionUpdated: triggerRebuild));
      }
    }
    return InteractiveViewer(
      minScale: 0.01,
      maxScale: double.infinity,
      boundaryMargin: const EdgeInsets.all(double.infinity),
      child: ValueListenableBuilder<int>(
        valueListenable: rebuildNotifier,
        builder: (context, value, child) => Center(
          child: Stack(
            children: List.generate(
              nodes.length,
              (index) => Positioned(
                top: nodes[index].position.dy,
                left: nodes[index].position.dx,
                child: nodes[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
