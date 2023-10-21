import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetListItem extends StatelessWidget {
  const BottomSheetListItem({
    super.key,
    required this.isFirst,
    required this.title,
    required this.isSelected,
    this.child,
    this.onTap,
  });

  final bool isFirst;
  final String title;
  final bool isSelected;
  final Widget? child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = isSelected
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.tertiary;

    final foregroundColor = isSelected
        ? Theme.of(context).colorScheme.onPrimary
        : Theme.of(context).colorScheme.onTertiary;

    return Padding(
      padding: EdgeInsets.only(top: isFirst ? 0 : 16),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(100),
        child: Ink(
          height: 56.h,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: foregroundColor,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                child ?? const SizedBox.shrink(),
                isSelected
                    ? Icon(
                        Icons.check,
                        color: foregroundColor,
                        size: 24.r,
                      )
                    : SizedBox(height: 24.r, width: 24.r),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
