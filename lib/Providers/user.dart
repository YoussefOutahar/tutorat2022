import 'package:flutter/cupertino.dart';

class User with ChangeNotifier {
  String? name;
  String? email;

  String? get userName => this.name;
}
