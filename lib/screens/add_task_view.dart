import 'package:flutter/material.dart';
import 'package:todoey/constans.dart';

class NewTodoView extends StatelessWidget {
  const NewTodoView({
    required void Function() onSave,
    required TextEditingController titleController,
  })  : _onSave = onSave,
        _titleController = titleController;

  final void Function() _onSave;
  final TextEditingController _titleController;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF757575),
      child: Container(
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(top: 20.0, left: 50.0, right: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              Text(
                'Add Todo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 35.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              TextField(
                autofocus: true,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0),
                decoration: InputDecoration(hintText: 'Enter todo title'),
                controller: _titleController,
              ),
              SizedBox(
                height: 25.0,
              ),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: primaryColor,
                ),
                onPressed: () {
                  _onSave();
                  _titleController.text = '';
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: secondaryColor,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
