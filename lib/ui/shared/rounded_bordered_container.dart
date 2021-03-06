import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    required Key key,
    required this.child,
    required this.height,
    required this.width,
    this.color = Colors.white,
    this.padding = const EdgeInsets.all(16.0),
    required this.margin,
    required this.borderRadius,
    required this.alignment,
    required this.elevation,
  }) : super(key: key);
  final Widget child;
  final double width;
  final double height;
  final Color color;
  final EdgeInsets padding;
  final EdgeInsets margin;
  final BorderRadius borderRadius;
  final AlignmentGeometry alignment;
  final double elevation;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: margin ?? const EdgeInsets.all(0),
      color: color,
      elevation: elevation ?? 0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius ?? BorderRadius.circular(20.0),
      ),
      child: Container(
        alignment: alignment,
        height: height,
        width: width,
        padding: padding,
        child: child,
      ),
    );
  }
}