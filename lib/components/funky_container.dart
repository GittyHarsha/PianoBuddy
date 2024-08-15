import 'dart:ffi';
import 'dart:math';
import 'package:piano_buddy/funky.dart';
import 'package:flutter/material.dart';

class FunkyContainer extends StatelessWidget {
  final double width;
  final double height;
  final double outline;
  final double shadowThickness;
  final Color shadowColor;
  final Color backgroundColor;
  final bool rounded;
  final Widget? child;
  final double horizontalShadowOffset;
  final double verticalShadowOffset;
  final double shadowSpreadRadius;
  double rotateAngle = 0;
  FunkyContainer({
    Key? key,
    required this.width,
    required this.height,
    this.outline = 2.0,
    this.shadowThickness = 1,
    this.horizontalShadowOffset = 0.0,
    this.verticalShadowOffset = 0.0,
    this.shadowColor = FunkyColors.DARK,
    this.backgroundColor = FunkyColors.WHITE,
    this.rounded = false,
    this.shadowSpreadRadius = 4.0,
    this.child, required rotateAngle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotateAngle,
      child: Container(
        width: width,
        height: height,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border.all(
            color: Colors.black,
            width: outline,
          ),
          borderRadius: BorderRadius.circular(rounded ? 12.0 : 0.0),
          boxShadow: [
            BoxShadow(
              color: shadowColor,
              blurRadius: shadowThickness,
              spreadRadius: shadowSpreadRadius,
              offset: Offset(horizontalShadowOffset, verticalShadowOffset),
            ),
          ],
        ),
        child: Transform.rotate(
          angle: -rotateAngle,
          child: child,
        ),
      ),
    );
  }
}
