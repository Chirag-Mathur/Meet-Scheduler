import 'package:flutter/material.dart';
import 'package:meet_scheduler/Screens/Authenticate/authenticate.dart';
import 'package:meet_scheduler/Services/auth.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

AuthService _auth = AuthService();

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: Container(
        child: Center(
            child: RaisedButton(
          child: Text('SignIn Anonymously'),
          onPressed: () async {
            dynamic result = await _auth.signInAnon();
            if(result== null){
              print('Error signing in');
            }else{
              print('signed in');
              print(result);
            }

          },
        )),
      ),
    );
  }
}
