import 'package:flutter/material.dart';
import 'package:sample_project_2/main.dart';
import 'package:sample_project_2/screen_home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    loginCheck(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(left: 30, right: 30),
          child: Form(
            key: _formkey,
            child: ListView(
              children: [
                Text(
                  "Login Page",
                  style: TextStyle(
                    color: Colors.blueGrey[900],
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 40,
                ),
                TextFormField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'USERNAME',
                  ),
                
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    } else if (value.length < 6) {
                      return "Enter atleast 6 characters";
                    } else {
                      return null;
                    }
                  }, 
                 textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  width: double.infinity,
                  height: 40,
                ),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'PASSWORD',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'This field is required';
                    } else if (value.length < 6) {
                      return 'Incorrect Password';
                    } else {
                      return null;
                    }
                  },
                  textInputAction: TextInputAction.done,
          
                  obscureText: true,
                ),
                const SizedBox(
                  width: 40,
                  height: 40,
                ),
                
                ElevatedButton(
                    onPressed: () {
                      FocusScopeNode currentFocus = FocusScope.of(context);

                      if (!currentFocus.hasPrimaryFocus) {
                        currentFocus.unfocus();
                      }
                      FocusScope.of(context).requestFocus(new FocusNode());
                      if (_formkey.currentState!.validate()) {
                        loginCheck(context);
                      }
                    },
                    child: const Text("LogIn")),
                const SizedBox(
                  width: 40,
                  height: 10,
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  void loginCheck(BuildContext ctx) async {
    final _username = _usernameController.text;
    final _password = _passwordController.text;
    if (_username == 'mubashira' && _password == '123456') {
      Navigator.of(ctx).pushReplacement(
          MaterialPageRoute(builder: (ctx2) => HomeScreen()));
      final _sharedprefs = await SharedPreferences.getInstance();
      await _sharedprefs.setBool(SAVE_KEY_NAME, true);
    } else {
      ScaffoldMessenger.of(ctx).showSnackBar(
          const SnackBar(content: Text("Incorrect username or password")));
    }
  }
}
