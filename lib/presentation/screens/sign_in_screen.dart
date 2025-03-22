import 'package:flutter/material.dart';
import 'package:module_a_practice2/common/font.dart';
import 'package:module_a_practice2/presentation/components/custom_button.dart';
import 'package:module_a_practice2/presentation/components/custom_preparing_box.dart';
import 'package:module_a_practice2/presentation/components/custom_text_field.dart';
import 'package:module_a_practice2/presentation/components/custom_text_field_error_box.dart';
import 'package:module_a_practice2/presentation/providers/sign_in_provider.dart';
import 'package:module_a_practice2/presentation/screens/sign_up_screen.dart';

import '../components/custom_button2.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      signInProvider.addListener(updateScreen);
    },);
  }

  @override
  void dispose() {
    signInProvider.removeListener(updateScreen);
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
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  color: Colors.black,
                  width: double.infinity,
                  height: 110,
                  child: Text('MY Health DATA', style: titleLarge.white),
                ),
                Spacer(),
                Image.asset('assets/images/symbol.png', width: MediaQuery.sizeOf(context).width * 0.38,),
                Spacer(),
                Text('Please enter your information.', style: bodyMedium.grey),
                Spacer(),
                CustomTextField(hint: 'Username', icon: Icons.person, controller: signInProvider.userNameController,),
                SizedBox(height: 10,),
                CustomTextField(hint: 'Password', icon: Icons.lock, controller: signInProvider.passwordController, textInputType: TextInputType.visiblePassword,),
                Spacer(),
                CustomButton2(title: 'Sign in', function: () {
                  signInProvider.textFieldCheck()
                      ? null
                      : signInProvider.viewTextFieldError();
                },),
                Spacer(),
                Container(
                  color: Color(0xFFF9F9F9),
                  width: double.infinity,
                  height: MediaQuery.sizeOf(context).height * 0.26,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(title: 'Sign Up', function: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpScreen()));
                      },),
                      SizedBox(height: 20,),
                      CustomButton(title: 'Password Reset', outline: true, function: signInProvider.viewPasswordReset,),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          signInProvider.tapPasswordResetButton
              ? Align(
              alignment: Alignment.topCenter, child: CustomPreparingBox())
              : SizedBox.shrink(),
          signInProvider.textFieldError
              ? Align(alignment: Alignment.center,
              child: CustomTextFieldErrorBox(
                  errorText: 'Username과 password는 4글자 이상\nUsername은 공백을 포함할수 없습니다.'))
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
