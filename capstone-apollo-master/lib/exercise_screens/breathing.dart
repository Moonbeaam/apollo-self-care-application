import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:shared_preferences/shared_preferences.dart';

//setBreathingExerciseIncre(int breathingExerciseCounter) async {
//  SharedPreferences prefs = await SharedPreferences.getInstance();
//  prefs.setInt('breathingExerciseCounter', breathingExerciseCounter);
//  return prefs.getInt('breathingExerciseCounter');
//}
//
//getBreathingExerciseIncre() async {
//  SharedPreferences prefs = await SharedPreferences.getInstance();
//  int breathingExerciseCounter =
//      await prefs.getInt('breathingExerciseCounter') ?? 0;
//  return breathingExerciseCounter;
//}

int breathingExerciseCounter = 0;

class BreathingPage extends StatefulWidget {
  @override
  _BreathingPageState createState() => _BreathingPageState();
}

class _BreathingPageState extends State<BreathingPage> {
  final hinga = Image.asset('assets/images/breathingpagelandscape.jpg');

  @override
  void didChangeDependencies() {
    precacheImage(hinga.image, context);
    super.didChangeDependencies();
  }

  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  AudioCache audioCache;
  String path = 'audios/Breathing.mp3';

  @override
  void initState() {
    super.initState();
    //breathingExerciseDataIncre();
    audioCache = AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.onPlayerStateChanged.listen((AudioPlayerState s) {
      setState(() {
        audioPlayerState = s;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    audioPlayer.release();
    audioPlayer.dispose();
    audioCache.clearCache();
  }

  playMusic() async {
    await audioCache.play(path);
  }

  pauseMusic() async {
    await audioPlayer.pause();
  }

  //Future<Null> getBreathingExerciseData() async {
  //  final SharedPreferences prefs = await SharedPreferences.getInstance();
  //  int breathingData = prefs.getString('breathingCount') != null
  //      ? int.parse(prefs.getString('breathingCount'))
  //      : breathingExerciseCounter;
//
  //  this.setState(() {
  //    breathingExerciseCounter = breathingData;
  //  });
  //}

  Future<Null> breathingExerciseDataIncre() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.setState(() {
      breathingExerciseCounter = breathingExerciseCounter + 1;
      prefs.setString('breathingCount', breathingExerciseCounter.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/breathingpagelandscape.jpg'),
                  alignment: Alignment.topCenter,
                  fit: BoxFit.fitWidth,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 240,
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      color: Color(0xFF130D26),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 12,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          "Breathing",
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: 24,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                          top: 5,
                                        ),
                                        child: Text(
                                          "Breathing Exercise for Calmness",
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              color: Color(0xFFB6B6B6),
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                      left: 60,
                                    ),
                                    child: IconButton(
                                      iconSize: 50,
                                      onPressed: () {
                                        audioPlayerState ==
                                                AudioPlayerState.PLAYING
                                            ? pauseMusic()
                                            : playMusic();
                                      },
                                      icon: Icon(
                                        audioPlayerState ==
                                                AudioPlayerState.PLAYING
                                            ? Icons.pause_rounded
                                            : Icons.play_arrow_rounded,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 20,
                                ),
                                child: Text(
                                  "Taking a deep breath in is actually linked to the sympathetic nervous system, which controls the fight-or-flight response. But exhaling is linked to the parasympathetic nervous system, which influences our body’s ability to relax and calm down.",
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Numbering(
                                instruct:
                                    "Lie down somewhere on a bed or an area that you feel comfortable. Close your eyes.",
                              ),
                              Numbering(
                                number: "2",
                                instruct:
                                    "Gently breathe in through your nose, mouth closed, for a count of 6 seconds Don’t fill your lungs too full of air.",
                              ),
                              Numbering(
                                number: "3",
                                instruct:
                                    "Exhale for 6 seconds, allowing your breath to leave your body slowly and gently. Don’t force it.",
                              ),
                              Numbering(
                                number: "4",
                                instruct:
                                    "Repeat this process for about 5 - 10 minutes, until you feel better.",
                              ),
                              Numbering(
                                number: "5",
                                instruct:
                                    "Take a few additional minutes to be still and focus on how your body feels.",
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 20,
                                ),
                                child: Text(
                                  "This breathing exercise is called Resonance Breathing. For more breathing exercises, please visit: link",
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    breathingExerciseDataIncre();
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                      top: 20,
                                      bottom: 10,
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
                                        "Finished",
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(Icons.chevron_left_rounded),
              iconSize: 40,
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Numbering extends StatelessWidget {
  String instruct;
  String number;
  Numbering({this.number, this.instruct});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 10,
          ),
          margin: EdgeInsets.only(
            top: 20,
            left: 150,
          ),
          width: 50,
          height: 50,
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
          child: Text(
            number ?? "1",
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          margin: EdgeInsets.only(
            left: 10,
            top: 18,
          ),
          child: Text(
            instruct ?? "Instructions",
            style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
