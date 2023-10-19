import 'package:clot/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyScreenPlaceholder extends StatelessWidget {
  const EmptyScreenPlaceholder({
    super.key,
    required this.image,
    required this.text,
    required this.buttonText,
    required this.onPressed,
  });

  final Widget image;
  final String text;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Constants.screenPadding),
      child: Container(
        alignment: Alignment.center,
        color: Theme.of(context).colorScheme.background,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image,
            const SizedBox(height: Constants.screenPadding),
            Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const SizedBox(height: Constants.screenPadding),
            SizedBox(
              width: 192.w,
              child: TextButton(
                onPressed: onPressed,
                child: Text(buttonText),
              ),
            )
          ],
        ),
      ),
    );
  }
}
