import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:apolloApp/mood_check_in.dart';

MoodCheckIn _moodCheckIn = new MoodCheckIn();

Image moodDisplay;

double sliderData;

class PersonalPage extends StatefulWidget {
  @override
  _PersonalPageState createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  Future<SharedPreferences> sprefs = SharedPreferences.getInstance();

  int _count = 0;

  bool showAvg = false;

  var sliderValue = 4.0;

  int breathingExerciseCounter = 0;

  int meditationExerciseCounter = 0;

  int sleepingExerciseCounter = 0;

  @override
  void initState() {
    super.initState();
    getData();
    getBreathingExerciseData();
    getMeditationExerciseData();
    getSleepingExerciseData();
    getSliderValue();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  Future<Null> getData() async {
    final SharedPreferences prefs = await sprefs;
    int data = prefs.getString("count") != null
        ? int.parse(prefs.getString("count"))
        : 0;

    this.setState(() {
      _count++;
    });
  }

  Future<Null> incre() async {
    final SharedPreferences prefs = await sprefs;
    this.setState(() {
      _count = _count + 3;
      prefs.setString("count", _count.toString());
    });
  }

  checkIsTodayVisit() async {
    Future<SharedPreferences> prefs = SharedPreferences.getInstance();

    SharedPreferences preferences = await prefs;
    String lastVisitDate = preferences.get("mDateKey");

    String toDayDate = DateTime.now().day.toString();

    if (toDayDate == lastVisitDate) {
      //When user opens app again and again

    } else {
      //When user opens the app for the first time of the day
      preferences.setString("mDateKey", toDayDate);
      incre();
    }
  }

  Future<Null> getBreathingExerciseData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int breathingData = prefs.getString('breathingCount') != null
        ? int.parse(prefs.getString('breathingCount'))
        : breathingExerciseCounter;

    this.setState(() {
      breathingExerciseCounter = breathingData;
    });
  }

  Future<Null> getMeditationExerciseData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int meditationData = prefs.getString('meditationCount') != null
        ? int.parse(prefs.getString('meditationCount'))
        : meditationExerciseCounter;

