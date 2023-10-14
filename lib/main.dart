import 'package:aamazon/constants/utils/theme.dart';
import 'package:aamazon/view/auth/auth_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    theme: theme,
    debugShowCheckedModeBanner: false,
    home: const Amazon(),
  ));
}

class Amazon extends StatelessWidget {
  const Amazon({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScreen();
  }
}
