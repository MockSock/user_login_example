// This will store the widget information for a sign up screen

import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _email = TextEditingController();
    final _password = TextEditingController();
    return Form();
  }
}
