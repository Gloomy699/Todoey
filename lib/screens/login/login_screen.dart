import 'package:todoey/constans.dart';
import 'package:flutter/material.dart';
import 'package:todoey/components/round_button.dart';
import 'package:todoey/screens/login/login_controller.dart';
import 'package:todoey/screens/task_screen.dart';

class LoginScreen extends StatefulWidget {
  static String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _controller = LoginController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: CircleAvatar(
                    backgroundColor: primaryColor,
                    radius: 30.0,
                    child: Icon(
                      Icons.list,
                      size: 100.0,
                      color: secondaryColor,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              controller: _emailController,
              textAlign: TextAlign.center,
              decoration:
                  textFieldDecoration.copyWith(hintText: 'Enter your email...'),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              textAlign: TextAlign.center,
              decoration: textFieldDecoration.copyWith(
                  hintText: 'Enter your pasword...'),
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              title: 'Log in',
              colour: Colors.lightBlueAccent,
              onPressed: () async {
                setState(
                  () => showSpinner = true,
                );
                _controller.signInWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text,
                  navigateToTaskScreen: () async =>
                      await Navigator.pushNamed(context, TasksScreen.id),
                );
                setState(
                  () => showSpinner = false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
