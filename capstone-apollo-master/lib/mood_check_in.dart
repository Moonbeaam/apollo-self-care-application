import 'package:apolloApp/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MoodCheckIn extends StatefulWidget {
  const MoodCheckIn({Key key}) : super(key: key);

  @override
  _MoodCheckInState createState() => _MoodCheckInState();
}

class _MoodCheckInState extends State<MoodCheckIn> with ChangeNotifier {
  GlobalKey<_MoodCheckInState> _myKey = GlobalKey();

  final happy = Image.asset("assets/images/Happy 3-crop.png");
  final good = Image.asset("assets/images/Good 3-crop.png");
  final neutral = Image.asset("assets/images/Neutral 3-crop.png");
  final sad = Image.asset("assets/images/Sad 3-crop.png");
  final stressed = Image.asset("assets/images/Stressed 3-crop.png");

  void didChangeDependencies() {
    precacheImage(happy.image, context);
    precacheImage(good.image, context);
    precacheImage(neutral.image, context);
    precacheImage(sad.image, context);
    precacheImage(stressed.image, context);
    super.didChangeDependencies();
  }

  var myFeedbackText = "Great!";

  var sliderValue = 4.0;

  Image myFeedback = Image.asset(
    "assets/images/Happy 3-crop.png",
    fit: BoxFit.cover,
  );

  Color myFeedbackColor = Color(0xFFFFE573);

  Color myBackgroundColor = Color(0xFFFFE573);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: myBackgroundColor,
      resizeToAvoidBottomInset: true,
      body: Column(
        children: [
          _buildAppBar(),
          _buildHeaderText(),
          SizedBox(
            height: 30,
          ),
          _buildTitle(),
          SizedBox(
            height: 20,
          ),
          _buildSlider(),
          SizedBox(
            height: 20,
          ),
          _buildBottomContent(),
        ],
      ),
    );
  }

  _buildAppBar() => Padding(
        padding: const EdgeInsets.only(top: 70, bottom: 35),
        child: Container(
          alignment: Alignment.center,
          child: Text(
            "Mood Check-in",
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: Color(0xFF130d26),
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
        ),
      );

  _buildHeaderText() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Text(
          "How are you Feeling Right Now?",
          textAlign: TextAlign.center,
          style: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: Color(0xFF130d26),
              fontWeight: FontWeight.bold,
              fontSize: 35,
            ),
          ),
        ),
      );

  _buildTitle() => Column(
        children: [
          Text(
            myFeedbackText,
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: Color(0xFF130d26),
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: myFeedback,
            height: 250,
          ),
        ],
      );

  _buildSlider() => Container(
        key: _myKey,
        child: Slider(
          min: 0.0,
          max: 4.0,
          divisions: 4,
          value: sliderValue,
          activeColor: Color(0xFF130d26),
          onChanged: (newValue) {
            setState(
              () {
                sliderValue = newValue;
                if (sliderValue <= 4.0 && sliderValue >= 3.1) {
                  myFeedback = Image.asset("assets/images/Happy 3-crop.png");
                  myFeedbackColor = Color(0xFFFFE573);
                  myFeedbackText = "Great!";
                  myBackgroundColor = Color(0xFFFFE573);
                }
                if (sliderValue <= 3 && sliderValue >= 2.1) {
                  myFeedback = Image.asset("assets/images/Good 3-crop.png");
                  myFeedbackColor = Color(0xFF60f680);
                  myFeedbackText = "Good";
                  myBackgroundColor = Color(0xFF60f680);
                }
                if (sliderValue <= 2.0 && sliderValue >= 1.1) {
                  myFeedback = Image.asset("assets/images/Neutral 3-crop.png");
                  myFeedbackColor = Color(0xFFfaffd4);
                  myFeedbackText = "Neutral";
                  myBackgroundColor = Color(0xFFfaffd4);
                }
                if (sliderValue <= 1.0 && sliderValue >= 0.1) {
                  myFeedback = Image.asset("assets/images/Sad 3-crop.png");
                  myFeedbackColor = Color(0xFFacecf7);
                  myFeedbackText = "Down";
                  myBackgroundColor = Color(0xFFacecf7);
                }
                if (sliderValue <= 0.0 && sliderValue >= 0.0) {
                  myFeedback = Image.asset("assets/images/Stressed 3-crop.png");
                  myFeedbackColor = Color(0xFFf45f65);
                  myFeedbackText = "Stressed";
                  myBackgroundColor = Color(0xFFf45f65);
                }
              },
            );
          },
        ),
      );

  _buildBottomContent() => ButtonTheme(
        minWidth: 200,
        height: 50,
        child: MaterialButton(
          color: Color(0xFF130d26),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            "Save",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          onPressed: () {
            saveSliderValue();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SelfCareApp(),
              ),
            );
          },
        ),
      );

  double sliderData;

  Image moodDisplay;

  Future<Null> saveSliderValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.setState(() {
      sliderValue = sliderValue;
      prefs.setString('mood', sliderValue.toString());
    });
  }

//I HAVE TO MAKE A SETTER ASGAJKLSASHLA
  Future<Null> getSliderValue() async {
    final SharedPreferences sliderPrefs = await SharedPreferences.getInstance();
    double sliderData = sliderPrefs.getString("mood") != null
        ? double.parse(sliderPrefs.getString("mood"))
        : sliderValue;
    notifyListeners();

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
}

