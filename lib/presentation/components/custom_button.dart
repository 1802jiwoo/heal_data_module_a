import 'package:flutter/material.dart';
import 'package:module_a_practice2/common/font.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.title, this.outline = false, required this.function});

  final String title;

  final bool outline;

  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.sizeOf(context).width * 0.7,
        height: 45,
        decoration: BoxDecoration(
          color: outline ? Colors.white : Colors.black,
          border: outline ? Border.all(color: Colors.grey, width: 0.5) : null,
        ),
        child: Text(title, style: outline ? bodyLarge.black : bodyLarge.white,),
      ),
    );
  }
}
