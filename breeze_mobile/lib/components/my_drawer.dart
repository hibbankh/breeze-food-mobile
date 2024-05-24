import 'package:breeze_mobile/components/my_drawer_tile.dart';
import 'package:breeze_mobile/services/auth/auth_service.dart';
import 'package:flutter/material.dart';

import '../pages/customer_rating_page.dart';
import '../pages/order_history_page.dart';
import '../pages/profile_pages.dart';
import '../pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(BuildContext context) {
    final authService = AuthService();
    authService.signOut();
    Navigator.of(context).pushReplacementNamed('/login');
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Icon(
              Icons.air_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          MyDrawerTile(
            text: "HOME",
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          MyDrawerTile(
            text: "SETTINGS",
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
          MyDrawerTile(
            text: "PROFILE",
            icon: Icons.person,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ProfilePage(),
                ),
              );
            },
          ),
          MyDrawerTile(
            text: "ORDER HISTORY",
            icon: Icons.history,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OrderHistoryPage(),
                ),
              );
            },
          ),
          MyDrawerTile(
            text: "RATING",
            icon: Icons.rate_review,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CustomerRatingPage(),
                ),
              );
            },
          ),
          const Spacer(),
          MyDrawerTile(
            text: "LOGOUT",
            icon: Icons.logout,
            onTap: () => logout(context),
          ),
          const SizedBox(height: 25),
        ],
      ),
    );
  }
}
