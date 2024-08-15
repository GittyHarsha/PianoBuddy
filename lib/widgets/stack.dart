import 'package:flutter/material.dart';
import '../colors/funky_colors.dart';

class StackedElements extends StatelessWidget {
  final List<Widget> children;
  double elementHeight;
  double elementWidth;
  double horizontalElementSpacing;
  double verticalElementSpacing;

  late final double width;
  late final double height;

  StackedElements({
    required this.children,
    required this.horizontalElementSpacing,
    required this.verticalElementSpacing,
    this.elementHeight = 120,
    this.elementWidth = 250,
  }) {
    width = elementWidth + (children.length-1) * horizontalElementSpacing;
    height = elementHeight + (children.length-1) * verticalElementSpacing;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: width,
          height: height,
          color: Colors.transparent,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: List.generate(
              children.length,
              (index) => Positioned(
                bottom: verticalElementSpacing * index,
                right: horizontalElementSpacing * index,
                child: SizedBox(
                  width: elementWidth,
                  height: elementHeight,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: index < funkyColors.length
                          ? funkyColors[index]
                          : funkyColors[index % funkyColors.length],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: children[index],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Color> funkyColors = [
    FunkyColors.DANGER,
    FunkyColors.PRIMARY,
    FunkyColors.SECONDARY,
  ];
}
