import 'package:flutter/cupertino.dart';

final ProfileAndTargetProvider profileAndTargetProvider = ProfileAndTargetProvider();

class ProfileAndTargetProvider extends ChangeNotifier {

  bool textFieldError = false;
  String isSelectGender = '';

  TextEditingController userNameController = TextEditingController();
  TextEditingController tallController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  TextEditingController walkController = TextEditingController();
  TextEditingController waterController = TextEditingController();

  void changeGenderFemale() {
    isSelectGender = 'Female';
    notifyListeners();
  }

  void changeGenderMale() {
    isSelectGender = 'Male';
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
    if(isSelectGender.isNotEmpty) {
      if(userNameController.text.isNotEmpty && tallController.text.isNotEmpty) {
        if(weightController.text.isNotEmpty && dateController.text.isNotEmpty) {
          if(walkController.text.isNotEmpty && waterController.text.isNotEmpty) {
            return true;
          }
        }
      }
    }
    return false;
  }

}