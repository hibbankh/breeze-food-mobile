// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, use_key_in_widget_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../app/routes.dart';
import '../../../services/auth/auth_service.dart';
// import 'package:breeze_mobile/pages/app.dart';

// import 'main_page_viewmodel.dart';

class OwnerSideMenu extends StatefulWidget {
  @override
  State<OwnerSideMenu> createState() => _OwnerSideMenuState();
}

// MainPageViewModel viewmodel = MainPageViewModel();

class UserCountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection('users').get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        int userCount = snapshot.data?.docs.length ?? 0;
        return Text(
          'Number of users: $userCount',
          style: TextStyle(fontSize: 20),
        );
      },
    );
  }
}

class _OwnerSideMenuState extends State<OwnerSideMenu> {
  void logout(BuildContext context) {
    final authService = AuthService();
    authService.signOut();
    Navigator.of(context).pushReplacementNamed('/login');
  }

  // Future userId = viewmodel.checkUser();
  //todo check user permission
  String status = "";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Hi! Admin',
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  //!TODO display username here
                  // FutureBuilder<DocumentSnapshot>(
                  //   future: viewmodel.getCurrentUser(),
                  //   builder: (context, AsyncSnapshot<DocumentSnapshot>snapshot),
                  // ),
                ]),
            decoration: BoxDecoration(
              color: Color.fromRGBO(200, 118, 22, 1),
            ),
          ),
          // ListTile(
          //   leading: Icon(Icons.person),
          //   title: Text('Profile'),
          //   onTap: () => {
          //     // Navigator.pushNamed(context, Routes.profile)
          //   },
          // ),
          ListTile(
            leading: Icon(Icons.add_circle_outline),
            title: Text('Add Product'),
            onTap: () =>
                {Navigator.pushNamed(context, Routes.owner_addProduct)},
          ),
          ListTile(
            leading: Icon(Icons.reviews_outlined),
            title: Text('Revenue'),
            onTap: () => {Navigator.pushNamed(context, Routes.revenue)},
          ),
          // ListTile(
          //   leading: Icon(Icons.fastfood_rounded),
          //   title: Text('View products'),
          //   onTap: () => {
          //     // Navigator.pushNamed(context, Routes.owner_viewProduct)
          //   },
          // ),
          // ListTile(
          //     leading: Icon(Icons.dashboard_customize_rounded),
          //     title: Text('Dashboard'),
          //     onTap: () {
          //       // Navigator.pushNamed(context, Routes.owner_dashboard);
          //     }),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => logout(context),
          ),
        ],
      ),
    );
  }
}
