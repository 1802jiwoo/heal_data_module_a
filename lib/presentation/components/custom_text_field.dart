import 'package:flutter/material.dart';
import 'package:module_a_practice2/common/font.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.hint, required this.icon, this.label = '', required this.controller, this.textInputType = TextInputType.text});

  final String hint;

  final IconData icon;

  final String label;

  final TextEditingController controller;

  final TextInputType textInputType;


  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.8,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xFFF9F9F9),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        obscureText: textInputType == TextInputType.visiblePassword ? true : false,
        keyboardType: textInputType,
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: bodyMedium.grey,
          prefixIcon: Icon(icon, color: Colors.grey,),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
          ),
          suffixIcon: Text(label, style: bodyMedium.grey, textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
