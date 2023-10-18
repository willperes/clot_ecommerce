import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircularIconButton extends StatefulWidget {
  const CircularIconButton({
    super.key,
    required this.height,
    required this.width,
    required this.iconData,
    required this.iconSize,
    this.onTap,
  });

  final double height;
  final double width;
  final IconData iconData;
  final double iconSize;
  final VoidCallback? onTap;

  @override
  State<CircularIconButton> createState() => _CircularIconButtonState();
}

class _CircularIconButtonState extends State<CircularIconButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(100),
      ),
      child: InkWell(
        onTap: widget.onTap,
        child: SizedBox(
          height: widget.height.r,
          width: widget.width.r,
          child: Icon(
            widget.iconData,
            size: widget.iconSize,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
      ),
    );
  }
}
