import 'package:flutter/material.dart';
import 'package:sample_project_2/screen_home.dart';
import 'package:sample_project_2/screen_login.dart';
import 'package:sample_project_2/splash.dart';

const SAVE_KEY_NAME = 'userloggedin';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.indigo,fontFamily: 'RobotoMono'),
      home: SplashScreen(),
      routes: {
        'screen_1': (ctx) {
          return LoginScreen();
        },
        'screen_2': (ctx) {
          return HomeScreen();
        },
        
      },
    );
  }

}

  

