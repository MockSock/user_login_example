// This will store the widget information for a sign up screen

import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _password = TextEditingController();

  @override
  void initState() {
    super.initState();
    _email.addListener(_printEmailValue);
    _password.addListener(_printPasswordValue);
  }

  @override
  // This helps prevent memory leaks
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future _printEmailValue() async {
    return showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text("Test Dialog"),
            content: Text('Is this the email you entered? ${_email.text}'),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                color: Colors.green,
                icon: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
            ],
          );
        });
  }

  Future _printPasswordValue() async {
    return showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            title: const Text('Test Dialog'),
            content:
                Text('Is this the password you entered? ${_password.text}'),
            actions: <Widget>[
              IconButton(
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
                icon: const Icon(
                  Icons.check,
                  color: Colors.white,
                ),
                color: Colors.green,
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    // This will be for sizing
    final size = MediaQuery.of(context).size;

    return Container(
      color: Theme.of(context).primaryColor,
      alignment: Alignment.center,
      padding: EdgeInsets.all(size.width * 0.1),
      margin: EdgeInsets.only(top: size.height * 0.1),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            // Email TextField
            TextField(
              decoration:
                  const InputDecoration(labelText: 'Please Enter your Email'),
              controller: _email,
            ),

            // Password TextField
            TextField(
              decoration: const InputDecoration(
                  labelText: 'Please Enter a Strong Password'),
              controller: _password,
            ),
          ],
        ),
      ),
    );
  }
}
