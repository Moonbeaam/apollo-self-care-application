import 'dart:io';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:apolloApp/services/crud.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:random_string/random_string.dart';
import 'dashboard.dart';
import 'package:flutter/cupertino.dart';
import 'package:apolloApp/screens/home.dart';
import 'package:apolloApp/database/database.dart';
import 'package:hexcolor/hexcolor.dart';
import 'mood_check_in.dart';

class OutBoardingPage extends StatefulWidget {
  static String id = 'OutBoardingPage';
  //const OutBoardingPage({Key key}) : super(key: key);

  final String getvalue;
  OutBoardingPage({this.getvalue});

  @override
  _OutBoardingPageState createState() => _OutBoardingPageState();
}

class _OutBoardingPageState extends State<OutBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  final selfCareImage = Image.asset("assets/images/Self Care.jpg");
  final personalTrackerImage =
      Image.asset("assets/images/Personal Tracker.jpg");
  final intimateDiaryImage = Image.asset("assets/images/Intimate Diary.jpg");

  @override
  void didChangeDependencies() {
    precacheImage(selfCareImage.image, context);
    precacheImage(personalTrackerImage.image, context);
    precacheImage(intimateDiaryImage.image, context);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      globalBackgroundColor: Color(0xFF130D26),
      key: introKey,
      pages: [
        //First Page of the Intro Screen
        PageViewModel(
          title: "Self-Care",
          bodyWidget: new Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              Text(
                "Apollo prioritizes the practice of Self-Care! ‎Explore the wide range of content within Apollo which aims to aid you in taking care of your mental health.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: HexColor("#d6f6dd"),
                    fontSize: 12.5,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
              ),
            ],
          ),
          decoration: PageDecoration(
            titlePadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            pageColor: Color(0xFF130D26),
            descriptionPadding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            imagePadding: const EdgeInsets.fromLTRB(50, 150, 50, 0),
            imageFlex: 0,
            titleTextStyle: TextStyle(
                color: HexColor("#60f680"),
                fontSize: 32,
                fontWeight: FontWeight.bold),
            bodyTextStyle: TextStyle(
              color: HexColor("#d6f6dd"),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          image: Image.asset(
            'assets/images/Self Care.jpg',
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        //Second Page of the Intro Screen
        PageViewModel(
          title: "Personal Tracker",
          bodyWidget: new Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              Text(
                "Apollo allows you to keep track of your mental health journey! This means that you can go back and see how you’ve improved your Mood, Sleeping Experience, and overall mental health.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: HexColor("#d6f6dd"),
                    fontSize: 12.5,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
              ),
            ],
          ),
          decoration: PageDecoration(
            titlePadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            pageColor: Color(0xFF130D26),
            descriptionPadding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            imagePadding: const EdgeInsets.fromLTRB(50, 150, 50, 0),
            imageFlex: 0,
            titleTextStyle: TextStyle(
                color: HexColor("#60f680"),
                fontSize: 32,
                fontWeight: FontWeight.bold),
            bodyTextStyle: TextStyle(
              color: HexColor("#d6f6dd"),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          image: Image.asset(
            'assets/images/Personal Tracker.jpg',
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width,
          ),
        ),
        //Third Page of the Intro Screen
        PageViewModel(
          title: "Intimate Diary",
          bodyWidget: new Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              Text(
                "Apollo provides you a diary where you can express your deepest thoughts and release whatever you’re feeling. This is yours to keep.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: HexColor("#d6f6dd"),
                    fontSize: 12.5,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
              ),
            ],
          ),
          decoration: PageDecoration(
            titlePadding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            pageColor: Color(0xFF130D26),
            descriptionPadding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            imagePadding: const EdgeInsets.fromLTRB(50, 150, 50, 0),
            imageFlex: 0,
            titleTextStyle: TextStyle(
                color: HexColor("#60f680"),
                fontSize: 32,
                fontWeight: FontWeight.bold),
            bodyTextStyle: TextStyle(
              color: HexColor("#d6f6dd"),
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          image: Image.asset(
            'assets/images/Intimate Diary.jpg',
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ],
      onDone: () {
        //CODE BELOW IS ONLY FOR CONVENIENCE PURPOSES!
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => WelcomePage()));
        //CODE BELOW FIXED THE JOURNAL BUG!
        /*var route = new MaterialPageRoute(
          builder: (BuildContext context) => new NamePage(
            getvalue: getvalue,
          ),
        );
        Navigator.of(context).pushReplacement(route);*/
      },
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: Text(
        'Skip',
        style: TextStyle(color: Colors.white),
      ),
      next: const Icon(
        Icons.arrow_forward,
        color: Colors.white,
      ),
      done: const Text("Let's Go!",
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
      dotsDecorator: DotsDecorator(
        size: Size(10.0, 10.0),
        color: HexColor("#60f680"),
        activeColor: HexColor("#d6f6dd"),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

//
//NOTE: CODE BELOW WORKS FINE. BUT I'M GOING TO REMOVE IT SO THIS IS ONLY BACKUP
//class NamePage extends StatefulWidget {
//  NamePage({this.app});
//  final FirebaseApp app;
//  @override
//  _NamePageState createState() => _NamePageState();
//}
//
//class _NamePageState extends State<NamePage> {
//  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//
//  final referenceDatabase = FirebaseDatabase.instance;
//
//  bool _btnEnabled = true;
//
//  String authorName;
//
//  File selectedImage;
//  bool _isLoading = false;
//  CrudMethods crudMethods = new CrudMethods();
//
//  uploadBlog() async {
//    if (authorName != null) {
//      Map<String, dynamic> blogMap = {
//        "authorName": authorName,
//      };
//      crudMethods.addData(blogMap).then(
//        (result) {
//          String nameToSend = nameController.text;
//          Navigator.push(
//            context,
//            MaterialPageRoute(
//              builder: (context) => WelcomePage(
//                name: nameToSend,
//              ),
//            ),
//          );
//          Navigator.pop(context);
//        },
//      );
//      //await firebaseAuth.currentUser.updateProfile(displayName: authorName);
//    } else {
//      Container(
//        child: Text("User"),
//      );
//    }
//  }
//
//  //Controller for Name of User
//  final nameController = TextEditingController();
//
//  //Key for Name of User
//  final GlobalKey<FormState> _nameKey = GlobalKey<FormState>();
//
//  @override
//  void initState() {
//    super.initState();
//    this.uploadBlog();
//  }
//
//  @override
//  void dispose() {
//    nameController.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    final ref = referenceDatabase.reference();
//    const bodyStyle = TextStyle(
//        fontSize: 18.0, color: Color(0xFF130D26), fontWeight: FontWeight.bold);
//    const pageDecoration = const PageDecoration(
//      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
//      bodyTextStyle: bodyStyle,
//      descriptionPadding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 16.0),
//      pageColor: Color(0xFF130D26),
//    );
//
//    return IntroductionScreen(
//      globalBackgroundColor: Color(0xFF130D26),
//      showSkipButton: false,
//      showNextButton: false,
//      isProgress: false,
//      done: Text(""),
//      onDone: () {},
//      pages: [
//        PageViewModel(
//          //image: _buildImage('img1'),
//          title: "Before anything else..",
//          bodyWidget: new Wrap(
//            alignment: WrapAlignment.center,
//            children: <Widget>[
//              Text(
//                'What should I call you?',
//                textAlign: TextAlign.center,
//                style: TextStyle(
//                    fontSize: 18.0,
//                    color: Color(0xFFdac4f7),
//                    fontWeight: FontWeight.bold),
//              ),
//              Expanded(
//                flex: 6,
//                child: SizedBox(
//                  height: 200,
//                  child: new Form(
//                    key: _nameKey,
//                    child: Padding(
//                      padding: EdgeInsets.only(top: 30),
//                      child: ListView(
//                        children: <Widget>[
//                          Padding(
//                            padding: EdgeInsets.only(left: 20, right: 20),
//                            child: TextFormField(
//                              autovalidate: true,
//                              validator: (String value) {
//                                bool isValid = value.length > 0;
//                                if (isValid != _btnEnabled) {
//                                  WidgetsBinding.instance
//                                      .addPostFrameCallback((_) {
//                                    setState(() {
//                                      _btnEnabled = value.length > 0;
//                                    });
//                                  });
//                                }
//                              },
//                              autofocus: false,
//                              onChanged: (value) {
//                                authorName = value;
//                              },
//                              style: bodyStyle,
//                              controller: nameController,
//                              decoration: InputDecoration(
//                                contentPadding:
//                                    EdgeInsets.fromLTRB(30, 10, 20, 20),
//                                fillColor: Colors.white,
//                                alignLabelWithHint: true,
//                                hintText: 'Enter your nickname',
//                                floatingLabelBehavior:
//                                    FloatingLabelBehavior.always,
//                                hintStyle: TextStyle(
//                                    color: Color(0xFF130D26).withOpacity(0.3),
//                                    fontSize: 14),
//                                focusedBorder: OutlineInputBorder(
//                                  borderRadius: BorderRadius.circular(35),
//                                  borderSide:
//                                      BorderSide(color: Colors.white, width: 2),
//                                ),
//                                filled: true,
//                                enabledBorder: OutlineInputBorder(
//                                  borderRadius: BorderRadius.circular(35),
//                                  borderSide:
//                                      BorderSide(color: Colors.white, width: 2),
//                                ),
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  ),
//                ),
//              ),
//            ],
//          ),
//          footer: RaisedButton(
//            padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
//            onPressed: _btnEnabled
//                ? () {
//                    _sendDataToWelcomePage(context);
//                    uploadBlog();
//                  }
//                : null,
//            child: const Text(
//              'Continue',
//              style: TextStyle(
//                  color: Color(0xFF130D26),
//                  fontSize: 16,
//                  fontWeight: FontWeight.bold),
//            ),
//            color: Color(0xFFad75f7),
//            shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.circular(20),
//            ),
//          ),
//          decoration: const PageDecoration(
//            footerPadding: const EdgeInsets.only(top: 60),
//            titlePadding: const EdgeInsets.only(top: 300),
//            descriptionPadding: const EdgeInsets.only(top: 20),
//            pageColor: Color(0xFF130D26),
//            titleTextStyle: TextStyle(
//                color: Color(0xFFad75f7),
//                fontSize: 28.0,
//                fontWeight: FontWeight.w700),
//            bodyTextStyle: TextStyle(color: Colors.white, fontSize: 12.0),
//          ),
//        ),
//      ],
//    );
//  }
//
//  void _sendDataToWelcomePage(BuildContext context) {
//    String nameToSend = nameController.text;
//    Navigator.push(
//      context,
//      MaterialPageRoute(
//        builder: (context) => WelcomePage(
//          name: nameToSend,
//        ),
//      ),
//    );
//  }
//}

class WelcomePage extends StatefulWidget {
  WelcomePage({
    Key key,
  }) : super(key: key);

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User user;
  bool isLoggedIn = false;

  void getUser() async {
    User firebaseUser = firebaseAuth.currentUser;
    await firebaseUser?.toString();
    firebaseUser = firebaseAuth.currentUser;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isLoggedIn = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    this.getUser();
    //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 18.0, color: Color(0xFF130D26));
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 16.0),
      pageColor: Color(0xFF130D26),
    );

    return IntroductionScreen(
      globalBackgroundColor: Color(0xFF130D26),
      showSkipButton: false,
      showNextButton: false,
      isProgress: false,
      done: Text(""),
      onDone: () {},
      pages: [
        PageViewModel(
          image: Image.asset(
            "assets/images/Welcome.jpg",
            fit: BoxFit.fitWidth,
            width: MediaQuery.of(context).size.width,
          ),
          title: "Welcome to Apollo,\n${user.displayName}!",
          bodyWidget: new Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              Text(
                "You are just a few steps away from experiencing Apollo! Rest assured that your personal data will not be collected nor sold to other organizations and individuals. We truly value your privacy here in Apollo.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 12.5,
                    color: Color(0xFFdac4f7),
                    fontWeight: FontWeight.bold,
                    height: 1.5),
              )
            ],
          ),
          footer: RaisedButton(
            padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => DevMessage()));
            },
            child: const Text(
              "Let's Go!",
              style: TextStyle(
                  color: Color(0xFF130D26),
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            color: Color(0xFFad75f7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          decoration: const PageDecoration(
            footerPadding: const EdgeInsets.only(top: 45),
            imagePadding: const EdgeInsets.fromLTRB(50, 150, 50, 0),
            titlePadding: const EdgeInsets.only(top: 20),
            descriptionPadding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
            pageColor: Color(0xFF130D26),
            titleTextStyle: TextStyle(
                color: Color(0xFFad75f7),
                fontSize: 28.0,
                fontWeight: FontWeight.w700),
            bodyTextStyle: TextStyle(color: Colors.white, fontSize: 12.0),
          ),
        ),
      ],
    );
  }
}
//
//NOTE: BACKUP FOR THE WELCOME PAGE THAT USES THE NAMEPAGE
//class WelcomePage extends StatelessWidget {
//  final String name;
//
//  WelcomePage({Key key, @required this.name}) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    const bodyStyle = TextStyle(fontSize: 18.0, color: Color(0xFF130D26));
//    const pageDecoration = const PageDecoration(
//      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
//      bodyTextStyle: bodyStyle,
//      descriptionPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 16.0),
//      pageColor: Color(0xFF130D26),
//    );
//
//    return IntroductionScreen(
//      globalBackgroundColor: Color(0xFF130D26),
//      showSkipButton: false,
//      showNextButton: false,
//      isProgress: false,
//      done: Text(""),
//      onDone: () {},
//      pages: [
//        PageViewModel(
//          image: Image.asset(
//            "assets/images/Welcome.jpg",
//            fit: BoxFit.fitWidth,
//            width: MediaQuery.of(context).size.width,
//          ),
//          title: "Welcome to Apollo,\n$name!",
//          bodyWidget: new Wrap(
//            alignment: WrapAlignment.center,
//            children: <Widget>[
//              Text(
//                "You are just a few steps away from experiencing Apollo! Rest assured that your personal data will not be collected nor sold to other organizations and individuals. We truly value your privacy here in Apollo.",
//                textAlign: TextAlign.justify,
//                style: TextStyle(
//                    fontSize: 12.5,
//                    color: Color(0xFFdac4f7),
//                    fontWeight: FontWeight.bold,
//                    height: 1.5),
//              )
//            ],
//          ),
//          footer: RaisedButton(
//            padding: const EdgeInsets.fromLTRB(45, 0, 45, 0),
//            onPressed: () {
//              Navigator.of(context)
//                  .push(MaterialPageRoute(builder: (context) => DevMessage()));
//            },
//            child: const Text(
//              "Let's Go!",
//              style: TextStyle(
//                  color: Color(0xFF130D26),
//                  fontSize: 16,
//                  fontWeight: FontWeight.bold),
//            ),
//            color: Color(0xFFad75f7),
//            shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.circular(20),
//            ),
//          ),
//          decoration: const PageDecoration(
//            footerPadding: const EdgeInsets.only(top: 45),
//            imagePadding: const EdgeInsets.fromLTRB(50, 150, 50, 0),
//            titlePadding: const EdgeInsets.only(top: 20),
//            descriptionPadding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
//            pageColor: Color(0xFF130D26),
//            titleTextStyle: TextStyle(
//                color: Color(0xFFad75f7),
//                fontSize: 28.0,
//                fontWeight: FontWeight.w700),
//            bodyTextStyle: TextStyle(color: Colors.white, fontSize: 12.0),
//          ),
//        ),
//      ],
//    );
//  }
//}

