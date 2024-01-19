import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String lable;
  final String placeholder;
  final TextEditingController controller;
  final FocusNode focusNode;

  const TextInputField({
    super.key,
    required this.lable,
    required this.placeholder,
    required this.controller,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lable,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: controller,
          focusNode: focusNode,
          onEditingComplete: () => FocusScope.of(context).nextFocus(),
          cursorColor: const Color(0xFFD6D6D6),
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
          ),
          decoration: InputDecoration(
            isCollapsed: true,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 13,
            ),
            hintText: placeholder,
            hintStyle: const TextStyle(
              color: Color(0xFFD6D6D6),
              fontSize: 14,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w600,
            ),
            border: const OutlineInputBorder(
                gapPadding: 0,
                borderSide: BorderSide(color: Color(0xFFCCCCCC), width: 2),
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            focusedBorder: const OutlineInputBorder(
              gapPadding: 0,
              borderSide: BorderSide(color: Color(0xFFCCCCCC), width: 2),
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            enabledBorder: const OutlineInputBorder(
                gapPadding: 0,
                borderSide: BorderSide(color: Color(0xFFCCCCCC), width: 2),
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
          ),
        ),
      ],
    );
  }
}
