import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../home.dart';
import 'authentication.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void toggleScreen() {}

    final user = Provider.of<User?>(context);
    if (user != null) {
      return Garden();
    } else {
      return Authentication();
    }
  }
}
