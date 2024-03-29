import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
// ignore: depend_on_referenced_packages
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_performance/firebase_performance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:tutorat2022/Providers/user.dart';
import 'package:tutorat2022/page_404.dart';
import 'package:tutorat2022/translations/codegen_loader.g.dart';

import 'Apps/Admin/Pages/StudentPage/students_page.dart';
import 'Apps/Admin/admin_screen.dart';
import 'Auth/auth_check.dart';
import 'FireBase/firebase_options.dart';
import 'Widgets/TutoréUI/tutorer_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize app languages
  await EasyLocalization.ensureInitialized();

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
    EasyLocalization(
      path: 'assets/translations',
      supportedLocales: const [
        Locale('en'),
        Locale('fr'),
      ],
      fallbackLocale: const Locale('en'),
      assetLoader: const CodegenLoader(),
      child: MultiProvider(
        providers: [ChangeNotifierProvider<User>(create: (_) => User())],
        child: const WebApp(),
      ),
    ),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();

class WebApp extends StatelessWidget {
  const WebApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Tutorat",
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      locale: context.locale,
      theme: ThemeData(
        useMaterial3: true,
        //fontFamily: "SF Pro",
      ),
      routes: {
        '/': (BuildContext context) => const AuthCheck(),
        //"/": (context) => const AuthenticatePage(),
        "/Tutorat": (context) => const TutoratPage(),
        "/Admin": (context) => const AdminPage(),
        "/test": (context) => const StudentsPage(),
      },
      initialRoute: "/",
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => NotFoundPage(
            routeName: settings.name ?? "/Unknown",
          ),
        );
      },
    );
  }
}
