import 'package:amplify_datastore/amplify_datastore.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoey/screens/todos_view.dart';
import 'package:todoey/screens/loading_view.dart';
import 'package:todoey/repository/todo_cubit.dart';
import 'amplifyconfiguration.dart';
import 'models/ModelProvider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _amplifyConfigured = false;

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => TodoCubit()..getTodos(),
        child: _amplifyConfigured ? TodosView() : LoadingView(),
      ),
    );
  }

  void _configureAmplify() async {
    await Amplify.addPlugin(
        AmplifyDataStore(modelProvider: ModelProvider.instance));

    // Once Plugins are added, configure Amplify
    try {
      await Amplify.configure(amplifyconfig);
    } catch (e) {
      print(e);
    }
    setState(
      () {
        _amplifyConfigured = true;
      },
    );
  }
}
