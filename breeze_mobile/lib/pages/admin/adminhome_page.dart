import 'package:breeze_mobile/pages/admin/adminmy_drawer.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Home'),
      ),
      drawer: AdminMyDrawer(),
      body: Center(
        child: Text(
          'Welcome to the Admin Home Page',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
