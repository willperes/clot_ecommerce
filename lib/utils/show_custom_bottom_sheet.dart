import 'package:clot/theme/constants.dart';
import 'package:flutter/material.dart';

showModalBottomSheetList(
    {required String title,
    required BuildContext context,
    required SliverList list}) {
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
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
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
