import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'package:tutorat2022/Pages/Authentification/authenticate_page.dart';

import 'FireBase/firebase_options.dart';
import 'Pages/MainPage/AdminDashBoard/admin_screen.dart';
import 'Pages/MainPage/TutoréUI/tutorer_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize the Firebase Performance service.
  FirebasePerformance perfomance = FirebasePerformance.instance;
  perfomance.setPerformanceCollectionEnabled(true);

  // Initialize the analytics service.
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  analytics.setAnalyticsCollectionEnabled(true);
  analytics.logAppOpen();

  Provider.debugCheckInvalidValueType = null;
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
    (_) async {
      runApp(const WebApp());
    },
  );
}

class WebApp extends StatelessWidget {
  const WebApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
      ),
      routes: {
        "/": (context) => const AuthenticatePage(),
        "/Tutorat": (context) => const TutoratPage(),
        "/Admin": (context) => const AdminPage(),
      },
      initialRoute: "/",
    );
  }
}
