import 'package:flutter/material.dart';

PreferredSizeWidget CustomAppBar(String text, context) {
  return AppBar(
    title: Text(text),
    actions: [
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/home');
          },
          icon: Icon(Icons.home)),
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/user');
          },
          icon: Icon(Icons.account_circle)),
      IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/auth');
          },
          icon: Icon(Icons.exit_to_app)),
    ],
  );
}