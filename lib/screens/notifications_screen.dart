import 'package:clot/screens/categories_screen.dart';
import 'package:clot/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});

  final _notifications = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: const _NoNotificationsContent(),
    );
  }
}

class _NoNotificationsContent extends StatelessWidget {
  const _NoNotificationsContent();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset("assets/images/notification_screen.svg"),
          const SizedBox(height: Constants.screenPadding),
          Text(
            "No notifications yet",
            style: Theme.of(context).textTheme.displayMedium,
          ),
          const SizedBox(height: Constants.screenPadding),
          SizedBox(
            width: 192,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, CategoriesScreen.routeName);
              },
              child: const Text("Explore Categories"),
            ),
          )
        ],
      ),
    );
  }
}
