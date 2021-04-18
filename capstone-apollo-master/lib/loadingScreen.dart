import 'dart:async';
import 'package:apolloApp/auth/auth.dart';
import 'package:apolloApp/chewie_list_item.dart';
import 'package:flutter/material.dart';
import 'introScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import 'package:lottie/lottie.dart';
import 'package:animations/animations.dart';
import 'mood_check_in.dart';

class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage>
    with TickerProviderStateMixin {
  final selfCareImage = Image.asset("assets/images/Self Care.jpg");
  @override
  void didChangeDependencies() {
    precacheImage(selfCareImage.image, context);
    super.didChangeDependencies();
  }

  AnimationController _controller;

  Timer timer;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);

    Timer.periodic(Duration(seconds: 8), (Timer t) => checkFirstSeen());
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Center(
        child: Lottie.asset(
          'assets/lottie/AppLogo4.json',
          height: 250,
          width: 250,
          controller: _controller,
          onLoaded: (composition) {
            _controller
              ..duration = composition.duration
              ..forward();
          },
        ),
      ),
      backgroundColor: Color(0xFF130D26),
    );
  }

  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);

    if (_seen) {
      Navigator.of(context).pushReplacement(new PageRouteBuilder(
          pageBuilder: (context, animation, anotherAnimation) =>
              //new MoodCheckIn(),
              new MoodCheckIn(),
          transitionDuration: Duration(seconds: 2),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation =
                CurvedAnimation(curve: Curves.easeIn, parent: animation);
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          }));
    } else {
      await prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(new PageRouteBuilder(
          pageBuilder: (context, animation, anotherAnimation) =>
              new AuthScreen(),
          transitionDuration: Duration(seconds: 2),
          transitionsBuilder: (context, animation, anotherAnimation, child) {
            animation =
                CurvedAnimation(curve: Curves.easeIn, parent: animation);
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          }));
    }
  }
}
