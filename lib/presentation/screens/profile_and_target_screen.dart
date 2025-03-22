import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:module_a_practice2/presentation/providers/profile_and_target_provider.dart';
import 'package:module_a_practice2/presentation/screens/sign_in_screen.dart';

import '../../common/font.dart';
import '../components/custom_button2.dart';
import '../components/custom_text_field.dart';
import '../components/custom_text_field_error_box.dart';

class ProfileAndTargetScreen extends StatefulWidget {
  const ProfileAndTargetScreen({super.key, required this.userName});

  final String userName;

  @override
  State<ProfileAndTargetScreen> createState() => _ProfileAndTargetScreenState();
}

class _ProfileAndTargetScreenState extends State<ProfileAndTargetScreen> {

  void updateScreen() => setState(() {});

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      profileAndTargetProvider.addListener(updateScreen);
    },);
  }

  @override
  void dispose() {
    profileAndTargetProvider.removeListener(updateScreen);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            resizeToAvoidBottomInset: true,
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              backgroundColor: Colors.black87,
              flexibleSpace: Center(
                child: Text('Profile & Target', style: bodyMedium.white),
              ),
              title: null,
            ),
            body: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 6,),
                    Container(
                      alignment: AlignmentDirectional.centerStart,
                      width: MediaQuery
                          .sizeOf(context)
                          .width * 0.9,
                      child: Text('Hi ${widget.userName}', style: TextStyle(
                        color: Colors.black87,
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'NotoSans',
                      ),),
                    ),
                    SizedBox(height: 6,),

                    Container(
                      alignment: AlignmentDirectional.centerStart,
                      width: MediaQuery
                          .sizeOf(context)
                          .width * 0.9,
                      child: Text('Profile,', style: bodyBig.black87,),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _genderBox('Male', Icons.man, profileAndTargetProvider.changeGenderMale),
                          _genderBox('Female', Icons.woman, profileAndTargetProvider.changeGenderFemale),
                        ],
                      ),
                    ),

                    SizedBox(height: 20,),
                    CustomTextField(hint: widget.userName, icon: Icons.person, controller: profileAndTargetProvider.userNameController,),
                    SizedBox(height: 10,),
                    CustomTextField(hint: '182.5', icon: Icons.straighten_outlined, label: 'Cm', controller: profileAndTargetProvider.tallController, textInputType: TextInputType.number,),
                    SizedBox(height: 10,),
                    CustomTextField(hint: '80.5', icon: Icons.scale_outlined, label: 'Kg', controller: profileAndTargetProvider.weightController, textInputType: TextInputType.number,),
                    SizedBox(height: 10,),
                    CustomTextField(hint: '1986.09.30', icon: Icons.cake_outlined, controller: profileAndTargetProvider.dateController, textInputType: TextInputType.datetime,),
                    SizedBox(height: 6,),
                    Container(
                      alignment: AlignmentDirectional.centerStart,
                      width: MediaQuery
                          .sizeOf(context)
                          .width * 0.9,
                      child: Text('Target,', style: bodyBig.black87,),
                    ),
                    SizedBox(height: 10,),
                    CustomTextField(hint: '5,000', icon: Icons.directions_walk, controller: profileAndTargetProvider.walkController, label: 'Steps', textInputType: TextInputType.number,),
                    SizedBox(height: 10,),
                    CustomTextField(hint: '2,000', icon: Icons.water_drop_outlined, controller: profileAndTargetProvider.waterController, label: 'ml', textInputType: TextInputType.number,),
                    SizedBox(height: 6,),
                    CustomButton2(title: 'Complete', function: () {
                      profileAndTargetProvider.textFieldCheck()
                          ? Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignInScreen(),),)
                          : profileAndTargetProvider.viewTextFieldError();
                    },),
                    SizedBox(height: 6,),
                  ],
                ),
              ),
            ),
          ),

          profileAndTargetProvider.textFieldError
              ? Align(alignment: Alignment.center,
              child: CustomTextFieldErrorBox(
                  errorText: 'Password와 ConfirmPassword는\n4글자 이상이어야 하며\n두 항목의 값은 같아야합니다'))
              : SizedBox.shrink(),
        ],
      ),
    );
  }
  
  GestureDetector _genderBox(String gender, IconData icon, VoidCallback function) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: MediaQuery.sizeOf(context).width * 0.33,
        height: 130,
        alignment: AlignmentDirectional.center,
        decoration: BoxDecoration(
          color: Color(0xFFF9F9F9),
          borderRadius: BorderRadius.circular(10),
          border: profileAndTargetProvider.isSelectGender == gender ? Border.all(color: Colors.grey, width: 1.5) : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 75, color: profileAndTargetProvider.isSelectGender == gender ? Colors.black : Colors.grey,),
            Text(gender, style: profileAndTargetProvider.isSelectGender == gender ? bodyLarge.black87 : bodyLarge.grey,),
          ],
        ),
      ),
    );
  }
  
}
