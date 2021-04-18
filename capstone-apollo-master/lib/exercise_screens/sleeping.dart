import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

int sleepingExerciseCounter = 0;

class SleepingPage extends StatefulWidget {
  @override
  _SleepingPageState createState() => _SleepingPageState();
}

class _SleepingPageState extends State<SleepingPage> {
  final tulog = Image.asset('assets/images/sleepinglandscape.jpg');

  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  AudioCache audioCache;
  String path = 'audios/Sleeping.mp3';

  @override
  void initState() {
    super.initState();
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

  @override
  void didChangeDependencies() {
    precacheImage(tulog.image, context);
    super.didChangeDependencies();
  }

  Future<Null> sleepingExerciseDataIncre() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.setState(() {
      sleepingExerciseCounter = sleepingExerciseCounter + 1;
      prefs.setString('sleepingCount', sleepingExerciseCounter.toString());
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
                  image: AssetImage('assets/images/sleepinglandscape.jpg'),
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
                                          "Sleeping",
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
                                          "Sleeping Exercises for Quality Sleep",
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
                                      left: 40,
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
                                  "Child’s Pose is a resting stretch that’s similar to a kneeling lat stretch, but more relaxed. It’s perfect for tuning into your breath, relaxing your body, and reducing stress.",
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
                                    "Come down on your knees, sitting back on your heels.",
                              ),
                              Numbering(
                                number: "2",
                                instruct:
                                    "Hinge at your hips to fold forward and rest your forehead on the floor.",
                              ),
                              Numbering(
                                number: "3",
                                instruct:
                                    "Extend your arms in front of you to support your neck or bring your arms alongside your body. You can use a pillow or cushion under your thighs or forehead for extra support",
                              ),
                              Numbering(
                                number: "4",
                                instruct:
                                    "Breathe deeply in while holding the pose, bringing your awareness to any areas of discomfort or tightness in your back.",
                              ),
                              Numbering(
                                number: "5",
                                instruct:
                                    "Hold this pose for up to 5 minutes. You can also come into this pose between other stretches to give your body a rest.",
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 20,
                                ),
                                child: Text(
                                  "This exercise is called the Child's Pose exercise. For more exercise for sleep quality, please visit: link",
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                              Center(
                                child: GestureDetector(
                                  onTap: () {
                                    sleepingExerciseDataIncre();
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
                                        "Finish",
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
