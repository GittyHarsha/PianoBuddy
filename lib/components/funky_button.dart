import 'dart:math' as math; // Use math for clarity
import 'package:flutter/material.dart';
import 'package:piano_buddy/funky.dart';

class FunkyButton extends StatefulWidget {
  final double width;
  final double height;
  final FunkyButtonShape shape;
  final FunkyButtonType type;
  final double outline;
  final double shadowThickness;
  final Color shadowColor;
  final Color backgroundColor;
  final bool rounded;
  final double horizontalShadowOffset;
  final double verticalShadowOffset;
  final double shadowSpreadRadius;
  double rotateAngle;
  final Widget? child;
  final VoidCallback? onPressed;

  FunkyButton({
    Key? key,
    required this.width,
    required this.height,
    this.type = FunkyButtonType.solid,
    this.shape = FunkyButtonShape.pills,
    this.outline = 2.0,
    this.shadowThickness = 0.5,
    this.horizontalShadowOffset = DEFAULT_HORIZONTAL_SHADOW_OFFSET,
    this.verticalShadowOffset = DEFAULT_VERTICAL_SHADOW_OFFSET,
    this.shadowColor = FunkyColors.DARK,
    this.backgroundColor = FunkyColors.WHITE,
    this.rounded = true,
    this.shadowSpreadRadius = DEFAULT_SHADOW_SPREAD_RADIUS,
    this.child,
    this.onPressed,
    this.rotateAngle=0.0,
  }) : super(key: key);

  @override
  State<FunkyButton> createState() => _FunkyButtonState();
}

class _FunkyButtonState extends State<FunkyButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    Color _getBackgroundColor() {
      switch (widget.type) {
        case FunkyButtonType.solid:
          return widget.backgroundColor;
        case FunkyButtonType.outline:
        case FunkyButtonType.outline2x:
        case FunkyButtonType.transparent:
          return Colors.transparent;
      }
    }

    double _getOutlineWidth() {
      switch (widget.type) {
        case FunkyButtonType.solid:
          return 0.0;
        case FunkyButtonType.outline:
          return widget.outline;
        case FunkyButtonType.outline2x:
          return widget.outline * 2.0; // Double the outline for outline2x
        case FunkyButtonType.transparent:
          return 0.0;
      }
    }

    BorderRadius _getBorderRadius() {
      switch (widget.shape) {
        case FunkyButtonShape.square:
          return BorderRadius.zero;
        case FunkyButtonShape.standard: // Assuming standard is rounded corners
          return BorderRadius.circular(widget.rounded ? 6.0 : 0.0);
        case FunkyButtonShape.pills: // Assuming pill is a rounded rectangle
          return BorderRadius.all(Radius.circular(widget.height / 2));
        default:
          throw Exception('Invalid FunkyButtonShape: ${widget.shape}');
      }
    }

    return GestureDetector(
      onTapDown: (_) => setState(() => _isPressed = true),
      onTapUp: (_) => setState(() => _isPressed = false),
      child: Transform.rotate(
        angle: widget.rotateAngle * (math.pi / 180.0),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 150),
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            color: _getBackgroundColor(),
            border: Border.all(
              color: Colors.black,
              width: _getOutlineWidth(),
            ),
            borderRadius: _getBorderRadius(),
            boxShadow: [
              BoxShadow(
                color: widget.shadowColor,
                blurRadius: widget.shadowThickness,
                spreadRadius: widget.shadowSpreadRadius,
                offset: Offset(
                  _isPressed ? 0.0 : widget.horizontalShadowOffset,
                  _isPressed ? 0.0 : widget.verticalShadowOffset,
                ),
              ),
            ],
          ),
          child: Transform.rotate(
            angle: -widget.rotateAngle * (math.pi / 180),
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
