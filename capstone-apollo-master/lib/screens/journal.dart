import 'package:apolloApp/screens/writingnotes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:apolloApp/notebook_widget.dart';
import 'package:apolloApp/database/database.dart';
import 'package:apolloApp/database/notes.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';

class JournalPage extends StatefulWidget {
  @override
  _JournalPageState createState() => _JournalPageState();
}

class _JournalPageState extends State<JournalPage> {
  DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                left: 45,
                top: 10,
                bottom: 20,
              ),
              alignment: Alignment.topLeft,
              child: Text(
                "Notebooks",
                style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                initialData: [],
                future: _databaseHelper.getNotes(),
                builder: (context, snapshot) {
                  return ScrollConfiguration(
                    behavior: NoGlowBehavior(),
                    child: ListView.builder(
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
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
                                    alignment: Alignment.centerRight,
                                    child: child,
                                  );
                                },
                                pageBuilder:
                                    (context, animation, animationTime) {
                                  return WritingNotes(
                                    notes: snapshot.data[index],
                                  );
                                },
                              ),
                            ).then(
                              (value) {
                                setState(() {});
                              },
                            );
                          },
                          child: Notebook(
                            title: snapshot.data[index].title,
                            desc: snapshot.data[index].desc,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 30.0,
          right: 25.0,
          child: GestureDetector(
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
                      alignment: Alignment.bottomRight,
                      child: child,
                    );
                  },
                  pageBuilder: (context, animation, animationTime) {
                    return WritingNotes(
                      notes: null,
                    );
                  },
                ),
              ).then(
                (value) {
                  setState(() {});
                },
              );
            },
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFFDAC4F7),
                    Color(0xFFad75f7),
                  ],
                ),
              ),
              child: Icon(
                LineIcons.pen,
                color: Colors.white,
                size: 32,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
