import 'package:todoey/components/round_button.dart';
import 'package:todoey/screens/task_screen.dart';
import 'package:flutter/material.dart';
import 'package:todoey/constans.dart';
import 'package:todoey/screens/registration/registration_controller.dart';

class RegistrationScreen extends StatefulWidget {
  static String id = 'registration_screen';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _controller = RegistrationController();
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
              title: 'Register',
              colour: Colors.blueAccent,
              onPressed: () async {
                setState(
                  () => showSpinner = true,
                );
                _controller.createUserWithEmailAndPassword(
                  email: _emailController.text,
                  password: _passwordController.text,
                  navigateToTaskScreen: () async =>
                      await Navigator.pushNamed(context, TasksScreen.id),
                );
                setState(() => showSpinner = false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
