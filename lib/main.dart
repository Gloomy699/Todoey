import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:todoey/models/task_data.dart';
import 'package:todoey/screens/task_screen.dart';
import 'package:todoey/screens/welcome_screen.dart';
import 'package:todoey/screens/login/login_screen.dart';
import 'package:todoey/screens/registration/registration_screen.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => TaskData(),
      child: MaterialApp(
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (_) => WelcomeScreen(),
          LoginScreen.id: (_) => LoginScreen(),
          RegistrationScreen.id: (_) => RegistrationScreen(),
          TasksScreen.id: (_) => TasksScreen(),
        },
      ),
    );
  }
}
