import 'package:flutter/material.dart';
import 'package:module_a_practice2/common/font.dart';
import 'package:module_a_practice2/presentation/components/custom_text_field.dart';
import 'package:module_a_practice2/presentation/providers/sign_up_provider.dart';
import 'package:module_a_practice2/presentation/screens/profile_and_target_screen.dart';
import 'package:module_a_practice2/presentation/screens/sign_in_screen.dart';

import '../components/custom_button.dart';
import '../components/custom_button2.dart';
import '../components/custom_preparing_box.dart';
import '../components/custom_text_field_error_box.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      signUpProvider.addListener(updateScreen);
    },);
  }

  @override
  void dispose() {
    signUpProvider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              backgroundColor: Colors.black87,
              flexibleSpace: Center(
                child: Text('Sign Up', style: bodyMedium.white),
              ),
              title: null,
            ),
            body: Column(
              children: [
                Spacer(),
                Container(
                  alignment: AlignmentDirectional.centerStart,
                  width: MediaQuery
                      .sizeOf(context)
                      .width * 0.9,
                  child: Text('Your information,', style: bodyBig.black87,),
                ),
                Spacer(),
                CustomTextField(hint: 'UserID', icon: Icons.person, controller: signUpProvider.userIdController,),
                SizedBox(height: 10,),
                CustomTextField(hint: 'Username', icon: Icons.badge_outlined, controller: signUpProvider.userNameController,),
                SizedBox(height: 10,),
                CustomTextField(hint: 'Password', icon: Icons.lock, controller: signUpProvider.passwordController, textInputType: TextInputType.visiblePassword,),
                SizedBox(height: 10,),
                CustomTextField(hint: 'Confirm Password', icon: Icons.lock_reset, controller: signUpProvider.confirmPasswordController, textInputType: TextInputType.visiblePassword,),
                Spacer(),
                CustomButton2(title: 'Sign Up', function: () {
                  signUpProvider.textFieldCheck()
                      ? Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProfileAndTargetScreen(userName: signUpProvider.userNameController.text,),),)
                      : signUpProvider.viewTextFieldError();
                },),
                Spacer(),
                Container(
                  color: Color(0xFFF9F9F9),
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.26,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(title: 'Sign In', outline: true, function: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignInScreen()));                       Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => SignInScreen()));
                      },),
                      SizedBox(height: 20,),
                      CustomButton(title: 'Password Reset', outline: true, function: signUpProvider.viewPasswordReset,),
                    ],
                  ),
                ),
              ],
            ),
          ),

          signUpProvider.tapPasswordResetButton
              ? Align(
              alignment: Alignment.topCenter, child: CustomPreparingBox())
              : SizedBox.shrink(),
          signUpProvider.textFieldError
              ? Align(alignment: Alignment.center,
              child: CustomTextFieldErrorBox(
                  errorText: 'Password와 ConfirmPassword는\n4글자 이상이어야 하며\n두 항목의 값은 같아야합니다'))
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
