import 'package:flutter/material.dart';
import 'package:module_a_practice2/common/font.dart';

class CustomButton2 extends StatelessWidget {
  const CustomButton2({super.key, required this.title, required this.function});

  final String title;

  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.sizeOf(context).width * 0.8,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(title, style: bodyLarge.white,),
      ),
    );
  }
}
