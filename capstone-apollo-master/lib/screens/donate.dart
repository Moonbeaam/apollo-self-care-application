import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Donate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Color(0xFF130D26),
          ),
          Column(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 20,
                  ),
                  child: Text(
                    "Donate",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 300,
                  ),
                  child: Text(
                    "We are just kidding.",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
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
    );
  }
}