import 'package:bt_habitat_ft_organizacion/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          margin: EdgeInsets.only(top: 20),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildAvatar(),
                SizedBox(
                  height: 40,
                ),
                _buildInput('Email', false),
                SizedBox(
                  height: 20,
                ),
                _buildInput('Password', true),
                SizedBox(
                  height: 20,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 350,
                    minWidth: 350,
                  ),
                  child: CupertinoButton(
                    child: Text(
                      'Ingresar',
                      style: TextStyle(fontSize: 22),
                    ),
                    onPressed: () => signIn('leju1712@gmail.com', '123456'),
                    color: Colors.blue,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxWidth: 350,
                    minWidth: 350,
                  ),
                  child: CupertinoButton(
                    child: Text(
                      'Google',
                      style: TextStyle(fontSize: 22),
                    ),
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        )),
                    color: Colors.redAccent,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CircleAvatar _buildAvatar() {
    return CircleAvatar(
      child: Icon(
        Icons.assignment_ind,
        size: 90,
      ),
      radius: 70,
    );
  }

  ConstrainedBox _buildInput(String label, bool obscureText) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 350, minWidth: 350),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(labelText: label),
      ),
    );
  }

  void signIn(String email, String password) {
    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((AuthResult result) => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            )))
        .catchError((err) => print(err));
  }

  Future<void> _signInGoogle() async {
    print("login google");

    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'email',
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );

    try {
      GoogleSignInAccount account = await _googleSignIn.signIn();
      print(account.email);
    } catch (error) {
      print(error);
    }
  }
}
