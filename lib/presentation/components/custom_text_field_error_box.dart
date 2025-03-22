import 'package:flutter/material.dart';
import 'package:module_a_practice2/common/font.dart';

class CustomTextFieldErrorBox extends StatelessWidget {
  const CustomTextFieldErrorBox({super.key, required this.errorText});

  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: 20,),
          Text(errorText, style: bodyLarge.white, textAlign: TextAlign.center,),
          Spacer(),
          Icon(Icons.dangerous_outlined, color: Colors.red,),
          SizedBox(width: 20,),
        ],
      ),
    );
  }
}
