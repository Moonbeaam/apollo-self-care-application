import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:shared_preferences/shared_preferences.dart';

int meditationExerciseCounter = 0;

class MeditationPage extends StatefulWidget {
  @override
  _MeditationPageState createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> {
  final yoga = Image.asset('assets/images/meditationpagelandscape.jpg');

  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayerState audioPlayerState = AudioPlayerState.PAUSED;
  AudioCache audioCache;
  String path = 'audios/Meditation.mp3';

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
    precacheImage(yoga.image, context);
    super.didChangeDependencies();
  }

  Future<Null> meditationExerciseDataIncre() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    this.setState(() {
      meditationExerciseCounter = meditationExerciseCounter + 1;
      prefs.setString('meditationCount', meditationExerciseCounter.toString());
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
                  image:
                      AssetImage('assets/images/meditationpagelandscape.jpg'),
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
                                          "Meditation",
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
                                          "Meditation Exercise for Calming",
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
                                  "Mindfulness meditation encourages the practitioner to observe wandering thoughts as they drift through the mind. The intention is not to get involved with the thoughts or to judge them, but simply to be aware of each mental note as it arises.",
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
                                    "Start by bringing your attention to the sensations in your body.",
                              ),
                              Numbering(
                                number: "2",
                                instruct:
                                    "Breathe in through your nose, allowing the air to fill your lungs. Let your abdomen expand fully. Then breathe out slowly through your mouth. This pattern may slow down your heart rate and lower your blood pressure, helping you relax. Notice the sensations of each inhalation and exhalation.",
                              ),
                              Numbering(
                                number: "3",
                                instruct:
                                    "Proceed with the task at hand slowly and with full deliberation.",
                              ),
                              Numbering(
                                number: "4",
                                instruct:
                                    "Engage your senses fully. Notice each sight, touch, and sound so that you savor every sensation.",
                              ),
                              Numbering(
                                number: "5",
                                instruct:
                                    "When you notice that your mind has wandered from the task at hand, gently bring your attention back to the sensations of the moment. ",
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 20,
                                ),
                                child: Text(
                                  "This meditation is called Mindfulness Meditation. For more details about meditation please vist: link",
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
                                    meditationExerciseDataIncre();
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
