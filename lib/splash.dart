import 'package:flutter/material.dart';
import 'package:sample_project_2/main.dart';
import 'package:sample_project_2/screen_home.dart';
import 'package:sample_project_2/screen_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[900],
      body: Center(
          child: Image.network(
        "https://media.istockphoto.com/vectors/letter-logo-vector-id1296859607?b=1&k=20&m=1296859607&s=612x612&w=0&h=vSxZSgc2NsI0C5i6zBlk7ijAcHuDQRkB3QYxQg3qpuY=",
        height: 60,
      )),
    );
  }

  Future<void> checkUserLoggedIn() async {
    final _sharedprefs = await SharedPreferences.getInstance();
    final _userloggedin = _sharedprefs.getBool(SAVE_KEY_NAME);
    if (_userloggedin == null || _userloggedin == false) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx22) => LoginScreen()));
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx1) => HomeScreen()));
    }
  }
}
