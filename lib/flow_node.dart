import 'package:flutter/material.dart';

class FlowNode extends StatelessWidget {
  final void Function()? onPositionUpdated;
  final Widget child;

  Offset position = Offset(0, 0);

  FlowNode({super.key, this.onPositionUpdated, required this.child});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        position += details.delta;
        onPositionUpdated!();
      },
      child: child,
    );
  }
}
