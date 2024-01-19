import 'package:flutter/material.dart';

class CheckBox extends StatelessWidget {
  final bool isChecked;

  const CheckBox({super.key, required this.isChecked});

  @override
  Widget build(BuildContext context) {
    return isChecked
        ? Container(
            width: 25,
            height: 25,
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              color: const Color(0xFF0061FF),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Image.asset('assets/check-icon.png')],
            ),
          )
        : Container(
            width: 25,
            height: 25,
            padding: const EdgeInsets.all(10),
            clipBehavior: Clip.antiAlias,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 3, color: Color(0xFFC7C3C3)),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          );
  }
}
