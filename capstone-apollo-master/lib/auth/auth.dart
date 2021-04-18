import 'package:animations/animations.dart';
import 'package:apolloApp/auth/background_painter.dart';
import 'package:apolloApp/auth/register.dart';
import 'package:apolloApp/auth/sign_in.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key key, @required this.onRegisterClicked})
      : super(key: key);

  final VoidCallback onRegisterClicked;

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  ValueNotifier<bool> showSignInPage = ValueNotifier<bool>(true);

  @override
  void initState() {
    // TODO: implement initState
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF130D26),
      body: Stack(
        children: [
          SizedBox.expand(
            child: CustomPaint(
              painter: BackgroundPainter(
                animation: _controller.view,
              ),
            ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800),
              child: ValueListenableBuilder<bool>(
                valueListenable: showSignInPage,
                builder: (context, value, child) {
                  return PageTransitionSwitcher(
                    reverse: !value,
                    duration: Duration(milliseconds: 800),
                    transitionBuilder: (child, animation, secondaryAnimation) {
                      return SharedAxisTransition(
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.vertical,
                        fillColor: Colors.transparent,
                        child: child,
                      );
                    },
                    child: value
                        ? SignIn(
                            key: ValueKey("SignIn"),
                            onRegisterClicked: () {
                              showSignInPage.value = false;
                              _controller.forward();
                            },
                          )
                        : Register(
                            key: ValueKey("Register"),
                            onSignInPressed: () {
                              showSignInPage.value = true;
                              _controller.reverse();
                            },
                          ),
                  );
                },
              ),
            ),
          ),
          /*Center(
            child: MaterialButton(
              onPressed: () {
                _controller.forward(from: 0);
              },
              child: Text("Register"),
              textColor: Colors.white,
              color: Color(0xFF242632),
            ),
          ),*/
          //Positioned(
          //  top: 110,
          //  left: 30,
          //  child: Center(
          //    child: Text(
          //      "Welcome to",
          //      style: TextStyle(
          //        color: Colors.white,
          //        fontWeight: FontWeight.bold,
          //        fontSize: 30,
          //      ),
          //    ),
          //  ),
          //),
          //Positioned(
          //  top: 150,
          //  left: 30,
          //  child: Center(
          //    child: Text(
          //      "Apollo!",
          //      style: TextStyle(
          //        color: Colors.white,
          //        fontWeight: FontWeight.bold,
          //        fontSize: 50,
          //        shadows: [
          //          Shadow(
          //            blurRadius: 0,
          //            color: Color(0xFF130D26),
          //            offset: Offset(0, 2),
          //          ),
          //        ],
          //      ),
          //    ),
          //  ),
          //),
          //Center(
          //  child: Form(
          //    key: _formKey,
          //    child: Column(
          //      mainAxisAlignment: MainAxisAlignment.center,
          //      children: [
          //        Container(
          //          child: Padding(
          //            padding: const EdgeInsets.fromLTRB(32, 22, 32, 22),
          //            child: TextFormField(
          //              autofocus: false,
          //              validator: (input) {
          //                if (input.isEmpty)
          //                  return 'Please enter your username';
          //              },
          //              onChanged: (userName) {},
          //              style: TextStyle(
          //                color: Colors.white,
          //                fontWeight: FontWeight.bold,
          //                fontSize: 16,
          //              ),
          //              decoration: InputDecoration(
          //                prefixIcon: Icon(
          //                  Icons.person,
          //                  color: Colors.white,
          //                ),
          //                contentPadding: EdgeInsets.fromLTRB(30, 10, 20, 20),
          //                fillColor: Colors.white,
          //                alignLabelWithHint: true,
          //                hintText: 'Username',
          //                hintStyle: TextStyle(
          //                  color: Colors.white.withOpacity(0.6),
          //                  fontWeight: FontWeight.bold,
          //                  fontSize: 16,
          //                ),
          //                floatingLabelBehavior: FloatingLabelBehavior.always,
          //                focusedBorder: OutlineInputBorder(
          //                  borderRadius: BorderRadius.circular(20),
          //                  borderSide:
          //                      BorderSide(color: Colors.white, width: 2),
          //                ),
          //                errorBorder: OutlineInputBorder(
          //                  borderRadius: BorderRadius.circular(20),
          //                  borderSide:
          //                      BorderSide(color: Colors.white, width: 2),
          //                ),
          //                enabledBorder: OutlineInputBorder(
          //                  borderRadius: BorderRadius.circular(20),
          //                  borderSide:
          //                      BorderSide(color: Colors.white, width: 2),
          //                ),
          //                focusedErrorBorder: OutlineInputBorder(
          //                  borderRadius: BorderRadius.circular(20),
          //                  borderSide:
          //                      BorderSide(color: Colors.white, width: 2),
          //                ),
          //              ),
          //              onSaved: (input) => _userName = input,
          //            ),
          //          ),
          //        ),
          //        Container(
          //          child: Padding(
          //            padding: const EdgeInsets.fromLTRB(32, 0, 32, 0),
          //            child: TextFormField(
          //              autofocus: false,
          //              validator: (input) {
          //                if (input.isEmpty)
          //                  return 'Please enter your password';
          //              },
          //              onChanged: (userName) {},
          //              style: TextStyle(
          //                color: Colors.white,
          //                fontWeight: FontWeight.bold,
          //                fontSize: 16,
          //              ),
          //              obscureText: true,
          //              decoration: InputDecoration(
          //                prefixIcon: Icon(
          //                  Icons.lock,
          //                  color: Colors.white,
          //                ),
          //                contentPadding: EdgeInsets.fromLTRB(30, 10, 20, 20),
          //                fillColor: Colors.white,
          //                alignLabelWithHint: true,
          //                hintText: 'Password',
          //                hintStyle: TextStyle(
          //                  color: Colors.white.withOpacity(0.6),
          //                  fontWeight: FontWeight.bold,
          //                  fontSize: 16,
          //                ),
          //                floatingLabelBehavior: FloatingLabelBehavior.always,
          //                errorBorder: OutlineInputBorder(
          //                  borderRadius: BorderRadius.circular(20),
          //                  borderSide:
          //                      BorderSide(color: Colors.white, width: 2),
          //                ),
          //                focusedBorder: OutlineInputBorder(
          //                  borderRadius: BorderRadius.circular(20),
          //                  borderSide:
          //                      BorderSide(color: Colors.white, width: 2),
          //                ),
          //                enabledBorder: OutlineInputBorder(
          //                  borderRadius: BorderRadius.circular(20),
          //                  borderSide:
          //                      BorderSide(color: Colors.white, width: 2),
          //                ),
          //                focusedErrorBorder: OutlineInputBorder(
          //                  borderRadius: BorderRadius.circular(20),
          //                  borderSide:
          //                      BorderSide(color: Colors.white, width: 2),
          //                ),
          //              ),
          //              onSaved: (input) => _password = input,
          //            ),
          //          ),
          //        ),
          //      ],
          //    ),
          //  ),
          //),
          //Padding(
          //  padding: const EdgeInsets.fromLTRB(30, 400, 30, 0),
          //  child: ValueListenableBuilder<bool>(
          //    valueListenable: showLoginPage,
          //    builder: (context, value, child) {
          //      return value
          //          ? LoginBar(
          //              onRegisterClicked: () {
          //                showLoginPage.value = false;
          //              },
          //              isLoading: false,
          //              label: "Login",
          //              onPressed: login,
          //            )
          //          : Register();
          //    },
          //    child: LoginBar(
          //      label: "Login",
          //      onPressed: login,
          //      isLoading: false,
          //    ),
          //  ),
          //),
          //Align(
          //  alignment: Alignment.centerLeft,
          //  child: InkWell(
          //    splashColor: Colors.white,
          //    onTap: () {
          //      if (onRegisterClicked != null) {
          //        onRegisterClicked() {
          //          showLoginPage.value = false;
          //        }
          //      }
          //    },
          //    child: const Text(
          //      'Sign up',
          //      style: TextStyle(
          //        fontSize: 16,
          //        decoration: TextDecoration.underline,
          //        color: Colors.white,
          //      ),
          //    ),
          //  ),
          //),
          //Positioned(
          //  bottom: 70,
          //  left: 120,
          //  child: Column(
          //    mainAxisAlignment: MainAxisAlignment.center,
          //    children: <Widget>[
          //      MaterialButton(
          //        padding: const EdgeInsets.symmetric(
          //          horizontal: 35,
          //          vertical: 10,
          //        ),
          //        onPressed: login,
          //        child: Text(
          //          "Login",
          //          style: TextStyle(
          //            color: Colors.white,
          //            fontWeight: FontWeight.bold,
          //            fontSize: 20,
          //          ),
          //        ),
          //        shape: RoundedRectangleBorder(
          //          borderRadius: BorderRadius.circular(30),
          //        ),
          //        color: Color(0xFFff6fb0),
          //      ),
          //      SizedBox(
          //        height: 15,
          //      ),
          //      Text(
          //        "Don't have an account yet?",
          //        style: TextStyle(
          //          color: Colors.white70,
          //          fontWeight: FontWeight.bold,
          //          fontSize: 14,
          //        ),
          //      ),
          //      MaterialButton(
          //        onPressed: () {},
          //        child: Text(
          //          "Sign up!",
          //          style: TextStyle(
          //            color: Color(0xFFff6fb0),
          //            fontWeight: FontWeight.bold,
          //            fontSize: 16,
          //            //decoration: TextDecoration.underline,
          //          ),
          //        ),
          //      )
          //    ],
          //  ),
          //),
        ],
      ),
    );
  }
}
