import 'package:flutter/material.dart';

class DropDown extends StatelessWidget {
  final String label;
  final String placeholder;
  final TextEditingController controller;
  final FocusNode focusNode;
  final List<String> options;

  const DropDown(
      {super.key,
      required this.label,
      required this.placeholder,
      required this.controller,
      required this.focusNode,
      required this.options});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontFamily: 'Raleway',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 10),
        Container(
          height: 42,
          padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 0),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFCCCCCC), // Border color
              width: 2, // Border width
            ),
            borderRadius: BorderRadius.circular(5), // Border radius
          ),
          child: DropdownButton<String>(
            isExpanded: true,
            value: controller.text == '' ? null : controller.text,
            focusNode: focusNode,
            onChanged: (String? value) {
              controller.text = value!;
              FocusScope.of(context).nextFocus();
            },
            items: options.map((String value) {
              return DropdownMenuItem(
                value: value,
                child: Container(
                  // width: double.infinity,
                  // padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          value,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                            fontFamily: 'Raleway',
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.fade,
                          ),
                        ),
                      ),
                      Container(
                        width: 10,
                        // child:
                        // Image.asset(
                        //   'assets/dropdown_arrow-icon.png',
                        //   // fit: BoxFit.contain,
                        // ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
            // [
            //   DropdownMenuItem(
            //     value: 'Blue',
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         const Text(
            //           'Blue',
            //           style: TextStyle(
            //             color: Colors.black,
            //             fontSize: 14,
            //             fontFamily: 'Raleway',
            //             fontWeight: FontWeight.w600,
            //           ),
            //         ),
            //         Container(
            //           width: 10,
            //           child: Image.asset(
            //             'assets/dropdown_arrow-icon.png',
            //             // fit: BoxFit.contain,
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ],
            hint: Expanded(
              child: Text(
                placeholder,
                style: const TextStyle(
                  color: Color(0xFFD6D6D6),
                  fontSize: 14,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.w600,
                  overflow: TextOverflow.fade,
                ),
                softWrap: false,
              ),
            ),
            underline: Container(
              height: 0,
              color: Colors.transparent,
            ),
            style: const TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontFamily: 'Raleway',
              fontWeight: FontWeight.w600,
            ),
            icon: SizedBox(
              width: 20,
              child: Image.asset(
                'assets/dropdown_arrow-icon.png',
              ),
            ),
          ),
        ),
      ],
    );
  }
}