////int _current = 0;
//int _current;
//
//final List<String> moodList = [
//  "assets/images/Happy 3.png",
//  "assets/images/Good 3.png",
//  "assets/images/Neutral 3.png",
//  "assets/images/Sad 3.png",
//  "assets/images/Stressed 3.png",
//];
//
//@override
//void initState() {
//  FlutterStatusbarManager.setTranslucent(true);
//  FlutterStatusbarManager.setStyle(StatusBarStyle.LIGHT_CONTENT);
//  WidgetsBinding.instance.addPostFrameCallback((_) {
//    moodList.forEach((element) {
//      precacheImage(AssetImage("assets/images/Happy 3.png"), context);
//      precacheImage(AssetImage("assets/images/Good 3.png"), context);
//      precacheImage(AssetImage("assets/images/Neutral 3.png"), context);
//      precacheImage(AssetImage("assets/images/Sad 3.png"), context);
//      precacheImage(AssetImage("assets/images/Stressed 3.png"), context);
//    });
//  });
//  super.initState();
//}
//
//String imagePath1 = "assets/images/Happy 3.png";
//String imagePath2 = "assets/images/Good 3.png";
//
//@override
//Widget build(BuildContext context) {
//  return Scaffold(
//    backgroundColor: Color(0xFF130D26),
//    body: ListView(
//      children: [
//        Text(
//          "How are you feeling today?",
//          textAlign: TextAlign.center,
//          style: TextStyle(
//            height: 12.5,
//            fontSize: 22,
//            fontWeight: FontWeight.bold,
//            color: Colors.white,
//          ),
//        ),
//        CarouselSlider(
//          items: [
//            GestureDetector(
//              onTap: () => setState(() {
//                ;
//              }),
//              child: Container(
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                    image: AssetImage(imagePath1),
//                    fit: BoxFit.fill,
//                  ),
//                ),
//              ),
//            ),
//            GestureDetector(
//              onTap: () {},
//              child: Container(
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                    image: AssetImage("assets/images/Good 3.png"),
//                    fit: BoxFit.fill,
//                  ),
//                ),
//              ),
//            ),
//            GestureDetector(
//              onTap: () {},
//              child: Container(
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                    image: AssetImage("assets/images/Neutral 3.png"),
//                    fit: BoxFit.fill,
//                  ),
//                ),
//              ),
//            ),
//            GestureDetector(
//              onTap: () {},
//              child: Container(
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                    image: AssetImage("assets/images/Sad 3.png"),
//                    fit: BoxFit.fill,
//                  ),
//                ),
//              ),
//            ),
//            GestureDetector(
//              onTap: () {},
//              child: Container(
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                    image: AssetImage("assets/images/Stressed 3.png"),
//                    fit: BoxFit.fill,
//                  ),
//                ),
//              ),
//            ),
//          ],
//          options: CarouselOptions(
//            aspectRatio: 1 / 1,
//            height: 300,
//            enlargeCenterPage: true,
//            enableInfiniteScroll: true,
//            initialPage: 0,
//            viewportFraction: 0.61,
//          ),
//        ),
//        SizedBox(
//          height: 70,
//        ),
//        FractionallySizedBox(
//          widthFactor: 0.4,
//          child: MaterialButton(
//            padding: const EdgeInsets.fromLTRB(45, 10, 45, 10),
//            onPressed: () {
//              Navigator.of(context).push(
//                  MaterialPageRoute(builder: (context) => SelfCareApp()));
//            },
//            child: const Text(
//              "Save",
//              style: TextStyle(color: Color(0xFF242632), fontSize: 16),
//            ),
//            color: Colors.white,
//            shape: RoundedRectangleBorder(
//              borderRadius: BorderRadius.circular(20),
//            ),
//          ),
//        ),
//      ],
//    ),
//  );
//}
//}
/*@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFF242632),
        body: Container(
            padding: const EdgeInsets.only(top: 300),
            child: CarouselSlider.builder(
              itemCount: moodList.length,
              options: CarouselOptions(
                  aspectRatio: 1 / 1,
                  enableInfiniteScroll: false,
                  autoPlay: false,
                  enlargeCenterPage: true,
                  initialPage: _current,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                  viewportFraction: 0.7),
              itemBuilder: (context, int index, realIdx) {
                return Transform.scale(
                  scale: index == _current ? 1 : 0.9,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 0.5),
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Image.asset(
                        moodList[index],
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                );
              },
            )),
      ),
    );
  }
}*/

/*@override
  Widget build(BuildContext context) {
    return new IntroductionScreen(
      globalBackgroundColor: Color(0xFF242632),
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
                "How are you feeling today?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
          bodyWidget: new Scaffold(
            body: new Swiper.children(
              autoplay: false,
              children: <Widget>[
                new Image.asset(
                  "assets/images/Self Care.jpg",
                  fit: BoxFit.contain,
                ),
                new Image.asset(
                  "assets/images/Illustration.jpg",
                  fit: BoxFit.contain,
                ),
              ],
              onTap: (itemCount) {},
            ),
          ),
          decoration: const PageDecoration(
            titlePadding: const EdgeInsets.fromLTRB(40, 250, 40, 0),
            descriptionPadding: const EdgeInsets.fromLTRB(40, 20, 40, 0),
            titleTextStyle: TextStyle(
              color: Color(0xFF67e2f7),
              fontSize: 28.0,
            ),
          ),
        ),
      ],
    );
  }
}
*/
