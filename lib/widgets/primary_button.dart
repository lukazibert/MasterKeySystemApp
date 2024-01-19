import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String lable;
  final Function onPressed;

  const PrimaryButton({
    super.key,
    required this.lable,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xFF0061FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        shadows: const [
          BoxShadow(
            color: Color(0x1E3861FF),
            blurRadius: 8,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x193861FF),
            blurRadius: 15,
            offset: Offset(0, 15),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x0F3861FF),
            blurRadius: 20,
            offset: Offset(0, 33),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x053861FF),
            blurRadius: 24,
            offset: Offset(0, 60),
            spreadRadius: 0,
          ),
          BoxShadow(
            color: Color(0x003861FF),
            blurRadius: 26,
            offset: Offset(0, 93),
            spreadRadius: 0,
          )
        ],
      ),
      child: ElevatedButton(
        onPressed: () => onPressed(),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
          backgroundColor: const Color(0xFF0061FF),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          shadowColor: const Color(0x1E3861FF),
          elevation: 100,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              lable,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontFamily: 'Raleway',
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
