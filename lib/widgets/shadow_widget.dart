import 'package:flutter/material.dart';

class ShadowWidget extends StatelessWidget {
  const ShadowWidget(
      {Key key,
      @required this.child,
      this.elevation = 3,
      this.color = Colors.red})
      : super(key: key);

  final Widget child;
  final double elevation;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: this.child,
      shadowColor: this.color,
      elevation: this.elevation,
    );
  }
}
