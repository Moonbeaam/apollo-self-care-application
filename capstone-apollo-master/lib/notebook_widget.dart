import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Notebook extends StatelessWidget {
  final String title;
  final String desc;
  Notebook({this.title, this.desc});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        bottom: 20,
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 32.0,
        horizontal: 24.0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title ?? "(UNTITLED)",
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text(
              desc ?? "No description Added",
              style: GoogleFonts.montserrat(
                textStyle: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF86829D),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NoGlowBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}
