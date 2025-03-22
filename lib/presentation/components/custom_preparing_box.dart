import 'package:flutter/material.dart';
import 'package:module_a_practice2/common/font.dart';

class CustomPreparingBox extends StatelessWidget {
  const CustomPreparingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: 40,
      decoration: BoxDecoration(
        color: Color(0xCCF9F9F9),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          SizedBox(width: 20,),
          Text('현재 개발이 진행되고 있는 기능 입니다.', style: bodyLarge.black87,),
          Spacer(),
          Icon(Icons.dangerous_outlined, color: Colors.red,),
          SizedBox(width: 20,),
        ],
      ),
    );
  }
}
