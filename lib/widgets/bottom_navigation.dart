import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation(
      {super.key, required this.currentIndex, required this.setSelectedTab});

  final int currentIndex;
  final void Function(int index) setSelectedTab;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      onTap: (value) {
        widget.setSelectedTab(value);
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
          ),
          label: "Products",
          activeIcon: _SelectedIconBox(
            child: Icon(
              Icons.home,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.notifications,
          ),
          label: "Notifications",
          activeIcon: _SelectedIconBox(
            child: Icon(
              Icons.notifications,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.receipt,
          ),
          label: "Orders",
          activeIcon: _SelectedIconBox(
            child: Icon(
              Icons.receipt,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
          ),
          label: "Account",
          activeIcon: _SelectedIconBox(
            child: Icon(
              Icons.person,
            ),
          ),
        ),
      ],
    );
  }
}

class _SelectedIconBox extends StatelessWidget {
  const _SelectedIconBox({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.r,
      width: 40.r,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(100),
      ),
      child: child,
    );
  }
}
