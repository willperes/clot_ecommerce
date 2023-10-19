import 'package:clot/screens/categories_screen.dart';
import 'package:clot/widgets/empty_screen_placeholder.dart';
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
    return EmptyScreenPlaceholder(
        image: SvgPicture.asset('assets/images/notification_screen.svg'),
        text: 'No notifications yet',
        buttonText: 'Explore Categories',
        onPressed: () {
          Navigator.of(context)
              .pushReplacementNamed(CategoriesScreen.routeName);
        });
  }
}
