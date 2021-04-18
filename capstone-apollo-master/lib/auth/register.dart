import 'package:apolloApp/auth/sign_in_up_bar.dart';
import 'package:apolloApp/introScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';

class Register extends StatefulWidget {
  const Register({Key key, @required this.onSignInPressed}) : super(key: key);

  final VoidCallback onSignInPressed;

  @override
  _RegisterState createState() => _RegisterState(onSignInPressed);
}

class _RegisterState extends State<Register> {
  final VoidCallback onSignInPressed;
  String
      _userName; //From Flutter Helper's Video: Flutter Login with firebase- auth|flutter firebase|Email/Pass & Google Sign in-flutter tutorial
  String _password;
  String _name;

  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<
      FormState>(); //From Flutter Helper's Video: Flutter Login with firebase- auth|flutter firebase|Email/Pass & Google Sign in-flutter tutorial
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  _RegisterState(this.onSignInPressed);

  checkAuthentification() async {
    firebaseAuth.authStateChanges().listen(
      (user) async {
        if (user != null) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => OutBoardingPage()));
        }
      },
    );
  }

  void initState() {
    super.initState();
    //this.checkAuthentification();
    this.signUp();
    this.checkAuthentification();
  }

  //checkAuthentification() async {
  //  firebaseAuth.fetchSignInMethodsForEmail(_userName).then(
  //        (methods) => {
  //          (user) async {
  //            if (user != null) {
  //              Navigator.push(context,
  //                  MaterialPageRoute(builder: (context) => OutBoardingPage()));
  //            }
  //          },
  //        },
  //      );
  //}

  signUp() async {
    //Navigator.of(context)
    //    .push(MaterialPageRoute(builder: (context) => OutBoardingPage()));
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      //Navigator.push(
      //    context, MaterialPageRoute(builder: (context) => OutBoardingPage()));

      try {
        UserCredential user = await firebaseAuth.createUserWithEmailAndPassword(
            email: _userName, password: _password);
        //Navigator.of(context)
        //    .push(MaterialPageRoute(builder: (context) => OutBoardingPage()));
        if (user != null) {
          await firebaseAuth.currentUser.updateProfile(displayName: _name);
        }
        //Navigator.of(context)
        //    .push(MaterialPageRoute(builder: (context) => OutBoardingPage()));
      } catch (signUpError) {
        Scaffold.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Email already in use.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            backgroundColor: Color(0xffad75f7),
          ),
        );
        print(signUpError);
      }
    }
  }
  //Navigator.of(context)
  //    .push(MaterialPageRoute(builder: (context) => OutBoardingPage()));

  //Navigator.of(context)
  //    .push(MaterialPageRoute(builder: (context) => OutBoardingPage()));

  @override
  void dispose() {
    signUp().dispose();
    super.dispose();
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
              "Create your",
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
              "Account",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
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
                    padding: const EdgeInsets.fromLTRB(32, 152, 32, 22),
                    child: TextFormField(
                      autofocus: false,
                      validator: (input) {
                        if (input.isEmpty) return 'What can we call you?';
                      },
                      onChanged: (userName) {},
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        contentPadding: EdgeInsets.fromLTRB(30, 10, 20, 20),
                        fillColor: Colors.white,
                        alignLabelWithHint: true,
                        hintText: 'Nickname',
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
                      onSaved: (input) => _name = input,
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(32, 0, 32, 22),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      autofocus: false,
                      validator: (input) =>
                          //if (input.isEmpty) return 'Please enter your email.';
                          EmailValidator.validate(input)
                              ? null
                              : "Please enter a valid email.",
                      onChanged: (userName) {},
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.white),
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
                      onChanged: (userName) {},
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      obscureText: true,
                      decoration: InputDecoration(
                        errorStyle: TextStyle(color: Colors.white),
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
                    label: "Sign up",
                    onPressed: signUp,
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
                          "Already have an account?  ",
                          style: TextStyle(
                            color: Colors.white60,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            onSignInPressed?.call();
                          },
                          child: const Text(
                            "Login",
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
