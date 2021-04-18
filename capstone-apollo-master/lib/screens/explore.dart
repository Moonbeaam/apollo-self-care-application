import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ExplorePage extends StatefulWidget {
  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(initialPage: 0);
    return Scaffold(
      backgroundColor: Color(0xFF130D26),
      body: PageView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        controller: controller,
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 50,
                    ),
                    child: Icon(
                      Icons.chevron_left_rounded,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 100,
                    left: 100,
                    bottom: 10,
                  ),
                  child: Text(
                    "Hello There!",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                    left: 55,
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: 120,
                    horizontal: 10,
                  ),
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(200),
                    gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [
                        Color(0xFF205072),
                        Color(0xFF56C596),
                      ],
                    ),
                  ),
                  child: FadeAnimatedTextKit(
                    repeatForever: true,
                    onTap: () {},
                    text: [
                      "Let's Explore",
                      "More About",
                      "Mental Health",
                    ],
                    textStyle: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 120,
                    left: 155,
                  ),
                  child: Text(
                    "Swipe Up",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF7BE495),
                  Color(0xFF329D9C),
                ],
              ),
            ),
          ),
          //
          //
          //
          //
          //2ND PAGE OF EXPLORE
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 50,
                    ),
                    child: Icon(
                      Icons.chevron_left_rounded,
                      size: 50,
                      color: Colors.white,
                    ),
                    alignment: Alignment.topLeft,
                  ),
                ),
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(),
                  child: Image(
                    image: AssetImage("assets/images/Student 2.png"),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 5),
                  child: Text(
                    "What is Mental Health?",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    right: 30,
                    left: 30,
                    bottom: 10,
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                    child: Text(
                      "According to the World Health Organization, Mental Health is a state of well-being in which an individual realizes his or her own abilities, can cope with the normal stresses of life, can work productively, and is able to make a contribution to his or her community. It is all about how people think, feel, and behave.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                MaterialButton(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => WhatIsMH()));
                  },
                  child: Text(
                    "Learn more",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16),
                  ),
                  color: Color(0xFFfbbb44),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFFF9C449),
                  Color(0xFFF04393),
                ],
              ),
            ),
          ),
          //
          //
          //
          //
          //3RD PAGE OF EXPLORE
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 50,
                    ),
                    child: Icon(
                      Icons.chevron_left_rounded,
                      size: 50,
                      color: Colors.white,
                    ),
                    alignment: Alignment.topLeft,
                  ),
                ),
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(),
                  child: Image(
                    image: AssetImage("assets/images/Common MH Disorders.png"),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(53, 0, 53, 0),
                  child: Text(
                    "What are the Common Mental Health Disorders?",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    right: 30,
                    left: 30,
                    bottom: 10,
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                    child: Text(
                      "These are the Common Mental Health Disorders:\n\n(1) Anxiety Disorders,\n(2) Mood Disorders,\n(3) Schizophrenia Disorders, and\n(4) Depression\nFor more information, you can learn more by clicking the button below.",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                MaterialButton(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => CommonMHD()));
                  },
                  child: Text(
                    "Learn more",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16),
                  ),
                  color: Color(0xFF1F2F98),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF1F2F98),
                  Color(0xFF4ADEDE),
                ],
              ),
            ),
          ),
          //
          //
          //
          //
          //4TH PAGE OF EXPLORE
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 50,
                    ),
                    child: Icon(
                      Icons.chevron_left_rounded,
                      size: 50,
                      color: Colors.white,
                    ),
                    alignment: Alignment.topLeft,
                  ),
                ),
                Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(),
                  child: Image(
                    image: AssetImage("assets/images/Signs.png"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(53, 0, 53, 0),
                  child: Text(
                    "What are the Possible Signs of Some Common Mental Health Disorders?",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 30,
                    right: 30,
                    bottom: 10,
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                    child: Text(
                      "People should look out for the following as possible signs of a mental health disorder:",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 10,
                        left: 50,
                      ),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 5,
                        left: 5,
                        right: 30,
                        bottom: 10,
                      ),
                      child: Text(
                        "Displaying negative emotions",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 5,
                        left: 50,
                      ),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 5,
                        right: 30,
                        bottom: 10,
                      ),
                      child: Text(
                        "Having consistent low energy",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 5,
                        left: 50,
                      ),
                      height: 10,
                      width: 10,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        left: 5,
                        right: 30,
                        bottom: 10,
                      ),
                      child: Text(
                        "Feeling hopeless",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 25),
                MaterialButton(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PossibleSigns()));
                  },
                  child: Text(
                    "Learn more",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16),
                  ),
                  color: Color(0xFF68B2A0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFF68B2A0),
                  Color(0xFF2C6975),
                ],
              ),
            ),
          ),
          //
          //
          //
          //
          //5TH PAGE OF EXPLORE
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 50,
                    ),
                    child: Icon(
                      Icons.chevron_left_rounded,
                      size: 50,
                      color: Colors.white,
                    ),
                    alignment: Alignment.topLeft,
                  ),
                ),
                Container(
                  width: 300,
                  height: 250,
                  decoration: BoxDecoration(),
                  child: Image(
                    image: AssetImage("assets/images/Treatment.png"),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(53, 0, 53, 0),
                  child: Text(
                    "What are the Treatments for Mental Health Disorders?",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 19.6,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 30,
                    right: 30,
                    bottom: 10,
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
                    child: Text(
                      "There are various methods for managing mental health problems. According to Medical News Today, some common treatments are:",
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                  child: Text(
                    "(1) Psychotherapy\n\n(2) Medications\n\n(3) Self-help",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 75),
                MaterialButton(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Methods()));
                  },
                  child: Text(
                    "Learn more",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 16),
                  ),
                  color: Color(0xFFB80E66),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                )
              ],
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Color(0xFFB80E66),
                  Color(0xFF1691B2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Classes for the URL Links
class WhatIsMH extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: "https://www.who.int/health-topics/mental-health#tab=tab_1",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class CommonMHD extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl: "https://medlineplus.gov/mentaldisorders.html",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class PossibleSigns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl:
            "https://www.healthgrades.com/right-care/mental-health-and-behavior/emotional-symptoms",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}

class Methods extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        initialUrl:
            "https://www.medicalnewstoday.com/articles/154543#common-disorders",
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}
