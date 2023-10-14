import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.text,
    this.textColor,
    this.onTap,
  });

  final String text;
  final Color? textColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: Theme.of(context).textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            "See All",
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
      ],
    );
  }
}
