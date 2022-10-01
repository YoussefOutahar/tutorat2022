import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tutorat2022/Apps/Tutorer/tutorer_screen.dart';
import 'package:tutorat2022/Auth/Authentification/authenticate_page.dart';
import 'package:tutorat2022/page_404.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasData) {
          return const TutoratPage();
        } else if (snapshot.hasError) {
          return const NotFoundPage();
        } else {
          return const AuthenticatePage();
        }
      },
    );
  }
}
