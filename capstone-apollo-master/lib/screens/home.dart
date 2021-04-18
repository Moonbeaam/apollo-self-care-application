import 'package:apolloApp/services/crud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'explore.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:apolloApp/exercise_screens/meditation.dart';
import 'package:apolloApp/exercise_screens/sleeping.dart';
import 'package:apolloApp/exercise_screens/breathing.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

//I want the user's name input to be stored first to a database, then it will get called again to display their inputted name

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User user;
  bool isLoggedIn = false;

  Map data;

  String authorName;

  Future<void> getUser() async {
    User firebaseUser = firebaseAuth.currentUser;
    firebaseUser?.toString();
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
    FlutterStatusbarManager.setTranslucent(true);
    FlutterStatusbarManager.setStyle(StatusBarStyle.LIGHT_CONTENT);
  }

  addData() async {
    Map<String, dynamic> demoData = {"name": authorName};

    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('data');
    collectionReference.add(demoData);
  }

  fetchData() {
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('data');
    collectionReference.snapshots().listen(
      (snapshot) {
        setState(
          () {
            data = snapshot.docs[0].data as Map;
          },
        );
      },
    );
  }

  CrudMethods crudMethods = new CrudMethods();

  final nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  final breathing = Image.asset("assets/images/breathingexercise2.png");
  final meditation = Image.asset("assets/images/meditationexercise.png");
  final sleeping = Image.asset("assets/images/sleepingexercise.png");
  final bhlogo = Image.asset("assets/images/Bahrain Logo.png");

  @override
  void didChangeDependencies() {
    precacheImage(breathing.image, context);
    precacheImage(meditation.image, context);
    precacheImage(sleeping.image, context);
    precacheImage(bhlogo.image, context);
    super.didChangeDependencies();
  }

  bool exploreTap = false;

  bool playing = false;
  IconData playButton = Icons.music_note;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //Positioned(
        //  right: 30,
        //  child: Container(
        //    child: NeumorphicIcon(
        //      Icons.music_note,
        //      size: 20,
        //    ),
        //  ),
        //),
        Container(
          margin: const EdgeInsets.only(
            left: 200,
            top: 80,
          ),
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFFF1B6B),
                Color(0xFF45CAFF),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(
            left: 20,
            top: 220,
          ),
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Color(0xFFf89b29),
                Color(0xFFFF1B6B),
              ],
            ),
          ),
        ),
        ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(
                    left: 45.0,
                    top: 10.0,
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Hi there,",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.topLeft,
                        child: Text(
                          ("${user.displayName}!"),
                          style: TextStyle(
                            fontSize: 35,
                            color: Color(0xFFad75f7),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                GlassmorphicContainer(
                  margin: const EdgeInsets.only(
                    top: 20,
                  ),
                  width: 350,
                  height: 110,
                  borderRadius: 20,
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
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              top: 35.0,
                              left: 25.0,
                            ),
                            child: Text(
                              "Mental Health",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              left: 25.0,
                            ),
                            child: Text(
                              "Explore more about mental health",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 12,
                                  color: Color(0xFFB5B3BC),
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      GestureDetector(
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
                                  alignment: Alignment.topCenter,
                                  child: child,
                                );
                              },
                              pageBuilder: (context, animation, animationTime) {
                                return ExplorePage();
                              },
                            ),
                          );
                        },
                        child: Container(
                          alignment: Alignment.centerRight,
                          margin: const EdgeInsets.only(
                            left: 30,
                          ),
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0xFFDAC4F7),
                                Color(0xFFad75f7),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              LineIcons.angleRight,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                CarouselSlider(
                  items: [
                    GestureDetector(
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
                                alignment: Alignment.bottomCenter,
                                child: child,
                              );
                            },
                            pageBuilder: (context, animation, animationTime) {
                              return BreathingPage();
                            },
                          ),
                        );
                      },
                      child: BreathingWidget(),
                    ),
                    GestureDetector(
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
                                alignment: Alignment.bottomCenter,
                                child: child,
                              );
                            },
                            pageBuilder: (context, animation, animationTime) {
                              return MeditationPage();
                            },
                          ),
                        );
                      },
                      child: MeditationWidget(),
                    ),
                    GestureDetector(
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
                                alignment: Alignment.bottomCenter,
                                child: child,
                              );
                            },
                            pageBuilder: (context, animation, animationTime) {
                              return SleepingPage();
                            },
                          ),
                        );
                      },
                      child: SleepingWidget(),
                    ),
                  ],
                  options: CarouselOptions(
                    aspectRatio: 1 / 1,
                    height: 470,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    initialPage: 0,
                    viewportFraction: 0.9,
                  ),
                ),
                SizedBox(height: 25),
                Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        children: [
                          Text(
                            "Hotlines",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                          Spacer(),
                          MaterialButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            color: Color(0xFFFF1B6B),
                            onPressed: () {},
                            child: Text(
                              "For emergency purposes",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(
                        top: 25,
                        bottom: 40,
                        left: 30,
                        right: 30,
                      ),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreenMOHScreen(),
                                ),
                              );
                            },
                            child: Container(
                              width: 180,
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/images/Ministry of Health-Mental Health.png",
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    decoration: BoxDecoration(
                                      color: Color(0xFF565eaf),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 10),
                                          blurRadius: 10,
                                          color: Color(0xFF565eaf)
                                              .withOpacity(0.5),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "Learn more",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreenCOVIDScreen(),
                                ),
                              );
                            },
                            child: Container(
                              width: 180,
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/images/Ministry of Health-COVID.png",
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFfee7f1),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 10),
                                          blurRadius: 10,
                                          color: Colors.white.withOpacity(0.23),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "Learn more",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Color(0xFF9d81f2),
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      DetailsScreenGeneralScreen(),
                                ),
                              );
                            },
                            child: Container(
                              width: 180,
                              child: Column(
                                children: <Widget>[
                                  Image.asset(
                                    "assets/images/Ministry of Health-Emergency.png",
                                  ),
                                  Container(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFc24b40),
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      ),
                                      boxShadow: [
                                        BoxShadow(
                                          offset: Offset(0, 10),
                                          blurRadius: 10,
                                          color: Colors.white.withOpacity(0.23),
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 10),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: "Learn more",
                                                  style: TextStyle(
                                                    fontSize: 20,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(width: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class BlogsTile extends StatelessWidget {
  String name;
  BlogsTile({@required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.only(
        left: 45.0,
        top: 10.0,
      ),
      child: Text(
        (name),
        style: GoogleFonts.montserrat(
          textStyle: TextStyle(
            fontSize: 30,
            color: Color(0xFFad75f7),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class BreathingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      height: 430,
      blur: 20,
      width: 350,
      borderRadius: 30,
      linearGradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          Color(0xFFffffff).withOpacity(0.1),
          Color(0xFFFFFFFF).withOpacity(0.01),
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
      child: Container(
        //margin: const EdgeInsets.only(
        //bottom: 10,
        //left: 10,
        //right: 5,
        //),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Inhale.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class MeditationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      height: 430,
      blur: 20,
      width: 350,
      borderRadius: 30,
      linearGradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          Color(0xFFffffff).withOpacity(0.1),
          Color(0xFFFFFFFF).withOpacity(0.01),
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
      child: Container(
        //height: 300,
        //width: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/meditationexercise.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

class SleepingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      margin: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      height: 430,
      blur: 20,
      width: 350,
      borderRadius: 30,
      linearGradient: LinearGradient(
        begin: Alignment.bottomLeft,
        end: Alignment.topRight,
        colors: [
          Color(0xFFffffff).withOpacity(0.1),
          Color(0xFFFFFFFF).withOpacity(0.01),
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
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/sleepingexercise.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}

//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE
//HOTLINE

//MOHSCREEN
//MOHSCREEN
//MOHSCREEN
//MOHSCREEN
//MOHSCREEN
//MOHSCREEN
//MOHSCREEN
//MOHSCREEN
//MOHSCREEN
//MOHSCREEN
//MOHSCREEN
//MOHSCREEN
//MOHSCREEN
//MOHSCREEN
//MOHSCREEN
//MOHSCREEN
//MOHSCREEN
//MOHSCREEN
class DetailsScreenMOHScreen extends StatefulWidget {
  @override
  _DetailsScreenMOHScreenState createState() => _DetailsScreenMOHScreenState();
}

class _DetailsScreenMOHScreenState extends State<DetailsScreenMOHScreen> {
  final bhlogo = Image.asset("assets/images/Bahrain Logo.png");

  void didChangeDependencies() {
    precacheImage(bhlogo.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF130D26),
      appBar: null,
      body: MOHScreen(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF130D26),
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.chevron_left_rounded,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}

class MOHScreen extends StatefulWidget {
  @override
  _MOHScreenState createState() => _MOHScreenState();
}

class _MOHScreenState extends State<MOHScreen> {
  final bhlogo = Image.asset("assets/images/Bahrain Logo.png");

  void didChangeDependencies() {
    precacheImage(bhlogo.image, context);
    super.didChangeDependencies();
  }

  void launchCaller(int number) async {
    var url = "tel: ${number.toString()}";
    if (await canLaunch(url)) {
      await (launch(url));
    } else {
      throw "Could not place call";
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 800,
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    clipBehavior: Clip.none,
                    alignment: Alignment.topRight,
                    child: Image(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/images/Bahrain Logo.png",
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.43),
                  padding: EdgeInsets.only(
                      top: size.height * 0.05, left: 10, right: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFFc280ff),
                        Color(0xFFf77878),
                      ],
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Patient Relations Office - Psychiatric Hospital",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          "Our mission is to work proactively to provide secondary and tertiary healthcare services to the residents of the Kingdom of Bahrain. We hope to do so by making the best use of our available resources and by promoting quality improvement initiatives and establishing guidelines in the organization. We also aim to increase awareness towards personal responsibility for health maintenance, in addition to functioning as a teaching and training Hospital.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                            color: Colors.white,
                            fontSize: 12.5,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              RaisedButton.icon(
                                onPressed: () {
                                  launchCaller(39425525);
                                },
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 15,
                                ),
                                color: Color(0xFFFF1B6B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Call now",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Icon(
                            Icons.chevron_left_rounded,
                            size: 40,
                            color: Colors.white,
                          ),
                          alignment: Alignment.topLeft,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Bahrain",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Ministry of Health",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Available Languages:",
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      RaisedButton.icon(
                        onPressed: null,
                        icon: Image.asset(
                          "assets/images/Bahrain Flag.png",
                          height: 20,
                        ),
                        label: Text(
                          "Arabic",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ),
                      RaisedButton.icon(
                        onPressed: null,
                        icon: Image.asset(
                          "assets/images/USA Flag.png",
                          height: 20,
                        ),
                        label: Text(
                          "English",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "*Available only from 8:00 AM to 1:00 PM GMT+3",
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//COVIDSCREEN
//COVIDSCREEN
//COVIDSCREEN
//COVIDSCREEN
//COVIDSCREEN
//COVIDSCREEN
//COVIDSCREEN
//COVIDSCREEN
//COVIDSCREEN
//COVIDSCREEN
//COVIDSCREEN
//COVIDSCREEN
//COVIDSCREEN
//COVIDSCREEN
//COVIDSCREEN
//COVIDSCREEN
//COVIDSCREEN
//COVIDSCREEN
//COVIDSCREEN
//COVIDSCREEN
//COVIDSCREEN
//COVIDSCREEN
//COVIDSCREEN
//COVIDSCREEN
class DetailsScreenCOVIDScreen extends StatefulWidget {
  @override
  _DetailsScreenCOVIDScreenState createState() =>
      _DetailsScreenCOVIDScreenState();
}

class _DetailsScreenCOVIDScreenState extends State<DetailsScreenCOVIDScreen> {
  final bhlogo = Image.asset("assets/images/Bahrain Logo.png");

  void didChangeDependencies() {
    precacheImage(bhlogo.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF130D26),
      appBar: null,
      body: COVIDScreen(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF130D26),
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.chevron_left_rounded,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}

class COVIDScreen extends StatefulWidget {
  @override
  _COVIDScreenState createState() => _COVIDScreenState();
}

class _COVIDScreenState extends State<COVIDScreen> {
  final bhlogo = Image.asset("assets/images/Bahrain Logo.png");

  void didChangeDependencies() {
    precacheImage(bhlogo.image, context);
    super.didChangeDependencies();
  }

  void launchCaller(int number) async {
    var url = "tel: ${number.toString()}";
    if (await canLaunch(url)) {
      await (launch(url));
    } else {
      throw "Could not place call";
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 800,
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    clipBehavior: Clip.none,
                    alignment: Alignment.topRight,
                    child: Image(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/images/Bahrain Logo.png",
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.43),
                  padding: EdgeInsets.only(
                      top: size.height * 0.05, left: 10, right: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFFc280ff),
                        Color(0xFFf77878),
                      ],
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Hotlines Service for COVID-19",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          "Fear, worry, and stress are normal responses to perceived or real threats, and at times when we are faced with uncertainty or the unknown. So, it's normal and understandable that people are experiencing fear in the context of the COVID-19 pandemic. If ever you are experiencing any COVID-19 symptom such as coughing, shortness of breath, and fever, don't hesitate to contact the Ministry of Health using the national coronavirus hotline.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                            color: Colors.white,
                            fontSize: 12.5,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              RaisedButton.icon(
                                onPressed: () {
                                  launchCaller(444);
                                },
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 15,
                                ),
                                color: Color(0xFFFF1B6B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Call now",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Icon(
                            Icons.chevron_left_rounded,
                            size: 40,
                            color: Colors.white,
                          ),
                          alignment: Alignment.topLeft,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Bahrain",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Ministry of Health",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Available Languages:",
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      RaisedButton.icon(
                        onPressed: null,
                        icon: Image.asset(
                          "assets/images/Bahrain Flag.png",
                          height: 20,
                        ),
                        label: Text(
                          "Arabic",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ),
                      RaisedButton.icon(
                        onPressed: null,
                        icon: Image.asset(
                          "assets/images/USA Flag.png",
                          height: 20,
                        ),
                        label: Text(
                          "English",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "*Available 24/7",
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//GENERALEMERGENCY
//GENERALEMERGENCY
//GENERALEMERGENCY
//GENERALEMERGENCY
//GENERALEMERGENCY
//GENERALEMERGENCY
//GENERALEMERGENCY
//GENERALEMERGENCY
//GENERALEMERGENCY
//GENERALEMERGENCY
//GENERALEMERGENCY
//GENERALEMERGENCY
//GENERALEMERGENCY
//GENERALEMERGENCY
//GENERALEMERGENCY
//GENERALEMERGENCY
//GENERALEMERGENCY
//GENERALEMERGENCY
//GENERALEMERGENCY
//GENERALEMERGENCY
//GENERALEMERGENCY
//GENERALEMERGENCY
//GENERALEMERGENCY
//GENERALEMERGENCY
class DetailsScreenGeneralScreen extends StatefulWidget {
  @override
  _DetailsScreenGeneralScreenState createState() =>
      _DetailsScreenGeneralScreenState();
}

class _DetailsScreenGeneralScreenState
    extends State<DetailsScreenGeneralScreen> {
  final bhlogo = Image.asset("assets/images/Bahrain Logo.png");

  void didChangeDependencies() {
    precacheImage(bhlogo.image, context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF130D26),
      appBar: null,
      body: GeneralScreen(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF130D26),
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.chevron_left_rounded,
          color: Colors.white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}

class GeneralScreen extends StatefulWidget {
  @override
  _GeneralScreenState createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  final bhlogo = Image.asset("assets/images/Bahrain Logo.png");

  void didChangeDependencies() {
    precacheImage(bhlogo.image, context);
    super.didChangeDependencies();
  }

  void launchCaller(int number) async {
    var url = "tel: ${number.toString()}";
    if (await canLaunch(url)) {
      await (launch(url));
    } else {
      throw "Could not place call";
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 950,
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(left: 100),
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    clipBehavior: Clip.none,
                    alignment: Alignment.topRight,
                    child: Image(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      fit: BoxFit.cover,
                      image: AssetImage(
                        "assets/images/Bahrain Logo.png",
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.43),
                  padding: EdgeInsets.only(
                      top: size.height * 0.05, left: 10, right: 10),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFFc280ff),
                        Color(0xFFf77878),
                      ],
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        child: Text(
                          "Emergency Call Center",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Text(
                          "“Health for All” is well recognized in Kingdom of Bahrain. The Emergency Medical Services are highly responsive to all emergency calls and requests. All steps needed is to dial the toll-free number 999 from any phone to call for ambulance services. But before calling, you need to be aware of the emergency calls guidelines:\n\n • 999 is Emergency Services, Fire, police & Ambulance\n\n • When dialing 999 you will be asked which service you\n    need\n\n • Give clear details of the accident or emergency, the\n   number of causalities, any additional hazards and full\n   address\n\n • Do not put the phone down until the control officer\n   clear the line",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            height: 1.5,
                            color: Colors.white,
                            fontSize: 12.5,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              RaisedButton.icon(
                                onPressed: () {
                                  launchCaller(999);
                                },
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 30,
                                  vertical: 15,
                                ),
                                color: Color(0xFFFF1B6B),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(35),
                                ),
                                icon: Icon(
                                  Icons.phone,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  "Call now",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          child: Icon(
                            Icons.chevron_left_rounded,
                            size: 40,
                            color: Colors.white,
                          ),
                          alignment: Alignment.topLeft,
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        "Bahrain",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Ministry of Health",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Available Languages:",
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      SizedBox(height: 10),
                      RaisedButton.icon(
                        onPressed: null,
                        icon: Image.asset(
                          "assets/images/Bahrain Flag.png",
                          height: 20,
                        ),
                        label: Text(
                          "Arabic",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ),
                      RaisedButton.icon(
                        onPressed: null,
                        icon: Image.asset(
                          "assets/images/USA Flag.png",
                          height: 20,
                        ),
                        label: Text(
                          "English",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 15),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "*Available 24/7",
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
