import 'package:breeze_mobile/components/my_textfield.dart';
import 'package:flutter/material.dart';
import 'adminhome_page.dart';

class AdminLoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Admin Login Page',
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 20),
            MyTextField(
              obscureText: false,
              controller: TextEditingController(),
              hintText: 'Admin Username',
            ),
            const SizedBox(height: 10),
            MyTextField(
              controller: TextEditingController(),
              hintText: 'Admin Password',
              obscureText: false,
            ),
            const SizedBox(height: 10),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AdminHomePage()),
                );
              },
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
