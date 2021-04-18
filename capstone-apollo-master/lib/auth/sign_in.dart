import 'package:apolloApp/auth/sign_in_up_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import '../mood_check_in.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key key, @required this.onRegisterClicked}) : super(key: key);

  final VoidCallback onRegisterClicked;

  @override
  _SignInState createState() => _SignInState(onRegisterClicked);
}

class _SignInState extends State<SignIn> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<
      FormState>(); //From Flutter Helper's Video: Flutter Login with firebase- auth|flutter firebase|Email/Pass & Google Sign in-flutter tutorial
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final snackBar = SnackBar(content: Text('Yay! A SnackBar!'));
  final VoidCallback onRegisterClicked;
  String
      _userName; //From Flutter Helper's Video: Flutter Login with firebase- auth|flutter firebase|Email/Pass & Google Sign in-flutter tutorial
  String _password;
  String _name;

  _SignInState(this.onRegisterClicked);

  checkAuthentification() async {
    firebaseAuth.authStateChanges().listen(
      (user) async {
        if (user != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MoodCheckIn()));
        }
      },
    );
  }

  void initState() {
    super.initState();
    this.checkAuthentification();
  }

  login() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();

      try {
        UserCredential user = await firebaseAuth.signInWithEmailAndPassword(
            email: _userName, password: _password);
        if (user != null) {
          await firebaseAuth.currentUser.updateProfile(displayName: _name);
        }
      } catch (e) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Invalid email and password combination.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            backgroundColor: Color(0xffad75f7),
          ),
        );
        print(e);
      }
    }
  }

  showError(String errorMessage) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Error"),
          content: Text(errorMessage),
          actions: <Widget>[
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Ok"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      key: _scaffoldKey,
      children: [
        Positioned(
          top: 110,
          left: 30,
          child: Center(
            child: Text(
              "Welcome to",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
        ),
        Positioned(
          top: 150,
          left: 30,
          child: Center(
            child: Text(
              "Apollo!",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 50,
                shadows: [
                  Shadow(
                    blurRadius: 0,
                    color: Color(0xFF130D26),
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ),
        ),
        Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(32, 222, 32, 22),
                    child: TextFormField(
                      autofocus: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: (input) =>
                          //if (input.isEmpty) return 'Please enter your email.';
                          EmailValidator.validate(input)
                              ? null
                              : "Please enter a valid email.",
                      onChanged: (userName) {
                        _userName = userName.trim();
                      },
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.white,
                        ),
                        contentPadding: EdgeInsets.fromLTRB(30, 10, 20, 20),
                        fillColor: Colors.white,
                        alignLabelWithHint: true,
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                      onSaved: (input) => _userName = input,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
                    child: TextFormField(
                      autofocus: false,
                      validator: (input) {
                        if (input.isEmpty) return 'Please enter your password.';
                        if (input.length < 6)
                          return "Password must be at least 6 characters long.";
                      },
                      onChanged: (password) {
                        setState(() {
                          _password = password.trim();
                        });
                      },
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.white,
                        ),
                        contentPadding: EdgeInsets.fromLTRB(30, 10, 20, 20),
                        fillColor: Colors.white,
                        alignLabelWithHint: true,
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                      ),
                      onSaved: (input) => _password = input,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 60, 30, 0),
                  child: SignInBar(
                    label: "Login",
                    onPressed: login,
                    isLoading: false,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          "Don't have an account yet?  ",
                          style: TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            onRegisterClicked?.call();
                          },
                          child: const Text(
                            "Sign up",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
