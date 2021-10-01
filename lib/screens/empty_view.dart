import 'package:flutter/material.dart';
import 'package:todoey/constans.dart';

class EmptyView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 60.0,
        // left: 20.0,
        // right: 20.0,
        // bottom: 20.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircleAvatar(
            backgroundColor: secondaryColor,
            radius: 30.0,
            child: Icon(
              Icons.list,
              size: 40.0,
              color: primaryColor,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Todoey',
            style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.w700,
              color: secondaryColor,
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
              ),
              child: Center(
                child: Text(
                  'No todos yet',
                  style: TextStyle(
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