/*class QuestionsPage extends StatefulWidget {
  @override
  _QuestionsPageState createState() => _QuestionsPageState();
}

class _QuestionsPageState extends State<QuestionsPage> {
  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 18.0, color: Color(0xFF130D26));
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 16.0),
      pageColor: Color(0xFF130D26),
    );

    return IntroductionScreen(
      globalBackgroundColor: Color(0xFF130D26),
      showSkipButton: false,
      showNextButton: false,
      isProgress: false,
      done: Text(""),
      onDone: () {},
      pages: [
        PageViewModel(
          titleWidget: new Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              Text(
                "What seems to be the problem?",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 21, color: Color(0xFF67e2f7)),
              ),
            ],
          ),
          bodyWidget: new Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              Text(
                "Just select as many from the list and Apollo will assist you to the fullest!",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, color: Color(0xFFacecf7)),
              ),
              SizedBox(
                height: 80,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(30, 0, 25, 0),
                  onPressed: () {},
                  child: const Text(
                    "Stress",
                    style: TextStyle(
                      color: Color(0xFF130D26),
                      fontSize: 14,
                    ),
                  ),
                  color: Color(0xFFacecf7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(30, 0, 28, 0),
                  onPressed: () {},
                  child: const Text(
                    "Anxiety",
                    style: TextStyle(
                      color: Color(0xFF130D26),
                      fontSize: 14,
                    ),
                  ),
                  color: Color(0xFFacecf7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(30, 0, 21, 0),
                  onPressed: () {},
                  child: const Text(
                    "Loneliness",
                    style: TextStyle(
                      color: Color(0xFF130D26),
                      fontSize: 14,
                    ),
                  ),
                  color: Color(0xFFacecf7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(30, 0, 28, 0),
                  onPressed: () {},
                  child: const Text(
                    "Depression",
                    style: TextStyle(
                      color: Color(0xFF130D26),
                      fontSize: 14,
                    ),
                  ),
                  color: Color(0xFFacecf7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(30, 0, 38, 0),
                  onPressed: () {},
                  child: const Text(
                    "Uncertainty",
                    style: TextStyle(
                      color: Color(0xFF130D26),
                      fontSize: 14,
                    ),
                  ),
                  color: Color(0xFFacecf7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(30, 0, 38, 0),
                  onPressed: () {},
                  child: const Text(
                    "Sleeplessness",
                    style: TextStyle(
                      color: Color(0xFF130D26),
                      fontSize: 14,
                    ),
                  ),
                  color: Color(0xFFacecf7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  onPressed: () {},
                  child: const Text(
                    "Lack of Motivation",
                    style: TextStyle(
                      color: Color(0xFF130D26),
                      fontSize: 14,
                    ),
                  ),
                  color: Color(0xFFacecf7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: MaterialButton(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                  onPressed: () {},
                  child: const Text(
                    "Anger Management",
                    style: TextStyle(
                      color: Color(0xFF130D26),
                      fontSize: 14,
                    ),
                  ),
                  color: Color(0xFFacecf7),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ],
          ),
          footer: RaisedButton(
            padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => QuestionsPage2()));
            },
            child: const Text(
              "Next",
              style: TextStyle(color: Color(0xFF130D26), fontSize: 16),
            ),
            color: Color(0xFF67e2f7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          decoration: const PageDecoration(
            footerPadding: const EdgeInsets.only(top: 40),
            imagePadding: const EdgeInsets.fromLTRB(50, 150, 50, 0),
            titlePadding: const EdgeInsets.fromLTRB(30, 70, 30, 0),
            descriptionPadding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
            pageColor: Color(0xFF130D26),
            titleTextStyle: TextStyle(
                color: Color(0xFF67e2f7),
                fontSize: 28.0,
                fontWeight: FontWeight.w700),
            bodyTextStyle: TextStyle(color: Color(0xFFacecf7), fontSize: 12.0),
          ),
        ),
      ],
    );
  }
}

class QuestionsPage2 extends StatefulWidget {
  @override
  _QuestionsPage2State createState() => _QuestionsPage2State();
}

class _QuestionsPage2State extends State<QuestionsPage2> {
  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 18.0, color: Color(0xFF130D26));
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 16.0),
      pageColor: Color(0xFF130D26),
    );

    return IntroductionScreen(
      globalBackgroundColor: Color(0xFF130D26),
      showSkipButton: false,
      showNextButton: false,
      isProgress: false,
      done: Text(""),
      onDone: () {},
      pages: [
        PageViewModel(
          titleWidget: new Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              Text(
                "What brings you to Apollo?",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 21, color: Color(0xFF67e2f7)),
              ),
            ],
          ),
          bodyWidget: new Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              Text(
                "We’ll personalize recommendations based on your liking!",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14, color: Color(0xFFacecf7)),
              ),
              SizedBox(
                height: 100,
              ),
              MaterialButton(
                padding: const EdgeInsets.fromLTRB(104, 0, 104, 0),
                onPressed: () {},
                child: const Text(
                  "Reduce Stress",
                  style: TextStyle(
                    color: Color(0xFF130D26),
                    fontSize: 14,
                  ),
                ),
                color: Color(0xFFacecf7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              MaterialButton(
                padding: const EdgeInsets.fromLTRB(82, 0, 82, 0),
                onPressed: () {},
                child: const Text(
                  "Increase Happiness",
                  style: TextStyle(
                    color: Color(0xFF130D26),
                    fontSize: 14,
                  ),
                ),
                color: Color(0xFFacecf7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              MaterialButton(
                padding: const EdgeInsets.fromLTRB(99, 0, 99, 0),
                onPressed: () {},
                child: const Text(
                  "Reduce Anxiety",
                  style: TextStyle(
                    color: Color(0xFF130D26),
                    fontSize: 14,
                  ),
                ),
                color: Color(0xFFacecf7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              MaterialButton(
                padding: const EdgeInsets.fromLTRB(43, 0, 43, 0),
                onPressed: () {},
                child: const Text(
                  "Improve Overall Performance",
                  style: TextStyle(
                    color: Color(0xFF130D26),
                    fontSize: 14,
                  ),
                ),
                color: Color(0xFFacecf7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              MaterialButton(
                padding: const EdgeInsets.fromLTRB(79, 0, 79, 0),
                onPressed: () {},
                child: const Text(
                  "Build-up Self Esteem",
                  style: TextStyle(
                    color: Color(0xFF130D26),
                    fontSize: 14,
                  ),
                ),
                color: Color(0xFFacecf7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              MaterialButton(
                padding: const EdgeInsets.fromLTRB(55, 0, 55, 0),
                onPressed: () {},
                child: const Text(
                  "Better Sleeping Experience",
                  style: TextStyle(
                    color: Color(0xFF130D26),
                    fontSize: 14,
                  ),
                ),
                color: Color(0xFFacecf7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              MaterialButton(
                padding: const EdgeInsets.fromLTRB(73, 0, 73, 0),
                onPressed: () {},
                child: const Text(
                  "Looking for Motivation",
                  style: TextStyle(
                    color: Color(0xFF130D26),
                    fontSize: 14,
                  ),
                ),
                color: Color(0xFFacecf7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              MaterialButton(
                padding: const EdgeInsets.fromLTRB(42, 0, 42, 0),
                onPressed: () {},
                child: const Text(
                  "Fix Anger Management Issues",
                  style: TextStyle(
                    color: Color(0xFF130D26),
                    fontSize: 14,
                  ),
                ),
                color: Color(0xFFacecf7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ],
          ),
          footer: RaisedButton(
            padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => DevMessage()));
            },
            child: const Text(
              "Next",
              style: TextStyle(color: Color(0xFF130D26), fontSize: 16),
            ),
            color: Color(0xFF67e2f7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          decoration: const PageDecoration(
            footerPadding: const EdgeInsets.only(top: 55),
            imagePadding: const EdgeInsets.fromLTRB(50, 150, 50, 0),
            titlePadding: const EdgeInsets.fromLTRB(30, 70, 30, 0),
            descriptionPadding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
            pageColor: Color(0xFF130D26),
            titleTextStyle: TextStyle(
                color: Color(0xFF67e2f7),
                fontSize: 28.0,
                fontWeight: FontWeight.w700),
            bodyTextStyle: TextStyle(color: Color(0xFFacecf7), fontSize: 12.0),
          ),
        ),
      ],
    );
  }
}*/

class DevMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 18.0, color: Color(0xFF130D26));
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 16.0),
      pageColor: Color(0xFF130D26),
    );

    return IntroductionScreen(
      globalBackgroundColor: Color(0xFF130D26),
      showSkipButton: false,
      showNextButton: false,
      isProgress: false,
      done: Text(""),
      onDone: () {},
      pages: [
        PageViewModel(
          titleWidget: new Wrap(
            children: <Widget>[
              Text(
                "Apollo believes in you!",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 24,
                    color: Color(0xFFad75f7),
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
          bodyWidget: new Wrap(
            alignment: WrapAlignment.center,
            children: <Widget>[
              Text(
                "We know that you have the strength to become better than who you were before. We are more than happy to assist you in your journey to improvement! Now, are you ready for the upcoming journey?",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFFdac4f7),
                    fontWeight: FontWeight.bold,
                    height: 1.25),
              )
            ],
          ),
          footer: RaisedButton(
            padding: const EdgeInsets.fromLTRB(70, 0, 70, 0),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => MoodCheckIn()));
            },
            child: const Text(
              "Continue!",
              style: TextStyle(color: Color(0xFF130D26), fontSize: 16),
            ),
            color: Color(0xFFad75f7),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          decoration: const PageDecoration(
            footerPadding: const EdgeInsets.only(top: 70),
            imagePadding: const EdgeInsets.fromLTRB(50, 150, 50, 0),
            titlePadding: const EdgeInsets.fromLTRB(40, 330, 40, 0),
            descriptionPadding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
            pageColor: Color(0xFF130D26),
            titleTextStyle: TextStyle(
                color: Color(0xFF67e2f7),
                fontSize: 28.0,
                fontWeight: FontWeight.w700),
            bodyTextStyle: TextStyle(color: Color(0xFFacecf7), fontSize: 12.0),
          ),
        ),
      ],
    );
  }
}
