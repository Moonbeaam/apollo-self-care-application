import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:google_fonts/google_fonts.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFF130D26),
          ),
          ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 20,
                      ),
                      child: Text(
                        "About",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: GlassmorphicContainer(
                      margin: const EdgeInsets.only(
                        left: 5,
                        top: 20,
                      ),
                      width: 200,
                      height: 200,
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
                      child: Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/AppLogo.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                        left: 30,
                        right: 30,
                      ),
                      child: Text(
                        "It is a self-care mobile application which aims to serve as the user's virtual companion during this COVID-19 pandemic where most people only stay at home.",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 30,
                        left: 30,
                        right: 30,
                      ),
                      child: Text(
                        "Research has shown that the virus has caused anxiety in most people. This is why the developers have decided to integrate a COVID-19 protection system in Apollo because this will also help the users in caring for themselves by being safe from the virus.",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 50,
                        left: 30,
                        right: 30,
                      ),
                      child: Text(
                        "What Can You Do With This Mobile Application?",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Center(
                    child: GlassmorphicContainer(
                      margin: const EdgeInsets.only(
                        top: 20,
                      ),
                      width: 300,
                      height: 300,
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
                      child: Center(
                        child: Container(
                          margin: const EdgeInsets.only(
                            left: 10,
                          ),
                          width: 270,
                          height: 270,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/images/Treatment.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 20,
                          left: 60,
                        ),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Color(0xFF242632),
                              Color(0xFF333645),
                              Color(0xFF5d5E69),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            "1",
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 25,
                          left: 20,
                        ),
                        child: Text(
                          "Have A Personal Journal",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 20,
                          left: 60,
                        ),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Color(0xFF242632),
                              Color(0xFF333645),
                              Color(0xFF5d5E69),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            "2",
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 25,
                          left: 20,
                        ),
                        child: Text(
                          "Perform Various Exercises",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 20,
                          left: 60,
                        ),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.centerRight,
                            end: Alignment.centerLeft,
                            colors: [
                              Color(0xFF242632),
                              Color(0xFF333645),
                              Color(0xFF5d5E69),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Center(
                          child: Text(
                            "3",
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          top: 25,
                          left: 20,
                        ),
                        child: Text(
                          "Track Your Emotions",
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 50,
                      ),
                      child: Text(
                        "Developers",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              top: 20,
                              left: 30,
                            ),
                            width: 170,
                            height: 170,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                image: AssetImage('assets/images/dev1.png'),
                                fit: BoxFit.fitHeight,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 10,
                              left: 20,
                            ),
                            child: Text(
                              "Genesis Basa",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              top: 20,
                              left: 10,
                              right: 30,
                            ),
                            width: 170,
                            height: 170,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                image: AssetImage('assets/images/dev2.jpg'),
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 10,
                              right: 20,
                            ),
                            child: Text(
                              "Marc Agaceta",
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 30,
                        left: 30,
                        right: 30,
                      ),
                      child: Text(
                        "We are the developers of Apollo. This is our first ever mobile application developed in a span of 3 months. We started with 0 programming knowledge in the field of developing mobile application. But after all challanges we are able to create Apollo. It isn't much but we are happy on the outcome of this mobile application, I hope you are to. Please leave us a message or suggestions by emailing us in the Contact Us page. Thank you!",
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        textAlign: TextAlign.justify,
                      ),
                    ),
                  ),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 20,
                          bottom: 20,
                        ),
                        width: 150,
                        height: 50,
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
                          child: Text(
                            "Go Back",
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
