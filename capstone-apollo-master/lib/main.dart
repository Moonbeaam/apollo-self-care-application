import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'dashboard.dart';
import 'introScreen.dart';
import 'loadingScreen.dart';
import 'package:flutter/services.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_statusbar_manager/flutter_statusbar_manager.dart';
//The code under this is the initial code before I changed it (March 11, 2021 | 9:07 PM)
//void main() {
//  runApp(MaterialApp(home: SelfCareApp()));
//}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  await FlutterStatusbarManager.setTranslucent(true);
  await FlutterStatusbarManager.setStyle(StatusBarStyle.LIGHT_CONTENT);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) => {
      runApp(
        new MaterialApp(
          builder: EasyLoading.init(),
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            fontFamily: "Poppins",
            accentColor: Color(0xFFff6fb0),
          ),
          home: new OnBoardingPage(),
          routes: <String, WidgetBuilder>{
            '/OutBoardingPage': (BuildContext context) => new OutBoardingPage(),
            '/SelfCareApp': (BuildContext context) => new SelfCareApp()
          },
        ),
      ),
    },
  );
  await Firebase.initializeApp();
}
