import 'package:flutter/cupertino.dart';

final SignUpProvider signUpProvider = SignUpProvider();

class SignUpProvider extends ChangeNotifier {

  bool tapPasswordResetButton = false;
  bool textFieldError = false;

  TextEditingController userIdController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void viewPasswordReset() async {
    tapPasswordResetButton = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    tapPasswordResetButton = false;
    notifyListeners();
  }

  void viewTextFieldError() async {
    textFieldError = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    textFieldError = false;
    notifyListeners();
  }

  bool textFieldCheck() {
    if(userNameController.text.isNotEmpty && userIdController.text.isNotEmpty && passwordController.text.isNotEmpty && confirmPasswordController.text.isNotEmpty) {
      if(passwordController.text.length >= 4 && confirmPasswordController.text.length >= 4) {
        if(passwordController.text == confirmPasswordController.text) return true;
      }
    }
    return false;
  }

}