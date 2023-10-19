import 'package:clot/screens/product_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.onChanged,
    required this.focusNode,
    required this.onClear,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final void Function(String) onChanged;
  final void Function() onClear;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: SizedBox(
        height: 40,
        child: TextFormField(
          controller: controller,
          focusNode: focusNode,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: 'Search',
            prefixIcon: Icon(Icons.search,
                size: 16.r, color: Theme.of(context).colorScheme.onBackground),
            suffixIcon: GestureDetector(
              onTap: () {
                controller.clear();
                onClear();
              },
              child: Icon(Icons.close,
                  size: 16.r,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            hintStyle: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
            errorStyle: const TextStyle(
              color: Colors.red,
              fontWeight: FontWeight.w500,
            ),
            filled: true,
            fillColor: Theme.of(context).colorScheme.tertiary,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

class SearchBarPlaceholder extends StatelessWidget {
  const SearchBarPlaceholder({super.key, this.showPadding});

  final bool? showPadding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: showPadding != null ? 10 : 0),
      child: InkWell(
        borderRadius: BorderRadius.circular(100),
        onTap: () {
          Navigator.pushNamed(context, ProductSearchScreen.routeName);
        },
        child: Ink(
          height: 40.h,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.tertiary,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(
                    right: 12,
                  ),
                  child: Icon(
                    Icons.search,
                    size: 16,
                  ),
                ),
                Text(
                  "Search",
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
