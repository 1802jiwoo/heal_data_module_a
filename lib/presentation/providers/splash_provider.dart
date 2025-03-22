import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/sign_in_screen.dart';

final SplashProvider splashProvider = SplashProvider();

class SplashProvider extends ChangeNotifier {

  bool isLogoStart = false;
  bool isTextStart = false;

  void animationStart(BuildContext context) async {

    isLogoStart = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    isTextStart = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignInScreen()));

  }

}