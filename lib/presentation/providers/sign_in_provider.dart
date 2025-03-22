import 'package:flutter/cupertino.dart';

final SignInProvider signInProvider = SignInProvider();

class SignInProvider extends ChangeNotifier {

  bool tapPasswordResetButton = false;
  bool textFieldError = false;

  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void viewPasswordReset() async {
    tapPasswordResetButton = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    tapPasswordResetButton = false;
    notifyListeners();
  }

  bool textFieldCheck() {
    if(userNameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      if(userNameController.text.length >= 4 && !userNameController.text.contains(' ')) {
        if(passwordController.text.length >= 4) return true;
      }
    }
    return false;
  }

  void viewTextFieldError() async {
    textFieldError = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    textFieldError = false;
    notifyListeners();
  }

}