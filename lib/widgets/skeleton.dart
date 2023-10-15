import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class Skeleton extends StatelessWidget {
  const Skeleton(
      {super.key,
      this.height,
      this.width,
      this.padding,
      this.borderRadius,
      this.child});

  final Widget? child;
  final double? height, width;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.secondary.withOpacity(0.1),
      highlightColor: Theme.of(context).colorScheme.secondary.withOpacity(0.15),
      child: Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: borderRadius ?? BorderRadius.circular(4),
        ),
        child: child,
      ),
    );
  }
}
