import 'package:bsu_aims/auth/auth_page.dart';
import 'package:bsu_aims/pages/home_page.dart';
import 'package:bsu_aims/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var gsuite_email = preferences.getString('gsuite_email');

  runApp(MaterialApp(home: gsuite_email == null ? LoginPage(): HomePage(),));
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent)
    );
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      home:  HomePage(),
    );
  }
}