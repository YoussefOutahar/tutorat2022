import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tutorat2022/Providers/user.dart';

import 'FireBase/firebase_options.dart';
import 'Views/AdminDashBoard/admin_screen.dart';
import 'Views/Authentification/authenticate_page.dart';
import 'Views/TutoréUI/tutorer_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
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
  } catch (e) {
    debugPrint("Couldn't start Firebase for this platform");
  }

  Provider.debugCheckInvalidValueType = null;
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider<User>(create: (_) => User())],
      child: const WebApp(),
    ),
  );
}

class WebApp extends StatelessWidget {
  const WebApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Tutorat",
      theme: ThemeData(
        useMaterial3: true,
        //fontFamily: "SF Pro",
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
