import 'package:apolloApp/auth/auth.dart';
import 'package:apolloApp/screens/explore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:line_icons/line_icons.dart';
import 'navbarkey.dart';
import 'package:apolloApp/screens/home.dart';
import 'package:apolloApp/screens/journal.dart';
import 'package:apolloApp/screens/personal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:apolloApp/screens/about.dart';
import 'package:apolloApp/screens/contact.dart';
import 'package:apolloApp/screens/donate.dart';
import 'package:apolloApp/screens/tos.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';

class SelfCareApp extends StatefulWidget {
  final String name;
  SelfCareApp({Key key, this.name}) : super(key: key);

  static String id = 'SelfCareApp';
  //const SelfCareApp({Key key}) : super(key: key);
  @override
  _SelfCareAppState createState() => _SelfCareAppState(name);
  /*State<SelfCareApp> createState() {
    // TODO: implement createState
    return DashHomePage();
  }*/
}

class _SelfCareAppState extends State<SelfCareApp> {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  User user;
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  bool isLoggedIn = false;

  checkAuthentification() async {
    firebaseAuth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AuthScreen(
                      onRegisterClicked: () {},
                    )));
      }
    });
  }

  getUser() async {
    User firebaseUser = firebaseAuth.currentUser;
    await firebaseUser?.reload();
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
    //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    this.checkAuthentification();
    this.getUser();
    FlutterStatusbarManager.setTranslucent(true);
    FlutterStatusbarManager.setStyle(StatusBarStyle.LIGHT_CONTENT);

    _messaging.getToken().then(
      (token) {
        print(token);
      },
    );
  }

  final String name;
  _SelfCareAppState(this.name);

  int selectedPage = 0;
  var screen = [HomePage(), JournalPage(), PersonalPage()];
  var pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Exit"),
            content: Text("Exit the app?"),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("No"),
              ),
              TextButton(
                onPressed: () async {
                  await SystemChannels.platform
                      .invokeMethod<void>('SystemNavigator.pop');
                },
                child: Text("Yes"),
              ),
            ],
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(backgroundColor: Colors.transparent, elevation: 0),
        drawer: Drawer(
          child: Container(
            color: Color(0xFF130D26),
            child: ListView(
              children: [
                GlassmorphicContainer(
                  margin: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 10,
                  ),
                  width: null,
                  height: 150,
                  borderRadius: 30,
                  blur: 20,
                  linearGradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFFffffff).withOpacity(0.1),
                      Color(0xFFFFFFFF).withOpacity(0.01),
                    ],
                    stops: [
                      0.1,
                      1,
                    ],
                  ),
                  border: 3,
                  borderGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFFFFFF).withOpacity(0.1),
                      Color(0xFFFFFFFF).withOpacity(0.01),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/images/AppLogo.png'),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Container(
                            child: Text(
                              "APOLLO",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 32,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        child: Text(
                          "Keep on Going, You Got This",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GlassmorphicContainer(
                  margin: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 20,
                  ),
                  width: null,
                  height: 600,
                  borderRadius: 30,
                  blur: 20,
                  linearGradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: [
                      Color(0xFFffffff).withOpacity(0.1),
                      Color(0xFFFFFFFF).withOpacity(0.01),
                    ],
                    stops: [
                      0.1,
                      1,
                    ],
                  ),
                  border: 3,
                  borderGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFFFFFF).withOpacity(0.1),
                      Color(0xFFFFFFFF).withOpacity(0.01),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 500),
                              transitionsBuilder:
                                  (context, animation, animationTime, child) {
                                animation = CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.linearToEaseOut,
                                );
                                return ScaleTransition(
                                  scale: animation,
                                  alignment: Alignment.centerLeft,
                                  child: child,
                                );
                              },
                              pageBuilder: (context, animation, animationTime) {
                                return About();
                              },
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                right: 10,
                                left: 30,
                                top: 30,
                                bottom: 10,
                              ),
                              child: Icon(
                                LineIcons.questionCircle,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                top: 30,
                                bottom: 10,
                              ),
                              child: Text(
                                "About",
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 500),
                              transitionsBuilder:
                                  (context, animation, animationTime, child) {
                                animation = CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.linearToEaseOut,
                                );
                                return ScaleTransition(
                                  scale: animation,
                                  alignment: Alignment.centerLeft,
                                  child: child,
                                );
                              },
                              pageBuilder: (context, animation, animationTime) {
                                return Donate();
                              },
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                right: 10,
                                left: 30,
                                top: 30,
                                bottom: 10,
                              ),
                              child: Icon(
                                LineIcons.donate,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                top: 30,
                                bottom: 10,
                              ),
                              child: Text(
                                "Donate",
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 500),
                              transitionsBuilder:
                                  (context, animation, animationTime, child) {
                                animation = CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.linearToEaseOut,
                                );
                                return ScaleTransition(
                                  scale: animation,
                                  alignment: Alignment.centerLeft,
                                  child: child,
                                );
                              },
                              pageBuilder: (context, animation, animationTime) {
                                return TermsOfService();
                              },
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                right: 10,
                                left: 30,
                                top: 30,
                                bottom: 10,
                              ),
                              child: Icon(
                                LineIcons.exclamation,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                top: 30,
                                bottom: 10,
                              ),
                              child: Text(
                                "Term of Service",
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration: Duration(milliseconds: 500),
                              transitionsBuilder:
                                  (context, animation, animationTime, child) {
                                animation = CurvedAnimation(
                                  parent: animation,
                                  curve: Curves.linearToEaseOut,
                                );
                                return ScaleTransition(
                                  scale: animation,
                                  alignment: Alignment.centerLeft,
                                  child: child,
                                );
                              },
                              pageBuilder: (context, animation, animationTime) {
                                return Contact();
                              },
                            ),
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                right: 10,
                                left: 30,
                                top: 30,
                                bottom: 10,
                              ),
                              child: Icon(
                                LineIcons.envelope,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                top: 30,
                                bottom: 10,
                              ),
                              child: Text(
                                "Contact Us",
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        body: PageView(
          children: screen,
          physics: NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(
              () {
                selectedPage = index;
              },
            );
          },
          controller: pageController,
        ),
        bottomNavigationBar: Container(
          margin: EdgeInsets.only(
            left: 24,
            right: 24,
            bottom: 10,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFDAC4F7),
                Color(0xFFad75f7),
              ],
            ),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              ),
            ],
          ),
          height: 60,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 8,
              ),
              child: GNav(
                gap: 8,
                activeColor: Colors.white,
                iconSize: 24.0,
                padding: EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 7,
                ),
                duration: Duration(milliseconds: 800),
                tabs: [
                  GButton(
                    icon: LineIcons.home,
                    text: "Home",
                    backgroundColor: Color(0xFF130D26),
                    iconColor: Colors.white,
                  ),
                  GButton(
                    icon: LineIcons.book,
                    text: "Journal",
                    backgroundColor: Color(0xFF130D26),
                    iconColor: Colors.white,
                  ),
                  GButton(
                    icon: LineIcons.user,
                    text: "Personal",
                    backgroundColor: Color(0xFF130D26),
                    iconColor: Colors.white,
                  ),
                ],
                onTabChange: (index) {
                  setState(
                    () {
                      selectedPage = index;
                      pageController.animateToPage(
                        selectedPage,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
        backgroundColor: Color(0xFF130D26),
      ),
    );
  }
}