    this.setState(() {
      meditationExerciseCounter = meditationData;
    });
  }

  Future<Null> getSleepingExerciseData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    int sleepingData = prefs.getString('sleepingCount') != null
        ? int.parse(prefs.getString('sleepingCount'))
        : sleepingExerciseCounter;

    this.setState(() {
      sleepingExerciseCounter = sleepingData;
    });
  }

  Future<Null> getSliderValue() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    double sliderData = prefs.getString("mood") != null
        ? double.parse(prefs.getString("mood"))
        : sliderValue;

    this.setState(
      () {
        sliderValue = sliderData;
        if (sliderValue <= 4.0 && sliderValue >= 3.1) {
          moodDisplay = Image.asset("assets/images/Happy 3.png");
        }
        if (sliderValue <= 3.0 && sliderValue >= 2.1) {
          moodDisplay = Image.asset("assets/images/Good 3.png");
        }
        if (sliderValue <= 2.0 && sliderValue >= 1.1) {
          moodDisplay = Image.asset("assets/images/Neutral 3.png");
        }
        if (sliderValue <= 1.0 && sliderValue >= 0.1) {
          moodDisplay = Image.asset("assets/images/Sad 3.png");
        }
        if (sliderValue <= 0.0 && sliderValue >= 0.0) {
          moodDisplay = Image.asset("assets/images/Stressed 3.png");
        }
      },
    );
  }

  _buildImage() => Container(
        child: moodDisplay,
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 12, left: 45, bottom: 35),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "The Journey",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Color(0xffc7b3e2),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: RegionTabBar(count: _count),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      child: Row(
                        children: [
                          //Breathing Exercise
                          //Breathing Exercise
                          //Breathing Exercise
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 41, vertical: 20),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xFF130d26),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF1f1640),
                                    offset: Offset(-10, -10),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                  ),
                                  BoxShadow(
                                    color: Color(0xFF06040d),
                                    offset: Offset(10, 10),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 47.5),
                                      child: Text(
                                        "Breathing Exercise Streaks",
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            color: Color(0xffad75f7),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      top: 20,
                                    ),
                                    child: Row(
                                      children: [
                                        Text(
                                          "$breathingExerciseCounter",
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 50,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Positioned(
                                          right: 90,
                                          child: Icon(
                                            //Icons.arrow_right,
                                            Icons.fast_forward,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //Meditation Exercise
                          //Meditation Exercise
                          //Meditation Exercise
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 41),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xFF130d26),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF1f1640),
                                    offset: Offset(-10, -10),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                  ),
                                  BoxShadow(
                                    color: Color(0xFF06040d),
                                    offset: Offset(10, 10),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 47.5),
                                      child: Text(
                                        "Meditation Exercise Streaks",
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            color: Color(0xffad75f7),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      top: 20,
                                    ),
                                    child: Row(
                                      children: [
                                        Positioned(
                                          right: 90,
                                          child: Icon(
                                            Icons.arrow_left,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Text(
                                          "$meditationExerciseCounter",
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 50,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                        Positioned(
                                          right: 90,
                                          child: Icon(
                                            Icons.arrow_right,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //Sleeping Exercise
                          //Sleeping Exercise
                          //Sleeping Exercise
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 41),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xFF130d26),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0xFF1f1640),
                                    offset: Offset(-10, -10),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                  ),
                                  BoxShadow(
                                    color: Color(0xFF06040d),
                                    offset: Offset(10, 10),
                                    blurRadius: 15,
                                    spreadRadius: 1,
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(
                                      top: 20,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 47.5),
                                      child: Text(
                                        "Sleeping Exercise Streaks",
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            color: Color(0xffad75f7),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      top: 20,
                                    ),
                                    child: Row(
                                      children: [
                                        Positioned(
                                          right: 90,
                                          child: Icon(
                                            //Icons.arrow_left,
                                            Icons.fast_rewind,
                                            color: Colors.white,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          "$sleepingExerciseCounter",
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 50,
                                              fontWeight: FontWeight.w500,
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
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 41),
                      child: Container(
                        alignment: Alignment.center,
                        height: 290,
                        decoration: BoxDecoration(
                          color: Color(0xFF130d26),
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF1f1640),
                              offset: Offset(-10, -10),
                              blurRadius: 15,
                              spreadRadius: 1,
                            ),
                            BoxShadow(
                              color: Color(0xFF06040d),
                              offset: Offset(10, 10),
                              blurRadius: 15,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(
                                top: 20,
                                bottom: 20,
                              ),
                              child: Text(
                                "Mood of the Day | MOTD",
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 200,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: moodDisplay.image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 50,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

//class StatsTabBar extends StatelessWidget {
//  const StatsTabBar({
//    Key key,
//  }) : super(key: key);
//
//  @override
//  Widget build(BuildContext context) {
//    return Padding(
//      padding: const EdgeInsets.all(20),
//      child: Container(
//        child: DefaultTabController(
//          length: 3,
//          child: TabBar(
//            indicatorColor: Colors.transparent,
//            labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
//            labelColor: Colors.white,
//            unselectedLabelColor: Colors.white60,
//            tabs: [
//              Text("Overall"),
//              Text("Today"),
//              Text("Yesterday"),
//            ],
//            onTap: (index) {},
//          ),
//        ),
//      ),
//    );
//  }
//}

class RegionTabBar extends StatelessWidget {
  const RegionTabBar({
    Key key,
    @required int count,
  })  : _count = count,
        super(key: key);

  final int _count;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 41),
              child: Container(
                alignment: Alignment.topLeft,
                decoration: BoxDecoration(
                  color: Color(0xFF130d26),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xFF1f1640),
                      offset: Offset(-10, -10),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                    BoxShadow(
                      color: Color(0xFF06040d),
                      offset: Offset(10, 10),
                      blurRadius: 15,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Streaks",
                        style: TextStyle(
                          color: Color(0xffad75f7),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                        child: Divider(
                          color: Colors.white,
                          thickness: 1,
                        ),
                      ),
                      Text(
                        "Current Streak: $_count day/s",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//class RefreshPage extends StatefulWidget {
//  @override
//  _RefreshPageState createState() => _RefreshPageState();
//}
//
//class _RefreshPageState extends State<RefreshPage> {
//  bool _enablePullDown = true;
//  RefreshController _refreshController;
//  var _scaffoldKey = GlobalKey<ScaffoldState>();
//
//  @override
//  void initState() {
//    _refreshController = RefreshController();
//    super.initState();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Stack(
//      children: [
//        Scaffold(
//          backgroundColor: Color(0xFF130d26),
//          key: _scaffoldKey,
//          body: SmartRefresher(
//            enablePullDown: _enablePullDown,
//            header: WaterDropHeader(
//              waterDropColor: Color(0xffad75f7),
//              complete: Text(
//                'Refreshed',
//                style: TextStyle(
//                    color: Colors.white,
//                    fontSize: 16,
//                    fontWeight: FontWeight.w500),
//              ),
//              failed: Text('Failed',
//                  style: TextStyle(color: Colors.red, fontSize: 18)),
//            ),
//            controller: _refreshController,
//            onRefresh: _onRefresh,
//            onLoading: _onLoading,
//            child: _personalPage(),
//          ),
//        ),
//      ],
//    );
//  }
//
//  _onLoading() {
//    _refreshController.loadComplete();
//  }
//
//  _onRefresh() {
//    setState(() {
//      RefreshPage();
//      _refreshController.refreshCompleted();
//    });
//  }
//
//  _personalPage() {
//    return PersonalPage();
//  }
//}
