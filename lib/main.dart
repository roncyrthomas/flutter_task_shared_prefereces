import 'package:flutter/material.dart';
import 'package:profilepersistent/profile_page.dart';
import 'package:provider/provider.dart';

import 'user_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => User(),
      child: MaterialApp(
        home: ProfilePage(),
      ),
    );
  }
}
