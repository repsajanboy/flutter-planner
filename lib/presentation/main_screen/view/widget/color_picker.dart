import 'package:flutter/material.dart';

class ColorPicker extends StatelessWidget {
  const ColorPicker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Wrap(
        spacing: 10.0,
        runSpacing: 10.0,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF0A84FF),
            ),
          ),
          //const SizedBox(width: 10.0,),
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF30d158),
            ),
          ),
          //const SizedBox(width: 10.0,),
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF5e5ce6),
            ),
          ),
          //const SizedBox(width: 10.0,),
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color:  Color(0xFFFF9F0A),
            ),
          ),
          //const SizedBox(width: 10.0,),
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFF375F),
            ),
          ),
          //const SizedBox(width: 10.0,),
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFBF5AF2),
            ),
          ),
          //const SizedBox(width: 10.0,),
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFF453A),
            ),
          ),
          //const SizedBox(width: 10.0,),
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFF64D2FF),
            ),
          ),
          //const SizedBox(width: 10.0,),
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFFD60A),
            ),
          ),
          //const SizedBox(width: 10.0,),
        ],
      ),
    );
  }
}
