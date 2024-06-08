// ignore_for_file: prefer_const_constructors, annotate_overrides, use_super_parameters

import 'package:flutter/material.dart';

class OwnerMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OwnerMainAppBar({Key? key}) : super(key: key);

  Size get preferredSize => Size.fromHeight(50);

  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Restaurant Breeze', style: TextStyle(color: Colors.white)),
      centerTitle: true,
      backgroundColor: Color.fromRGBO(200, 118, 22, 1),
      elevation: 3.0,
      iconTheme: IconThemeData(color: Colors.white),
    );
  }
}
