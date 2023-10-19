import 'package:clot/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showModalBottomSheetList({
  required String title,
  required BuildContext context,
  required SliverList list,
  Widget? leading,
}) {
  return showModalBottomSheet(
    showDragHandle: true,
    backgroundColor: Theme.of(context).colorScheme.background,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    context: context,
    builder: (context) {
      return Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: Constants.screenPadding),
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.only(bottom: 24),
              sliver: SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    leading ??
                        Container(
                          height: 40.r,
                          width: 40.r,
                        ),
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style:
                          Theme.of(context).textTheme.displayMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                    InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Ink(
                        height: 40.r,
                        width: 40.r,
                        child: const Center(
                          child: Icon(
                            Icons.close,
                            size: 24,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            list,
            const SliverToBoxAdapter(
              child: SizedBox(
                height: Constants.screenPadding,
              ),
            )
          ],
        ),
      );
    },
  );
}
