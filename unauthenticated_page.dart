import 'package:flutter/material.dart';

class UnauthenticatedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Not Logged In'),
      ),
      body: Center(
        child: Text('You need to login to access this feature.'),
      ),
    );
  }
}
